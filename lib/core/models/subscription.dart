import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription.freezed.dart';
part 'subscription.g.dart';

/// A subscription record returned by the server.
@freezed
abstract class Subscription with _$Subscription {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Subscription({
    required int id,
    required String projectId,
    required String minAlertLevel,
    required bool smsEnabled,
    required bool pushEnabled,
    required bool emailEnabled,
    String? quietHoursStart,
    String? quietHoursEnd,
  }) = _Subscription;

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);
}

/// Request body for POST /api/v1/users/{user_id}/subscriptions.
@freezed
abstract class CreateSubscriptionRequest with _$CreateSubscriptionRequest {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory CreateSubscriptionRequest({
    required String projectId,
    required String minAlertLevel,
    required bool smsEnabled,
    required bool pushEnabled,
    required bool emailEnabled,
    String? quietHoursStart,
    String? quietHoursEnd,
  }) = _CreateSubscriptionRequest;

  factory CreateSubscriptionRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateSubscriptionRequestFromJson(json);
}
