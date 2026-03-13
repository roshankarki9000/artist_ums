// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) =>
    _ProfileModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      coverUrl: json['cover_url'] as String?,
      creatorUserId: json['creator_user_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      isActive: json['is_active'] as bool,
      passwordResetDone: json['password_reset_done'] as bool,
      artists: json['artists'] == null
          ? const []
          : _artistsFromJson(json['artists'] as List?),
      songs: json['songs'] == null
          ? const []
          : _songsFromJson(json['songs'] as List?),
      artistsCreated: (json['artists_created'] as num).toInt(),
      songsCreated: (json['songs_created'] as num).toInt(),
    );

Map<String, dynamic> _$ProfileModelToJson(_ProfileModel instance) =>
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
      'artists': instance.artists,
      'songs': instance.songs,
      'artists_created': instance.artistsCreated,
      'songs_created': instance.songsCreated,
    };

_SongModel _$SongModelFromJson(Map<String, dynamic> json) => _SongModel(
  id: json['id'] as String,
  title: json['title'] as String,
  album: json['album'] as String,
  coverUrl: json['cover_url'] as String?,
  artistId: json['artist_id'] as String,
  artistName: json['artist_name'] as String,
  artistCover: json['artist_cover'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$SongModelToJson(_SongModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'album': instance.album,
      'cover_url': instance.coverUrl,
      'artist_id': instance.artistId,
      'artist_name': instance.artistName,
      'artist_cover': instance.artistCover,
      'created_at': instance.createdAt.toIso8601String(),
    };

_ArtistModel _$ArtistModelFromJson(Map<String, dynamic> json) => _ArtistModel(
  id: json['id'] as String,
  name: json['name'] as String,
  bio: json['bio'] as String?,
  createdBy: json['createdBy'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  songsWritten: (json['songs_written'] as num).toInt(),
  coverUrl: json['cover_url'] as String?,
);

Map<String, dynamic> _$ArtistModelToJson(_ArtistModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'bio': instance.bio,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'songs_written': instance.songsWritten,
      'cover_url': instance.coverUrl,
    };
