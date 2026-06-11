import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/rainfall_payload.dart';
import '../../../core/providers/providers.dart';
import '../../../data/mock/mock_data.dart'; // RainfallReading wrapper

part 'rainfall_view_model.g.dart';

enum RainfallTimeRange {
  day(label: 'Last 24 h', hours: 24),
  threeDays(label: 'Last 3 days', hours: 72),
  week(label: 'Last 7 days', hours: 168);

  const RainfallTimeRange({required this.label, required this.hours});
  final String label;
  final int hours;
}

class RainfallChartState {
  const RainfallChartState({
    required this.sensorId,
    required this.timeRange,
    required this.readings,
    this.isLoading = false,
    this.error,
  });

  final String sensorId;
  final RainfallTimeRange timeRange;
  final List<RainfallReading> readings;
  final bool isLoading;
  final String? error;

  RainfallChartState copyWith({
    String? sensorId,
    RainfallTimeRange? timeRange,
    List<RainfallReading>? readings,
    bool? isLoading,
    String? error,
  }) =>
      RainfallChartState(
        sensorId: sensorId ?? this.sensorId,
        timeRange: timeRange ?? this.timeRange,
        readings: readings ?? this.readings,
        isLoading: isLoading ?? this.isLoading,
        error: error,
      );
}

@riverpod
class RainfallViewModel extends _$RainfallViewModel {
  static const _defaultRange = RainfallTimeRange.week;

  @override
  RainfallChartState build({required String projectId, required String sensorId}) {
    Future.microtask(() => _fetch(sensorId, _defaultRange));
    return RainfallChartState(
      sensorId: sensorId,
      timeRange: _defaultRange,
      readings: const [],
      isLoading: true,
    );
  }

  Future<void> _fetch(String sensorId, RainfallTimeRange range) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final now = DateTime.now().toUtc();
      final from = now.subtract(Duration(hours: range.hours));

      final svc = ref.read(readingsServiceProvider);
      final items = await svc.getAllSensorReadings(
        sensorId: sensorId,
        from: from,
        to: now,
        sensorType: 'rainfall',
      );

      final readings = items
          .where((d) => d.payload.isNotEmpty)
          .map((d) {
            try {
              return RainfallReading(
                timestamp: d.timestamp,
                payload: RainfallPayload.fromJson(d.payload),
              );
            } catch (_) {
              return null;
            }
          })
          .whereType<RainfallReading>()
          .toList();

      state = state.copyWith(readings: readings, isLoading: false);
    } catch (e, st) {
      debugPrint('RainfallViewModel error: $e\n$st');
      state = state.copyWith(
        readings: const [],
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  void selectRange(RainfallTimeRange range) {
    state = state.copyWith(timeRange: range);
    _fetch(state.sensorId, range);
  }

  void refresh() => _fetch(state.sensorId, state.timeRange);
}
