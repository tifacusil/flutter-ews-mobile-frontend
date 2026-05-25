import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

/// Thin wrapper around [SharedPreferences] that owns all session data:
/// JWT token, user_id, username, and role.
///
/// Inject via [authServiceProvider]; override [sharedPreferencesProvider]
/// in ProviderScope before calling any method.
class AuthService {
  AuthService(this._prefs);

  final SharedPreferences _prefs;

  // ---- Getters ----------------------------------------------------------------

  String? get accessToken => _prefs.getString(kAccessTokenKey);

  int? get userId => _prefs.getInt(kUserIdKey);

  String? get username => _prefs.getString(kUsernameKey);

  String? get role => _prefs.getString(kRoleKey);

  bool get isLoggedIn => accessToken != null;

  bool get isAdmin => role == 'admin';

  // ---- Persistence -----------------------------------------------------------

  /// Persists the full session returned by the login endpoint.
  Future<void> saveSession({
    required String token,
    required int userId,
    required String username,
    required String role,
  }) async {
    await Future.wait([
      _prefs.setString(kAccessTokenKey, token),
      _prefs.setInt(kUserIdKey, userId),
      _prefs.setString(kUsernameKey, username),
      _prefs.setString(kRoleKey, role),
    ]);
  }

  /// Removes all session data (call on logout).
  Future<void> clearSession() async {
    await Future.wait([
      _prefs.remove(kAccessTokenKey),
      _prefs.remove(kUserIdKey),
      _prefs.remove(kUsernameKey),
      _prefs.remove(kRoleKey),
      // Legacy keys kept for backwards-compat in case they exist on disk.
      _prefs.remove(kRefreshTokenKey),
    ]);
  }
}
