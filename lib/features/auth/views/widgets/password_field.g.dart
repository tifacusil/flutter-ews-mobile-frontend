// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_field.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PasswordObscure)
final passwordObscureProvider = PasswordObscureProvider._();

final class PasswordObscureProvider
    extends $NotifierProvider<PasswordObscure, bool> {
  PasswordObscureProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'passwordObscureProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$passwordObscureHash();

  @$internal
  @override
  PasswordObscure create() => PasswordObscure();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$passwordObscureHash() => r'b3a1c87593d0c84d881c54484373dbfe80222c2d';

abstract class _$PasswordObscure extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
