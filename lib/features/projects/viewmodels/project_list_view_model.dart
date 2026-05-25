import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/project.dart';
import '../../../core/providers/providers.dart';

part 'project_list_view_model.g.dart';

/// Loads the projects accessible to the current user by:
///
///   1. GET /api/v1/users/{userId}/subscriptions
///      → list of project_ids the user is subscribed to.
///   2. GET /api/v1/projects/{project_id}  (parallel, one per subscription)
///      → full project detail including sensors.
///
/// At most ~2 projects + 1 subscriptions call = 3 HTTP requests total.
@riverpod
class ProjectListViewModel extends _$ProjectListViewModel {
  @override
  Future<List<Project>> build() async {
    final auth = ref.watch(authServiceProvider);
    final userId = auth.userId;
    if (userId == null) return [];

    final userMgmt = ref.watch(userManagementServiceProvider);
    final data = ref.watch(dataServiceProvider);

    // Step 1 — subscriptions tell us which projects this user can see.
    final subscriptions = await userMgmt.listSubscriptions(userId);
    if (subscriptions.isEmpty) return [];

    // Step 2 — fetch each project in parallel.
    final apiProjects = await Future.wait(
      subscriptions.map((s) => data.getProject(s.projectId)),
    );

    return apiProjects.map((p) => p.toProject()).toList();
  }

  void reload() => ref.invalidateSelf();
}
