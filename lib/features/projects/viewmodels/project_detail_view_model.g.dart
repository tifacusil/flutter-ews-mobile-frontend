// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Loads a single project with its sensors.
///
/// Uses GET /api/v1/projects/{id} which returns both the project metadata
/// and the sensor list in one call — no separate sensors request needed.

@ProviderFor(ProjectDetailViewModel)
final projectDetailViewModelProvider = ProjectDetailViewModelFamily._();

/// Loads a single project with its sensors.
///
/// Uses GET /api/v1/projects/{id} which returns both the project metadata
/// and the sensor list in one call — no separate sensors request needed.
final class ProjectDetailViewModelProvider
    extends $AsyncNotifierProvider<ProjectDetailViewModel, ApiProject> {
  /// Loads a single project with its sensors.
  ///
  /// Uses GET /api/v1/projects/{id} which returns both the project metadata
  /// and the sensor list in one call — no separate sensors request needed.
  ProjectDetailViewModelProvider._({
    required ProjectDetailViewModelFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'projectDetailViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$projectDetailViewModelHash();

  @override
  String toString() {
    return r'projectDetailViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProjectDetailViewModel create() => ProjectDetailViewModel();

  @override
  bool operator ==(Object other) {
    return other is ProjectDetailViewModelProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$projectDetailViewModelHash() =>
    r'9cb890bda5f0106360faf3ebe690897f6f292a0f';

/// Loads a single project with its sensors.
///
/// Uses GET /api/v1/projects/{id} which returns both the project metadata
/// and the sensor list in one call — no separate sensors request needed.

final class ProjectDetailViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          ProjectDetailViewModel,
          AsyncValue<ApiProject>,
          ApiProject,
          FutureOr<ApiProject>,
          String
        > {
  ProjectDetailViewModelFamily._()
    : super(
        retry: null,
        name: r'projectDetailViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Loads a single project with its sensors.
  ///
  /// Uses GET /api/v1/projects/{id} which returns both the project metadata
  /// and the sensor list in one call — no separate sensors request needed.

  ProjectDetailViewModelProvider call(String projectId) =>
      ProjectDetailViewModelProvider._(argument: projectId, from: this);

  @override
  String toString() => r'projectDetailViewModelProvider';
}

/// Loads a single project with its sensors.
///
/// Uses GET /api/v1/projects/{id} which returns both the project metadata
/// and the sensor list in one call — no separate sensors request needed.

abstract class _$ProjectDetailViewModel extends $AsyncNotifier<ApiProject> {
  late final _$args = ref.$arg as String;
  String get projectId => _$args;

  FutureOr<ApiProject> build(String projectId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ApiProject>, ApiProject>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ApiProject>, ApiProject>,
              AsyncValue<ApiProject>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
