import 'alert_level.dart';

class Project {
  const Project({
    required this.id,
    required this.displayName,
    required this.typeLabel,
    this.activeAlertLevel,
  });

  final String id;
  final String displayName;
  final String typeLabel;
  final AlertLevel? activeAlertLevel;
}
