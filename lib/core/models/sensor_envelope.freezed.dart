// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor_envelope.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SensorEnvelope {

 String get schemaVersion; String get messageId; String get projectId; String get sensorId; String get sensorType; DateTime get timestamp; DateTime get receivedAt; int get samplingIntervalSeconds; Map<String, dynamic> get payload;
/// Create a copy of SensorEnvelope
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SensorEnvelopeCopyWith<SensorEnvelope> get copyWith => _$SensorEnvelopeCopyWithImpl<SensorEnvelope>(this as SensorEnvelope, _$identity);

  /// Serializes this SensorEnvelope to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SensorEnvelope&&(identical(other.schemaVersion, schemaVersion) || other.schemaVersion == schemaVersion)&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.sensorId, sensorId) || other.sensorId == sensorId)&&(identical(other.sensorType, sensorType) || other.sensorType == sensorType)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt)&&(identical(other.samplingIntervalSeconds, samplingIntervalSeconds) || other.samplingIntervalSeconds == samplingIntervalSeconds)&&const DeepCollectionEquality().equals(other.payload, payload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schemaVersion,messageId,projectId,sensorId,sensorType,timestamp,receivedAt,samplingIntervalSeconds,const DeepCollectionEquality().hash(payload));

@override
String toString() {
  return 'SensorEnvelope(schemaVersion: $schemaVersion, messageId: $messageId, projectId: $projectId, sensorId: $sensorId, sensorType: $sensorType, timestamp: $timestamp, receivedAt: $receivedAt, samplingIntervalSeconds: $samplingIntervalSeconds, payload: $payload)';
}


}

/// @nodoc
abstract mixin class $SensorEnvelopeCopyWith<$Res>  {
  factory $SensorEnvelopeCopyWith(SensorEnvelope value, $Res Function(SensorEnvelope) _then) = _$SensorEnvelopeCopyWithImpl;
@useResult
$Res call({
 String schemaVersion, String messageId, String projectId, String sensorId, String sensorType, DateTime timestamp, DateTime receivedAt, int samplingIntervalSeconds, Map<String, dynamic> payload
});




}
/// @nodoc
class _$SensorEnvelopeCopyWithImpl<$Res>
    implements $SensorEnvelopeCopyWith<$Res> {
  _$SensorEnvelopeCopyWithImpl(this._self, this._then);

  final SensorEnvelope _self;
  final $Res Function(SensorEnvelope) _then;

/// Create a copy of SensorEnvelope
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? schemaVersion = null,Object? messageId = null,Object? projectId = null,Object? sensorId = null,Object? sensorType = null,Object? timestamp = null,Object? receivedAt = null,Object? samplingIntervalSeconds = null,Object? payload = null,}) {
  return _then(_self.copyWith(
schemaVersion: null == schemaVersion ? _self.schemaVersion : schemaVersion // ignore: cast_nullable_to_non_nullable
as String,messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,sensorId: null == sensorId ? _self.sensorId : sensorId // ignore: cast_nullable_to_non_nullable
as String,sensorType: null == sensorType ? _self.sensorType : sensorType // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,receivedAt: null == receivedAt ? _self.receivedAt : receivedAt // ignore: cast_nullable_to_non_nullable
as DateTime,samplingIntervalSeconds: null == samplingIntervalSeconds ? _self.samplingIntervalSeconds : samplingIntervalSeconds // ignore: cast_nullable_to_non_nullable
as int,payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [SensorEnvelope].
extension SensorEnvelopePatterns on SensorEnvelope {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SensorEnvelope value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SensorEnvelope() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SensorEnvelope value)  $default,){
final _that = this;
switch (_that) {
case _SensorEnvelope():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SensorEnvelope value)?  $default,){
final _that = this;
switch (_that) {
case _SensorEnvelope() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String schemaVersion,  String messageId,  String projectId,  String sensorId,  String sensorType,  DateTime timestamp,  DateTime receivedAt,  int samplingIntervalSeconds,  Map<String, dynamic> payload)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SensorEnvelope() when $default != null:
return $default(_that.schemaVersion,_that.messageId,_that.projectId,_that.sensorId,_that.sensorType,_that.timestamp,_that.receivedAt,_that.samplingIntervalSeconds,_that.payload);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String schemaVersion,  String messageId,  String projectId,  String sensorId,  String sensorType,  DateTime timestamp,  DateTime receivedAt,  int samplingIntervalSeconds,  Map<String, dynamic> payload)  $default,) {final _that = this;
switch (_that) {
case _SensorEnvelope():
return $default(_that.schemaVersion,_that.messageId,_that.projectId,_that.sensorId,_that.sensorType,_that.timestamp,_that.receivedAt,_that.samplingIntervalSeconds,_that.payload);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String schemaVersion,  String messageId,  String projectId,  String sensorId,  String sensorType,  DateTime timestamp,  DateTime receivedAt,  int samplingIntervalSeconds,  Map<String, dynamic> payload)?  $default,) {final _that = this;
switch (_that) {
case _SensorEnvelope() when $default != null:
return $default(_that.schemaVersion,_that.messageId,_that.projectId,_that.sensorId,_that.sensorType,_that.timestamp,_that.receivedAt,_that.samplingIntervalSeconds,_that.payload);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SensorEnvelope implements SensorEnvelope {
  const _SensorEnvelope({required this.schemaVersion, required this.messageId, required this.projectId, required this.sensorId, required this.sensorType, required this.timestamp, required this.receivedAt, required this.samplingIntervalSeconds, required final  Map<String, dynamic> payload}): _payload = payload;
  factory _SensorEnvelope.fromJson(Map<String, dynamic> json) => _$SensorEnvelopeFromJson(json);

@override final  String schemaVersion;
@override final  String messageId;
@override final  String projectId;
@override final  String sensorId;
@override final  String sensorType;
@override final  DateTime timestamp;
@override final  DateTime receivedAt;
@override final  int samplingIntervalSeconds;
 final  Map<String, dynamic> _payload;
@override Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}


/// Create a copy of SensorEnvelope
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SensorEnvelopeCopyWith<_SensorEnvelope> get copyWith => __$SensorEnvelopeCopyWithImpl<_SensorEnvelope>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SensorEnvelopeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SensorEnvelope&&(identical(other.schemaVersion, schemaVersion) || other.schemaVersion == schemaVersion)&&(identical(other.messageId, messageId) || other.messageId == messageId)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.sensorId, sensorId) || other.sensorId == sensorId)&&(identical(other.sensorType, sensorType) || other.sensorType == sensorType)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt)&&(identical(other.samplingIntervalSeconds, samplingIntervalSeconds) || other.samplingIntervalSeconds == samplingIntervalSeconds)&&const DeepCollectionEquality().equals(other._payload, _payload));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,schemaVersion,messageId,projectId,sensorId,sensorType,timestamp,receivedAt,samplingIntervalSeconds,const DeepCollectionEquality().hash(_payload));

