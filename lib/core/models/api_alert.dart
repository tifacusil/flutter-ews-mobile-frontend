/// A single active alert returned by GET /api/v1/alerts/.
class ApiAlert {
  const ApiAlert({
    required this.alertId,
    required this.projectId,
    required this.level,
    required this.message,
    required this.createdAt,
    this.isActive = true,
    this.sensorId,
    this.sensorType,
  });

  final String alertId;
  final String projectId;
  final String level;     // "blue" | "orange" | "red"
  final String message;
  final DateTime createdAt;
  final bool isActive;
  final String? sensorId;
  final String? sensorType;

  factory ApiAlert.fromJson(Map<String, dynamic> json) => ApiAlert(
        alertId: (json['alert_id'] as String?) ??
            (json['id'] as String?) ??
            '',
        projectId: (json['project_id'] as String?) ?? '',
        level: (json['level'] as String?) ?? 'blue',
        message: (json['message'] as String?) ?? '',
        createdAt: json['created_at'] != null
            ? DateTime.tryParse(json['created_at'] as String) ?? DateTime.now()
            : DateTime.now(),
        isActive: (json['is_active'] as bool?) ?? true,
        sensorId: json['sensor_id'] as String?,
        sensorType: json['sensor_type'] as String?,
      );
}

/// A single recipient returned by
/// GET /api/v1/projects/{id}/alert-recipients?level=…
class AlertRecipient {
  const AlertRecipient({
    required this.userId,
    required this.username,
    this.email,
    this.phone,
  });

  final int userId;
  final String username;
  final String? email;
  final String? phone;

  factory AlertRecipient.fromJson(Map<String, dynamic> json) => AlertRecipient(
        userId: (json['user_id'] as int?) ?? 0,
        username: (json['username'] as String?) ?? '',
        email: json['email'] as String?,
        phone: json['phone'] as String?,
      );
}
