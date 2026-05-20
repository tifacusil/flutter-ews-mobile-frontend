// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strain_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StrainPayloadImpl _$$StrainPayloadImplFromJson(Map<String, dynamic> json) =>
    _$StrainPayloadImpl(
      strainMicrostrain: (json['strainMicrostrain'] as num).toDouble(),
      temperatureCelsius: (json['temperatureCelsius'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$StrainPayloadImplToJson(_$StrainPayloadImpl instance) =>
    <String, dynamic>{
      'strainMicrostrain': instance.strainMicrostrain,
      'temperatureCelsius': instance.temperatureCelsius,
    };
