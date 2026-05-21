// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gnss_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GnssPayload {

 double get displacementXMm; double get displacementYMm; double get displacementZMm; double get displacementHorizontalMm; double get cumulativeDisplacementMm; int get fixQuality;
/// Create a copy of GnssPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GnssPayloadCopyWith<GnssPayload> get copyWith => _$GnssPayloadCopyWithImpl<GnssPayload>(this as GnssPayload, _$identity);

  /// Serializes this GnssPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GnssPayload&&(identical(other.displacementXMm, displacementXMm) || other.displacementXMm == displacementXMm)&&(identical(other.displacementYMm, displacementYMm) || other.displacementYMm == displacementYMm)&&(identical(other.displacementZMm, displacementZMm) || other.displacementZMm == displacementZMm)&&(identical(other.displacementHorizontalMm, displacementHorizontalMm) || other.displacementHorizontalMm == displacementHorizontalMm)&&(identical(other.cumulativeDisplacementMm, cumulativeDisplacementMm) || other.cumulativeDisplacementMm == cumulativeDisplacementMm)&&(identical(other.fixQuality, fixQuality) || other.fixQuality == fixQuality));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,displacementXMm,displacementYMm,displacementZMm,displacementHorizontalMm,cumulativeDisplacementMm,fixQuality);

@override
String toString() {
  return 'GnssPayload(displacementXMm: $displacementXMm, displacementYMm: $displacementYMm, displacementZMm: $displacementZMm, displacementHorizontalMm: $displacementHorizontalMm, cumulativeDisplacementMm: $cumulativeDisplacementMm, fixQuality: $fixQuality)';
}


}

