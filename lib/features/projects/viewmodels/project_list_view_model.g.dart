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
    extends $AsyncNotifierProvider<ProjectListViewModel, List<dynamic>> {
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
    r'd0ba9fd927d6e57eb4fd64ac88b63ce1cf7dc83f';

abstract class _$ProjectListViewModel extends $AsyncNotifier<List<dynamic>> {
  FutureOr<List<dynamic>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<dynamic>>, List<dynamic>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<dynamic>>, List<dynamic>>,
              AsyncValue<List<dynamic>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
