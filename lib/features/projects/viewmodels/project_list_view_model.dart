import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/project.dart';
import '../../../data/mock/mock_data.dart';

part 'project_list_view_model.g.dart';

@riverpod
class ProjectListViewModel extends _$ProjectListViewModel {
  @override
  Future<List<Project>> build() async {
    await Future.delayed(const Duration(milliseconds: 400));
    final sorted = [...MockData.projects]..sort((a, b) {
        if (a.activeAlertLevel != null && b.activeAlertLevel == null) return -1;
        if (a.activeAlertLevel == null && b.activeAlertLevel != null) return 1;
        return a.displayName.compareTo(b.displayName);
      });
    return sorted;
  }

  void reload() => ref.invalidateSelf();
}
