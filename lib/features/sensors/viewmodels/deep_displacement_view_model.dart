import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/mock/mock_data.dart';

part 'deep_displacement_view_model.g.dart';

class DeepChartState {
  const DeepChartState({
    required this.sensorId,
    required this.readings,
  });

  final String sensorId;
  final List<DeepDisplacementReading> readings;

  DeepChartState copyWith({
    String? sensorId,
    List<DeepDisplacementReading>? readings,
  }) =>
      DeepChartState(
        sensorId: sensorId ?? this.sensorId,
        readings: readings ?? this.readings,
      );
}

@riverpod
class DeepDisplacementViewModel extends _$DeepDisplacementViewModel {
  @override
  DeepChartState build({required String projectId, required String sensorId}) {
    return DeepChartState(
      sensorId: sensorId,
      readings: MockData.deepReadings,
    );
  }

  void refresh() {}
}
