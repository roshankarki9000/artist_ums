import 'package:freezed_annotation/freezed_annotation.dart';

part 'song_model.freezed.dart';
part 'song_model.g.dart';

@freezed
abstract class SongModel with _$SongModel {
  const factory SongModel({
    required String id,

    @JsonKey(name: "artist_id") required String artistId,

    required String title,

    String? album,

    @JsonKey(name: "cover_url") String? coverUrl,

    @JsonKey(name: "created_at") DateTime? createdAt,
  }) = _SongModel;

  factory SongModel.fromJson(Map<String, dynamic> json) =>
      _$SongModelFromJson(json);
}
