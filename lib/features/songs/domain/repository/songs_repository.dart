import 'dart:io';

import 'package:artist_ums/core/error/failure/failure.dart';
import 'package:artist_ums/core/utils/either_or.dart';
import 'package:artist_ums/features/songs/domain/entities/song_model.dart';

abstract class SongRepository {
  Future<EitherOr<Failure, List<SongModel>>> getSongs();
  Future<EitherOr<Failure, List<SongModel>>> getSongsByArtist(String artistId);
  Future<EitherOr<Failure, void>> createSong({
    required String artistId,
    required String title,
    String? album,
    String? coverUrl,
  });

  Future<EitherOr<Failure, String>> uploadSongCover({required File file});

  Future<EitherOr<Failure, void>> updateSong({
    required String id,
    required String artistId,
    required String title,
    String? album,
    String? coverUrl,
  });

  Future<EitherOr<Failure, void>> deleteSong(String id);
}
