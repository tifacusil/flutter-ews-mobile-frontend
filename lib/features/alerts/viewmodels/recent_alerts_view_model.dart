import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/recent_alert.dart';
import '../../../core/providers/providers.dart';

part 'recent_alerts_view_model.g.dart';

/// Loads the most recent alerts for the current user across all their
/// subscribed projects.
///
/// Calls GET /api/v1/alerts/recent?limit=[limit].
@riverpod
class RecentAlertsViewModel extends _$RecentAlertsViewModel {
  @override
  Future<List<RecentAlert>> build({int limit = 50}) async {
    final data = ref.watch(dataServiceProvider);
    return data.getRecentAlerts(limit: limit);
  }

  void reload() => ref.invalidateSelf();
}
