import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// Full user profile returned by GET /api/v1/users/{user_id}.
@freezed
abstract class UserProfile with _$UserProfile {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserProfile({
    required int userId,
    required String username,
    required String email,
    String? phoneE164,
    required String role,
    required String status,
    required DateTime createdAt,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

/// Payload for PUT /api/v1/users/{user_id} (email and/or phone only).
@freezed
abstract class UpdateUserRequest with _$UpdateUserRequest {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
  const factory UpdateUserRequest({
    String? email,
    String? phoneE164,
  }) = _UpdateUserRequest;

  factory UpdateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserRequestFromJson(json);
}
