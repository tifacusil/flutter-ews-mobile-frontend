import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/project.dart';
import '../../../core/providers/providers.dart';

part 'project_list_view_model.g.dart';

@riverpod
class ProjectListViewModel extends _$ProjectListViewModel {
  @override
  Future<List<Project>> build() async {
    final svc = ref.watch(dataServiceProvider);
    final apiProjects = await svc.getProjects();
    return apiProjects.map((p) => p.toProject()).toList();
  }

  void reload() => ref.invalidateSelf();
}
