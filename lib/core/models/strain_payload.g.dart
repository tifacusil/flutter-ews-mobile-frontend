// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strain_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StrainPayload _$StrainPayloadFromJson(Map<String, dynamic> json) =>
    _StrainPayload(
      strainMicrostrain: (json['strainMicrostrain'] as num).toDouble(),
      temperatureCelsius: (json['temperatureCelsius'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StrainPayloadToJson(_StrainPayload instance) =>
    <String, dynamic>{
      'strainMicrostrain': instance.strainMicrostrain,
      'temperatureCelsius': instance.temperatureCelsius,
    };
