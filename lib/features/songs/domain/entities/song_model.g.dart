// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SongModel _$SongModelFromJson(Map<String, dynamic> json) => _SongModel(
  id: json['id'] as String,
  artistId: json['artist_id'] as String,
  title: json['title'] as String,
  album: json['album'] as String?,
  coverUrl: json['cover_url'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$SongModelToJson(_SongModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'artist_id': instance.artistId,
      'title': instance.title,
      'album': instance.album,
      'cover_url': instance.coverUrl,
      'created_at': instance.createdAt?.toIso8601String(),
    };
