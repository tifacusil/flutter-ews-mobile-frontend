// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'strain_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StrainPayload _$StrainPayloadFromJson(Map<String, dynamic> json) {
  return _StrainPayload.fromJson(json);
}

/// @nodoc
mixin _$StrainPayload {
  double get strainMicrostrain => throw _privateConstructorUsedError;
  double? get temperatureCelsius => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StrainPayloadCopyWith<StrainPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StrainPayloadCopyWith<$Res> {
  factory $StrainPayloadCopyWith(
          StrainPayload value, $Res Function(StrainPayload) then) =
      _$StrainPayloadCopyWithImpl<$Res, StrainPayload>;
  @useResult
  $Res call({double strainMicrostrain, double? temperatureCelsius});
}

/// @nodoc
class _$StrainPayloadCopyWithImpl<$Res, $Val extends StrainPayload>
    implements $StrainPayloadCopyWith<$Res> {
  _$StrainPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strainMicrostrain = null,
    Object? temperatureCelsius = freezed,
  }) {
    return _then(_value.copyWith(
      strainMicrostrain: null == strainMicrostrain
          ? _value.strainMicrostrain
          : strainMicrostrain // ignore: cast_nullable_to_non_nullable
              as double,
      temperatureCelsius: freezed == temperatureCelsius
          ? _value.temperatureCelsius
          : temperatureCelsius // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StrainPayloadImplCopyWith<$Res>
    implements $StrainPayloadCopyWith<$Res> {
  factory _$$StrainPayloadImplCopyWith(
          _$StrainPayloadImpl value, $Res Function(_$StrainPayloadImpl) then) =
      __$$StrainPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double strainMicrostrain, double? temperatureCelsius});
}

/// @nodoc
class __$$StrainPayloadImplCopyWithImpl<$Res>
    extends _$StrainPayloadCopyWithImpl<$Res, _$StrainPayloadImpl>
    implements _$$StrainPayloadImplCopyWith<$Res> {
  __$$StrainPayloadImplCopyWithImpl(
      _$StrainPayloadImpl _value, $Res Function(_$StrainPayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? strainMicrostrain = null,
    Object? temperatureCelsius = freezed,
  }) {
    return _then(_$StrainPayloadImpl(
      strainMicrostrain: null == strainMicrostrain
          ? _value.strainMicrostrain
          : strainMicrostrain // ignore: cast_nullable_to_non_nullable
              as double,
      temperatureCelsius: freezed == temperatureCelsius
          ? _value.temperatureCelsius
          : temperatureCelsius // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StrainPayloadImpl implements _StrainPayload {
  const _$StrainPayloadImpl(
      {required this.strainMicrostrain, this.temperatureCelsius});

  factory _$StrainPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$StrainPayloadImplFromJson(json);

  @override
  final double strainMicrostrain;
  @override
  final double? temperatureCelsius;

  @override
  String toString() {
    return 'StrainPayload(strainMicrostrain: $strainMicrostrain, temperatureCelsius: $temperatureCelsius)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StrainPayloadImpl &&
            (identical(other.strainMicrostrain, strainMicrostrain) ||
                other.strainMicrostrain == strainMicrostrain) &&
            (identical(other.temperatureCelsius, temperatureCelsius) ||
                other.temperatureCelsius == temperatureCelsius));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, strainMicrostrain, temperatureCelsius);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StrainPayloadImplCopyWith<_$StrainPayloadImpl> get copyWith =>
      __$$StrainPayloadImplCopyWithImpl<_$StrainPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StrainPayloadImplToJson(
      this,
    );
  }
}

abstract class _StrainPayload implements StrainPayload {
  const factory _StrainPayload(
      {required final double strainMicrostrain,
      final double? temperatureCelsius}) = _$StrainPayloadImpl;

  factory _StrainPayload.fromJson(Map<String, dynamic> json) =
      _$StrainPayloadImpl.fromJson;

  @override
  double get strainMicrostrain;
  @override
  double? get temperatureCelsius;
  @override
  @JsonKey(ignore: true)
  _$$StrainPayloadImplCopyWith<_$StrainPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
