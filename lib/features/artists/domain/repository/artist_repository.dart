import 'dart:io';

import '../../../../core/error/failure/failure.dart';
import '../../../../core/utils/either_or.dart';
import '../entities/artist_model.dart';

abstract class ArtistRepository {
  Future<EitherOr<Failure, List<ArtistModel>>> getArtists();

  Future<EitherOr<Failure, void>> createArtist({
    required String name,
    String? bio,
    String? coverUrl,
  });

  Future<EitherOr<Failure, String>> uploadArtistCover({required File file});

  Future<EitherOr<Failure, void>> updateArtist({
    required String id,
    required String name,
    String? bio,
  });

  Future<EitherOr<Failure, void>> deleteArtist(String id);
}
