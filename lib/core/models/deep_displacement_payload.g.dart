// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deep_displacement_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeepDisplacementPayloadImpl _$$DeepDisplacementPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$DeepDisplacementPayloadImpl(
      depthM: (json['depthM'] as num).toDouble(),
      tiltXMm: (json['tiltXMm'] as num).toDouble(),
      tiltYMm: (json['tiltYMm'] as num).toDouble(),
      cumulativeTiltMm: (json['cumulativeTiltMm'] as num).toDouble(),
    );

Map<String, dynamic> _$$DeepDisplacementPayloadImplToJson(
        _$DeepDisplacementPayloadImpl instance) =>
    <String, dynamic>{
      'depthM': instance.depthM,
      'tiltXMm': instance.tiltXMm,
      'tiltYMm': instance.tiltYMm,
      'cumulativeTiltMm': instance.cumulativeTiltMm,
    };
