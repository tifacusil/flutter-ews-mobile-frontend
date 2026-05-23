// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rainfall_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RainfallPayload {

@JsonKey(name: 'rainfall_mm') double get rainfallMm;@JsonKey(name: 'cumulative_rainfall_mm') double get cumulativeRainfallMm;@JsonKey(name: 'interval_minutes') int get intervalMinutes;
/// Create a copy of RainfallPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RainfallPayloadCopyWith<RainfallPayload> get copyWith => _$RainfallPayloadCopyWithImpl<RainfallPayload>(this as RainfallPayload, _$identity);

  /// Serializes this RainfallPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RainfallPayload&&(identical(other.rainfallMm, rainfallMm) || other.rainfallMm == rainfallMm)&&(identical(other.cumulativeRainfallMm, cumulativeRainfallMm) || other.cumulativeRainfallMm == cumulativeRainfallMm)&&(identical(other.intervalMinutes, intervalMinutes) || other.intervalMinutes == intervalMinutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rainfallMm,cumulativeRainfallMm,intervalMinutes);

@override
String toString() {
  return 'RainfallPayload(rainfallMm: $rainfallMm, cumulativeRainfallMm: $cumulativeRainfallMm, intervalMinutes: $intervalMinutes)';
}


}

/// @nodoc
abstract mixin class $RainfallPayloadCopyWith<$Res>  {
  factory $RainfallPayloadCopyWith(RainfallPayload value, $Res Function(RainfallPayload) _then) = _$RainfallPayloadCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'rainfall_mm') double rainfallMm,@JsonKey(name: 'cumulative_rainfall_mm') double cumulativeRainfallMm,@JsonKey(name: 'interval_minutes') int intervalMinutes
});




}
/// @nodoc
class _$RainfallPayloadCopyWithImpl<$Res>
    implements $RainfallPayloadCopyWith<$Res> {
  _$RainfallPayloadCopyWithImpl(this._self, this._then);

  final RainfallPayload _self;
  final $Res Function(RainfallPayload) _then;

/// Create a copy of RainfallPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rainfallMm = null,Object? cumulativeRainfallMm = null,Object? intervalMinutes = null,}) {
  return _then(_self.copyWith(
rainfallMm: null == rainfallMm ? _self.rainfallMm : rainfallMm // ignore: cast_nullable_to_non_nullable
as double,cumulativeRainfallMm: null == cumulativeRainfallMm ? _self.cumulativeRainfallMm : cumulativeRainfallMm // ignore: cast_nullable_to_non_nullable
as double,intervalMinutes: null == intervalMinutes ? _self.intervalMinutes : intervalMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RainfallPayload].
extension RainfallPayloadPatterns on RainfallPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RainfallPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RainfallPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RainfallPayload value)  $default,){
final _that = this;
switch (_that) {
case _RainfallPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RainfallPayload value)?  $default,){
final _that = this;
switch (_that) {
case _RainfallPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'rainfall_mm')  double rainfallMm, @JsonKey(name: 'cumulative_rainfall_mm')  double cumulativeRainfallMm, @JsonKey(name: 'interval_minutes')  int intervalMinutes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RainfallPayload() when $default != null:
return $default(_that.rainfallMm,_that.cumulativeRainfallMm,_that.intervalMinutes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'rainfall_mm')  double rainfallMm, @JsonKey(name: 'cumulative_rainfall_mm')  double cumulativeRainfallMm, @JsonKey(name: 'interval_minutes')  int intervalMinutes)  $default,) {final _that = this;
switch (_that) {
case _RainfallPayload():
return $default(_that.rainfallMm,_that.cumulativeRainfallMm,_that.intervalMinutes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'rainfall_mm')  double rainfallMm, @JsonKey(name: 'cumulative_rainfall_mm')  double cumulativeRainfallMm, @JsonKey(name: 'interval_minutes')  int intervalMinutes)?  $default,) {final _that = this;
switch (_that) {
case _RainfallPayload() when $default != null:
return $default(_that.rainfallMm,_that.cumulativeRainfallMm,_that.intervalMinutes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RainfallPayload implements RainfallPayload {
  const _RainfallPayload({@JsonKey(name: 'rainfall_mm') required this.rainfallMm, @JsonKey(name: 'cumulative_rainfall_mm') required this.cumulativeRainfallMm, @JsonKey(name: 'interval_minutes') required this.intervalMinutes});
  factory _RainfallPayload.fromJson(Map<String, dynamic> json) => _$RainfallPayloadFromJson(json);

@override@JsonKey(name: 'rainfall_mm') final  double rainfallMm;
@override@JsonKey(name: 'cumulative_rainfall_mm') final  double cumulativeRainfallMm;
@override@JsonKey(name: 'interval_minutes') final  int intervalMinutes;

/// Create a copy of RainfallPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RainfallPayloadCopyWith<_RainfallPayload> get copyWith => __$RainfallPayloadCopyWithImpl<_RainfallPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RainfallPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RainfallPayload&&(identical(other.rainfallMm, rainfallMm) || other.rainfallMm == rainfallMm)&&(identical(other.cumulativeRainfallMm, cumulativeRainfallMm) || other.cumulativeRainfallMm == cumulativeRainfallMm)&&(identical(other.intervalMinutes, intervalMinutes) || other.intervalMinutes == intervalMinutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rainfallMm,cumulativeRainfallMm,intervalMinutes);

@override
String toString() {
  return 'RainfallPayload(rainfallMm: $rainfallMm, cumulativeRainfallMm: $cumulativeRainfallMm, intervalMinutes: $intervalMinutes)';
}


}

/// @nodoc
abstract mixin class _$RainfallPayloadCopyWith<$Res> implements $RainfallPayloadCopyWith<$Res> {
  factory _$RainfallPayloadCopyWith(_RainfallPayload value, $Res Function(_RainfallPayload) _then) = __$RainfallPayloadCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'rainfall_mm') double rainfallMm,@JsonKey(name: 'cumulative_rainfall_mm') double cumulativeRainfallMm,@JsonKey(name: 'interval_minutes') int intervalMinutes
});




}
/// @nodoc
class __$RainfallPayloadCopyWithImpl<$Res>
    implements _$RainfallPayloadCopyWith<$Res> {
  __$RainfallPayloadCopyWithImpl(this._self, this._then);

  final _RainfallPayload _self;
  final $Res Function(_RainfallPayload) _then;

/// Create a copy of RainfallPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rainfallMm = null,Object? cumulativeRainfallMm = null,Object? intervalMinutes = null,}) {
  return _then(_RainfallPayload(
rainfallMm: null == rainfallMm ? _self.rainfallMm : rainfallMm // ignore: cast_nullable_to_non_nullable
as double,cumulativeRainfallMm: null == cumulativeRainfallMm ? _self.cumulativeRainfallMm : cumulativeRainfallMm // ignore: cast_nullable_to_non_nullable
as double,intervalMinutes: null == intervalMinutes ? _self.intervalMinutes : intervalMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
