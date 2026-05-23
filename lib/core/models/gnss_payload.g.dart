// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gnss_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GnssPayload _$GnssPayloadFromJson(Map<String, dynamic> json) => _GnssPayload(
  displacementXMm: (json['displacement_x_mm'] as num).toDouble(),
  displacementYMm: (json['displacement_y_mm'] as num).toDouble(),
  displacementZMm: (json['displacement_z_mm'] as num).toDouble(),
  displacementHorizontalMm: (json['displacement_horizontal_mm'] as num)
      .toDouble(),
  cumulativeDisplacementMm: (json['cumulative_displacement_mm'] as num)
      .toDouble(),
  fixQuality: json['fix_quality'] as String,
);

Map<String, dynamic> _$GnssPayloadToJson(_GnssPayload instance) =>
    <String, dynamic>{
      'displacement_x_mm': instance.displacementXMm,
      'displacement_y_mm': instance.displacementYMm,
      'displacement_z_mm': instance.displacementZMm,
      'displacement_horizontal_mm': instance.displacementHorizontalMm,
      'cumulative_displacement_mm': instance.cumulativeDisplacementMm,
      'fix_quality': instance.fixQuality,
    };
