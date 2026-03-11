// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ArtistModel _$ArtistModelFromJson(Map<String, dynamic> json) => _ArtistModel(
  id: json['id'] as String,
  name: json['name'] as String,
  bio: json['bio'] as String?,
  createdBy: json['createdBy'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$ArtistModelToJson(_ArtistModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'bio': instance.bio,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
