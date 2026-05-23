// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deep_displacement_payload.freezed.dart';
part 'deep_displacement_payload.g.dart';

@freezed
abstract class DeepDisplacementPayload with _$DeepDisplacementPayload {
  const factory DeepDisplacementPayload({
    @JsonKey(name: 'depth_m') required double depthM,
    @JsonKey(name: 'tilt_x_mm') required double tiltXMm,
    @JsonKey(name: 'tilt_y_mm') required double tiltYMm,
    @JsonKey(name: 'cumulative_tilt_mm') required double cumulativeTiltMm,
  }) = _DeepDisplacementPayload;

  factory DeepDisplacementPayload.fromJson(Map<String, dynamic> json) =>
      _$DeepDisplacementPayloadFromJson(json);
}
