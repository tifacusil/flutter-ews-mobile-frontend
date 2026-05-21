import 'package:freezed_annotation/freezed_annotation.dart';
import 'alert_level.dart';

part 'alert.freezed.dart';
part 'alert.g.dart';

@freezed
abstract class Alert with _$Alert {
  const factory Alert({
    required String alertId,
    required String projectId,
    required String sensorId,
    required AlertLevel level,
    required double valueMmPerDay,
    required DateTime triggeredAt,
    DateTime? resolvedAt,
  }) = _Alert;

  factory Alert.fromJson(Map<String, dynamic> json) => _$AlertFromJson(json);
}