@override
String toString() {
  return 'SensorEnvelope(schemaVersion: $schemaVersion, messageId: $messageId, projectId: $projectId, sensorId: $sensorId, sensorType: $sensorType, timestamp: $timestamp, receivedAt: $receivedAt, samplingIntervalSeconds: $samplingIntervalSeconds, payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$SensorEnvelopeCopyWith<$Res> implements $SensorEnvelopeCopyWith<$Res> {
  factory _$SensorEnvelopeCopyWith(_SensorEnvelope value, $Res Function(_SensorEnvelope) _then) = __$SensorEnvelopeCopyWithImpl;
@override @useResult
$Res call({
 String schemaVersion, String messageId, String projectId, String sensorId, String sensorType, DateTime timestamp, DateTime receivedAt, int samplingIntervalSeconds, Map<String, dynamic> payload
});




}
/// @nodoc
class __$SensorEnvelopeCopyWithImpl<$Res>
    implements _$SensorEnvelopeCopyWith<$Res> {
  __$SensorEnvelopeCopyWithImpl(this._self, this._then);

  final _SensorEnvelope _self;
  final $Res Function(_SensorEnvelope) _then;

/// Create a copy of SensorEnvelope
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? schemaVersion = null,Object? messageId = null,Object? projectId = null,Object? sensorId = null,Object? sensorType = null,Object? timestamp = null,Object? receivedAt = null,Object? samplingIntervalSeconds = null,Object? payload = null,}) {
  return _then(_SensorEnvelope(
schemaVersion: null == schemaVersion ? _self.schemaVersion : schemaVersion // ignore: cast_nullable_to_non_nullable
as String,messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,sensorId: null == sensorId ? _self.sensorId : sensorId // ignore: cast_nullable_to_non_nullable
as String,sensorType: null == sensorType ? _self.sensorType : sensorType // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,receivedAt: null == receivedAt ? _self.receivedAt : receivedAt // ignore: cast_nullable_to_non_nullable
as DateTime,samplingIntervalSeconds: null == samplingIntervalSeconds ? _self.samplingIntervalSeconds : samplingIntervalSeconds // ignore: cast_nullable_to_non_nullable
as int,payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
