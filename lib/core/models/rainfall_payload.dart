// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rainfall_payload.freezed.dart';
part 'rainfall_payload.g.dart';

@freezed
abstract class RainfallPayload with _$RainfallPayload {
  const factory RainfallPayload({
    @JsonKey(name: 'rainfall_mm') required double rainfallMm,
    @JsonKey(name: 'cumulative_rainfall_mm') required double cumulativeRainfallMm,
    @JsonKey(name: 'interval_minutes') required int intervalMinutes,
  }) = _RainfallPayload;

  factory RainfallPayload.fromJson(Map<String, dynamic> json) =>
      _$RainfallPayloadFromJson(json);
}
