// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_dashboard_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SensorDashboardViewModel)
final sensorDashboardViewModelProvider = SensorDashboardViewModelFamily._();

final class SensorDashboardViewModelProvider
    extends $NotifierProvider<SensorDashboardViewModel, SensorDashboardState> {
  SensorDashboardViewModelProvider._({
    required SensorDashboardViewModelFamily super.from,
    required ({String projectId, String sensorId}) super.argument,
  }) : super(
         retry: null,
         name: r'sensorDashboardViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sensorDashboardViewModelHash();

  @override
  String toString() {
    return r'sensorDashboardViewModelProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  SensorDashboardViewModel create() => SensorDashboardViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SensorDashboardState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SensorDashboardState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SensorDashboardViewModelProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sensorDashboardViewModelHash() =>
    r'929fac45010a387fba9371e7b50295a322b6c813';

final class SensorDashboardViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          SensorDashboardViewModel,
          SensorDashboardState,
          SensorDashboardState,
          SensorDashboardState,
          ({String projectId, String sensorId})
        > {
  SensorDashboardViewModelFamily._()
    : super(
        retry: null,
        name: r'sensorDashboardViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SensorDashboardViewModelProvider call({
    required String projectId,
    required String sensorId,
  }) => SensorDashboardViewModelProvider._(
    argument: (projectId: projectId, sensorId: sensorId),
    from: this,
  );

  @override
  String toString() => r'sensorDashboardViewModelProvider';
}

abstract class _$SensorDashboardViewModel
    extends $Notifier<SensorDashboardState> {
  late final _$args = ref.$arg as ({String projectId, String sensorId});
  String get projectId => _$args.projectId;
  String get sensorId => _$args.sensorId;

  SensorDashboardState build({
    required String projectId,
    required String sensorId,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SensorDashboardState, SensorDashboardState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SensorDashboardState, SensorDashboardState>,
              SensorDashboardState,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(projectId: _$args.projectId, sensorId: _$args.sensorId),
    );
  }
}
