import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/sensor_envelope.dart';
import '../../../core/models/date_range.dart';

// TODO: import sensorRepositoryProvider once SensorRepository is implemented

part 'sensor_dashboard_view_model.g.dart';

class SensorDashboardState {
  const SensorDashboardState({
    this.latest,
    this.history = const [],
    this.isLoading = false,
    this.error,
  });

  final SensorEnvelope? latest;
  final List<SensorEnvelope> history;
  final bool isLoading;
  final String? error;

  SensorDashboardState copyWith({
    SensorEnvelope? latest,
    List<SensorEnvelope>? history,
    bool? isLoading,
    String? error,
  }) =>
      SensorDashboardState(
        latest: latest ?? this.latest,
        history: history ?? this.history,
        isLoading: isLoading ?? this.isLoading,
        error: error,
      );
}

@riverpod
class SensorDashboardViewModel extends _$SensorDashboardViewModel {
  StreamSubscription<SensorEnvelope>? _sub;

  @override
  SensorDashboardState build({
    required String projectId,
    required String sensorId,
  }) {
    ref.onDispose(() => _sub?.cancel());
    return const SensorDashboardState();
  }

  void startWatching() {
    // TODO: _sub = ref.read(sensorRepositoryProvider).watchSensor(projectId, sensorId).listen(
    //   (envelope) => state = state.copyWith(latest: envelope),
    //   onError: (Object e) => state = state.copyWith(error: e.toString()),
    // );
  }

  Future<void> loadHistory(DateRange range) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      // TODO: final history = await ref.read(sensorRepositoryProvider).getHistory(projectId, sensorId, range);
      // state = state.copyWith(history: history, isLoading: false);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
