import 'package:riverpod_annotation/riverpod_annotation.dart';

// TODO: define a Project model and import projectRepositoryProvider

part 'project_list_view_model.g.dart';

@riverpod
class ProjectListViewModel extends _$ProjectListViewModel {
  @override
  Future<List<dynamic>> build() async {
    // TODO: return await ref.read(projectRepositoryProvider).getProjects();
    return [];
  }

  Future<void> reload() => ref.refresh(projectListViewModelProvider.future);
}
