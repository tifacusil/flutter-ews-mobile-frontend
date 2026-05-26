// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soil_pressure_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SoilPressureViewModel)
final soilPressureViewModelProvider = SoilPressureViewModelFamily._();

final class SoilPressureViewModelProvider
    extends $NotifierProvider<SoilPressureViewModel, SoilPressureChartState> {
  SoilPressureViewModelProvider._({
    required SoilPressureViewModelFamily super.from,
    required ({String projectId, String sensorId}) super.argument,
  }) : super(
         retry: null,
         name: r'soilPressureViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$soilPressureViewModelHash();

  @override
  String toString() {
    return r'soilPressureViewModelProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  SoilPressureViewModel create() => SoilPressureViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SoilPressureChartState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SoilPressureChartState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SoilPressureViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$soilPressureViewModelHash() =>
    r'095cba9a9ff816829b018dcf757708dedd3d58aa';

final class SoilPressureViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          SoilPressureViewModel,
          SoilPressureChartState,
          SoilPressureChartState,
          SoilPressureChartState,
          ({String projectId, String sensorId})
        > {
  SoilPressureViewModelFamily._()
    : super(
        retry: null,
        name: r'soilPressureViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SoilPressureViewModelProvider call({
    required String projectId,
    required String sensorId,
  }) => SoilPressureViewModelProvider._(
    argument: (projectId: projectId, sensorId: sensorId),
    from: this,
  );

  @override
  String toString() => r'soilPressureViewModelProvider';
}

abstract class _$SoilPressureViewModel
    extends $Notifier<SoilPressureChartState> {
  late final _$args = ref.$arg as ({String projectId, String sensorId});
  String get projectId => _$args.projectId;
  String get sensorId => _$args.sensorId;

  SoilPressureChartState build({
    required String projectId,
    required String sensorId,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<SoilPressureChartState, SoilPressureChartState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SoilPressureChartState, SoilPressureChartState>,
              SoilPressureChartState,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(projectId: _$args.projectId, sensorId: _$args.sensorId),
    );
  }
}
