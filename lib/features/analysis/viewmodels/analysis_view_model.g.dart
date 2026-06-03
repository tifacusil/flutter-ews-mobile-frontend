// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AnalysisViewModel)
final analysisViewModelProvider = AnalysisViewModelFamily._();

final class AnalysisViewModelProvider
    extends $NotifierProvider<AnalysisViewModel, AnalysisState> {
  AnalysisViewModelProvider._({
    required AnalysisViewModelFamily super.from,
    required ({String projectId, String sensorId, String sensorType})
    super.argument,
  }) : super(
         retry: null,
         name: r'analysisViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$analysisViewModelHash();

  @override
  String toString() {
    return r'analysisViewModelProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  AnalysisViewModel create() => AnalysisViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AnalysisState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AnalysisState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AnalysisViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$analysisViewModelHash() => r'43903872314466928761fa5352deb5f9867b0097';

final class AnalysisViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          AnalysisViewModel,
          AnalysisState,
          AnalysisState,
          AnalysisState,
          ({String projectId, String sensorId, String sensorType})
        > {
  AnalysisViewModelFamily._()
    : super(
        retry: null,
        name: r'analysisViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AnalysisViewModelProvider call({
    required String projectId,
    required String sensorId,
    required String sensorType,
  }) => AnalysisViewModelProvider._(
    argument: (
      projectId: projectId,
      sensorId: sensorId,
      sensorType: sensorType,
    ),
    from: this,
  );

  @override
  String toString() => r'analysisViewModelProvider';
}

abstract class _$AnalysisViewModel extends $Notifier<AnalysisState> {
  late final _$args =
      ref.$arg as ({String projectId, String sensorId, String sensorType});
  String get projectId => _$args.projectId;
  String get sensorId => _$args.sensorId;
  String get sensorType => _$args.sensorType;

  AnalysisState build({
    required String projectId,
    required String sensorId,
    required String sensorType,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AnalysisState, AnalysisState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AnalysisState, AnalysisState>,
              AnalysisState,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(
        projectId: _$args.projectId,
        sensorId: _$args.sensorId,
        sensorType: _$args.sensorType,
      ),
    );
  }
}
