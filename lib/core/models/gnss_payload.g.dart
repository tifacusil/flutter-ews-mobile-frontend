// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gnss_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GnssPayload _$GnssPayloadFromJson(Map<String, dynamic> json) => _GnssPayload(
  displacementXMm: (json['displacementXMm'] as num).toDouble(),
  displacementYMm: (json['displacementYMm'] as num).toDouble(),
  displacementZMm: (json['displacementZMm'] as num).toDouble(),
  displacementHorizontalMm: (json['displacementHorizontalMm'] as num)
      .toDouble(),
  cumulativeDisplacementMm: (json['cumulativeDisplacementMm'] as num)
      .toDouble(),
  fixQuality: (json['fixQuality'] as num).toInt(),
);

Map<String, dynamic> _$GnssPayloadToJson(_GnssPayload instance) =>
    <String, dynamic>{
      'displacementXMm': instance.displacementXMm,
      'displacementYMm': instance.displacementYMm,
      'displacementZMm': instance.displacementZMm,
      'displacementHorizontalMm': instance.displacementHorizontalMm,
      'cumulativeDisplacementMm': instance.cumulativeDisplacementMm,
      'fixQuality': instance.fixQuality,
    };
