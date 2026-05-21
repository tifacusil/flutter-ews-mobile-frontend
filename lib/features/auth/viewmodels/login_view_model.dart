import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_view_model.g.dart';

class LoginState {
  const LoginState({
    this.isLoading = false,
    this.isSuccess = false,
    this.error,
  });

  final bool isLoading;
  final bool isSuccess;
  final String? error;

  LoginState copyWith({bool? isLoading, bool? isSuccess, String? error}) =>
      LoginState(
        isLoading: isLoading ?? this.isLoading,
        isSuccess: isSuccess ?? this.isSuccess,
        error: error,
      );
}

@riverpod
class LoginViewModel extends _$LoginViewModel {
  @override
  LoginState build() => const LoginState();

  Future<void> login(String username, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    // Mock: simulate network latency
    await Future.delayed(const Duration(milliseconds: 800));
    if (username.trim().isEmpty || password.isEmpty) {
      state = state.copyWith(isLoading: false, error: 'Invalid credentials.');
      return;
    }
    state = state.copyWith(isLoading: false, isSuccess: true);
  }
}
