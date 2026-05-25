import 'package:flutter/foundation.dart';

import '../services/auth_service.dart';

/// A [ChangeNotifier] that signals the router whenever auth state changes.
///
/// Call [notify] after login or logout so [GoRouter]'s refreshListenable
/// re-evaluates the redirect callback.
class AuthStateNotifier extends ChangeNotifier {
  AuthStateNotifier(this._authService);

  final AuthService _authService;

  bool get isLoggedIn => _authService.isLoggedIn;

  /// Call after a successful login or logout to trigger route re-evaluation.
  void notify() => notifyListeners();
}
