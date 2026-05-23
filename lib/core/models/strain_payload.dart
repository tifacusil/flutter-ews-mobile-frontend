// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'strain_payload.freezed.dart';
part 'strain_payload.g.dart';

@freezed
abstract class StrainPayload with _$StrainPayload {
  const factory StrainPayload({
    @JsonKey(name: 'strain_microstrain') required double strainMicrostrain,
    @JsonKey(name: 'temperature_celsius') double? temperatureCelsius,
  }) = _StrainPayload;

  factory StrainPayload.fromJson(Map<String, dynamic> json) =>
      _$StrainPayloadFromJson(json);
}
