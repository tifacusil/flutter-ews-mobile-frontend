// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rainfall_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RainfallPayload _$RainfallPayloadFromJson(Map<String, dynamic> json) =>
    _RainfallPayload(
      rainfallMm: (json['rainfallMm'] as num).toDouble(),
      cumulativeRainfallMm: (json['cumulativeRainfallMm'] as num).toDouble(),
      intervalMinutes: (json['intervalMinutes'] as num).toInt(),
    );

Map<String, dynamic> _$RainfallPayloadToJson(_RainfallPayload instance) =>
    <String, dynamic>{
      'rainfallMm': instance.rainfallMm,
      'cumulativeRainfallMm': instance.cumulativeRainfallMm,
      'intervalMinutes': instance.intervalMinutes,
    };
