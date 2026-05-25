/// Placeholder notification service.
///
/// OneSignal has been removed. Wire up your preferred push provider here
/// (e.g. firebase_messaging, flutter_local_notifications).
abstract final class NotificationService {
  static void init() {}

  static Future<bool> requestPermission({bool fallbackToSettings = false}) async => false;

  /// Associate notifications with the authenticated user (call after login).
  static Future<void> login(String externalUserId) async {}

  /// Disassociate notifications from the user (call on logout).
  static Future<void> logout() async {}
}
