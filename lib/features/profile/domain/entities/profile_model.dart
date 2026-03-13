import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
abstract class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required String id,
    required String name,
    required String email,
    required String role,

    @JsonKey(name: 'cover_url') String? coverUrl,

    @JsonKey(name: 'creator_user_id') required String creatorUserId,

    @JsonKey(name: 'created_at') required DateTime createdAt,

    @JsonKey(name: 'is_active') required bool isActive,

    @JsonKey(name: 'password_reset_done') required bool passwordResetDone,

    @JsonKey(fromJson: _artistsFromJson) @Default([]) List<ArtistModel> artists,

    @JsonKey(fromJson: _songsFromJson) @Default([]) List<SongModel> songs,

    @JsonKey(name: 'artists_created') required int artistsCreated,

    @JsonKey(name: 'songs_created') required int songsCreated,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}

@freezed
abstract class SongModel with _$SongModel {
  const factory SongModel({
    required String id,
    required String title,
    required String album,

    @JsonKey(name: 'cover_url') String? coverUrl,

    @JsonKey(name: 'artist_id') required String artistId,

    @JsonKey(name: 'artist_name') required String artistName,

    @JsonKey(name: 'artist_cover') String? artistCover,

    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _SongModel;

  factory SongModel.fromJson(Map<String, dynamic> json) =>
      _$SongModelFromJson(json);
}

List<ArtistModel> _artistsFromJson(List<dynamic>? json) {
  if (json == null) return [];
  return json
      .map((e) => ArtistModel.fromJson(e as Map<String, dynamic>))
      .toList();
}

List<SongModel> _songsFromJson(List<dynamic>? json) {
  if (json == null) return [];
  return json
      .map((e) => SongModel.fromJson(e as Map<String, dynamic>))
      .toList();
}

@freezed
abstract class ArtistModel with _$ArtistModel {
  const factory ArtistModel({
    required String id,
    required String name,
    String? bio,
    String? createdBy,
    DateTime? createdAt,
    @JsonKey(name: 'songs_written') required int songsWritten,
    @JsonKey(name: "cover_url") String? coverUrl,
  }) = _ArtistModel;

  factory ArtistModel.fromJson(Map<String, dynamic> json) =>
      _$ArtistModelFromJson(json);
}
