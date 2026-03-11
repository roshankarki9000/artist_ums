import 'package:artist_ums/core/api/api_client.dart';
import 'package:artist_ums/core/error/failure/failure.dart';
import 'package:artist_ums/core/utils/either_or.dart';
import 'package:artist_ums/core/utils/repository_guard.dart';
import 'package:artist_ums/features/artists/domain/entities/artist_model.dart';
import 'package:artist_ums/features/artists/domain/repository/artist_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ArtistRepository)
class ArtistRepositoryImpl implements ArtistRepository {
  final ApiClient _apiClient;
  final RepositoryGuard _guard;
  ArtistRepositoryImpl(this._apiClient, this._guard);

  @override
  Future<EitherOr<Failure, List<ArtistModel>>> getArtists() {
    return _guard.run(() async {
      final response = await _apiClient.request(
        table: "artists",
        type: RequestType.get,
      );
      return (response as List).map((e) => ArtistModel.fromJson(e)).toList();
    });
  }

  @override
  Future<EitherOr<Failure, ArtistModel>> createArtist({
    required String name,
    String? bio,
  }) {
    return _guard.run(() async {
      final res = await _apiClient.request(
        table: "artists",
        body: {"name": name, "bio": bio},
        type: RequestType.post,
      );

      return ArtistModel.fromJson(res);
    });
  }

  @override
  Future<EitherOr<Failure, ArtistModel>> updateArtist({
    required String id,
    required String name,
    String? bio,
  }) {
    return _guard.run(() async {
      final res = await _apiClient.request(
        table: "artists",
        query: {'id': id},
        body: {"name": name, "bio": bio},
        type: RequestType.patch,
      );

      return ArtistModel.fromJson(res);
    });
  }

  @override
  Future<EitherOr<Failure, bool>> deleteArtist(String id) {
    return _guard.run(() async {
      await _apiClient.request(
        table: "artists",
        type: RequestType.delete,
        query: {'id': id},
      );

      return true;
    });
  }
}
