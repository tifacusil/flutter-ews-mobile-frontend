// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor_envelope.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SensorEnvelope _$SensorEnvelopeFromJson(Map<String, dynamic> json) {
  return _SensorEnvelope.fromJson(json);
}

/// @nodoc
mixin _$SensorEnvelope {
  String get schemaVersion => throw _privateConstructorUsedError;
  String get messageId => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get sensorId => throw _privateConstructorUsedError;
  String get sensorType => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  DateTime get receivedAt => throw _privateConstructorUsedError;
  int get samplingIntervalSeconds => throw _privateConstructorUsedError;
  Map<String, dynamic> get payload => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SensorEnvelopeCopyWith<SensorEnvelope> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SensorEnvelopeCopyWith<$Res> {
  factory $SensorEnvelopeCopyWith(
          SensorEnvelope value, $Res Function(SensorEnvelope) then) =
      _$SensorEnvelopeCopyWithImpl<$Res, SensorEnvelope>;
  @useResult
  $Res call(
      {String schemaVersion,
      String messageId,
      String projectId,
      String sensorId,
      String sensorType,
      DateTime timestamp,
      DateTime receivedAt,
      int samplingIntervalSeconds,
      Map<String, dynamic> payload});
}

/// @nodoc
class _$SensorEnvelopeCopyWithImpl<$Res, $Val extends SensorEnvelope>
    implements $SensorEnvelopeCopyWith<$Res> {
  _$SensorEnvelopeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schemaVersion = null,
    Object? messageId = null,
    Object? projectId = null,
    Object? sensorId = null,
    Object? sensorType = null,
    Object? timestamp = null,
    Object? receivedAt = null,
    Object? samplingIntervalSeconds = null,
    Object? payload = null,
  }) {
    return _then(_value.copyWith(
      schemaVersion: null == schemaVersion
          ? _value.schemaVersion
          : schemaVersion // ignore: cast_nullable_to_non_nullable
              as String,
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      sensorId: null == sensorId
          ? _value.sensorId
          : sensorId // ignore: cast_nullable_to_non_nullable
              as String,
      sensorType: null == sensorType
          ? _value.sensorType
          : sensorType // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      receivedAt: null == receivedAt
          ? _value.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      samplingIntervalSeconds: null == samplingIntervalSeconds
          ? _value.samplingIntervalSeconds
          : samplingIntervalSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SensorEnvelopeImplCopyWith<$Res>
    implements $SensorEnvelopeCopyWith<$Res> {
  factory _$$SensorEnvelopeImplCopyWith(_$SensorEnvelopeImpl value,
          $Res Function(_$SensorEnvelopeImpl) then) =
      __$$SensorEnvelopeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String schemaVersion,
      String messageId,
      String projectId,
      String sensorId,
      String sensorType,
      DateTime timestamp,
      DateTime receivedAt,
      int samplingIntervalSeconds,
      Map<String, dynamic> payload});
}

/// @nodoc
class __$$SensorEnvelopeImplCopyWithImpl<$Res>
    extends _$SensorEnvelopeCopyWithImpl<$Res, _$SensorEnvelopeImpl>
    implements _$$SensorEnvelopeImplCopyWith<$Res> {
  __$$SensorEnvelopeImplCopyWithImpl(
      _$SensorEnvelopeImpl _value, $Res Function(_$SensorEnvelopeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schemaVersion = null,
    Object? messageId = null,
    Object? projectId = null,
    Object? sensorId = null,
    Object? sensorType = null,
    Object? timestamp = null,
    Object? receivedAt = null,
    Object? samplingIntervalSeconds = null,
    Object? payload = null,
  }) {
    return _then(_$SensorEnvelopeImpl(
      schemaVersion: null == schemaVersion
          ? _value.schemaVersion
          : schemaVersion // ignore: cast_nullable_to_non_nullable
              as String,
      messageId: null == messageId
          ? _value.messageId
          : messageId // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      sensorId: null == sensorId
          ? _value.sensorId
          : sensorId // ignore: cast_nullable_to_non_nullable
              as String,
      sensorType: null == sensorType
          ? _value.sensorType
          : sensorType // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      receivedAt: null == receivedAt
          ? _value.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      samplingIntervalSeconds: null == samplingIntervalSeconds
          ? _value.samplingIntervalSeconds
          : samplingIntervalSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      payload: null == payload
          ? _value._payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SensorEnvelopeImpl implements _SensorEnvelope {
  const _$SensorEnvelopeImpl(
      {required this.schemaVersion,
      required this.messageId,
      required this.projectId,
      required this.sensorId,
      required this.sensorType,
      required this.timestamp,
      required this.receivedAt,
      required this.samplingIntervalSeconds,
      required final Map<String, dynamic> payload})
      : _payload = payload;

  factory _$SensorEnvelopeImpl.fromJson(Map<String, dynamic> json) =>
      _$$SensorEnvelopeImplFromJson(json);

  @override
  final String schemaVersion;
  @override
  final String messageId;
  @override
  final String projectId;
  @override
  final String sensorId;
  @override
  final String sensorType;
  @override
  final DateTime timestamp;
  @override
  final DateTime receivedAt;
  @override
  final int samplingIntervalSeconds;
  final Map<String, dynamic> _payload;
  @override
  Map<String, dynamic> get payload {
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_payload);
  }

  @override
  String toString() {
    return 'SensorEnvelope(schemaVersion: $schemaVersion, messageId: $messageId, projectId: $projectId, sensorId: $sensorId, sensorType: $sensorType, timestamp: $timestamp, receivedAt: $receivedAt, samplingIntervalSeconds: $samplingIntervalSeconds, payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SensorEnvelopeImpl &&
            (identical(other.schemaVersion, schemaVersion) ||
                other.schemaVersion == schemaVersion) &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.sensorId, sensorId) ||
                other.sensorId == sensorId) &&
            (identical(other.sensorType, sensorType) ||
                other.sensorType == sensorType) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(
                    other.samplingIntervalSeconds, samplingIntervalSeconds) ||
                other.samplingIntervalSeconds == samplingIntervalSeconds) &&
            const DeepCollectionEquality().equals(other._payload, _payload));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      schemaVersion,
      messageId,
      projectId,
      sensorId,
      sensorType,
      timestamp,
      receivedAt,
      samplingIntervalSeconds,
      const DeepCollectionEquality().hash(_payload));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SensorEnvelopeImplCopyWith<_$SensorEnvelopeImpl> get copyWith =>
      __$$SensorEnvelopeImplCopyWithImpl<_$SensorEnvelopeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SensorEnvelopeImplToJson(
      this,
    );
  }
}

abstract class _SensorEnvelope implements SensorEnvelope {
  const factory _SensorEnvelope(
      {required final String schemaVersion,
      required final String messageId,
      required final String projectId,
      required final String sensorId,
      required final String sensorType,
      required final DateTime timestamp,
      required final DateTime receivedAt,
      required final int samplingIntervalSeconds,
      required final Map<String, dynamic> payload}) = _$SensorEnvelopeImpl;

  factory _SensorEnvelope.fromJson(Map<String, dynamic> json) =
      _$SensorEnvelopeImpl.fromJson;

  @override
  String get schemaVersion;
  @override
  String get messageId;
  @override
  String get projectId;
  @override
  String get sensorId;
  @override
  String get sensorType;
  @override
  DateTime get timestamp;
  @override
  DateTime get receivedAt;
  @override
  int get samplingIntervalSeconds;
  @override
  Map<String, dynamic> get payload;
  @override
  @JsonKey(ignore: true)
  _$$SensorEnvelopeImplCopyWith<_$SensorEnvelopeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
