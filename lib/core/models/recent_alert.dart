/// A single alert returned by GET /alerts/recent.
class RecentAlert {
  const RecentAlert({
    required this.messageId,
    required this.projectId,
    required this.sensorId,
    required this.alertLevel,
    required this.alertType,
    required this.timestamp,
    this.currentDisplacementMm,
    this.previousDisplacementMm,
    this.deformationSpeedMmDay,
    this.thresholdMmDay,
    this.schemaVersion,
  });

  /// Unique message ID (UUID).
  final String messageId;

  /// Project this alert belongs to.
  final String projectId;

  /// Sensor that triggered the alert.
  final String sensorId;

  /// Severity level: "blue" | "orange" | "red".
  final String alertLevel;

  /// Category, e.g. "deformation_speed".
  final String alertType;

  /// When the alert was generated (UTC).
  final DateTime timestamp;

  final double? currentDisplacementMm;
  final double? previousDisplacementMm;
  final double? deformationSpeedMmDay;
  final double? thresholdMmDay;
  final String? schemaVersion;

  factory RecentAlert.fromJson(Map<String, dynamic> json) => RecentAlert(
        messageId: (json['message_id'] as String?) ?? '',
        projectId: (json['project_id'] as String?) ?? '',
        sensorId: (json['sensor_id'] as String?) ?? '',
        alertLevel: (json['alert_level'] as String?) ?? 'blue',
        alertType: (json['alert_type'] as String?) ?? '',
        timestamp: json['timestamp'] != null
            ? DateTime.tryParse(json['timestamp'] as String) ?? DateTime.now()
            : DateTime.now(),
        currentDisplacementMm:
            (json['current_displacement_mm'] as num?)?.toDouble(),
        previousDisplacementMm:
            (json['previous_displacement_mm'] as num?)?.toDouble(),
        deformationSpeedMmDay:
            (json['deformation_speed_mm_day'] as num?)?.toDouble(),
        thresholdMmDay: (json['threshold_mm_day'] as num?)?.toDouble(),
        schemaVersion: json['schema_version'] as String?,
      );
}
