import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/deep_displacement_payload.dart';
import '../../../core/providers/providers.dart';
import '../../../data/mock/mock_data.dart'; // DeepDisplacementReading wrapper

part 'deep_displacement_view_model.g.dart';

class DeepChartState {
  const DeepChartState({
    required this.sensorId,
    required this.readings,
    this.isLoading = false,
    this.error,
  });

  final String sensorId;
  final List<DeepDisplacementReading> readings;
  final bool isLoading;
  final String? error;

  DeepChartState copyWith({
    String? sensorId,
    List<DeepDisplacementReading>? readings,
    bool? isLoading,
    String? error,
  }) =>
      DeepChartState(
        sensorId: sensorId ?? this.sensorId,
        readings: readings ?? this.readings,
        isLoading: isLoading ?? this.isLoading,
        error: error,
      );
}

@riverpod
class DeepDisplacementViewModel extends _$DeepDisplacementViewModel {
  @override
  DeepChartState build({required String projectId, required String sensorId}) {
    Future.microtask(() => _fetch(sensorId));
    return DeepChartState(
      sensorId: sensorId,
      readings: const [],
      isLoading: true,
    );
  }

  Future<void> _fetch(String sensorId) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final svc = ref.read(readingsServiceProvider);
      // Fetch the most recent depth profile (last 7 days, up to 200 points)
      final now = DateTime.now().toUtc();
      final from = now.subtract(const Duration(days: 7));

      final paged = await svc.getSensorReadings(
        sensorId: sensorId,
        from: from,
        to: now,
        sensorType: 'deep_displacement',
        limit: 200,
      );

      // Keep the latest reading per depth level.
      // Items are returned in ascending time order, so iterating forward and
      // overwriting gives us the most recent value for each depth.
      final byDepth = <double, DeepDisplacementReading>{};
      for (final d in paged.items) {
        if (d.payload.isEmpty) continue;
        try {
          final payload = DeepDisplacementPayload.fromJson(d.payload);
          byDepth[payload.depthM] = DeepDisplacementReading(payload: payload);
        } catch (_) {}
      }

      final readings = byDepth.values.toList()
        ..sort((a, b) => a.payload.depthM.compareTo(b.payload.depthM));

      state = state.copyWith(readings: readings, isLoading: false);
    } catch (e, st) {
      debugPrint('DeepDisplacementViewModel error: $e\n$st');
      state = state.copyWith(
        readings: const [],
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  void refresh() => _fetch(state.sensorId);
}
