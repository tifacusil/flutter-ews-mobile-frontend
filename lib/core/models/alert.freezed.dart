// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Alert _$AlertFromJson(Map<String, dynamic> json) {
  return _Alert.fromJson(json);
}

/// @nodoc
mixin _$Alert {
  String get alertId => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get sensorId => throw _privateConstructorUsedError;
  AlertLevel get level => throw _privateConstructorUsedError;
  double get valueMmPerDay => throw _privateConstructorUsedError;
  DateTime get triggeredAt => throw _privateConstructorUsedError;
  DateTime? get resolvedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AlertCopyWith<Alert> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlertCopyWith<$Res> {
  factory $AlertCopyWith(Alert value, $Res Function(Alert) then) =
      _$AlertCopyWithImpl<$Res, Alert>;
  @useResult
  $Res call(
      {String alertId,
      String projectId,
      String sensorId,
      AlertLevel level,
      double valueMmPerDay,
      DateTime triggeredAt,
      DateTime? resolvedAt});
}

/// @nodoc
class _$AlertCopyWithImpl<$Res, $Val extends Alert>
    implements $AlertCopyWith<$Res> {
  _$AlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alertId = null,
    Object? projectId = null,
    Object? sensorId = null,
    Object? level = null,
    Object? valueMmPerDay = null,
    Object? triggeredAt = null,
    Object? resolvedAt = freezed,
  }) {
    return _then(_value.copyWith(
      alertId: null == alertId
          ? _value.alertId
          : alertId // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      sensorId: null == sensorId
          ? _value.sensorId
          : sensorId // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as AlertLevel,
      valueMmPerDay: null == valueMmPerDay
          ? _value.valueMmPerDay
          : valueMmPerDay // ignore: cast_nullable_to_non_nullable
              as double,
      triggeredAt: null == triggeredAt
          ? _value.triggeredAt
          : triggeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      resolvedAt: freezed == resolvedAt
          ? _value.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlertImplCopyWith<$Res> implements $AlertCopyWith<$Res> {
  factory _$$AlertImplCopyWith(
          _$AlertImpl value, $Res Function(_$AlertImpl) then) =
      __$$AlertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String alertId,
      String projectId,
      String sensorId,
      AlertLevel level,
      double valueMmPerDay,
      DateTime triggeredAt,
      DateTime? resolvedAt});
}

/// @nodoc
class __$$AlertImplCopyWithImpl<$Res>
    extends _$AlertCopyWithImpl<$Res, _$AlertImpl>
    implements _$$AlertImplCopyWith<$Res> {
  __$$AlertImplCopyWithImpl(
      _$AlertImpl _value, $Res Function(_$AlertImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? alertId = null,
    Object? projectId = null,
    Object? sensorId = null,
    Object? level = null,
    Object? valueMmPerDay = null,
    Object? triggeredAt = null,
    Object? resolvedAt = freezed,
  }) {
    return _then(_$AlertImpl(
      alertId: null == alertId
          ? _value.alertId
          : alertId // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      sensorId: null == sensorId
          ? _value.sensorId
          : sensorId // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as AlertLevel,
      valueMmPerDay: null == valueMmPerDay
          ? _value.valueMmPerDay
          : valueMmPerDay // ignore: cast_nullable_to_non_nullable
              as double,
      triggeredAt: null == triggeredAt
          ? _value.triggeredAt
          : triggeredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      resolvedAt: freezed == resolvedAt
          ? _value.resolvedAt
          : resolvedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlertImpl implements _Alert {
  const _$AlertImpl(
      {required this.alertId,
      required this.projectId,
      required this.sensorId,
      required this.level,
      required this.valueMmPerDay,
      required this.triggeredAt,
      this.resolvedAt});

  factory _$AlertImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlertImplFromJson(json);

  @override
  final String alertId;
  @override
  final String projectId;
  @override
  final String sensorId;
  @override
  final AlertLevel level;
  @override
  final double valueMmPerDay;
  @override
  final DateTime triggeredAt;
  @override
  final DateTime? resolvedAt;

  @override
  String toString() {
    return 'Alert(alertId: $alertId, projectId: $projectId, sensorId: $sensorId, level: $level, valueMmPerDay: $valueMmPerDay, triggeredAt: $triggeredAt, resolvedAt: $resolvedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlertImpl &&
            (identical(other.alertId, alertId) || other.alertId == alertId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.sensorId, sensorId) ||
                other.sensorId == sensorId) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.valueMmPerDay, valueMmPerDay) ||
                other.valueMmPerDay == valueMmPerDay) &&
            (identical(other.triggeredAt, triggeredAt) ||
                other.triggeredAt == triggeredAt) &&
            (identical(other.resolvedAt, resolvedAt) ||
                other.resolvedAt == resolvedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, alertId, projectId, sensorId,
      level, valueMmPerDay, triggeredAt, resolvedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AlertImplCopyWith<_$AlertImpl> get copyWith =>
      __$$AlertImplCopyWithImpl<_$AlertImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlertImplToJson(
      this,
    );
  }
}

abstract class _Alert implements Alert {
  const factory _Alert(
      {required final String alertId,
      required final String projectId,
      required final String sensorId,
      required final AlertLevel level,
      required final double valueMmPerDay,
      required final DateTime triggeredAt,
      final DateTime? resolvedAt}) = _$AlertImpl;

  factory _Alert.fromJson(Map<String, dynamic> json) = _$AlertImpl.fromJson;

  @override
  String get alertId;
  @override
  String get projectId;
  @override
  String get sensorId;
  @override
  AlertLevel get level;
  @override
  double get valueMmPerDay;
  @override
  DateTime get triggeredAt;
  @override
  DateTime? get resolvedAt;
  @override
  @JsonKey(ignore: true)
  _$$AlertImplCopyWith<_$AlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
