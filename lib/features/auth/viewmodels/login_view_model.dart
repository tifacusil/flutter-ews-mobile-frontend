import 'dart:async';
import 'dart:developer' as dev;
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

      // Capture ref-dependent objects NOW — before navigation disposes this
      // notifier and invalidates ref.
      final userMgmtSvc = ref.read(userManagementServiceProvider);
      final errorNotifier = ref.read(deviceRegistrationErrorProvider.notifier);

      // Trigger the router redirect → /projects.
      ref.read(authStateNotifierProvider).notify();

      state = state.copyWith(isLoading: false, isSuccess: true);

      // Register device token in the background — best-effort, never
      // blocks or fails the login flow.  Uses pre-captured objects so the
      // disposed ref is never touched again.
      unawaited(_registerDevice(userMgmtSvc, errorNotifier));
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

  Future<void> _registerDevice(
    UserManagementService svc,
    DeviceRegistrationErrorNotifier errorNotifier,
  ) async {
    try {
      final token = await NotificationService.getToken();
      if (token == null) {
        dev.log('FCM token is null — skipping device registration.',
            name: 'LoginViewModel');
        errorNotifier.setError('Push notifications unavailable on this device.');
        return;
      }

      dev.log('Registering device token: $token', name: 'LoginViewModel');

      final platform = Platform.isAndroid
          ? 'android'
          : Platform.isIOS
              ? 'ios'
              : 'web';

      final response = await svc.registerDevice(
        DeviceRegisterRequest(
          deviceToken: token,
          platform: platform,
          appVersion: '1.0.0',
        ),
      );

      dev.log('Device registered — id: ${response.deviceId}',
          name: 'LoginViewModel');
    } catch (e) {
      dev.log('Device registration failed: $e', name: 'LoginViewModel');
      errorNotifier.setError('Could not register device for push notifications.');
    }
  }
}
