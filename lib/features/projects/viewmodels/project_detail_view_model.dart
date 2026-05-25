import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/sensor.dart';
import '../../../core/providers/providers.dart';

part 'project_detail_view_model.g.dart';

@riverpod
class ProjectDetailViewModel extends _$ProjectDetailViewModel {
  @override
  Future<List<ApiSensor>> build(String projectId) async {
    final svc = ref.watch(dataServiceProvider);
    return svc.getSensors(projectId);
  }

  void reload() => ref.invalidateSelf();
}
