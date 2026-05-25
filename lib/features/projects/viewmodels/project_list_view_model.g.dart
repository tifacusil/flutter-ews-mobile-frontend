// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_list_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Loads the projects accessible to the current user by:
///
///   1. GET /api/v1/users/{userId}/subscriptions
///      → list of project_ids the user is subscribed to.
///   2. GET /api/v1/projects/{project_id}  (parallel, one per subscription)
///      → full project detail including sensors.
///
/// At most ~2 projects + 1 subscriptions call = 3 HTTP requests total.

@ProviderFor(ProjectListViewModel)
final projectListViewModelProvider = ProjectListViewModelProvider._();

/// Loads the projects accessible to the current user by:
///
///   1. GET /api/v1/users/{userId}/subscriptions
///      → list of project_ids the user is subscribed to.
///   2. GET /api/v1/projects/{project_id}  (parallel, one per subscription)
///      → full project detail including sensors.
///
/// At most ~2 projects + 1 subscriptions call = 3 HTTP requests total.
final class ProjectListViewModelProvider
    extends $AsyncNotifierProvider<ProjectListViewModel, List<Project>> {
  /// Loads the projects accessible to the current user by:
  ///
  ///   1. GET /api/v1/users/{userId}/subscriptions
  ///      → list of project_ids the user is subscribed to.
  ///   2. GET /api/v1/projects/{project_id}  (parallel, one per subscription)
  ///      → full project detail including sensors.
  ///
  /// At most ~2 projects + 1 subscriptions call = 3 HTTP requests total.
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
    r'4bf174ffb0fbc144f1f233286274560e61e69833';

/// Loads the projects accessible to the current user by:
///
///   1. GET /api/v1/users/{userId}/subscriptions
///      → list of project_ids the user is subscribed to.
///   2. GET /api/v1/projects/{project_id}  (parallel, one per subscription)
///      → full project detail including sensors.
///
/// At most ~2 projects + 1 subscriptions call = 3 HTTP requests total.

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
