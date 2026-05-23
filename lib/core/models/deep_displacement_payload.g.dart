// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deep_displacement_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeepDisplacementPayload _$DeepDisplacementPayloadFromJson(
  Map<String, dynamic> json,
) => _DeepDisplacementPayload(
  depthM: (json['depth_m'] as num).toDouble(),
  tiltXMm: (json['tilt_x_mm'] as num).toDouble(),
  tiltYMm: (json['tilt_y_mm'] as num).toDouble(),
  cumulativeTiltMm: (json['cumulative_tilt_mm'] as num).toDouble(),
);

Map<String, dynamic> _$DeepDisplacementPayloadToJson(
  _DeepDisplacementPayload instance,
) => <String, dynamic>{
  'depth_m': instance.depthM,
  'tilt_x_mm': instance.tiltXMm,
  'tilt_y_mm': instance.tiltYMm,
  'cumulative_tilt_mm': instance.cumulativeTiltMm,
};
