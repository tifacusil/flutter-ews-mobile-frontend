// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strain_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StrainPayload _$StrainPayloadFromJson(Map<String, dynamic> json) =>
    _StrainPayload(
      strainMicrostrain: (json['strain_microstrain'] as num).toDouble(),
      temperatureCelsius: (json['temperature_celsius'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StrainPayloadToJson(_StrainPayload instance) =>
    <String, dynamic>{
      'strain_microstrain': instance.strainMicrostrain,
      'temperature_celsius': instance.temperatureCelsius,
    };
