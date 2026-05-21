// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soil_pressure_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SoilPressurePayload _$SoilPressurePayloadFromJson(Map<String, dynamic> json) =>
    _SoilPressurePayload(
      pressureKpa: (json['pressureKpa'] as num).toDouble(),
      temperatureCelsius: (json['temperatureCelsius'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SoilPressurePayloadToJson(
  _SoilPressurePayload instance,
) => <String, dynamic>{
  'pressureKpa': instance.pressureKpa,
  'temperatureCelsius': instance.temperatureCelsius,
};
