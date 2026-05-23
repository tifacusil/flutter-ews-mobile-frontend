// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strain_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StrainViewModel)
final strainViewModelProvider = StrainViewModelFamily._();

final class StrainViewModelProvider
    extends $NotifierProvider<StrainViewModel, StrainChartState> {
  StrainViewModelProvider._({
    required StrainViewModelFamily super.from,
    required ({String projectId, String sensorId}) super.argument,
  }) : super(
         retry: null,
         name: r'strainViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$strainViewModelHash();

  @override
  String toString() {
    return r'strainViewModelProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  StrainViewModel create() => StrainViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StrainChartState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StrainChartState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is StrainViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$strainViewModelHash() => r'3a64ba9098591ece46a5d2ddf93de0f7d838afa9';

final class StrainViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          StrainViewModel,
          StrainChartState,
          StrainChartState,
          StrainChartState,
          ({String projectId, String sensorId})
        > {
  StrainViewModelFamily._()
    : super(
        retry: null,
        name: r'strainViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StrainViewModelProvider call({
    required String projectId,
    required String sensorId,
  }) => StrainViewModelProvider._(
    argument: (projectId: projectId, sensorId: sensorId),
    from: this,
  );

  @override
  String toString() => r'strainViewModelProvider';
}

abstract class _$StrainViewModel extends $Notifier<StrainChartState> {
  late final _$args = ref.$arg as ({String projectId, String sensorId});
  String get projectId => _$args.projectId;
  String get sensorId => _$args.sensorId;

  StrainChartState build({required String projectId, required String sensorId});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<StrainChartState, StrainChartState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<StrainChartState, StrainChartState>,
              StrainChartState,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(projectId: _$args.projectId, sensorId: _$args.sensorId),
    );
  }
}
