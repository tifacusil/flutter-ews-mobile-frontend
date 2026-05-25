// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_detail_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProjectDetailViewModel)
final projectDetailViewModelProvider = ProjectDetailViewModelFamily._();

final class ProjectDetailViewModelProvider
    extends $AsyncNotifierProvider<ProjectDetailViewModel, List<ApiSensor>> {
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
    r'5248e0c56cf5e3f104b5be3e6dc9d9ec309cc012';

final class ProjectDetailViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          ProjectDetailViewModel,
          AsyncValue<List<ApiSensor>>,
          List<ApiSensor>,
          FutureOr<List<ApiSensor>>,
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

  ProjectDetailViewModelProvider call(String projectId) =>
      ProjectDetailViewModelProvider._(argument: projectId, from: this);

  @override
  String toString() => r'projectDetailViewModelProvider';
}

abstract class _$ProjectDetailViewModel
    extends $AsyncNotifier<List<ApiSensor>> {
  late final _$args = ref.$arg as String;
  String get projectId => _$args;

  FutureOr<List<ApiSensor>> build(String projectId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<ApiSensor>>, List<ApiSensor>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ApiSensor>>, List<ApiSensor>>,
              AsyncValue<List<ApiSensor>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
