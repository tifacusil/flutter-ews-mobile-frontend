import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/mock/mock_data.dart';

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
  });

  final String sensorId;
  final GnssTimeRange timeRange;
  final List<GnssReading> readings;
  final bool isLoading;

  GnssChartState copyWith({
    String? sensorId,
    GnssTimeRange? timeRange,
    List<GnssReading>? readings,
    bool? isLoading,
  }) =>
      GnssChartState(
        sensorId: sensorId ?? this.sensorId,
        timeRange: timeRange ?? this.timeRange,
        readings: readings ?? this.readings,
        isLoading: isLoading ?? this.isLoading,
      );
}

@riverpod
class GnssViewModel extends _$GnssViewModel {
  static const _defaultRange = GnssTimeRange.halfYear;

  @override
  GnssChartState build({required String projectId, required String sensorId}) {
    return GnssChartState(
      sensorId: sensorId,
      timeRange: _defaultRange,
      readings: _filter(sensorId, _defaultRange),
    );
  }

  List<GnssReading> _filter(String sensorId, GnssTimeRange range) {
    final all = MockData.gnssReadings;
    if (all.isEmpty) return [];
    final cutoff = all.last.timestamp.subtract(Duration(days: range.days));
    return all.where((r) => r.timestamp.isAfter(cutoff)).toList();
  }

  void selectRange(GnssTimeRange range) {
    state = state.copyWith(
      timeRange: range,
      readings: _filter(state.sensorId, range),
    );
  }

  void refresh() {}
}
