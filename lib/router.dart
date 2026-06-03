import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'core/providers/providers.dart';
import 'features/alerts/views/alert_history_screen.dart';
import 'features/alerts/views/recent_alerts_screen.dart';
import 'features/analysis/views/analysis_screen.dart';
import 'features/auth/views/login_screen.dart';
import 'features/projects/views/project_detail_screen.dart';
import 'features/projects/views/project_list_screen.dart';
import 'features/sensors/views/deep_displacement_screen.dart';
import 'features/sensors/views/gnss_screen.dart';
import 'features/sensors/views/rainfall_screen.dart';
import 'features/sensors/views/soil_pressure_screen.dart';
import 'features/sensors/views/strain_screen.dart';

/// [GoRouter] as a Riverpod provider so it can read [authStateNotifierProvider].
///
/// The router is created once. [AuthStateNotifier] is passed as
/// [refreshListenable] so the redirect callback is re-evaluated on every
/// login / logout without recreating the router.
final routerProvider = Provider<GoRouter>((ref) {
  // Use ref.read — we only need the notifier instance, not reactivity.
  // The GoRouter itself listens via refreshListenable.
  final notifier = ref.read(authStateNotifierProvider);

  return GoRouter(
    initialLocation: '/login',
    refreshListenable: notifier,
    redirect: (context, state) {
      final isLoggedIn = notifier.isLoggedIn;
      final isLoginRoute = state.matchedLocation == '/login';

      // Not logged in and trying to access a protected route → login
      if (!isLoggedIn && !isLoginRoute) return '/login';

      // Already logged in and landing on /login → skip to projects
      if (isLoggedIn && isLoginRoute) return '/projects';

      return null; // no redirect needed
    },
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/projects',
        builder: (context, state) => const ProjectListScreen(),
      ),
      GoRoute(
        path: '/projects/:projectId',
        builder: (context, state) =>
            ProjectDetailScreen(projectId: state.pathParameters['projectId']!),
      ),
      GoRoute(
        path: '/projects/:projectId/sensors/gnss/:sensorId',
        builder: (context, state) => GnssScreen(
          projectId: state.pathParameters['projectId']!,
          sensorId: state.pathParameters['sensorId']!,
        ),
      ),
      GoRoute(
        path: '/projects/:projectId/sensors/rainfall/:sensorId',
        builder: (context, state) => RainfallScreen(
          projectId: state.pathParameters['projectId']!,
          sensorId: state.pathParameters['sensorId']!,
        ),
      ),
      GoRoute(
        path: '/projects/:projectId/sensors/soil-pressure/:sensorId',
        builder: (context, state) => SoilPressureScreen(
          projectId: state.pathParameters['projectId']!,
          sensorId: state.pathParameters['sensorId']!,
        ),
      ),
      GoRoute(
        path: '/projects/:projectId/sensors/strain/:sensorId',
        builder: (context, state) => StrainScreen(
          projectId: state.pathParameters['projectId']!,
          sensorId: state.pathParameters['sensorId']!,
        ),
      ),
      GoRoute(
        path: '/projects/:projectId/sensors/deep-displacement/:sensorId',
        builder: (context, state) => DeepDisplacementScreen(
          projectId: state.pathParameters['projectId']!,
          sensorId: state.pathParameters['sensorId']!,
        ),
      ),
      GoRoute(
        path: '/projects/:projectId/sensors/:sensorType/:sensorId/analysis',
        builder: (context, state) => AnalysisScreen(
          projectId: state.pathParameters['projectId']!,
          sensorType: state.pathParameters['sensorType']!,
          sensorId: state.pathParameters['sensorId']!,
        ),
      ),
      GoRoute(
        path: '/alerts',
        builder: (context, state) {
          final projectId = state.uri.queryParameters['projectId'] ?? '';
          return AlertHistoryScreen(projectId: projectId);
        },
      ),
      GoRoute(
        path: '/alerts/recent',
        builder: (context, state) {
          final limitStr = state.uri.queryParameters['limit'];
          final limit = int.tryParse(limitStr ?? '') ?? 50;
          return RecentAlertsScreen(limit: limit);
        },
      ),
    ],
  );
});
