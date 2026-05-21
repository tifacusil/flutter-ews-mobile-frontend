// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_envelope.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SensorEnvelope _$SensorEnvelopeFromJson(Map<String, dynamic> json) =>
    _SensorEnvelope(
      schemaVersion: json['schemaVersion'] as String,
      messageId: json['messageId'] as String,
      projectId: json['projectId'] as String,
      sensorId: json['sensorId'] as String,
      sensorType: json['sensorType'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      receivedAt: DateTime.parse(json['receivedAt'] as String),
      samplingIntervalSeconds: (json['samplingIntervalSeconds'] as num).toInt(),
      payload: json['payload'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$SensorEnvelopeToJson(_SensorEnvelope instance) =>
    <String, dynamic>{
      'schemaVersion': instance.schemaVersion,
      'messageId': instance.messageId,
      'projectId': instance.projectId,
      'sensorId': instance.sensorId,
      'sensorType': instance.sensorType,
      'timestamp': instance.timestamp.toIso8601String(),
      'receivedAt': instance.receivedAt.toIso8601String(),
      'samplingIntervalSeconds': instance.samplingIntervalSeconds,
      'payload': instance.payload,
    };
