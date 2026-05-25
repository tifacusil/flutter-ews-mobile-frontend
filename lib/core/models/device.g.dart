// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceRegisterRequest _$DeviceRegisterRequestFromJson(
  Map<String, dynamic> json,
) => _DeviceRegisterRequest(
  deviceToken: json['device_token'] as String,
  platform: json['platform'] as String,
  appVersion: json['app_version'] as String?,
);

Map<String, dynamic> _$DeviceRegisterRequestToJson(
  _DeviceRegisterRequest instance,
) => <String, dynamic>{
  'device_token': instance.deviceToken,
  'platform': instance.platform,
  'app_version': ?instance.appVersion,
};

_DeviceRegisterResponse _$DeviceRegisterResponseFromJson(
  Map<String, dynamic> json,
) => _DeviceRegisterResponse(deviceId: (json['device_id'] as num).toInt());

Map<String, dynamic> _$DeviceRegisterResponseToJson(
  _DeviceRegisterResponse instance,
) => <String, dynamic>{'device_id': instance.deviceId};
