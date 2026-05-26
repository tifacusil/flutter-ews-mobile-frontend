import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

abstract final class AppRoutes {
  static const login = '/login';
  static const projects = '/projects';
  static const alerts = '/alerts';
  static const recentAlerts = '/alerts/recent';

  static String projectDetail(String projectId) => '/projects/$projectId';

  static String gnss(String projectId, String sensorId) =>
      '/projects/$projectId/sensors/gnss/$sensorId';

  static String rainfall(String projectId, String sensorId) =>
      '/projects/$projectId/sensors/rainfall/$sensorId';

  static String soilPressure(String projectId, String sensorId) =>
      '/projects/$projectId/sensors/soil-pressure/$sensorId';

  static String strain(String projectId, String sensorId) =>
      '/projects/$projectId/sensors/strain/$sensorId';

  static String deepDisplacement(String projectId, String sensorId) =>
      '/projects/$projectId/sensors/deep-displacement/$sensorId';
}

extension RouterUtils on BuildContext {
  void goTo(String location) => GoRouter.of(this).go(location);
  void pushTo(String location) => GoRouter.of(this).push(location);
  void popRoute() => GoRouter.of(this).pop();
}
