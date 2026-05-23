import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/mock/mock_data.dart';

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
  });

  final String sensorId;
  final SoilPressureTimeRange timeRange;
  final List<SoilPressureReading> readings;
  final bool showTemperature;

  SoilPressureChartState copyWith({
    String? sensorId,
    SoilPressureTimeRange? timeRange,
    List<SoilPressureReading>? readings,
    bool? showTemperature,
  }) =>
      SoilPressureChartState(
        sensorId: sensorId ?? this.sensorId,
        timeRange: timeRange ?? this.timeRange,
        readings: readings ?? this.readings,
        showTemperature: showTemperature ?? this.showTemperature,
      );
}

@riverpod
class SoilPressureViewModel extends _$SoilPressureViewModel {
  static const _defaultRange = SoilPressureTimeRange.halfYear;

  @override
  SoilPressureChartState build({required String projectId, required String sensorId}) {
    return SoilPressureChartState(
      sensorId: sensorId,
      timeRange: _defaultRange,
      readings: _filter(_defaultRange),
    );
  }

  List<SoilPressureReading> _filter(SoilPressureTimeRange range) {
    final all = MockData.soilPressureReadings;
    if (all.isEmpty) return [];
    final cutoff = all.last.timestamp.subtract(Duration(days: range.days));
    return all.where((r) => r.timestamp.isAfter(cutoff)).toList();
  }

  void selectRange(SoilPressureTimeRange range) {
    state = state.copyWith(timeRange: range, readings: _filter(range));
  }

  void toggleTemperature() {
    state = state.copyWith(showTemperature: !state.showTemperature);
  }

  void refresh() {}
}
