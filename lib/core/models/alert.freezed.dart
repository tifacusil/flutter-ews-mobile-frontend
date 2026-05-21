// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Alert {

 String get alertId; String get projectId; String get sensorId; AlertLevel get level; double get valueMmPerDay; DateTime get triggeredAt; DateTime? get resolvedAt;
/// Create a copy of Alert
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertCopyWith<Alert> get copyWith => _$AlertCopyWithImpl<Alert>(this as Alert, _$identity);

  /// Serializes this Alert to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Alert&&(identical(other.alertId, alertId) || other.alertId == alertId)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.sensorId, sensorId) || other.sensorId == sensorId)&&(identical(other.level, level) || other.level == level)&&(identical(other.valueMmPerDay, valueMmPerDay) || other.valueMmPerDay == valueMmPerDay)&&(identical(other.triggeredAt, triggeredAt) || other.triggeredAt == triggeredAt)&&(identical(other.resolvedAt, resolvedAt) || other.resolvedAt == resolvedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,alertId,projectId,sensorId,level,valueMmPerDay,triggeredAt,resolvedAt);

@override
String toString() {
  return 'Alert(alertId: $alertId, projectId: $projectId, sensorId: $sensorId, level: $level, valueMmPerDay: $valueMmPerDay, triggeredAt: $triggeredAt, resolvedAt: $resolvedAt)';
}


}

/// @nodoc
abstract mixin class $AlertCopyWith<$Res>  {
  factory $AlertCopyWith(Alert value, $Res Function(Alert) _then) = _$AlertCopyWithImpl;
@useResult
$Res call({
 String alertId, String projectId, String sensorId, AlertLevel level, double valueMmPerDay, DateTime triggeredAt, DateTime? resolvedAt
});




}
/// @nodoc
class _$AlertCopyWithImpl<$Res>
    implements $AlertCopyWith<$Res> {
  _$AlertCopyWithImpl(this._self, this._then);

  final Alert _self;
  final $Res Function(Alert) _then;

/// Create a copy of Alert
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? alertId = null,Object? projectId = null,Object? sensorId = null,Object? level = null,Object? valueMmPerDay = null,Object? triggeredAt = null,Object? resolvedAt = freezed,}) {
  return _then(_self.copyWith(
alertId: null == alertId ? _self.alertId : alertId // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,sensorId: null == sensorId ? _self.sensorId : sensorId // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as AlertLevel,valueMmPerDay: null == valueMmPerDay ? _self.valueMmPerDay : valueMmPerDay // ignore: cast_nullable_to_non_nullable
as double,triggeredAt: null == triggeredAt ? _self.triggeredAt : triggeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,resolvedAt: freezed == resolvedAt ? _self.resolvedAt : resolvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Alert].
extension AlertPatterns on Alert {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Alert value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Alert() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Alert value)  $default,){
final _that = this;
switch (_that) {
case _Alert():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Alert value)?  $default,){
final _that = this;
switch (_that) {
case _Alert() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String alertId,  String projectId,  String sensorId,  AlertLevel level,  double valueMmPerDay,  DateTime triggeredAt,  DateTime? resolvedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Alert() when $default != null:
return $default(_that.alertId,_that.projectId,_that.sensorId,_that.level,_that.valueMmPerDay,_that.triggeredAt,_that.resolvedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String alertId,  String projectId,  String sensorId,  AlertLevel level,  double valueMmPerDay,  DateTime triggeredAt,  DateTime? resolvedAt)  $default,) {final _that = this;
switch (_that) {
case _Alert():
return $default(_that.alertId,_that.projectId,_that.sensorId,_that.level,_that.valueMmPerDay,_that.triggeredAt,_that.resolvedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String alertId,  String projectId,  String sensorId,  AlertLevel level,  double valueMmPerDay,  DateTime triggeredAt,  DateTime? resolvedAt)?  $default,) {final _that = this;
switch (_that) {
case _Alert() when $default != null:
return $default(_that.alertId,_that.projectId,_that.sensorId,_that.level,_that.valueMmPerDay,_that.triggeredAt,_that.resolvedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Alert implements Alert {
  const _Alert({required this.alertId, required this.projectId, required this.sensorId, required this.level, required this.valueMmPerDay, required this.triggeredAt, this.resolvedAt});
  factory _Alert.fromJson(Map<String, dynamic> json) => _$AlertFromJson(json);

@override final  String alertId;
@override final  String projectId;
@override final  String sensorId;
@override final  AlertLevel level;
@override final  double valueMmPerDay;
@override final  DateTime triggeredAt;
@override final  DateTime? resolvedAt;

/// Create a copy of Alert
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlertCopyWith<_Alert> get copyWith => __$AlertCopyWithImpl<_Alert>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlertToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Alert&&(identical(other.alertId, alertId) || other.alertId == alertId)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.sensorId, sensorId) || other.sensorId == sensorId)&&(identical(other.level, level) || other.level == level)&&(identical(other.valueMmPerDay, valueMmPerDay) || other.valueMmPerDay == valueMmPerDay)&&(identical(other.triggeredAt, triggeredAt) || other.triggeredAt == triggeredAt)&&(identical(other.resolvedAt, resolvedAt) || other.resolvedAt == resolvedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,alertId,projectId,sensorId,level,valueMmPerDay,triggeredAt,resolvedAt);

@override
String toString() {
  return 'Alert(alertId: $alertId, projectId: $projectId, sensorId: $sensorId, level: $level, valueMmPerDay: $valueMmPerDay, triggeredAt: $triggeredAt, resolvedAt: $resolvedAt)';
}


}

/// @nodoc
abstract mixin class _$AlertCopyWith<$Res> implements $AlertCopyWith<$Res> {
  factory _$AlertCopyWith(_Alert value, $Res Function(_Alert) _then) = __$AlertCopyWithImpl;
@override @useResult
$Res call({
 String alertId, String projectId, String sensorId, AlertLevel level, double valueMmPerDay, DateTime triggeredAt, DateTime? resolvedAt
});




}
/// @nodoc
class __$AlertCopyWithImpl<$Res>
    implements _$AlertCopyWith<$Res> {
  __$AlertCopyWithImpl(this._self, this._then);

  final _Alert _self;
  final $Res Function(_Alert) _then;

/// Create a copy of Alert
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? alertId = null,Object? projectId = null,Object? sensorId = null,Object? level = null,Object? valueMmPerDay = null,Object? triggeredAt = null,Object? resolvedAt = freezed,}) {
  return _then(_Alert(
alertId: null == alertId ? _self.alertId : alertId // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,sensorId: null == sensorId ? _self.sensorId : sensorId // ignore: cast_nullable_to_non_nullable
as String,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as AlertLevel,valueMmPerDay: null == valueMmPerDay ? _self.valueMmPerDay : valueMmPerDay // ignore: cast_nullable_to_non_nullable
as double,triggeredAt: null == triggeredAt ? _self.triggeredAt : triggeredAt // ignore: cast_nullable_to_non_nullable
as DateTime,resolvedAt: freezed == resolvedAt ? _self.resolvedAt : resolvedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
