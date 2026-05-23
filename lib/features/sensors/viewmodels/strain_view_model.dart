import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/mock/mock_data.dart';

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
  });

  final String sensorId;
  final StrainTimeRange timeRange;
  final List<StrainReading> readings;
  final bool showTemperature;

  StrainChartState copyWith({
    String? sensorId,
    StrainTimeRange? timeRange,
    List<StrainReading>? readings,
    bool? showTemperature,
  }) =>
      StrainChartState(
        sensorId: sensorId ?? this.sensorId,
        timeRange: timeRange ?? this.timeRange,
        readings: readings ?? this.readings,
        showTemperature: showTemperature ?? this.showTemperature,
      );
}

@riverpod
class StrainViewModel extends _$StrainViewModel {
  static const _defaultRange = StrainTimeRange.halfYear;

  @override
  StrainChartState build({required String projectId, required String sensorId}) {
    return StrainChartState(
      sensorId: sensorId,
      timeRange: _defaultRange,
      readings: _filter(_defaultRange),
    );
  }

  List<StrainReading> _filter(StrainTimeRange range) {
    final all = MockData.strainReadings;
    if (all.isEmpty) return [];
    final cutoff = all.last.timestamp.subtract(Duration(days: range.days));
    return all.where((r) => r.timestamp.isAfter(cutoff)).toList();
  }

  void selectRange(StrainTimeRange range) {
    state = state.copyWith(timeRange: range, readings: _filter(range));
  }

  void toggleTemperature() {
    state = state.copyWith(showTemperature: !state.showTemperature);
  }

  void refresh() {}
}
