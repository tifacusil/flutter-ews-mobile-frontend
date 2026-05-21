import 'package:freezed_annotation/freezed_annotation.dart';

part 'sensor_envelope.freezed.dart';
part 'sensor_envelope.g.dart';

@freezed
abstract class SensorEnvelope with _$SensorEnvelope {
  const factory SensorEnvelope({
    required String schemaVersion,
    required String messageId,
    required String projectId,
    required String sensorId,
    required String sensorType,
    required DateTime timestamp,
    required DateTime receivedAt,
    required int samplingIntervalSeconds,
    required Map<String, dynamic> payload,
  }) = _SensorEnvelope;

  factory SensorEnvelope.fromJson(Map<String, dynamic> json) =>
      _$SensorEnvelopeFromJson(json);
}
