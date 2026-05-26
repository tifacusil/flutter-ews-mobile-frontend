// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_alerts_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Loads the most recent alerts for the current user across all their
/// subscribed projects.
///
/// Calls GET /api/v1/alerts/recent?limit=[limit].

@ProviderFor(RecentAlertsViewModel)
final recentAlertsViewModelProvider = RecentAlertsViewModelFamily._();

/// Loads the most recent alerts for the current user across all their
/// subscribed projects.
///
/// Calls GET /api/v1/alerts/recent?limit=[limit].
final class RecentAlertsViewModelProvider
    extends $AsyncNotifierProvider<RecentAlertsViewModel, List<RecentAlert>> {
  /// Loads the most recent alerts for the current user across all their
  /// subscribed projects.
  ///
  /// Calls GET /api/v1/alerts/recent?limit=[limit].
  RecentAlertsViewModelProvider._({
    required RecentAlertsViewModelFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'recentAlertsViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$recentAlertsViewModelHash();

  @override
  String toString() {
    return r'recentAlertsViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  RecentAlertsViewModel create() => RecentAlertsViewModel();

  @override
  bool operator ==(Object other) {
    return other is RecentAlertsViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$recentAlertsViewModelHash() =>
    r'3cb045f3504173be4ebf66c284b33dd57c92fe46';

/// Loads the most recent alerts for the current user across all their
/// subscribed projects.
///
/// Calls GET /api/v1/alerts/recent?limit=[limit].

final class RecentAlertsViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          RecentAlertsViewModel,
          AsyncValue<List<RecentAlert>>,
          List<RecentAlert>,
          FutureOr<List<RecentAlert>>,
          int
        > {
  RecentAlertsViewModelFamily._()
    : super(
        retry: null,
        name: r'recentAlertsViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Loads the most recent alerts for the current user across all their
  /// subscribed projects.
  ///
  /// Calls GET /api/v1/alerts/recent?limit=[limit].

  RecentAlertsViewModelProvider call({int limit = 50}) =>
      RecentAlertsViewModelProvider._(argument: limit, from: this);

  @override
  String toString() => r'recentAlertsViewModelProvider';
}

/// Loads the most recent alerts for the current user across all their
/// subscribed projects.
///
/// Calls GET /api/v1/alerts/recent?limit=[limit].

abstract class _$RecentAlertsViewModel
    extends $AsyncNotifier<List<RecentAlert>> {
  late final _$args = ref.$arg as int;
  int get limit => _$args;

  FutureOr<List<RecentAlert>> build({int limit = 50});
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<RecentAlert>>, List<RecentAlert>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<RecentAlert>>, List<RecentAlert>>,
              AsyncValue<List<RecentAlert>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(limit: _$args));
  }
}
