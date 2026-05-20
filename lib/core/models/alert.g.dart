// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlertImpl _$$AlertImplFromJson(Map<String, dynamic> json) => _$AlertImpl(
      alertId: json['alertId'] as String,
      projectId: json['projectId'] as String,
      sensorId: json['sensorId'] as String,
      level: $enumDecode(_$AlertLevelEnumMap, json['level']),
      valueMmPerDay: (json['valueMmPerDay'] as num).toDouble(),
      triggeredAt: DateTime.parse(json['triggeredAt'] as String),
      resolvedAt: json['resolvedAt'] == null
          ? null
          : DateTime.parse(json['resolvedAt'] as String),
    );

Map<String, dynamic> _$$AlertImplToJson(_$AlertImpl instance) =>
    <String, dynamic>{
      'alertId': instance.alertId,
      'projectId': instance.projectId,
      'sensorId': instance.sensorId,
      'level': _$AlertLevelEnumMap[instance.level]!,
      'valueMmPerDay': instance.valueMmPerDay,
      'triggeredAt': instance.triggeredAt.toIso8601String(),
      'resolvedAt': instance.resolvedAt?.toIso8601String(),
    };

const _$AlertLevelEnumMap = {
  AlertLevel.blue: 'blue',
  AlertLevel.orange: 'orange',
  AlertLevel.red: 'red',
};
