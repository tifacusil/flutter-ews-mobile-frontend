// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_list_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProjectListViewModel)
final projectListViewModelProvider = ProjectListViewModelProvider._();

final class ProjectListViewModelProvider
    extends $AsyncNotifierProvider<ProjectListViewModel, List<Project>> {
  ProjectListViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'projectListViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$projectListViewModelHash();

  @$internal
  @override
  ProjectListViewModel create() => ProjectListViewModel();
}

String _$projectListViewModelHash() =>
    r'b38cef8213fe0cb2460249b3910a8244c5a8bfae';

abstract class _$ProjectListViewModel extends $AsyncNotifier<List<Project>> {
  FutureOr<List<Project>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Project>>, List<Project>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Project>>, List<Project>>,
              AsyncValue<List<Project>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
