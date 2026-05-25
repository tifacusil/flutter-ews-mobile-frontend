// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Subscription _$SubscriptionFromJson(Map<String, dynamic> json) =>
    _Subscription(
      id: (json['id'] as num).toInt(),
      projectId: json['project_id'] as String,
      minAlertLevel: json['min_alert_level'] as String,
      smsEnabled: json['sms_enabled'] as bool,
      pushEnabled: json['push_enabled'] as bool,
      emailEnabled: json['email_enabled'] as bool,
      quietHoursStart: json['quiet_hours_start'] as String?,
      quietHoursEnd: json['quiet_hours_end'] as String?,
    );

Map<String, dynamic> _$SubscriptionToJson(_Subscription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_id': instance.projectId,
      'min_alert_level': instance.minAlertLevel,
      'sms_enabled': instance.smsEnabled,
      'push_enabled': instance.pushEnabled,
      'email_enabled': instance.emailEnabled,
      'quiet_hours_start': instance.quietHoursStart,
      'quiet_hours_end': instance.quietHoursEnd,
    };

_CreateSubscriptionRequest _$CreateSubscriptionRequestFromJson(
  Map<String, dynamic> json,
) => _CreateSubscriptionRequest(
  projectId: json['project_id'] as String,
  minAlertLevel: json['min_alert_level'] as String,
  smsEnabled: json['sms_enabled'] as bool,
  pushEnabled: json['push_enabled'] as bool,
  emailEnabled: json['email_enabled'] as bool,
  quietHoursStart: json['quiet_hours_start'] as String?,
  quietHoursEnd: json['quiet_hours_end'] as String?,
);

Map<String, dynamic> _$CreateSubscriptionRequestToJson(
  _CreateSubscriptionRequest instance,
) => <String, dynamic>{
  'project_id': instance.projectId,
  'min_alert_level': instance.minAlertLevel,
  'sms_enabled': instance.smsEnabled,
  'push_enabled': instance.pushEnabled,
  'email_enabled': instance.emailEnabled,
  'quiet_hours_start': ?instance.quietHoursStart,
  'quiet_hours_end': ?instance.quietHoursEnd,
};
