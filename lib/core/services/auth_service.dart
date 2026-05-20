import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

const _keyAccessToken = kAccessTokenKey;
const _keyRefreshToken = kRefreshTokenKey;

class AuthService {
  AuthService(this._prefs);

  final SharedPreferences _prefs;

  String? get accessToken => _prefs.getString(_keyAccessToken);
  String? get refreshToken => _prefs.getString(_keyRefreshToken);

  bool get hasToken => accessToken != null;

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _prefs.setString(_keyAccessToken, accessToken);
    await _prefs.setString(_keyRefreshToken, refreshToken);
  }

  Future<void> clearTokens() async {
    await _prefs.remove(_keyAccessToken);
    await _prefs.remove(_keyRefreshToken);
  }

  // TODO: implement token refresh against /auth/refresh endpoint
  Future<String?> refreshAccessToken() async {
    throw UnimplementedError();
  }
}
