import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../constants.dart';

/// Thin wrapper around the OneSignal SDK.
///
/// Call [init] once in main() before runApp.
/// Call [requestPermission] after the user has logged in (better conversion).
/// Use [login] / [logout] to tie notifications to the authenticated operator.
abstract final class NotificationService {
  static void init() {
    if (kOneSignalAppId.isEmpty) return;

    OneSignal.initialize(kOneSignalAppId);

    OneSignal.Notifications.addForegroundWillDisplayListener(
      _onForegroundWillDisplay,
    );
    OneSignal.Notifications.addClickListener(_onClicked);
  }

  /// Ask the OS for notification permission.
  /// Pass [fallbackToSettings] = true to re-prompt via settings if previously denied.
  static Future<bool> requestPermission({bool fallbackToSettings = false}) {
    return OneSignal.Notifications.requestPermission(fallbackToSettings);
  }

  /// Associate notifications with the authenticated user (call after login).
  static Future<void> login(String externalUserId) =>
      OneSignal.login(externalUserId);

  /// Disassociate notifications from the user (call on logout).
  static Future<void> logout() => OneSignal.logout();

  static void _onForegroundWillDisplay(OSNotificationWillDisplayEvent event) {
    // Display the notification as-is; override here to suppress or mutate.
    event.notification.display();
  }

  static void _onClicked(OSNotificationClickEvent event) {
    // TODO: read event.notification.additionalData and navigate accordingly.
    // e.g. data['project_id'] → AppRoutes.projectDetail(id)
  }
}
