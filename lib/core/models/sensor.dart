/// A sensor record returned by GET /api/v1/projects/{project_id}/sensors.
class ApiSensor {
  const ApiSensor({
    required this.sensorId,
    required this.projectId,
    required this.sensorType,
    this.model,
    this.installLat,
    this.installLng,
    this.installDepth,
    this.status,
    this.installedAt,
  });

  final String sensorId;
  final String projectId;
  final String sensorType;
  final String? model;
  final double? installLat;
  final double? installLng;
  final double? installDepth;
  final String? status;
  final DateTime? installedAt;

  factory ApiSensor.fromJson(Map<String, dynamic> json) => ApiSensor(
        sensorId: (json['sensor_id'] as String?) ?? '',
        projectId: (json['project_id'] as String?) ?? '',
        sensorType: (json['sensor_type'] as String?) ?? 'unknown',
        model: json['model'] as String?,
        installLat: (json['install_lat'] as num?)?.toDouble(),
        installLng: (json['install_lng'] as num?)?.toDouble(),
        installDepth: (json['install_depth'] as num?)?.toDouble(),
        status: json['status'] as String?,
        installedAt: json['installed_at'] == null
            ? null
            : DateTime.tryParse(json['installed_at'] as String),
      );
}
