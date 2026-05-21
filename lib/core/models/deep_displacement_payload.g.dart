// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deep_displacement_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeepDisplacementPayload _$DeepDisplacementPayloadFromJson(
  Map<String, dynamic> json,
) => _DeepDisplacementPayload(
  depthM: (json['depthM'] as num).toDouble(),
  tiltXMm: (json['tiltXMm'] as num).toDouble(),
  tiltYMm: (json['tiltYMm'] as num).toDouble(),
  cumulativeTiltMm: (json['cumulativeTiltMm'] as num).toDouble(),
);

Map<String, dynamic> _$DeepDisplacementPayloadToJson(
  _DeepDisplacementPayload instance,
) => <String, dynamic>{
  'depthM': instance.depthM,
  'tiltXMm': instance.tiltXMm,
  'tiltYMm': instance.tiltYMm,
  'cumulativeTiltMm': instance.cumulativeTiltMm,
};
