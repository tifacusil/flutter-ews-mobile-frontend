import 'package:freezed_annotation/freezed_annotation.dart';

part 'gnss_payload.freezed.dart';
part 'gnss_payload.g.dart';

@freezed
class GnssPayload with _$GnssPayload {
  const factory GnssPayload({
    required double displacementXMm,
    required double displacementYMm,
    required double displacementZMm,
    required double displacementHorizontalMm,
    required double cumulativeDisplacementMm,
    required int fixQuality,
  }) = _GnssPayload;

  factory GnssPayload.fromJson(Map<String, dynamic> json) =>
      _$GnssPayloadFromJson(json);
}
