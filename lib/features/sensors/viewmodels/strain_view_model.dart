import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/strain_payload.dart';
import '../../../core/providers/providers.dart';
import '../../../data/mock/mock_data.dart'; // StrainReading wrapper

part 'strain_view_model.g.dart';

enum StrainTimeRange {
  month(label: 'Recent 1 month', days: 30),
  threeMonths(label: 'Recent 3 months', days: 90),
  halfYear(label: 'Recent half year', days: 180);

  const StrainTimeRange({required this.label, required this.days});
  final String label;
  final int days;
}

class StrainChartState {
  const StrainChartState({
    required this.sensorId,
    required this.timeRange,
    required this.readings,
    this.showTemperature = true,
    this.isLoading = false,
    this.error,
  });

  final String sensorId;
  final StrainTimeRange timeRange;
  final List<StrainReading> readings;
  final bool showTemperature;
  final bool isLoading;
  final String? error;

  StrainChartState copyWith({
    String? sensorId,
    StrainTimeRange? timeRange,
    List<StrainReading>? readings,
    bool? showTemperature,
    bool? isLoading,
    String? error,
  }) =>
      StrainChartState(
        sensorId: sensorId ?? this.sensorId,
        timeRange: timeRange ?? this.timeRange,
        readings: readings ?? this.readings,
        showTemperature: showTemperature ?? this.showTemperature,
        isLoading: isLoading ?? this.isLoading,
        error: error,
      );
}

@riverpod
class StrainViewModel extends _$StrainViewModel {
  static const _defaultRange = StrainTimeRange.halfYear;

  @override
  StrainChartState build({required String projectId, required String sensorId}) {
    Future.microtask(() => _fetch(sensorId, _defaultRange));
    return StrainChartState(
      sensorId: sensorId,
      timeRange: _defaultRange,
      readings: const [],
      isLoading: true,
    );
  }

  Future<void> _fetch(String sensorId, StrainTimeRange range) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final now = DateTime.now().toUtc();
      final from = now.subtract(Duration(days: range.days));

      final svc = ref.read(readingsServiceProvider);
      final items = await svc.getAllSensorReadings(
        sensorId: sensorId,
        from: from,
        to: now,
        sensorType: 'strain',
      );

      final readings = items
          .where((d) => d.payload.isNotEmpty)
          .map((d) {
            try {
              return StrainReading(
                timestamp: d.timestamp,
                payload: StrainPayload.fromJson(d.payload),
              );
            } catch (_) {
              return null;
            }
          })
          .whereType<StrainReading>()
          .toList();

      state = state.copyWith(readings: readings, isLoading: false);
    } catch (e) {
      state = state.copyWith(
        readings: const [],
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  void selectRange(StrainTimeRange range) {
    state = state.copyWith(timeRange: range);
    _fetch(state.sensorId, range);
  }

  void toggleTemperature() {
    state = state.copyWith(showTemperature: !state.showTemperature);
  }

  void refresh() => _fetch(state.sensorId, state.timeRange);
}
