import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/repositories/auth_repository.dart';

class LoginState {
  const LoginState({
    this.isLoading = false,
    this.error,
  });

  final bool isLoading;
  final String? error;

  LoginState copyWith({bool? isLoading, String? error}) => LoginState(
        isLoading: isLoading ?? this.isLoading,
        error: error,
      );
}

class LoginViewModel extends StateNotifier<LoginState> {
  LoginViewModel(this._authRepository) : super(const LoginState());

  final AuthRepository _authRepository;

  Future<void> login(String username, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _authRepository.login(username, password);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

// TODO: register provider after implementing AuthRepository
