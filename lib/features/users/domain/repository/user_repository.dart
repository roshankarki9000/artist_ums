import 'package:artist_ums/core/error/failure/failure.dart';
import 'package:artist_ums/core/utils/either_or.dart';
import 'package:artist_ums/features/users/domain/entities/user_model.dart';

abstract class UserRepository {
  Future<EitherOr<Failure, List<UserModel>>> getUsers();

  Future<EitherOr<Failure, UserModel>> getCurrentUser();

  Future<EitherOr<Failure, UserModel>> getUser({required String id});

  Future<EitherOr<Failure, void>> createUser({
    required String name,
    required String email,
  });

  Future<EitherOr<Failure, void>> updateUser({
    required String id,
    required String name,
  });

  Future<EitherOr<Failure, void>> deleteUser(String id);

  /// mark password reset completed
  Future<EitherOr<Failure, void>> markPasswordResetDone();

  /// check if password reset is required
  Future<EitherOr<Failure, bool>> needsPasswordReset();
}
