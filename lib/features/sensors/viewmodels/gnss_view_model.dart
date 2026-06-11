import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/gnss_payload.dart';
import '../../../core/providers/providers.dart';
import '../../../data/mock/mock_data.dart'; // GnssReading wrapper

part 'gnss_view_model.g.dart';

enum GnssTimeRange {
  month(label: 'Recent 1 month', days: 30),
  threeMonths(label: 'Recent 3 months', days: 90),
  halfYear(label: 'Recent half year', days: 180);

  const GnssTimeRange({required this.label, required this.days});
  final String label;
  final int days;
}

class GnssChartState {
  const GnssChartState({
    required this.sensorId,
    required this.timeRange,
    required this.readings,
    this.isLoading = false,
    this.error,
  });

  final String sensorId;
  final GnssTimeRange timeRange;
  final List<GnssReading> readings;
  final bool isLoading;
  final String? error;

  GnssChartState copyWith({
    String? sensorId,
    GnssTimeRange? timeRange,
    List<GnssReading>? readings,
    bool? isLoading,
    String? error,
  }) =>
      GnssChartState(
        sensorId: sensorId ?? this.sensorId,
        timeRange: timeRange ?? this.timeRange,
        readings: readings ?? this.readings,
        isLoading: isLoading ?? this.isLoading,
        error: error,
      );
}

@riverpod
class GnssViewModel extends _$GnssViewModel {
  static const _defaultRange = GnssTimeRange.halfYear;

  @override
  GnssChartState build({required String projectId, required String sensorId}) {
    // Kick off the first fetch immediately.
    Future.microtask(() => _fetch(sensorId, _defaultRange));
    return GnssChartState(
      sensorId: sensorId,
      timeRange: _defaultRange,
      readings: const [],
      isLoading: true,
    );
  }

  Future<void> _fetch(String sensorId, GnssTimeRange range) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final now = DateTime.now().toUtc();
      final from = now.subtract(Duration(days: range.days));

      final svc = ref.read(readingsServiceProvider);
      final items = await svc.getAllSensorReadings(
        sensorId: sensorId,
        from: from,
        to: now,
        sensorType: 'gnss',
      );

      final readings = items
          .where((d) => d.payload.isNotEmpty)
          .map((d) {
            try {
              return GnssReading(
                timestamp: d.timestamp,
                payload: GnssPayload.fromJson(d.payload),
              );
            } catch (_) {
              return null;
            }
          })
          .whereType<GnssReading>()
          .toList();

      state = state.copyWith(readings: readings, isLoading: false);
    } catch (e, st) {
      debugPrint('GnssViewModel error: $e\n$st');
      state = state.copyWith(
        readings: const [],
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  void selectRange(GnssTimeRange range) {
    state = state.copyWith(timeRange: range);
    _fetch(state.sensorId, range);
  }

  void refresh() => _fetch(state.sensorId, state.timeRange);
}
