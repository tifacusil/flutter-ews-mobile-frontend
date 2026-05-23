// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deep_displacement_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeepDisplacementPayload {

@JsonKey(name: 'depth_m') double get depthM;@JsonKey(name: 'tilt_x_mm') double get tiltXMm;@JsonKey(name: 'tilt_y_mm') double get tiltYMm;@JsonKey(name: 'cumulative_tilt_mm') double get cumulativeTiltMm;
/// Create a copy of DeepDisplacementPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeepDisplacementPayloadCopyWith<DeepDisplacementPayload> get copyWith => _$DeepDisplacementPayloadCopyWithImpl<DeepDisplacementPayload>(this as DeepDisplacementPayload, _$identity);

  /// Serializes this DeepDisplacementPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeepDisplacementPayload&&(identical(other.depthM, depthM) || other.depthM == depthM)&&(identical(other.tiltXMm, tiltXMm) || other.tiltXMm == tiltXMm)&&(identical(other.tiltYMm, tiltYMm) || other.tiltYMm == tiltYMm)&&(identical(other.cumulativeTiltMm, cumulativeTiltMm) || other.cumulativeTiltMm == cumulativeTiltMm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,depthM,tiltXMm,tiltYMm,cumulativeTiltMm);

@override
String toString() {
  return 'DeepDisplacementPayload(depthM: $depthM, tiltXMm: $tiltXMm, tiltYMm: $tiltYMm, cumulativeTiltMm: $cumulativeTiltMm)';
}


}

