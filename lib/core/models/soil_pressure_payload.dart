// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'soil_pressure_payload.freezed.dart';
part 'soil_pressure_payload.g.dart';

@freezed
abstract class SoilPressurePayload with _$SoilPressurePayload {
  const factory SoilPressurePayload({
    @JsonKey(name: 'pressure_kpa') required double pressureKpa,
    @JsonKey(name: 'temperature_celsius') double? temperatureCelsius,
  }) = _SoilPressurePayload;

  factory SoilPressurePayload.fromJson(Map<String, dynamic> json) =>
      _$SoilPressurePayloadFromJson(json);
}
