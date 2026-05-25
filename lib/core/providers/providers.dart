import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth_notifier.dart';
import '../services/auth_service.dart';
import '../services/data_service.dart';
import '../services/readings_service.dart';
import '../services/user_management_service.dart';

/// The raw [SharedPreferences] instance.
///
/// **Must** be overridden in [ProviderScope] before the first widget build:
/// ```dart
/// ProviderScope(
///   overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
///   child: const EwsApp(),
/// )
/// ```
final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError('Override sharedPreferencesProvider in ProviderScope'),
  name: 'sharedPreferences',
);

/// The [AuthService] singleton backed by [sharedPreferencesProvider].
final authServiceProvider = Provider<AuthService>(
  (ref) => AuthService(ref.watch(sharedPreferencesProvider)),
  name: 'authService',
);

/// The [UserManagementService] singleton.
///
/// Depends on [authServiceProvider] so it can inject the JWT into every
/// authenticated request and clear the session on 401.
final userManagementServiceProvider = Provider<UserManagementService>(
  (ref) => UserManagementService(authService: ref.watch(authServiceProvider)),
  name: 'userManagementService',
);

/// The [ReadingsService] singleton — sensor time-series readings.
final readingsServiceProvider = Provider<ReadingsService>(
  (ref) => ReadingsService(authService: ref.watch(authServiceProvider)),
  name: 'readingsService',
);

/// The [DataService] singleton — projects, sensors, alerts, recipients.
final dataServiceProvider = Provider<DataService>(
  (ref) => DataService(authService: ref.watch(authServiceProvider)),
  name: 'dataService',
);

/// Notifies the router whenever auth state changes (login / logout).
///
/// Use [AuthStateNotifier.notify] after login or logout.
/// The [GoRouter] holds this as its [refreshListenable].
final authStateNotifierProvider = Provider<AuthStateNotifier>(
  (ref) => AuthStateNotifier(ref.watch(authServiceProvider)),
  name: 'authStateNotifier',
);

/// Holds the most recent device-registration error message, or `null` when
/// registration succeeded / has not been attempted yet.
///
/// Set by [LoginViewModel._registerDevice] on failure.
/// Watched by [ProjectListScreen] via [ref.listen] to show a snack-bar.
/// Reset to `null` after the snack-bar has been shown so it does not re-fire.
final deviceRegistrationErrorProvider =
    NotifierProvider<DeviceRegistrationErrorNotifier, String?>(
  DeviceRegistrationErrorNotifier.new,
  name: 'deviceRegistrationError',
);

class DeviceRegistrationErrorNotifier extends Notifier<String?> {
  @override
  String? build() => null;

  void setError(String message) => state = message;
  void clear() => state = null;
}
