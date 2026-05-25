import 'alert_level.dart';
import 'sensor.dart';

/// Local / mock representation of a project.
class Project {
  const Project({
    required this.id,
    required this.displayName,
    required this.typeLabel,
    this.activeAlertLevel,
    this.sensors,
  });

  final String id;
  final String displayName;
  final String typeLabel;
  final AlertLevel? activeAlertLevel;

  /// Sensors included when loaded via GET /api/v1/projects/{id}.
  /// Null when loaded from the list endpoint which omits them.
  final List<ApiSensor>? sensors;
}

/// API representation returned by:
///   - GET /api/v1/projects          (sensors == null)
///   - GET /api/v1/projects/{id}     (sensors populated)
class ApiProject {
  const ApiProject({
    required this.projectId,
    required this.name,
    this.description,
    this.type,
    this.location,
    this.locationLat,
    this.locationLng,
    this.status,
    this.createdAt,
    this.sensors,
  });

  final String projectId;
  final String name;
  final String? description;
  final String? type;
  final String? location;
  final double? locationLat;
  final double? locationLng;
  final String? status;
  final DateTime? createdAt;

  /// Populated only by the single-project endpoint.
  final List<ApiSensor>? sensors;

  factory ApiProject.fromJson(Map<String, dynamic> json) {
    final rawSensors = json['sensors'];
    return ApiProject(
      projectId: (json['project_id'] as String?) ??
          (json['id'] as String?) ??
          '',
      name: (json['name'] as String?) ??
          (json['display_name'] as String?) ??
          '',
      description: json['description'] as String?,
      type: (json['type'] as String?) ?? (json['type_label'] as String?),
      location: json['location'] as String?,
      locationLat: (json['location_lat'] as num?)?.toDouble(),
      locationLng: (json['location_lng'] as num?)?.toDouble(),
      status: json['status'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String)
          : null,
      sensors: rawSensors is List
          ? rawSensors
              .cast<Map<String, dynamic>>()
              .map(ApiSensor.fromJson)
              .toList()
          : null,
    );
  }

  /// Convert to the local [Project] model used by existing UI widgets.
  Project toProject() => Project(
        id: projectId,
        displayName: name.isNotEmpty ? name : projectId,
        typeLabel: type ?? 'slope',
        sensors: sensors,
      );
}
