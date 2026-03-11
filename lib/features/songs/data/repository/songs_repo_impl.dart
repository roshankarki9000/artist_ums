import 'package:artist_ums/core/api/api_client.dart';
import 'package:artist_ums/core/error/failure/failure.dart';
import 'package:artist_ums/core/utils/either_or.dart';
import 'package:artist_ums/core/utils/repository_guard.dart';
import 'package:artist_ums/features/songs/domain/entities/song_model.dart';
import 'package:artist_ums/features/songs/domain/repository/songs_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SongRepository)
class SongRepositoryImpl implements SongRepository {
  final ApiClient _apiClient;
  final RepositoryGuard _guard;

  SongRepositoryImpl(this._apiClient, this._guard);

  @override
  Future<EitherOr<Failure, List<SongModel>>> getSongs() {
    return _guard.run(() async {
      final response = await _apiClient.request(
        table: "songs",
        type: RequestType.get,
      );

      return (response as List).map((e) => SongModel.fromJson(e)).toList();
    });
  }

  @override
  Future<EitherOr<Failure, SongModel>> createSong({
    required String artistId,
    required String title,
    String? album,
    String? coverUrl,
  }) {
    return _guard.run(() async {
      final res = await _apiClient.request(
        table: "songs",
        body: {
          "artist_id": artistId,
          "title": title,
          "album": album,
          "cover_url": coverUrl,
        },
        type: RequestType.post,
      );

      return SongModel.fromJson(res);
    });
  }

  @override
  Future<EitherOr<Failure, SongModel>> updateSong({
    required String id,
    required String artistId,
    required String title,
    String? album,
    String? coverUrl,
  }) {
    return _guard.run(() async {
      final res = await _apiClient.request(
        table: "songs",
        query: {"id": id},
        body: {
          "artist_id": artistId,
          "title": title,
          "album": album,
          "cover_url": coverUrl,
        },
        type: RequestType.patch,
      );

      return SongModel.fromJson(res);
    });
  }

  @override
  Future<EitherOr<Failure, bool>> deleteSong(String id) {
    return _guard.run(() async {
      await _apiClient.request(
        table: "songs",
        type: RequestType.delete,
        query: {"id": id},
      );

      return true;
    });
  }
}
