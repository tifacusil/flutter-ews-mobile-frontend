import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/alert.dart';

// TODO: import alertRepositoryProvider once AlertRepository is implemented

part 'alert_view_model.g.dart';

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

@riverpod
class AlertViewModel extends _$AlertViewModel {
  StreamSubscription<Alert>? _sub;

  @override
  AlertState build({required String projectId}) {
    ref.onDispose(() => _sub?.cancel());
    return const AlertState();
  }

  void startWatching() {
    // TODO: _sub = ref.read(alertRepositoryProvider).watchAlerts(projectId).listen(
    //   (alert) => state = state.copyWith(activeAlerts: [...state.activeAlerts, alert]),
    //   onError: (Object e) => state = state.copyWith(error: e.toString()),
    // );
  }

  Future<void> loadHistory() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      // TODO: final history = await ref.read(alertRepositoryProvider).getAlertHistory(projectId);
      // state = state.copyWith(history: history, isLoading: false);
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
