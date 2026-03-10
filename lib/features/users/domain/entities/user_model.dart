import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String name,
    required String email,
    required String role,

    @JsonKey(name: 'creator_user_id') required String creatorUserId,

    @JsonKey(name: 'created_at') required DateTime createdAt,

    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'password_reset_done') required bool passwordResetDone,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
