// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gnss_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GnssPayloadImpl _$$GnssPayloadImplFromJson(Map<String, dynamic> json) =>
    _$GnssPayloadImpl(
      displacementXMm: (json['displacementXMm'] as num).toDouble(),
      displacementYMm: (json['displacementYMm'] as num).toDouble(),
      displacementZMm: (json['displacementZMm'] as num).toDouble(),
      displacementHorizontalMm:
          (json['displacementHorizontalMm'] as num).toDouble(),
      cumulativeDisplacementMm:
          (json['cumulativeDisplacementMm'] as num).toDouble(),
      fixQuality: (json['fixQuality'] as num).toInt(),
    );

Map<String, dynamic> _$$GnssPayloadImplToJson(_$GnssPayloadImpl instance) =>
    <String, dynamic>{
      'displacementXMm': instance.displacementXMm,
      'displacementYMm': instance.displacementYMm,
      'displacementZMm': instance.displacementZMm,
      'displacementHorizontalMm': instance.displacementHorizontalMm,
      'cumulativeDisplacementMm': instance.cumulativeDisplacementMm,
      'fixQuality': instance.fixQuality,
    };
