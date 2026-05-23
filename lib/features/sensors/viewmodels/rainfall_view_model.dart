import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/mock/mock_data.dart';

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
  });

  final String sensorId;
  final RainfallTimeRange timeRange;
  final List<RainfallReading> readings;

  RainfallChartState copyWith({
    String? sensorId,
    RainfallTimeRange? timeRange,
    List<RainfallReading>? readings,
  }) =>
      RainfallChartState(
        sensorId: sensorId ?? this.sensorId,
        timeRange: timeRange ?? this.timeRange,
        readings: readings ?? this.readings,
      );
}

@riverpod
class RainfallViewModel extends _$RainfallViewModel {
  static const _defaultRange = RainfallTimeRange.week;

  @override
  RainfallChartState build({required String projectId, required String sensorId}) {
    return RainfallChartState(
      sensorId: sensorId,
      timeRange: _defaultRange,
      readings: _filter(_defaultRange),
    );
  }

  List<RainfallReading> _filter(RainfallTimeRange range) {
    final all = MockData.rainfallReadings;
    if (all.isEmpty) return [];
    final cutoff = all.last.timestamp.subtract(Duration(hours: range.hours));
    return all.where((r) => r.timestamp.isAfter(cutoff)).toList();
  }

  void selectRange(RainfallTimeRange range) {
    state = state.copyWith(timeRange: range, readings: _filter(range));
  }

  void refresh() {}
}
