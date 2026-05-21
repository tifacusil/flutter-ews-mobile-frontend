import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

abstract final class AppRoutes {
  static const login = '/login';
  static const projects = '/projects';
  static const alerts = '/alerts';

  static String projectDetail(String id) => '/projects/$id';
  static String sensorDashboard(String id) => '/sensors/$id';
}

extension RouterUtils on BuildContext {
  void goTo(String location) => GoRouter.of(this).go(location);
  void pushTo(String location) => GoRouter.of(this).push(location);
  void popRoute() => GoRouter.of(this).pop();
}
