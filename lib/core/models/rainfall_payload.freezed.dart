// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rainfall_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RainfallPayload _$RainfallPayloadFromJson(Map<String, dynamic> json) {
  return _RainfallPayload.fromJson(json);
}

/// @nodoc
mixin _$RainfallPayload {
  double get rainfallMm => throw _privateConstructorUsedError;
  double get cumulativeRainfallMm => throw _privateConstructorUsedError;
  int get intervalMinutes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RainfallPayloadCopyWith<RainfallPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RainfallPayloadCopyWith<$Res> {
  factory $RainfallPayloadCopyWith(
          RainfallPayload value, $Res Function(RainfallPayload) then) =
      _$RainfallPayloadCopyWithImpl<$Res, RainfallPayload>;
  @useResult
  $Res call(
      {double rainfallMm, double cumulativeRainfallMm, int intervalMinutes});
}

/// @nodoc
class _$RainfallPayloadCopyWithImpl<$Res, $Val extends RainfallPayload>
    implements $RainfallPayloadCopyWith<$Res> {
  _$RainfallPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rainfallMm = null,
    Object? cumulativeRainfallMm = null,
    Object? intervalMinutes = null,
  }) {
    return _then(_value.copyWith(
      rainfallMm: null == rainfallMm
          ? _value.rainfallMm
          : rainfallMm // ignore: cast_nullable_to_non_nullable
              as double,
      cumulativeRainfallMm: null == cumulativeRainfallMm
          ? _value.cumulativeRainfallMm
          : cumulativeRainfallMm // ignore: cast_nullable_to_non_nullable
              as double,
      intervalMinutes: null == intervalMinutes
          ? _value.intervalMinutes
          : intervalMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RainfallPayloadImplCopyWith<$Res>
    implements $RainfallPayloadCopyWith<$Res> {
  factory _$$RainfallPayloadImplCopyWith(_$RainfallPayloadImpl value,
          $Res Function(_$RainfallPayloadImpl) then) =
      __$$RainfallPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double rainfallMm, double cumulativeRainfallMm, int intervalMinutes});
}

/// @nodoc
class __$$RainfallPayloadImplCopyWithImpl<$Res>
    extends _$RainfallPayloadCopyWithImpl<$Res, _$RainfallPayloadImpl>
    implements _$$RainfallPayloadImplCopyWith<$Res> {
  __$$RainfallPayloadImplCopyWithImpl(
      _$RainfallPayloadImpl _value, $Res Function(_$RainfallPayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rainfallMm = null,
    Object? cumulativeRainfallMm = null,
    Object? intervalMinutes = null,
  }) {
    return _then(_$RainfallPayloadImpl(
      rainfallMm: null == rainfallMm
          ? _value.rainfallMm
          : rainfallMm // ignore: cast_nullable_to_non_nullable
              as double,
      cumulativeRainfallMm: null == cumulativeRainfallMm
          ? _value.cumulativeRainfallMm
          : cumulativeRainfallMm // ignore: cast_nullable_to_non_nullable
              as double,
      intervalMinutes: null == intervalMinutes
          ? _value.intervalMinutes
          : intervalMinutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RainfallPayloadImpl implements _RainfallPayload {
  const _$RainfallPayloadImpl(
      {required this.rainfallMm,
      required this.cumulativeRainfallMm,
      required this.intervalMinutes});

  factory _$RainfallPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$RainfallPayloadImplFromJson(json);

  @override
  final double rainfallMm;
  @override
  final double cumulativeRainfallMm;
  @override
  final int intervalMinutes;

  @override
  String toString() {
    return 'RainfallPayload(rainfallMm: $rainfallMm, cumulativeRainfallMm: $cumulativeRainfallMm, intervalMinutes: $intervalMinutes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RainfallPayloadImpl &&
            (identical(other.rainfallMm, rainfallMm) ||
                other.rainfallMm == rainfallMm) &&
            (identical(other.cumulativeRainfallMm, cumulativeRainfallMm) ||
                other.cumulativeRainfallMm == cumulativeRainfallMm) &&
            (identical(other.intervalMinutes, intervalMinutes) ||
                other.intervalMinutes == intervalMinutes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, rainfallMm, cumulativeRainfallMm, intervalMinutes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RainfallPayloadImplCopyWith<_$RainfallPayloadImpl> get copyWith =>
      __$$RainfallPayloadImplCopyWithImpl<_$RainfallPayloadImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RainfallPayloadImplToJson(
      this,
    );
  }
}

abstract class _RainfallPayload implements RainfallPayload {
  const factory _RainfallPayload(
      {required final double rainfallMm,
      required final double cumulativeRainfallMm,
      required final int intervalMinutes}) = _$RainfallPayloadImpl;

  factory _RainfallPayload.fromJson(Map<String, dynamic> json) =
      _$RainfallPayloadImpl.fromJson;

  @override
  double get rainfallMm;
  @override
  double get cumulativeRainfallMm;
  @override
  int get intervalMinutes;
  @override
  @JsonKey(ignore: true)
  _$$RainfallPayloadImplCopyWith<_$RainfallPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
