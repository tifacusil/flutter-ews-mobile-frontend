import 'package:freezed_annotation/freezed_annotation.dart';

part 'strain_payload.freezed.dart';
part 'strain_payload.g.dart';

@freezed
class StrainPayload with _$StrainPayload {
  const factory StrainPayload({
    required double strainMicrostrain,
    double? temperatureCelsius,
  }) = _StrainPayload;

  factory StrainPayload.fromJson(Map<String, dynamic> json) =>
      _$StrainPayloadFromJson(json);
}
