import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/project.dart';
import '../../../core/providers/providers.dart';
import '../../../data/mock/mock_data.dart';

part 'project_list_view_model.g.dart';

@riverpod
class ProjectListViewModel extends _$ProjectListViewModel {
  @override
  Future<List<Project>> build() async {
    final authService = ref.watch(authServiceProvider);
    final userId = authService.userId;
    if (userId == null) return [];

    final svc = ref.watch(userManagementServiceProvider);
    final subscriptions = await svc.listSubscriptions(userId);

    final subscribedIds = subscriptions.map((s) => s.projectId).toSet();

    final projects = MockData.projects
        .where((p) => subscribedIds.contains(p.id))
        .toList()
      ..sort((a, b) {
        if (a.activeAlertLevel != null && b.activeAlertLevel == null) return -1;
        if (a.activeAlertLevel == null && b.activeAlertLevel != null) return 1;
        return a.displayName.compareTo(b.displayName);
      });

    return projects;
  }

  void reload() => ref.invalidateSelf();
}
