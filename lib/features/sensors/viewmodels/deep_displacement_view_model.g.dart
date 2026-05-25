// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deep_displacement_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DeepDisplacementViewModel)
final deepDisplacementViewModelProvider = DeepDisplacementViewModelFamily._();

final class DeepDisplacementViewModelProvider
    extends $NotifierProvider<DeepDisplacementViewModel, DeepChartState> {
  DeepDisplacementViewModelProvider._({
    required DeepDisplacementViewModelFamily super.from,
    required ({String projectId, String sensorId}) super.argument,
  }) : super(
         retry: null,
         name: r'deepDisplacementViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$deepDisplacementViewModelHash();

  @override
  String toString() {
    return r'deepDisplacementViewModelProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  DeepDisplacementViewModel create() => DeepDisplacementViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeepChartState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeepChartState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DeepDisplacementViewModelProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deepDisplacementViewModelHash() =>
    r'675b74d6970f0fa5155dc638ca174bdeca86b645';

final class DeepDisplacementViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          DeepDisplacementViewModel,
          DeepChartState,
          DeepChartState,
          DeepChartState,
          ({String projectId, String sensorId})
        > {
  DeepDisplacementViewModelFamily._()
    : super(
        retry: null,
        name: r'deepDisplacementViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DeepDisplacementViewModelProvider call({
    required String projectId,
    required String sensorId,
  }) => DeepDisplacementViewModelProvider._(
    argument: (projectId: projectId, sensorId: sensorId),
    from: this,
  );

  @override
  String toString() => r'deepDisplacementViewModelProvider';
}

abstract class _$DeepDisplacementViewModel extends $Notifier<DeepChartState> {
  late final _$args = ref.$arg as ({String projectId, String sensorId});
  String get projectId => _$args.projectId;
  String get sensorId => _$args.sensorId;

  DeepChartState build({required String projectId, required String sensorId});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<DeepChartState, DeepChartState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DeepChartState, DeepChartState>,
              DeepChartState,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(projectId: _$args.projectId, sensorId: _$args.sensorId),
    );
  }
}
