// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AlertViewModel)
final alertViewModelProvider = AlertViewModelFamily._();

final class AlertViewModelProvider
    extends $NotifierProvider<AlertViewModel, AlertState> {
  AlertViewModelProvider._({
    required AlertViewModelFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'alertViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$alertViewModelHash();

  @override
  String toString() {
    return r'alertViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  AlertViewModel create() => AlertViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AlertState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AlertState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AlertViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$alertViewModelHash() => r'b235df6d5e174a4ec9a253516404d474a909c604';

final class AlertViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          AlertViewModel,
          AlertState,
          AlertState,
          AlertState,
          String
        > {
  AlertViewModelFamily._()
    : super(
        retry: null,
        name: r'alertViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AlertViewModelProvider call({required String projectId}) =>
      AlertViewModelProvider._(argument: projectId, from: this);

  @override
  String toString() => r'alertViewModelProvider';
}

abstract class _$AlertViewModel extends $Notifier<AlertState> {
  late final _$args = ref.$arg as String;
  String get projectId => _$args;

  AlertState build({required String projectId});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AlertState, AlertState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AlertState, AlertState>,
              AlertState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(projectId: _$args));
  }
}
