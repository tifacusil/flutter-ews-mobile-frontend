// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'strain_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StrainPayload {

@JsonKey(name: 'strain_microstrain') double get strainMicrostrain;@JsonKey(name: 'temperature_celsius') double? get temperatureCelsius;
/// Create a copy of StrainPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StrainPayloadCopyWith<StrainPayload> get copyWith => _$StrainPayloadCopyWithImpl<StrainPayload>(this as StrainPayload, _$identity);

  /// Serializes this StrainPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StrainPayload&&(identical(other.strainMicrostrain, strainMicrostrain) || other.strainMicrostrain == strainMicrostrain)&&(identical(other.temperatureCelsius, temperatureCelsius) || other.temperatureCelsius == temperatureCelsius));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,strainMicrostrain,temperatureCelsius);

@override
String toString() {
  return 'StrainPayload(strainMicrostrain: $strainMicrostrain, temperatureCelsius: $temperatureCelsius)';
}


}

/// @nodoc
abstract mixin class $StrainPayloadCopyWith<$Res>  {
  factory $StrainPayloadCopyWith(StrainPayload value, $Res Function(StrainPayload) _then) = _$StrainPayloadCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'strain_microstrain') double strainMicrostrain,@JsonKey(name: 'temperature_celsius') double? temperatureCelsius
});




}
/// @nodoc
class _$StrainPayloadCopyWithImpl<$Res>
    implements $StrainPayloadCopyWith<$Res> {
  _$StrainPayloadCopyWithImpl(this._self, this._then);

  final StrainPayload _self;
  final $Res Function(StrainPayload) _then;

/// Create a copy of StrainPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? strainMicrostrain = null,Object? temperatureCelsius = freezed,}) {
  return _then(_self.copyWith(
strainMicrostrain: null == strainMicrostrain ? _self.strainMicrostrain : strainMicrostrain // ignore: cast_nullable_to_non_nullable
as double,temperatureCelsius: freezed == temperatureCelsius ? _self.temperatureCelsius : temperatureCelsius // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [StrainPayload].
extension StrainPayloadPatterns on StrainPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StrainPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StrainPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StrainPayload value)  $default,){
final _that = this;
switch (_that) {
case _StrainPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StrainPayload value)?  $default,){
final _that = this;
switch (_that) {
case _StrainPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'strain_microstrain')  double strainMicrostrain, @JsonKey(name: 'temperature_celsius')  double? temperatureCelsius)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StrainPayload() when $default != null:
return $default(_that.strainMicrostrain,_that.temperatureCelsius);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'strain_microstrain')  double strainMicrostrain, @JsonKey(name: 'temperature_celsius')  double? temperatureCelsius)  $default,) {final _that = this;
switch (_that) {
case _StrainPayload():
return $default(_that.strainMicrostrain,_that.temperatureCelsius);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'strain_microstrain')  double strainMicrostrain, @JsonKey(name: 'temperature_celsius')  double? temperatureCelsius)?  $default,) {final _that = this;
switch (_that) {
case _StrainPayload() when $default != null:
return $default(_that.strainMicrostrain,_that.temperatureCelsius);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StrainPayload implements StrainPayload {
  const _StrainPayload({@JsonKey(name: 'strain_microstrain') required this.strainMicrostrain, @JsonKey(name: 'temperature_celsius') this.temperatureCelsius});
  factory _StrainPayload.fromJson(Map<String, dynamic> json) => _$StrainPayloadFromJson(json);

@override@JsonKey(name: 'strain_microstrain') final  double strainMicrostrain;
@override@JsonKey(name: 'temperature_celsius') final  double? temperatureCelsius;

/// Create a copy of StrainPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StrainPayloadCopyWith<_StrainPayload> get copyWith => __$StrainPayloadCopyWithImpl<_StrainPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StrainPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StrainPayload&&(identical(other.strainMicrostrain, strainMicrostrain) || other.strainMicrostrain == strainMicrostrain)&&(identical(other.temperatureCelsius, temperatureCelsius) || other.temperatureCelsius == temperatureCelsius));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,strainMicrostrain,temperatureCelsius);

@override
String toString() {
  return 'StrainPayload(strainMicrostrain: $strainMicrostrain, temperatureCelsius: $temperatureCelsius)';
}


}

/// @nodoc
abstract mixin class _$StrainPayloadCopyWith<$Res> implements $StrainPayloadCopyWith<$Res> {
  factory _$StrainPayloadCopyWith(_StrainPayload value, $Res Function(_StrainPayload) _then) = __$StrainPayloadCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'strain_microstrain') double strainMicrostrain,@JsonKey(name: 'temperature_celsius') double? temperatureCelsius
});




}
/// @nodoc
class __$StrainPayloadCopyWithImpl<$Res>
    implements _$StrainPayloadCopyWith<$Res> {
  __$StrainPayloadCopyWithImpl(this._self, this._then);

  final _StrainPayload _self;
  final $Res Function(_StrainPayload) _then;

/// Create a copy of StrainPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? strainMicrostrain = null,Object? temperatureCelsius = freezed,}) {
  return _then(_StrainPayload(
strainMicrostrain: null == strainMicrostrain ? _self.strainMicrostrain : strainMicrostrain // ignore: cast_nullable_to_non_nullable
as double,temperatureCelsius: freezed == temperatureCelsius ? _self.temperatureCelsius : temperatureCelsius // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