/// @nodoc
abstract mixin class $GnssPayloadCopyWith<$Res>  {
  factory $GnssPayloadCopyWith(GnssPayload value, $Res Function(GnssPayload) _then) = _$GnssPayloadCopyWithImpl;
@useResult
$Res call({
 double displacementXMm, double displacementYMm, double displacementZMm, double displacementHorizontalMm, double cumulativeDisplacementMm, int fixQuality
});




}
/// @nodoc
class _$GnssPayloadCopyWithImpl<$Res>
    implements $GnssPayloadCopyWith<$Res> {
  _$GnssPayloadCopyWithImpl(this._self, this._then);

  final GnssPayload _self;
  final $Res Function(GnssPayload) _then;

/// Create a copy of GnssPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? displacementXMm = null,Object? displacementYMm = null,Object? displacementZMm = null,Object? displacementHorizontalMm = null,Object? cumulativeDisplacementMm = null,Object? fixQuality = null,}) {
  return _then(_self.copyWith(
displacementXMm: null == displacementXMm ? _self.displacementXMm : displacementXMm // ignore: cast_nullable_to_non_nullable
as double,displacementYMm: null == displacementYMm ? _self.displacementYMm : displacementYMm // ignore: cast_nullable_to_non_nullable
as double,displacementZMm: null == displacementZMm ? _self.displacementZMm : displacementZMm // ignore: cast_nullable_to_non_nullable
as double,displacementHorizontalMm: null == displacementHorizontalMm ? _self.displacementHorizontalMm : displacementHorizontalMm // ignore: cast_nullable_to_non_nullable
as double,cumulativeDisplacementMm: null == cumulativeDisplacementMm ? _self.cumulativeDisplacementMm : cumulativeDisplacementMm // ignore: cast_nullable_to_non_nullable
as double,fixQuality: null == fixQuality ? _self.fixQuality : fixQuality // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GnssPayload].
extension GnssPayloadPatterns on GnssPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GnssPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GnssPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GnssPayload value)  $default,){
final _that = this;
switch (_that) {
case _GnssPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GnssPayload value)?  $default,){
final _that = this;
switch (_that) {
case _GnssPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double displacementXMm,  double displacementYMm,  double displacementZMm,  double displacementHorizontalMm,  double cumulativeDisplacementMm,  int fixQuality)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GnssPayload() when $default != null:
return $default(_that.displacementXMm,_that.displacementYMm,_that.displacementZMm,_that.displacementHorizontalMm,_that.cumulativeDisplacementMm,_that.fixQuality);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double displacementXMm,  double displacementYMm,  double displacementZMm,  double displacementHorizontalMm,  double cumulativeDisplacementMm,  int fixQuality)  $default,) {final _that = this;
switch (_that) {
case _GnssPayload():
return $default(_that.displacementXMm,_that.displacementYMm,_that.displacementZMm,_that.displacementHorizontalMm,_that.cumulativeDisplacementMm,_that.fixQuality);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double displacementXMm,  double displacementYMm,  double displacementZMm,  double displacementHorizontalMm,  double cumulativeDisplacementMm,  int fixQuality)?  $default,) {final _that = this;
switch (_that) {
case _GnssPayload() when $default != null:
return $default(_that.displacementXMm,_that.displacementYMm,_that.displacementZMm,_that.displacementHorizontalMm,_that.cumulativeDisplacementMm,_that.fixQuality);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GnssPayload implements GnssPayload {
  const _GnssPayload({required this.displacementXMm, required this.displacementYMm, required this.displacementZMm, required this.displacementHorizontalMm, required this.cumulativeDisplacementMm, required this.fixQuality});
  factory _GnssPayload.fromJson(Map<String, dynamic> json) => _$GnssPayloadFromJson(json);

@override final  double displacementXMm;
@override final  double displacementYMm;
@override final  double displacementZMm;
@override final  double displacementHorizontalMm;
@override final  double cumulativeDisplacementMm;
@override final  int fixQuality;

/// Create a copy of GnssPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GnssPayloadCopyWith<_GnssPayload> get copyWith => __$GnssPayloadCopyWithImpl<_GnssPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GnssPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GnssPayload&&(identical(other.displacementXMm, displacementXMm) || other.displacementXMm == displacementXMm)&&(identical(other.displacementYMm, displacementYMm) || other.displacementYMm == displacementYMm)&&(identical(other.displacementZMm, displacementZMm) || other.displacementZMm == displacementZMm)&&(identical(other.displacementHorizontalMm, displacementHorizontalMm) || other.displacementHorizontalMm == displacementHorizontalMm)&&(identical(other.cumulativeDisplacementMm, cumulativeDisplacementMm) || other.cumulativeDisplacementMm == cumulativeDisplacementMm)&&(identical(other.fixQuality, fixQuality) || other.fixQuality == fixQuality));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,displacementXMm,displacementYMm,displacementZMm,displacementHorizontalMm,cumulativeDisplacementMm,fixQuality);

@override
String toString() {
  return 'GnssPayload(displacementXMm: $displacementXMm, displacementYMm: $displacementYMm, displacementZMm: $displacementZMm, displacementHorizontalMm: $displacementHorizontalMm, cumulativeDisplacementMm: $cumulativeDisplacementMm, fixQuality: $fixQuality)';
}


}

/// @nodoc
abstract mixin class _$GnssPayloadCopyWith<$Res> implements $GnssPayloadCopyWith<$Res> {
  factory _$GnssPayloadCopyWith(_GnssPayload value, $Res Function(_GnssPayload) _then) = __$GnssPayloadCopyWithImpl;
@override @useResult
$Res call({
 double displacementXMm, double displacementYMm, double displacementZMm, double displacementHorizontalMm, double cumulativeDisplacementMm, int fixQuality
});




}
/// @nodoc
class __$GnssPayloadCopyWithImpl<$Res>
    implements _$GnssPayloadCopyWith<$Res> {
  __$GnssPayloadCopyWithImpl(this._self, this._then);

  final _GnssPayload _self;
  final $Res Function(_GnssPayload) _then;

/// Create a copy of GnssPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? displacementXMm = null,Object? displacementYMm = null,Object? displacementZMm = null,Object? displacementHorizontalMm = null,Object? cumulativeDisplacementMm = null,Object? fixQuality = null,}) {
  return _then(_GnssPayload(
displacementXMm: null == displacementXMm ? _self.displacementXMm : displacementXMm // ignore: cast_nullable_to_non_nullable
as double,displacementYMm: null == displacementYMm ? _self.displacementYMm : displacementYMm // ignore: cast_nullable_to_non_nullable
as double,displacementZMm: null == displacementZMm ? _self.displacementZMm : displacementZMm // ignore: cast_nullable_to_non_nullable
as double,displacementHorizontalMm: null == displacementHorizontalMm ? _self.displacementHorizontalMm : displacementHorizontalMm // ignore: cast_nullable_to_non_nullable
as double,cumulativeDisplacementMm: null == cumulativeDisplacementMm ? _self.cumulativeDisplacementMm : cumulativeDisplacementMm // ignore: cast_nullable_to_non_nullable
as double,fixQuality: null == fixQuality ? _self.fixQuality : fixQuality // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
