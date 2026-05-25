// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  userId: (json['user_id'] as num).toInt(),
  username: json['username'] as String,
  email: json['email'] as String,
  phoneE164: json['phone_e164'] as String?,
  role: json['role'] as String,
  status: json['status'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'username': instance.username,
      'email': instance.email,
      'phone_e164': instance.phoneE164,
      'role': instance.role,
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
    };

_UpdateUserRequest _$UpdateUserRequestFromJson(Map<String, dynamic> json) =>
    _UpdateUserRequest(
      email: json['email'] as String?,
      phoneE164: json['phone_e164'] as String?,
    );

Map<String, dynamic> _$UpdateUserRequestToJson(_UpdateUserRequest instance) =>
    <String, dynamic>{
      'email': ?instance.email,
      'phone_e164': ?instance.phoneE164,
    };
