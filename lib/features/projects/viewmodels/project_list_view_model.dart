import 'package:flutter_riverpod/flutter_riverpod.dart';

// TODO: define a Project model and ProjectRepository
// TODO: register projectListProvider once dependencies are wired

class ProjectListViewModel extends StateNotifier<AsyncValue<List<dynamic>>> {
  ProjectListViewModel() : super(const AsyncValue.loading());

  Future<void> load() async {
    // TODO: fetch project list from ProjectRepository
    state = const AsyncValue.data([]);
  }
}
