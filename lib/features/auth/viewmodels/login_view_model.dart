import 'dart:async';
import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/device.dart';
import '../../../core/providers/providers.dart';
import '../../../core/services/notification_service.dart';
import '../../../core/services/user_management_service.dart';

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
    if (username.trim().isEmpty || password.isEmpty) {
      state = state.copyWith(
        isLoading: false,
        error: 'Please enter your username and password.',
      );
      return;
    }

    state = state.copyWith(isLoading: true, error: null);

    try {
      final svc = ref.read(userManagementServiceProvider);
      final loginResp = await svc.login(username.trim(), password);

      // Tie push notifications to the authenticated user.
      unawaited(NotificationService.requestPermission());
      unawaited(NotificationService.login(loginResp.userId.toString()));

      // Register device token in the background — best-effort, never
      // blocks or fails the login flow.
      unawaited(_registerDevice());

      // Trigger the router redirect → /projects.
      ref.read(authStateNotifierProvider).notify();

      state = state.copyWith(isLoading: false, isSuccess: true);
    } on ApiException catch (e) {
      final msg = switch (e.statusCode) {
        401 => 'Invalid username or password.',
        _ => e.message,
      };
      state = state.copyWith(isLoading: false, error: msg);
    } catch (_) {
      state = state.copyWith(
        isLoading: false,
        error: 'Could not reach the server. Check your connection.',
      );
    }
  }

  // ---------------------------------------------------------------------------
  // Device registration
  // ---------------------------------------------------------------------------

  Future<void> _registerDevice() async {
    try {
      final token = await _getPushToken();
      if (token == null) return;

      final platform = Platform.isAndroid
          ? 'android'
          : Platform.isIOS
              ? 'ios'
              : 'web';

      await ref.read(userManagementServiceProvider).registerDevice(
            DeviceRegisterRequest(
              deviceToken: token,
              platform: platform,
              appVersion: '1.0.0',
            ),
          );
    } catch (_) {
      // Device registration is best-effort; a failure here must never
      // affect the login result.
    }
  }

  /// Returns the FCM device token for the current device.
  Future<String?> _getPushToken() => NotificationService.getToken();
}
