// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rainfall_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RainfallPayload _$RainfallPayloadFromJson(Map<String, dynamic> json) =>
    _RainfallPayload(
      rainfallMm: (json['rainfall_mm'] as num).toDouble(),
      cumulativeRainfallMm: (json['cumulative_rainfall_mm'] as num).toDouble(),
      intervalMinutes: (json['interval_minutes'] as num).toInt(),
    );

Map<String, dynamic> _$RainfallPayloadToJson(_RainfallPayload instance) =>
    <String, dynamic>{
      'rainfall_mm': instance.rainfallMm,
      'cumulative_rainfall_mm': instance.cumulativeRainfallMm,
      'interval_minutes': instance.intervalMinutes,
    };
