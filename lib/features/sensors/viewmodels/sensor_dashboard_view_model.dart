import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/sensor_envelope.dart';
import '../../../core/repositories/sensor_repository.dart';
import '../../../core/models/date_range.dart';

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

class SensorDashboardViewModel
    extends StateNotifier<SensorDashboardState> {
  SensorDashboardViewModel({
    required this.projectId,
    required this.sensorId,
    required this._repository,
  }) : super(const SensorDashboardState());

  final String projectId;
  final String sensorId;
  final SensorRepository _repository;

  StreamSubscription<SensorEnvelope>? _sub;

  void startWatching() {
    _sub = _repository.watchSensor(projectId, sensorId).listen(
      (envelope) => state = state.copyWith(latest: envelope),
      onError: (Object e) =>
          state = state.copyWith(error: e.toString()),
    );
  }

  Future<void> loadHistory(DateRange range) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final history =
          await _repository.getHistory(projectId, sensorId, range);
      state = state.copyWith(history: history, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
}

// TODO: register sensorDashboardProvider family after wiring SensorRepository
