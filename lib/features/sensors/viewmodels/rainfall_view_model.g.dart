// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rainfall_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RainfallViewModel)
final rainfallViewModelProvider = RainfallViewModelFamily._();

final class RainfallViewModelProvider
    extends $NotifierProvider<RainfallViewModel, RainfallChartState> {
  RainfallViewModelProvider._({
    required RainfallViewModelFamily super.from,
    required ({String projectId, String sensorId}) super.argument,
  }) : super(
         retry: null,
         name: r'rainfallViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$rainfallViewModelHash();

  @override
  String toString() {
    return r'rainfallViewModelProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  RainfallViewModel create() => RainfallViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RainfallChartState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RainfallChartState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RainfallViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$rainfallViewModelHash() => r'18e0852734ab365825d768957384fd678da95b0a';

final class RainfallViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          RainfallViewModel,
          RainfallChartState,
          RainfallChartState,
          RainfallChartState,
          ({String projectId, String sensorId})
        > {
  RainfallViewModelFamily._()
    : super(
        retry: null,
        name: r'rainfallViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RainfallViewModelProvider call({
    required String projectId,
    required String sensorId,
  }) => RainfallViewModelProvider._(
    argument: (projectId: projectId, sensorId: sensorId),
    from: this,
  );

  @override
  String toString() => r'rainfallViewModelProvider';
}

abstract class _$RainfallViewModel extends $Notifier<RainfallChartState> {
  late final _$args = ref.$arg as ({String projectId, String sensorId});
  String get projectId => _$args.projectId;
  String get sensorId => _$args.sensorId;

  RainfallChartState build({
    required String projectId,
    required String sensorId,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<RainfallChartState, RainfallChartState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RainfallChartState, RainfallChartState>,
              RainfallChartState,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(projectId: _$args.projectId, sensorId: _$args.sensorId),
    );
  }
}
