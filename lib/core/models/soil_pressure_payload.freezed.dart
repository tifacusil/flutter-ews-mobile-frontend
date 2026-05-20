// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'soil_pressure_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SoilPressurePayload _$SoilPressurePayloadFromJson(Map<String, dynamic> json) {
  return _SoilPressurePayload.fromJson(json);
}

/// @nodoc
mixin _$SoilPressurePayload {
  double get pressureKpa => throw _privateConstructorUsedError;
  double? get temperatureCelsius => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SoilPressurePayloadCopyWith<SoilPressurePayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoilPressurePayloadCopyWith<$Res> {
  factory $SoilPressurePayloadCopyWith(
          SoilPressurePayload value, $Res Function(SoilPressurePayload) then) =
      _$SoilPressurePayloadCopyWithImpl<$Res, SoilPressurePayload>;
  @useResult
  $Res call({double pressureKpa, double? temperatureCelsius});
}

/// @nodoc
class _$SoilPressurePayloadCopyWithImpl<$Res, $Val extends SoilPressurePayload>
    implements $SoilPressurePayloadCopyWith<$Res> {
  _$SoilPressurePayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pressureKpa = null,
    Object? temperatureCelsius = freezed,
  }) {
    return _then(_value.copyWith(
      pressureKpa: null == pressureKpa
          ? _value.pressureKpa
          : pressureKpa // ignore: cast_nullable_to_non_nullable
              as double,
      temperatureCelsius: freezed == temperatureCelsius
          ? _value.temperatureCelsius
          : temperatureCelsius // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SoilPressurePayloadImplCopyWith<$Res>
    implements $SoilPressurePayloadCopyWith<$Res> {
  factory _$$SoilPressurePayloadImplCopyWith(_$SoilPressurePayloadImpl value,
          $Res Function(_$SoilPressurePayloadImpl) then) =
      __$$SoilPressurePayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double pressureKpa, double? temperatureCelsius});
}

/// @nodoc
class __$$SoilPressurePayloadImplCopyWithImpl<$Res>
    extends _$SoilPressurePayloadCopyWithImpl<$Res, _$SoilPressurePayloadImpl>
    implements _$$SoilPressurePayloadImplCopyWith<$Res> {
  __$$SoilPressurePayloadImplCopyWithImpl(_$SoilPressurePayloadImpl _value,
      $Res Function(_$SoilPressurePayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pressureKpa = null,
    Object? temperatureCelsius = freezed,
  }) {
    return _then(_$SoilPressurePayloadImpl(
      pressureKpa: null == pressureKpa
          ? _value.pressureKpa
          : pressureKpa // ignore: cast_nullable_to_non_nullable
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
class _$SoilPressurePayloadImpl implements _SoilPressurePayload {
  const _$SoilPressurePayloadImpl(
      {required this.pressureKpa, this.temperatureCelsius});

  factory _$SoilPressurePayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$SoilPressurePayloadImplFromJson(json);

  @override
  final double pressureKpa;
  @override
  final double? temperatureCelsius;

  @override
  String toString() {
    return 'SoilPressurePayload(pressureKpa: $pressureKpa, temperatureCelsius: $temperatureCelsius)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SoilPressurePayloadImpl &&
            (identical(other.pressureKpa, pressureKpa) ||
                other.pressureKpa == pressureKpa) &&
            (identical(other.temperatureCelsius, temperatureCelsius) ||
                other.temperatureCelsius == temperatureCelsius));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pressureKpa, temperatureCelsius);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SoilPressurePayloadImplCopyWith<_$SoilPressurePayloadImpl> get copyWith =>
      __$$SoilPressurePayloadImplCopyWithImpl<_$SoilPressurePayloadImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SoilPressurePayloadImplToJson(
      this,
    );
  }
}

abstract class _SoilPressurePayload implements SoilPressurePayload {
  const factory _SoilPressurePayload(
      {required final double pressureKpa,
      final double? temperatureCelsius}) = _$SoilPressurePayloadImpl;

  factory _SoilPressurePayload.fromJson(Map<String, dynamic> json) =
      _$SoilPressurePayloadImpl.fromJson;

  @override
  double get pressureKpa;
  @override
  double? get temperatureCelsius;
  @override
  @JsonKey(ignore: true)
  _$$SoilPressurePayloadImplCopyWith<_$SoilPressurePayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
