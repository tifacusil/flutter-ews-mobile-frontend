import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/soil_pressure_payload.dart';
import '../../../core/providers/providers.dart';
import '../../../data/mock/mock_data.dart'; // SoilPressureReading wrapper

part 'soil_pressure_view_model.g.dart';

enum SoilPressureTimeRange {
  month(label: 'Recent 1 month', days: 30),
  threeMonths(label: 'Recent 3 months', days: 90),
  halfYear(label: 'Recent half year', days: 180);

  const SoilPressureTimeRange({required this.label, required this.days});
  final String label;
  final int days;
}

class SoilPressureChartState {
  const SoilPressureChartState({
    required this.sensorId,
    required this.timeRange,
    required this.readings,
    this.showTemperature = true,
    this.isLoading = false,
    this.error,
  });

  final String sensorId;
  final SoilPressureTimeRange timeRange;
  final List<SoilPressureReading> readings;
  final bool showTemperature;
  final bool isLoading;
  final String? error;

  SoilPressureChartState copyWith({
    String? sensorId,
    SoilPressureTimeRange? timeRange,
    List<SoilPressureReading>? readings,
    bool? showTemperature,
    bool? isLoading,
    String? error,
  }) =>
      SoilPressureChartState(
        sensorId: sensorId ?? this.sensorId,
        timeRange: timeRange ?? this.timeRange,
        readings: readings ?? this.readings,
        showTemperature: showTemperature ?? this.showTemperature,
        isLoading: isLoading ?? this.isLoading,
        error: error,
      );
}

@riverpod
class SoilPressureViewModel extends _$SoilPressureViewModel {
  static const _defaultRange = SoilPressureTimeRange.halfYear;

  @override
  SoilPressureChartState build({required String projectId, required String sensorId}) {
    Future.microtask(() => _fetch(sensorId, _defaultRange));
    return SoilPressureChartState(
      sensorId: sensorId,
      timeRange: _defaultRange,
      readings: const [],
      isLoading: true,
    );
  }

  Future<void> _fetch(String sensorId, SoilPressureTimeRange range) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final now = DateTime.now().toUtc();
      final from = now.subtract(Duration(days: range.days));

      final svc = ref.read(readingsServiceProvider);
      final items = await svc.getAllSensorReadings(
        sensorId: sensorId,
        from: from,
        to: now,
        sensorType: 'soil_pressure',
      );

      final readings = items
          .where((d) => d.payload.isNotEmpty)
          .map((d) {
            try {
              return SoilPressureReading(
                timestamp: d.timestamp,
                payload: SoilPressurePayload.fromJson(d.payload),
              );
            } catch (_) {
              return null;
            }
          })
          .whereType<SoilPressureReading>()
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

  void selectRange(SoilPressureTimeRange range) {
    state = state.copyWith(timeRange: range);
    _fetch(state.sensorId, range);
  }

  void toggleTemperature() {
    state = state.copyWith(showTemperature: !state.showTemperature);
  }

  void refresh() => _fetch(state.sensorId, state.timeRange);
}
