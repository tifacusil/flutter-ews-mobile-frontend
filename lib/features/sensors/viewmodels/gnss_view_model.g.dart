// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gnss_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GnssViewModel)
final gnssViewModelProvider = GnssViewModelFamily._();

final class GnssViewModelProvider
    extends $NotifierProvider<GnssViewModel, GnssChartState> {
  GnssViewModelProvider._({
    required GnssViewModelFamily super.from,
    required ({String projectId, String sensorId}) super.argument,
  }) : super(
         retry: null,
         name: r'gnssViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$gnssViewModelHash();

  @override
  String toString() {
    return r'gnssViewModelProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  GnssViewModel create() => GnssViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GnssChartState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GnssChartState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GnssViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$gnssViewModelHash() => r'cbe12f37f90bf8e85f8b39c869734659b22d661d';

final class GnssViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          GnssViewModel,
          GnssChartState,
          GnssChartState,
          GnssChartState,
          ({String projectId, String sensorId})
        > {
  GnssViewModelFamily._()
    : super(
        retry: null,
        name: r'gnssViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GnssViewModelProvider call({
    required String projectId,
    required String sensorId,
  }) => GnssViewModelProvider._(
    argument: (projectId: projectId, sensorId: sensorId),
    from: this,
  );

  @override
  String toString() => r'gnssViewModelProvider';
}

abstract class _$GnssViewModel extends $Notifier<GnssChartState> {
  late final _$args = ref.$arg as ({String projectId, String sensorId});
  String get projectId => _$args.projectId;
  String get sensorId => _$args.sensorId;

  GnssChartState build({required String projectId, required String sensorId});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<GnssChartState, GnssChartState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GnssChartState, GnssChartState>,
              GnssChartState,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(projectId: _$args.projectId, sensorId: _$args.sensorId),
    );
  }
}
