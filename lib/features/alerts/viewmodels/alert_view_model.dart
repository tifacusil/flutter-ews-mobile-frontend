import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/alert.dart';
import '../../../core/repositories/alert_repository.dart';

class AlertState {
  const AlertState({
    this.activeAlerts = const [],
    this.history = const [],
    this.isLoading = false,
    this.error,
  });

  final List<Alert> activeAlerts;
  final List<Alert> history;
  final bool isLoading;
  final String? error;

  AlertState copyWith({
    List<Alert>? activeAlerts,
    List<Alert>? history,
    bool? isLoading,
    String? error,
  }) =>
      AlertState(
        activeAlerts: activeAlerts ?? this.activeAlerts,
        history: history ?? this.history,
        isLoading: isLoading ?? this.isLoading,
        error: error,
      );
}

class AlertViewModel extends StateNotifier<AlertState> {
  AlertViewModel({
    required this.projectId,
    required this._repository,
  }) : super(const AlertState());

  final String projectId;
  final AlertRepository _repository;

  StreamSubscription<Alert>? _sub;

  void startWatching() {
    _sub = _repository.watchAlerts(projectId).listen(
      (alert) => state = state.copyWith(
        activeAlerts: [...state.activeAlerts, alert],
      ),
      onError: (Object e) => state = state.copyWith(error: e.toString()),
    );
  }

  Future<void> loadHistory() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final history = await _repository.getAlertHistory(projectId);
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

// TODO: register alertProvider family after wiring AlertRepository
