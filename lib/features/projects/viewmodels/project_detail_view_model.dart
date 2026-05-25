import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/project.dart';
import '../../../core/providers/providers.dart';

part 'project_detail_view_model.g.dart';

/// Loads a single project with its sensors.
///
/// Uses GET /api/v1/projects/{id} which returns both the project metadata
/// and the sensor list in one call — no separate sensors request needed.
@riverpod
class ProjectDetailViewModel extends _$ProjectDetailViewModel {
  @override
  Future<ApiProject> build(String projectId) async {
    return ref.watch(dataServiceProvider).getProject(projectId);
  }

  void reload() => ref.invalidateSelf();
}
