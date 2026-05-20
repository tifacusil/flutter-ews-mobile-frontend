abstract interface class AuthRepository {
  Future<void> login(String username, String password);

  Future<void> logout();

  Stream<bool> get isAuthenticated;
}
