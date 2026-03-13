import 'dart:io';

import 'package:artist_ums/core/api/api_client.dart';
import 'package:artist_ums/core/api/auth_client.dart';
import 'package:artist_ums/core/error/failure/failure.dart';
import 'package:artist_ums/core/utils/either_or.dart';
import 'package:artist_ums/core/utils/repository_guard.dart';
import 'package:artist_ums/features/profile/domain/entities/profile_model.dart';
import 'package:artist_ums/features/profile/domain/repository/profile_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepoImpl implements ProfileRepository {
  final ApiClient apiClient;

  final RepositoryGuard guard;
  final AuthClient authClient;

  ProfileRepoImpl(this.apiClient, this.guard, this.authClient);

  @override
  Future<EitherOr<Failure, ProfileModel>> getProfile() {
    return guard.run(() async {
      final userId = authClient.currentUser!.id;

      final response = await apiClient.request(
        table: 'user_full_details',
        type: RequestType.get,
        query: {'id': userId},
      );
      return (response as List)
          .map((e) => ProfileModel.fromJson(e))
          .toList()
          .first;
    });
  }

  @override
  Future<EitherOr<Failure, void>> deleteUser(String id) {
    return guard.run(() async {
      await apiClient.request(
        table: 'users',
        type: RequestType.delete,
        query: {'id': id},
      );
    });
  }

  @override
  Future<EitherOr<Failure, void>> updateUser({
    required String id,
    required String name,
    String? coverUrl,
  }) {
    return guard.run(() async {
      await apiClient.request(
        table: 'users',
        type: RequestType.patch,
        query: {'id': id},
        body: {'name': name, 'cover_url': ?coverUrl},
      );
    });
  }

  @override
  Future<EitherOr<Failure, String>> uploadProfileCover({required File file}) {
    return guard.run(() async {
      return await apiClient.uploadImageAndGetUrl(
        bucket: "users-cover",
        file: file,
        folder: "covers",
      );
    });
  }
}
