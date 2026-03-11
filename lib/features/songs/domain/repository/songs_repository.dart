import 'package:artist_ums/core/error/failure/failure.dart';
import 'package:artist_ums/core/utils/either_or.dart';
import 'package:artist_ums/features/songs/domain/entities/song_model.dart';

abstract class SongRepository {
  Future<EitherOr<Failure, List<SongModel>>> getSongs();

  Future<EitherOr<Failure, SongModel>> createSong({
    required String artistId,
    required String title,
    String? album,
    String? coverUrl,
  });

  Future<EitherOr<Failure, SongModel>> updateSong({
    required String id,
    required String artistId,
    required String title,
    String? album,
    String? coverUrl,
  });

  Future<EitherOr<Failure, bool>> deleteSong(String id);
}
