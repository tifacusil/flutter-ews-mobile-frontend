// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soil_pressure_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SoilPressurePayload _$SoilPressurePayloadFromJson(Map<String, dynamic> json) =>
    _SoilPressurePayload(
      pressureKpa: (json['pressure_kpa'] as num).toDouble(),
      temperatureCelsius: (json['temperature_celsius'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SoilPressurePayloadToJson(
  _SoilPressurePayload instance,
) => <String, dynamic>{
  'pressure_kpa': instance.pressureKpa,
  'temperature_celsius': instance.temperatureCelsius,
};
