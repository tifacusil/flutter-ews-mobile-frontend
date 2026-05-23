import 'package:go_router/go_router.dart';

import 'features/alerts/views/alert_history_screen.dart';
import 'features/auth/views/login_screen.dart';
import 'features/projects/views/project_detail_screen.dart';
import 'features/projects/views/project_list_screen.dart';
import 'features/sensors/views/deep_displacement_screen.dart';
import 'features/sensors/views/gnss_screen.dart';
import 'features/sensors/views/rainfall_screen.dart';
import 'features/sensors/views/soil_pressure_screen.dart';
import 'features/sensors/views/strain_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
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
      path: '/alerts',
      builder: (context, state) {
        final projectId = state.uri.queryParameters['projectId'] ?? '';
        return AlertHistoryScreen(projectId: projectId);
      },
    ),
  ],
);
