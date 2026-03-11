import '../../../../core/error/failure/failure.dart';
import '../../../../core/utils/either_or.dart';
import '../entities/artist_model.dart';

abstract class ArtistRepository {
  Future<EitherOr<Failure, List<ArtistModel>>> getArtists();

  Future<EitherOr<Failure, ArtistModel>> createArtist({
    required String name,
    String? bio,
  });

  Future<EitherOr<Failure, ArtistModel>> updateArtist({
    required String id,
    required String name,
    String? bio,
  });

  Future<EitherOr<Failure, bool>> deleteArtist(String id);
}
