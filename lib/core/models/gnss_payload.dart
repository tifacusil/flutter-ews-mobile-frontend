// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gnss_payload.freezed.dart';
part 'gnss_payload.g.dart';

@freezed
abstract class GnssPayload with _$GnssPayload {
  const factory GnssPayload({
    @JsonKey(name: 'displacement_x_mm') required double displacementXMm,
    @JsonKey(name: 'displacement_y_mm') required double displacementYMm,
    @JsonKey(name: 'displacement_z_mm') required double displacementZMm,
    @JsonKey(name: 'displacement_horizontal_mm') required double displacementHorizontalMm,
    @JsonKey(name: 'cumulative_displacement_mm') required double cumulativeDisplacementMm,
    /// "rtk_fixed" | "float" | "dgps" | "autonomous"
    @JsonKey(name: 'fix_quality') required String fixQuality,
  }) = _GnssPayload;

  factory GnssPayload.fromJson(Map<String, dynamic> json) =>
      _$GnssPayloadFromJson(json);
}
