import 'dart:developer' as dev;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' show debugPrint;

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

  // ---------------------------------------------------------------------------
  // Public API
  // ---------------------------------------------------------------------------

  /// Initialises FCM: requests permission, registers foreground/background
  /// handlers, and logs the device token.
  static Future<void> init() async {
    // 1. Request permission (no-op on Android < 13 — always granted there).
    final settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    dev.log(
      'FCM permission: ${settings.authorizationStatus}',
      name: 'NotificationService',
    );

    // 2. Log the registration token (useful for server-side testing).
    final token = await _fcm.getToken();
    dev.log('FCM token: $token', name: 'NotificationService');
    debugPrint('╔══════════════════════════════════════════╗');
    debugPrint('║           FCM DEVICE TOKEN               ║');
    debugPrint('╠══════════════════════════════════════════╣');
    debugPrint('║ $token');
    debugPrint('╚══════════════════════════════════════════╝');

    // Refresh token whenever it rotates.
    _fcm.onTokenRefresh.listen((newToken) {
      dev.log('FCM token refreshed: $newToken', name: 'NotificationService');
      // TODO: send newToken to your backend so it can target this device.
    });

    // 3. Foreground message handler.
    FirebaseMessaging.onMessage.listen(_onForegroundMessage);

    // 4. Background / terminated tap handler.
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenedApp);

    // 5. Handle notification that launched the app from terminated state.
    final initial = await _fcm.getInitialMessage();
    if (initial != null) {
      _handleMessage(initial, source: 'initial');
    }
  }

  /// Requests notification permission explicitly (e.g. from a settings screen).
  ///
  /// Returns `true` if permission was granted or already granted.
  static Future<bool> requestPermission({bool fallbackToSettings = false}) async {
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

  /// Unsubscribes from all user-scoped topics and deletes the FCM token on sign-out.
  ///
  /// Call this when the user logs out.
  static Future<void> logout() async {
    await _fcm.deleteToken();
    dev.log('FCM token deleted', name: 'NotificationService');
  }

  // ---------------------------------------------------------------------------
  // Private handlers
  // ---------------------------------------------------------------------------

  static void _onForegroundMessage(RemoteMessage message) {
    dev.log(
      'FCM foreground: ${message.messageId} — ${message.notification?.title}',
      name: 'NotificationService',
    );
    // TODO: show an in-app banner / local notification via flutter_local_notifications.
  }

  static void _onMessageOpenedApp(RemoteMessage message) {
    _handleMessage(message, source: 'openedApp');
  }

  static void _handleMessage(RemoteMessage message, {required String source}) {
    dev.log(
      'FCM [$source]: ${message.messageId} — ${message.notification?.title}',
      name: 'NotificationService',
    );
    // TODO: navigate to the relevant screen based on message.data payload.
    //   e.g. if (message.data['type'] == 'alert') router.go('/alerts/${message.data['id']}');
  }
}
