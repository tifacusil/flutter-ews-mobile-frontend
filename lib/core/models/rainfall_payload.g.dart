// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rainfall_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RainfallPayloadImpl _$$RainfallPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$RainfallPayloadImpl(
      rainfallMm: (json['rainfallMm'] as num).toDouble(),
      cumulativeRainfallMm: (json['cumulativeRainfallMm'] as num).toDouble(),
      intervalMinutes: (json['intervalMinutes'] as num).toInt(),
    );

Map<String, dynamic> _$$RainfallPayloadImplToJson(
        _$RainfallPayloadImpl instance) =>
    <String, dynamic>{
      'rainfallMm': instance.rainfallMm,
      'cumulativeRainfallMm': instance.cumulativeRainfallMm,
      'intervalMinutes': instance.intervalMinutes,
    };