/// @nodoc
abstract mixin class $DeepDisplacementPayloadCopyWith<$Res>  {
  factory $DeepDisplacementPayloadCopyWith(DeepDisplacementPayload value, $Res Function(DeepDisplacementPayload) _then) = _$DeepDisplacementPayloadCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'depth_m') double depthM,@JsonKey(name: 'tilt_x_mm') double tiltXMm,@JsonKey(name: 'tilt_y_mm') double tiltYMm,@JsonKey(name: 'cumulative_tilt_mm') double cumulativeTiltMm
});




}
/// @nodoc
class _$DeepDisplacementPayloadCopyWithImpl<$Res>
    implements $DeepDisplacementPayloadCopyWith<$Res> {
  _$DeepDisplacementPayloadCopyWithImpl(this._self, this._then);

  final DeepDisplacementPayload _self;
  final $Res Function(DeepDisplacementPayload) _then;

/// Create a copy of DeepDisplacementPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? depthM = null,Object? tiltXMm = null,Object? tiltYMm = null,Object? cumulativeTiltMm = null,}) {
  return _then(_self.copyWith(
depthM: null == depthM ? _self.depthM : depthM // ignore: cast_nullable_to_non_nullable
as double,tiltXMm: null == tiltXMm ? _self.tiltXMm : tiltXMm // ignore: cast_nullable_to_non_nullable
as double,tiltYMm: null == tiltYMm ? _self.tiltYMm : tiltYMm // ignore: cast_nullable_to_non_nullable
as double,cumulativeTiltMm: null == cumulativeTiltMm ? _self.cumulativeTiltMm : cumulativeTiltMm // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [DeepDisplacementPayload].
extension DeepDisplacementPayloadPatterns on DeepDisplacementPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeepDisplacementPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeepDisplacementPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeepDisplacementPayload value)  $default,){
final _that = this;
switch (_that) {
case _DeepDisplacementPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeepDisplacementPayload value)?  $default,){
final _that = this;
switch (_that) {
case _DeepDisplacementPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'depth_m')  double depthM, @JsonKey(name: 'tilt_x_mm')  double tiltXMm, @JsonKey(name: 'tilt_y_mm')  double tiltYMm, @JsonKey(name: 'cumulative_tilt_mm')  double cumulativeTiltMm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeepDisplacementPayload() when $default != null:
return $default(_that.depthM,_that.tiltXMm,_that.tiltYMm,_that.cumulativeTiltMm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'depth_m')  double depthM, @JsonKey(name: 'tilt_x_mm')  double tiltXMm, @JsonKey(name: 'tilt_y_mm')  double tiltYMm, @JsonKey(name: 'cumulative_tilt_mm')  double cumulativeTiltMm)  $default,) {final _that = this;
switch (_that) {
case _DeepDisplacementPayload():
return $default(_that.depthM,_that.tiltXMm,_that.tiltYMm,_that.cumulativeTiltMm);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'depth_m')  double depthM, @JsonKey(name: 'tilt_x_mm')  double tiltXMm, @JsonKey(name: 'tilt_y_mm')  double tiltYMm, @JsonKey(name: 'cumulative_tilt_mm')  double cumulativeTiltMm)?  $default,) {final _that = this;
switch (_that) {
case _DeepDisplacementPayload() when $default != null:
return $default(_that.depthM,_that.tiltXMm,_that.tiltYMm,_that.cumulativeTiltMm);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeepDisplacementPayload implements DeepDisplacementPayload {
  const _DeepDisplacementPayload({@JsonKey(name: 'depth_m') required this.depthM, @JsonKey(name: 'tilt_x_mm') required this.tiltXMm, @JsonKey(name: 'tilt_y_mm') required this.tiltYMm, @JsonKey(name: 'cumulative_tilt_mm') required this.cumulativeTiltMm});
  factory _DeepDisplacementPayload.fromJson(Map<String, dynamic> json) => _$DeepDisplacementPayloadFromJson(json);

@override@JsonKey(name: 'depth_m') final  double depthM;
@override@JsonKey(name: 'tilt_x_mm') final  double tiltXMm;
@override@JsonKey(name: 'tilt_y_mm') final  double tiltYMm;
@override@JsonKey(name: 'cumulative_tilt_mm') final  double cumulativeTiltMm;

/// Create a copy of DeepDisplacementPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeepDisplacementPayloadCopyWith<_DeepDisplacementPayload> get copyWith => __$DeepDisplacementPayloadCopyWithImpl<_DeepDisplacementPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeepDisplacementPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeepDisplacementPayload&&(identical(other.depthM, depthM) || other.depthM == depthM)&&(identical(other.tiltXMm, tiltXMm) || other.tiltXMm == tiltXMm)&&(identical(other.tiltYMm, tiltYMm) || other.tiltYMm == tiltYMm)&&(identical(other.cumulativeTiltMm, cumulativeTiltMm) || other.cumulativeTiltMm == cumulativeTiltMm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,depthM,tiltXMm,tiltYMm,cumulativeTiltMm);

@override
String toString() {
  return 'DeepDisplacementPayload(depthM: $depthM, tiltXMm: $tiltXMm, tiltYMm: $tiltYMm, cumulativeTiltMm: $cumulativeTiltMm)';
}


}

/// @nodoc
abstract mixin class _$DeepDisplacementPayloadCopyWith<$Res> implements $DeepDisplacementPayloadCopyWith<$Res> {
  factory _$DeepDisplacementPayloadCopyWith(_DeepDisplacementPayload value, $Res Function(_DeepDisplacementPayload) _then) = __$DeepDisplacementPayloadCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'depth_m') double depthM,@JsonKey(name: 'tilt_x_mm') double tiltXMm,@JsonKey(name: 'tilt_y_mm') double tiltYMm,@JsonKey(name: 'cumulative_tilt_mm') double cumulativeTiltMm
});




}
/// @nodoc
class __$DeepDisplacementPayloadCopyWithImpl<$Res>
    implements _$DeepDisplacementPayloadCopyWith<$Res> {
  __$DeepDisplacementPayloadCopyWithImpl(this._self, this._then);

  final _DeepDisplacementPayload _self;
  final $Res Function(_DeepDisplacementPayload) _then;

/// Create a copy of DeepDisplacementPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? depthM = null,Object? tiltXMm = null,Object? tiltYMm = null,Object? cumulativeTiltMm = null,}) {
  return _then(_DeepDisplacementPayload(
depthM: null == depthM ? _self.depthM : depthM // ignore: cast_nullable_to_non_nullable
as double,tiltXMm: null == tiltXMm ? _self.tiltXMm : tiltXMm // ignore: cast_nullable_to_non_nullable
as double,tiltYMm: null == tiltYMm ? _self.tiltYMm : tiltYMm // ignore: cast_nullable_to_non_nullable
as double,cumulativeTiltMm: null == cumulativeTiltMm ? _self.cumulativeTiltMm : cumulativeTiltMm // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
