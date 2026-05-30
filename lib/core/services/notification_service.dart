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
    _log('init() started');

    // 1. Set up flutter_local_notifications ──────────────────────────────────

    // 'ic_notification' resolves to @drawable/ic_notification — Android
    // requires notification icons to be a monochrome drawable, not the
    // full-colour adaptive launcher icon.
    const androidSettings =
        AndroidInitializationSettings('ic_notification');
    const iosSettings = DarwinInitializationSettings(
      // We let firebase_messaging own the permission prompt; disable the
      // duplicate request from flutter_local_notifications.
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    final initialized = await _localNotifications.initialize(
      settings:
          const InitializationSettings(android: androidSettings, iOS: iosSettings),
      onDidReceiveNotificationResponse: _onLocalNotificationTap,
    );
    _log('flutter_local_notifications initialized: $initialized');

    // Create the high-importance Android channel (no-op if it already exists).
    final androidPlugin = _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    if (androidPlugin != null) {
      const channel = AndroidNotificationChannel(
        _kChannelId,
        _kChannelName,
        description: 'EWS landslide alerts and sensor notifications',
        importance: Importance.high,
      );
      await androidPlugin.createNotificationChannel(channel);
      _log('Android channel created: id=$_kChannelId  importance=high');
    } else {
      _log('AndroidFlutterLocalNotificationsPlugin not available (non-Android platform)');
    }

    // 2. Request FCM permission ───────────────────────────────────────────────
    // (Also covers POST_NOTIFICATIONS on Android 13+.)

    final settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    _log('FCM permission status: ${settings.authorizationStatus}  '
        'alert=${settings.alert}  badge=${settings.badge}  sound=${settings.sound}');

    // 3. Log the registration token ───────────────────────────────────────────

    final token = await _fcm.getToken();
    _log('FCM token: $token');

    // 4. Token rotation ───────────────────────────────────────────────────────

    _fcm.onTokenRefresh.listen((newToken) {
      _log('FCM token rotated — new token: $newToken');
      _tokenRefreshHandler?.call(newToken).catchError((Object e) {
        _log('Token refresh re-registration failed: $e', error: true);
      });
    });

    // 5. Message handlers ─────────────────────────────────────────────────────

    FirebaseMessaging.onMessage.listen(_onForegroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);

    final initial = await _fcm.getInitialMessage();
    if (initial != null) {
      _log('Cold-start message found: id=${initial.messageId}');
      _handleMessage(initial, source: 'initial');
    } else {
      _log('No cold-start message');
    }

    _log('init() complete');
  }

  /// Requests notification permission explicitly (e.g. from a settings screen).
  ///
  /// Returns `true` if permission was granted or already granted.
  static Future<bool> requestPermission(
      {bool fallbackToSettings = false}) async {
    final settings = await _fcm.requestPermission();
    final granted =
        settings.authorizationStatus == AuthorizationStatus.authorized ||
            settings.authorizationStatus == AuthorizationStatus.provisional;
    _log('requestPermission() → granted=$granted  status=${settings.authorizationStatus}');
    return granted;
  }

  /// Subscribe to the user-specific FCM topic so the backend can target
  /// push notifications to a single user without storing tokens server-side.
  ///
  /// Call this after a successful login.
  static Future<void> login(String externalUserId) async {
    final userTopic = 'user_$externalUserId';
    await _fcm.subscribeToTopic(userTopic);
    _log('Subscribed to FCM topic: $userTopic');
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
    _log('Token refresh handler registered');
  }

  /// Deletes the local FCM token and clears all handlers.
  ///
  /// Call this when the user logs out, after the server has already revoked
  /// all device tokens via POST /api/v1/auth/logout.
  static Future<void> logout() async {
    _tokenRefreshHandler = null;
    await _fcm.deleteToken();
    _log('logout() — FCM token deleted locally, handlers cleared');
  }

  // ---------------------------------------------------------------------------
  // Private handlers
  // ---------------------------------------------------------------------------

  /// Fires when a message arrives while the app is in the foreground.
  ///
  /// FCM suppresses the system notification in this state, so we re-fire it
  /// via [_localNotifications] so the user always sees an alert banner.
  static void _onForegroundMessage(RemoteMessage message) {
    _log('Foreground message received'
        '\n  id       : ${message.messageId}'
        '\n  title    : ${message.notification?.title}'
        '\n  body     : ${message.notification?.body}'
        '\n  data     : ${message.data}');

    final notification = message.notification;
    if (notification == null) {
      _log('No notification field — data-only message, skipping local banner');
      return;
    }

    final notifId = message.hashCode;
    _log('Posting local notification  id=$notifId  channel=$_kChannelId');

    _localNotifications
        .show(
          id: notifId,
          title: notification.title,
          body: notification.body,
          notificationDetails: NotificationDetails(
            android: AndroidNotificationDetails(
              _kChannelId,
              _kChannelName,
              importance: Importance.high,
              priority: Priority.high,
              icon: 'ic_notification',
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
        )
        .then((_) => _log('Local notification posted successfully  id=$notifId'))
        .catchError((Object e) =>
            _log('Local notification post FAILED  id=$notifId  error=$e',
                error: true));
  }

  /// Called when the user taps a local notification banner (foreground only).
  static void _onLocalNotificationTap(NotificationResponse response) {
    _log('Local notification tapped'
        '\n  actionId : ${response.actionId}'
        '\n  id       : ${response.id}'
        '\n  payload  : ${response.payload}');

    final raw = response.payload;
    if (raw == null || raw.isEmpty) {
      _log('Empty payload — cannot navigate');
      return;
    }

    try {
      final data = jsonDecode(raw) as Map<String, dynamic>;
      _log('Emitting tap event to notificationTaps stream  data=$data');
      // Wrap in a RemoteMessage so the navigation logic in main.dart is shared
      // with background / cold-start taps.
      _tapController.add(RemoteMessage(data: data));
    } catch (e) {
      _log('Failed to parse local notification payload: $e', error: true);
    }
  }

  static void _onMessageOpenedApp(RemoteMessage message) {
    _log('Background notification tapped (onMessageOpenedApp)'
        '\n  id    : ${message.messageId}'
        '\n  title : ${message.notification?.title}'
        '\n  data  : ${message.data}');
    _handleMessage(message, source: 'openedApp');
  }

  static void _handleMessage(RemoteMessage message, {required String source}) {
    _log('Emitting tap event to notificationTaps stream  source=$source  data=${message.data}');
    _tapController.add(message);
  }

  // ---------------------------------------------------------------------------
  // Logging helper
  // ---------------------------------------------------------------------------

  static void _log(String message, {bool error = false}) {
    dev.log(
      message,
      name: 'NotificationService',
      level: error ? 1000 : 0,
    );
  }
}
