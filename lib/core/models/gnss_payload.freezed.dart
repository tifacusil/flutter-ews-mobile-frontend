// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gnss_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GnssPayload _$GnssPayloadFromJson(Map<String, dynamic> json) {
  return _GnssPayload.fromJson(json);
}

/// @nodoc
mixin _$GnssPayload {
  double get displacementXMm => throw _privateConstructorUsedError;
  double get displacementYMm => throw _privateConstructorUsedError;
  double get displacementZMm => throw _privateConstructorUsedError;
  double get displacementHorizontalMm => throw _privateConstructorUsedError;
  double get cumulativeDisplacementMm => throw _privateConstructorUsedError;
  int get fixQuality => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GnssPayloadCopyWith<GnssPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GnssPayloadCopyWith<$Res> {
  factory $GnssPayloadCopyWith(
          GnssPayload value, $Res Function(GnssPayload) then) =
      _$GnssPayloadCopyWithImpl<$Res, GnssPayload>;
  @useResult
  $Res call(
      {double displacementXMm,
      double displacementYMm,
      double displacementZMm,
      double displacementHorizontalMm,
      double cumulativeDisplacementMm,
      int fixQuality});
}

/// @nodoc
class _$GnssPayloadCopyWithImpl<$Res, $Val extends GnssPayload>
    implements $GnssPayloadCopyWith<$Res> {
  _$GnssPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displacementXMm = null,
    Object? displacementYMm = null,
    Object? displacementZMm = null,
    Object? displacementHorizontalMm = null,
    Object? cumulativeDisplacementMm = null,
    Object? fixQuality = null,
  }) {
    return _then(_value.copyWith(
      displacementXMm: null == displacementXMm
          ? _value.displacementXMm
          : displacementXMm // ignore: cast_nullable_to_non_nullable
              as double,
      displacementYMm: null == displacementYMm
          ? _value.displacementYMm
          : displacementYMm // ignore: cast_nullable_to_non_nullable
              as double,
      displacementZMm: null == displacementZMm
          ? _value.displacementZMm
          : displacementZMm // ignore: cast_nullable_to_non_nullable
              as double,
      displacementHorizontalMm: null == displacementHorizontalMm
          ? _value.displacementHorizontalMm
          : displacementHorizontalMm // ignore: cast_nullable_to_non_nullable
              as double,
      cumulativeDisplacementMm: null == cumulativeDisplacementMm
          ? _value.cumulativeDisplacementMm
          : cumulativeDisplacementMm // ignore: cast_nullable_to_non_nullable
              as double,
      fixQuality: null == fixQuality
          ? _value.fixQuality
          : fixQuality // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GnssPayloadImplCopyWith<$Res>
    implements $GnssPayloadCopyWith<$Res> {
  factory _$$GnssPayloadImplCopyWith(
          _$GnssPayloadImpl value, $Res Function(_$GnssPayloadImpl) then) =
      __$$GnssPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double displacementXMm,
      double displacementYMm,
      double displacementZMm,
      double displacementHorizontalMm,
      double cumulativeDisplacementMm,
      int fixQuality});
}

/// @nodoc
class __$$GnssPayloadImplCopyWithImpl<$Res>
    extends _$GnssPayloadCopyWithImpl<$Res, _$GnssPayloadImpl>
    implements _$$GnssPayloadImplCopyWith<$Res> {
  __$$GnssPayloadImplCopyWithImpl(
      _$GnssPayloadImpl _value, $Res Function(_$GnssPayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displacementXMm = null,
    Object? displacementYMm = null,
    Object? displacementZMm = null,
    Object? displacementHorizontalMm = null,
    Object? cumulativeDisplacementMm = null,
    Object? fixQuality = null,
  }) {
    return _then(_$GnssPayloadImpl(
      displacementXMm: null == displacementXMm
          ? _value.displacementXMm
          : displacementXMm // ignore: cast_nullable_to_non_nullable
              as double,
      displacementYMm: null == displacementYMm
          ? _value.displacementYMm
          : displacementYMm // ignore: cast_nullable_to_non_nullable
              as double,
      displacementZMm: null == displacementZMm
          ? _value.displacementZMm
          : displacementZMm // ignore: cast_nullable_to_non_nullable
              as double,
      displacementHorizontalMm: null == displacementHorizontalMm
          ? _value.displacementHorizontalMm
          : displacementHorizontalMm // ignore: cast_nullable_to_non_nullable
              as double,
      cumulativeDisplacementMm: null == cumulativeDisplacementMm
          ? _value.cumulativeDisplacementMm
          : cumulativeDisplacementMm // ignore: cast_nullable_to_non_nullable
              as double,
      fixQuality: null == fixQuality
          ? _value.fixQuality
          : fixQuality // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GnssPayloadImpl implements _GnssPayload {
  const _$GnssPayloadImpl(
      {required this.displacementXMm,
      required this.displacementYMm,
      required this.displacementZMm,
      required this.displacementHorizontalMm,
      required this.cumulativeDisplacementMm,
      required this.fixQuality});

  factory _$GnssPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$GnssPayloadImplFromJson(json);

  @override
  final double displacementXMm;
  @override
  final double displacementYMm;
  @override
  final double displacementZMm;
  @override
  final double displacementHorizontalMm;
  @override
  final double cumulativeDisplacementMm;
  @override
  final int fixQuality;

  @override
  String toString() {
    return 'GnssPayload(displacementXMm: $displacementXMm, displacementYMm: $displacementYMm, displacementZMm: $displacementZMm, displacementHorizontalMm: $displacementHorizontalMm, cumulativeDisplacementMm: $cumulativeDisplacementMm, fixQuality: $fixQuality)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GnssPayloadImpl &&
            (identical(other.displacementXMm, displacementXMm) ||
                other.displacementXMm == displacementXMm) &&
            (identical(other.displacementYMm, displacementYMm) ||
                other.displacementYMm == displacementYMm) &&
            (identical(other.displacementZMm, displacementZMm) ||
                other.displacementZMm == displacementZMm) &&
            (identical(
                    other.displacementHorizontalMm, displacementHorizontalMm) ||
                other.displacementHorizontalMm == displacementHorizontalMm) &&
            (identical(
                    other.cumulativeDisplacementMm, cumulativeDisplacementMm) ||
                other.cumulativeDisplacementMm == cumulativeDisplacementMm) &&
            (identical(other.fixQuality, fixQuality) ||
                other.fixQuality == fixQuality));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      displacementXMm,
      displacementYMm,
      displacementZMm,
      displacementHorizontalMm,
      cumulativeDisplacementMm,
      fixQuality);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GnssPayloadImplCopyWith<_$GnssPayloadImpl> get copyWith =>
      __$$GnssPayloadImplCopyWithImpl<_$GnssPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GnssPayloadImplToJson(
      this,
    );
  }
}

abstract class _GnssPayload implements GnssPayload {
  const factory _GnssPayload(
      {required final double displacementXMm,
      required final double displacementYMm,
      required final double displacementZMm,
      required final double displacementHorizontalMm,
      required final double cumulativeDisplacementMm,
      required final int fixQuality}) = _$GnssPayloadImpl;

  factory _GnssPayload.fromJson(Map<String, dynamic> json) =
      _$GnssPayloadImpl.fromJson;

  @override
  double get displacementXMm;
  @override
  double get displacementYMm;
  @override
  double get displacementZMm;
  @override
  double get displacementHorizontalMm;
  @override
  double get cumulativeDisplacementMm;
  @override
  int get fixQuality;
  @override
  @JsonKey(ignore: true)
  _$$GnssPayloadImplCopyWith<_$GnssPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
