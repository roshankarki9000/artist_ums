import 'dart:io';

import 'package:artist_ums/core/error/failure/failure.dart';
import 'package:artist_ums/core/utils/either_or.dart';
import 'package:artist_ums/features/profile/domain/entities/profile_model.dart';

abstract class ProfileRepository {
  Future<EitherOr<Failure, ProfileModel>> getProfile();

  Future<EitherOr<Failure, void>> updateUser({
    required String id,
    required String name,
    String? coverUrl,
  });

  Future<EitherOr<Failure, void>> deleteUser(String id);
  Future<EitherOr<Failure, String>> uploadProfileCover({required File file});
}
