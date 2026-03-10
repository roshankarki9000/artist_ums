// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  name: json['name'] as String,
  email: json['email'] as String,
  role: json['role'] as String,
  creatorUserId: json['creator_user_id'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  isActive: json['is_active'] as bool,
  passwordResetDone: json['password_reset_done'] as bool,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
      'creator_user_id': instance.creatorUserId,
      'created_at': instance.createdAt.toIso8601String(),
      'is_active': instance.isActive,
      'password_reset_done': instance.passwordResetDone,
    };
