import 'package:freezed_annotation/freezed_annotation.dart';

part 'rainfall_payload.freezed.dart';
part 'rainfall_payload.g.dart';

@freezed
abstract class RainfallPayload with _$RainfallPayload {
  const factory RainfallPayload({
    required double rainfallMm,
    required double cumulativeRainfallMm,
    required int intervalMinutes,
  }) = _RainfallPayload;

  factory RainfallPayload.fromJson(Map<String, dynamic> json) =>
      _$RainfallPayloadFromJson(json);
}
