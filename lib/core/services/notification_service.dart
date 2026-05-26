import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Handles Firebase Cloud Messaging (FCM) for the EWS app.
///
/// Call [init] once during app startup (after [Firebase.initializeApp]).
/// After a successful login call [login] with the user ID so the device
/// can be targeted by user-scoped server sends. Call [logout] on sign-out.
abstract final class NotificationService {
  // ---------------------------------------------------------------------------
  // Internal state
  // ---------------------------------------------------------------------------

  static final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  static final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  /// Android notification channel used for all EWS alerts.
  static const _kChannelId = 'ews_alerts';
  static const _kChannelName = 'EWS Alerts';

  /// Called whenever the FCM token rotates so the caller can re-register it
  /// with the backend. Set via [setTokenRefreshHandler]; cleared on [logout].
  static Future<void> Function(String newToken)? _tokenRefreshHandler;

  /// Broadcast stream of [RemoteMessage]s that the user tapped (foreground
  /// banner, background, or terminated state). Listen to this stream to drive
  /// deep-link navigation.
  static final StreamController<RemoteMessage> _tapController =
      StreamController<RemoteMessage>.broadcast();

  static Stream<RemoteMessage> get notificationTaps => _tapController.stream;

  // ---------------------------------------------------------------------------
  // Public API
  // ---------------------------------------------------------------------------

  /// Initialises FCM and the local notifications plugin: requests permission,
  /// registers foreground/background handlers, and logs the device token.
  static Future<void> init() async {
    // 1. Set up flutter_local_notifications ──────────────────────────────────

    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      // We let firebase_messaging own the permission prompt; disable the
      // duplicate request from flutter_local_notifications.
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    await _localNotifications.initialize(
      settings:
          const InitializationSettings(android: androidSettings, iOS: iosSettings),
      onDidReceiveNotificationResponse: _onLocalNotificationTap,
    );

    // Create the high-importance Android channel (no-op if it already exists).
    final androidPlugin = _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    await androidPlugin?.createNotificationChannel(
      const AndroidNotificationChannel(
        _kChannelId,
        _kChannelName,
        description: 'EWS landslide alerts and sensor notifications',
        importance: Importance.high,
      ),
    );

    // 2. Request FCM permission ───────────────────────────────────────────────
    // (Also covers POST_NOTIFICATIONS on Android 13+.)

    final settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    dev.log(
      'FCM permission: ${settings.authorizationStatus}',
      name: 'NotificationService',
    );

    // 3. Log the registration token (useful for server-side testing) ─────────

    final token = await _fcm.getToken();
    dev.log('FCM token: $token', name: 'NotificationService');

    // 4. Token rotation ───────────────────────────────────────────────────────

    _fcm.onTokenRefresh.listen((newToken) {
      dev.log('FCM token refreshed: $newToken', name: 'NotificationService');
      _tokenRefreshHandler?.call(newToken).catchError((Object e) {
        dev.log('Token refresh re-registration failed: $e',
            name: 'NotificationService');
      });
    });

    // 5. Message handlers ─────────────────────────────────────────────────────

    // Foreground: show a local notification banner so the alert is never silent.
    FirebaseMessaging.onMessage.listen(_onForegroundMessage);

    // Background tap (app in background, user taps the FCM notification).
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);

    // Cold-start tap (app was terminated, user tapped the notification).
    final initial = await _fcm.getInitialMessage();
    if (initial != null) {
      _handleMessage(initial, source: 'initial');
    }
  }

  /// Requests notification permission explicitly (e.g. from a settings screen).
  ///
  /// Returns `true` if permission was granted or already granted.
  static Future<bool> requestPermission(
      {bool fallbackToSettings = false}) async {
    final settings = await _fcm.requestPermission();
    return settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional;
  }

  /// Subscribe to the user-specific FCM topic so the backend can target
  /// push notifications to a single user without storing tokens server-side.
  ///
  /// Call this after a successful login.
  static Future<void> login(String externalUserId) async {
    final topic = 'user_$externalUserId';
    await _fcm.subscribeToTopic(topic);
    dev.log('FCM subscribed to topic: $topic', name: 'NotificationService');
  }

  /// Returns the current FCM registration token, or `null` if unavailable.
  ///
  /// Use this to register the device with your backend after login.
  static Future<String?> getToken() => _fcm.getToken();

  /// Registers [handler] to be called whenever the FCM token rotates.
  ///
  /// The handler should re-register the new token with the backend.
  /// Call this after a successful device registration on login.
  static void setTokenRefreshHandler(
      Future<void> Function(String newToken) handler) {
    _tokenRefreshHandler = handler;
  }

  /// Unsubscribes from all user-scoped topics and deletes the FCM token on
  /// sign-out.
  ///
  /// Call this when the user logs out.
  static Future<void> logout() async {
    _tokenRefreshHandler = null;
    await _fcm.deleteToken();
    dev.log('FCM token deleted', name: 'NotificationService');
  }

  // ---------------------------------------------------------------------------
  // Private handlers
  // ---------------------------------------------------------------------------

  /// Fires when a message arrives while the app is in the foreground.
  ///
  /// FCM suppresses the system notification in this state, so we re-fire it
  /// via [_localNotifications] so the user always sees an alert banner.
  static void _onForegroundMessage(RemoteMessage message) {
    dev.log(
      'FCM foreground: ${message.messageId} — ${message.notification?.title}',
      name: 'NotificationService',
    );

    final notification = message.notification;
    if (notification == null) return; // data-only message — nothing to display

    _localNotifications.show(
      // Use a stable ID derived from the message so duplicate deliveries
      // replace rather than stack.
      id: message.hashCode,
      title: notification.title,
      body: notification.body,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          _kChannelId,
          _kChannelName,
          importance: Importance.high,
          priority: Priority.high,
          // Show the small app icon as the notification icon.
          icon: '@mipmap/ic_launcher',
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      // Serialise the FCM data payload as the local notification payload
      // so we can drive deep-link navigation when the banner is tapped.
      payload: jsonEncode(message.data),
    );
  }

  /// Called when the user taps a local notification banner (foreground only).
  static void _onLocalNotificationTap(NotificationResponse response) {
    final raw = response.payload;
    if (raw == null || raw.isEmpty) return;

    try {
      final data = jsonDecode(raw) as Map<String, dynamic>;
      // Wrap in a RemoteMessage so the navigation logic in main.dart is shared
      // with background / cold-start taps.
      _tapController.add(RemoteMessage(data: data));
    } catch (e) {
      dev.log('Failed to parse local notification payload: $e',
          name: 'NotificationService');
    }
  }

  static void _onMessageOpenedApp(RemoteMessage message) {
    _handleMessage(message, source: 'openedApp');
  }

  static void _handleMessage(RemoteMessage message, {required String source}) {
    dev.log(
      'FCM [$source]: ${message.messageId} — ${message.notification?.title}',
      name: 'NotificationService',
    );
    _tapController.add(message);
  }
}
