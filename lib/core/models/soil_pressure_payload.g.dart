// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soil_pressure_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SoilPressurePayloadImpl _$$SoilPressurePayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$SoilPressurePayloadImpl(
      pressureKpa: (json['pressureKpa'] as num).toDouble(),
      temperatureCelsius: (json['temperatureCelsius'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$SoilPressurePayloadImplToJson(
        _$SoilPressurePayloadImpl instance) =>
    <String, dynamic>{
      'pressureKpa': instance.pressureKpa,
      'temperatureCelsius': instance.temperatureCelsius,
    };
