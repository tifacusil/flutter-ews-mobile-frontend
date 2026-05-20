import 'package:go_router/go_router.dart';

import 'features/auth/views/login_screen.dart';
import 'features/projects/views/project_list_screen.dart';
import 'features/projects/views/project_detail_screen.dart';
import 'features/sensors/views/sensor_dashboard_screen.dart';
import 'features/alerts/views/alert_history_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  // TODO: add redirect guard that checks AuthRepository.isAuthenticated
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/projects',
      builder: (context, state) => const ProjectListScreen(),
    ),
    GoRoute(
      path: '/projects/:id',
      builder: (context, state) =>
          ProjectDetailScreen(projectId: state.pathParameters['id']!),
    ),
    GoRoute(
      path: '/sensors/:id',
      builder: (context, state) =>
          SensorDashboardScreen(sensorId: state.pathParameters['id']!),
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
