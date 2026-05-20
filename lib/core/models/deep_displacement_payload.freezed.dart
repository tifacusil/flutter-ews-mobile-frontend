// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deep_displacement_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeepDisplacementPayload _$DeepDisplacementPayloadFromJson(
    Map<String, dynamic> json) {
  return _DeepDisplacementPayload.fromJson(json);
}

/// @nodoc
mixin _$DeepDisplacementPayload {
  double get depthM => throw _privateConstructorUsedError;
  double get tiltXMm => throw _privateConstructorUsedError;
  double get tiltYMm => throw _privateConstructorUsedError;
  double get cumulativeTiltMm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeepDisplacementPayloadCopyWith<DeepDisplacementPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeepDisplacementPayloadCopyWith<$Res> {
  factory $DeepDisplacementPayloadCopyWith(DeepDisplacementPayload value,
          $Res Function(DeepDisplacementPayload) then) =
      _$DeepDisplacementPayloadCopyWithImpl<$Res, DeepDisplacementPayload>;
  @useResult
  $Res call(
      {double depthM, double tiltXMm, double tiltYMm, double cumulativeTiltMm});
}

/// @nodoc
class _$DeepDisplacementPayloadCopyWithImpl<$Res,
        $Val extends DeepDisplacementPayload>
    implements $DeepDisplacementPayloadCopyWith<$Res> {
  _$DeepDisplacementPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? depthM = null,
    Object? tiltXMm = null,
    Object? tiltYMm = null,
    Object? cumulativeTiltMm = null,
  }) {
    return _then(_value.copyWith(
      depthM: null == depthM
          ? _value.depthM
          : depthM // ignore: cast_nullable_to_non_nullable
              as double,
      tiltXMm: null == tiltXMm
          ? _value.tiltXMm
          : tiltXMm // ignore: cast_nullable_to_non_nullable
              as double,
      tiltYMm: null == tiltYMm
          ? _value.tiltYMm
          : tiltYMm // ignore: cast_nullable_to_non_nullable
              as double,
      cumulativeTiltMm: null == cumulativeTiltMm
          ? _value.cumulativeTiltMm
          : cumulativeTiltMm // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeepDisplacementPayloadImplCopyWith<$Res>
    implements $DeepDisplacementPayloadCopyWith<$Res> {
  factory _$$DeepDisplacementPayloadImplCopyWith(
          _$DeepDisplacementPayloadImpl value,
          $Res Function(_$DeepDisplacementPayloadImpl) then) =
      __$$DeepDisplacementPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double depthM, double tiltXMm, double tiltYMm, double cumulativeTiltMm});
}

/// @nodoc
class __$$DeepDisplacementPayloadImplCopyWithImpl<$Res>
    extends _$DeepDisplacementPayloadCopyWithImpl<$Res,
        _$DeepDisplacementPayloadImpl>
    implements _$$DeepDisplacementPayloadImplCopyWith<$Res> {
  __$$DeepDisplacementPayloadImplCopyWithImpl(
      _$DeepDisplacementPayloadImpl _value,
      $Res Function(_$DeepDisplacementPayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? depthM = null,
    Object? tiltXMm = null,
    Object? tiltYMm = null,
    Object? cumulativeTiltMm = null,
  }) {
    return _then(_$DeepDisplacementPayloadImpl(
      depthM: null == depthM
          ? _value.depthM
          : depthM // ignore: cast_nullable_to_non_nullable
              as double,
      tiltXMm: null == tiltXMm
          ? _value.tiltXMm
          : tiltXMm // ignore: cast_nullable_to_non_nullable
              as double,
      tiltYMm: null == tiltYMm
          ? _value.tiltYMm
          : tiltYMm // ignore: cast_nullable_to_non_nullable
              as double,
      cumulativeTiltMm: null == cumulativeTiltMm
          ? _value.cumulativeTiltMm
          : cumulativeTiltMm // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeepDisplacementPayloadImpl implements _DeepDisplacementPayload {
  const _$DeepDisplacementPayloadImpl(
      {required this.depthM,
      required this.tiltXMm,
      required this.tiltYMm,
      required this.cumulativeTiltMm});

  factory _$DeepDisplacementPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeepDisplacementPayloadImplFromJson(json);

  @override
  final double depthM;
  @override
  final double tiltXMm;
  @override
  final double tiltYMm;
  @override
  final double cumulativeTiltMm;

  @override
  String toString() {
    return 'DeepDisplacementPayload(depthM: $depthM, tiltXMm: $tiltXMm, tiltYMm: $tiltYMm, cumulativeTiltMm: $cumulativeTiltMm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeepDisplacementPayloadImpl &&
            (identical(other.depthM, depthM) || other.depthM == depthM) &&
            (identical(other.tiltXMm, tiltXMm) || other.tiltXMm == tiltXMm) &&
            (identical(other.tiltYMm, tiltYMm) || other.tiltYMm == tiltYMm) &&
            (identical(other.cumulativeTiltMm, cumulativeTiltMm) ||
                other.cumulativeTiltMm == cumulativeTiltMm));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, depthM, tiltXMm, tiltYMm, cumulativeTiltMm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeepDisplacementPayloadImplCopyWith<_$DeepDisplacementPayloadImpl>
      get copyWith => __$$DeepDisplacementPayloadImplCopyWithImpl<
          _$DeepDisplacementPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeepDisplacementPayloadImplToJson(
      this,
    );
  }
}

abstract class _DeepDisplacementPayload implements DeepDisplacementPayload {
  const factory _DeepDisplacementPayload(
      {required final double depthM,
      required final double tiltXMm,
      required final double tiltYMm,
      required final double cumulativeTiltMm}) = _$DeepDisplacementPayloadImpl;

  factory _DeepDisplacementPayload.fromJson(Map<String, dynamic> json) =
      _$DeepDisplacementPayloadImpl.fromJson;

  @override
  double get depthM;
  @override
  double get tiltXMm;
  @override
  double get tiltYMm;
  @override
  double get cumulativeTiltMm;
  @override
  @JsonKey(ignore: true)
  _$$DeepDisplacementPayloadImplCopyWith<_$DeepDisplacementPayloadImpl>
      get copyWith => throw _privateConstructorUsedError;
}
