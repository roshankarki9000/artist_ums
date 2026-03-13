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
  coverUrl: json['cover_url'] as String?,
  creatorUserId: json['creator_user_id'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  isActive: json['is_active'] as bool,
  passwordResetDone: json['password_reset_done'] as bool,
  artistsCreated: (json['artists_created'] as num?)?.toInt() ?? 0,
  songsCreated: (json['songs_created'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
      'cover_url': instance.coverUrl,
      'creator_user_id': instance.creatorUserId,
      'created_at': instance.createdAt.toIso8601String(),
      'is_active': instance.isActive,
      'password_reset_done': instance.passwordResetDone,
      'artists_created': instance.artistsCreated,
      'songs_created': instance.songsCreated,
    };
