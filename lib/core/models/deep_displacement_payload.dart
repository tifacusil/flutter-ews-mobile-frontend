import 'package:freezed_annotation/freezed_annotation.dart';

part 'deep_displacement_payload.freezed.dart';
part 'deep_displacement_payload.g.dart';

@freezed
abstract class DeepDisplacementPayload with _$DeepDisplacementPayload {
  const factory DeepDisplacementPayload({
    required double depthM,
    required double tiltXMm,
    required double tiltYMm,
    required double cumulativeTiltMm,
  }) = _DeepDisplacementPayload;

  factory DeepDisplacementPayload.fromJson(Map<String, dynamic> json) =>
      _$DeepDisplacementPayloadFromJson(json);
}
