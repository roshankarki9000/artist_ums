import 'package:artist_ums/core/api/api_client.dart';
import 'package:artist_ums/core/api/auth_client.dart';
import 'package:artist_ums/core/error/failure/failure.dart';
import 'package:artist_ums/core/utils/either_or.dart';
import 'package:artist_ums/core/utils/repository_guard.dart';
import 'package:artist_ums/features/users/domain/entities/user_model.dart';
import 'package:artist_ums/features/users/domain/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final ApiClient apiClient;

  final RepositoryGuard guard;
  final AuthClient authClient;

  UserRepositoryImpl(this.apiClient, this.guard, this.authClient);

  @override
  Future<EitherOr<Failure, List<UserModel>>> getUsers() {
    return guard.run(() async {
      final response = await apiClient.request(
        table: 'users',
        type: RequestType.get,
      );

      return (response as List).map((e) => UserModel.fromJson(e)).toList();
    });
  }

  @override
  Future<EitherOr<Failure, UserModel>> getCurrentUser() {
    return guard.run(() async {
      final userId = authClient.currentUser!.id;

      final response = await apiClient.request(
        table: 'users',
        type: RequestType.get,
        query: {'id': userId},
      );
      return (response as List)
          .map((e) => UserModel.fromJson(e))
          .toList()
          .first;
    });
  }

  @override
  Future<EitherOr<Failure, void>> createUser({
    required String name,
    required String email,
  }) {
    return guard.run(() async {
      final userId = authClient.currentUser!.id;
      final currentSession = authClient.session?.refreshToken;
      await authClient.register(
        email: email,
        password: 'Test@123',
        data: {"name": name, "creator_user_id": userId},
      );
      if (currentSession != null) await authClient.setSession(currentSession);
    });
  }

  @override
  Future<EitherOr<Failure, void>> updateUser({
    required String id,
    required String name,
  }) {
    return guard.run(() async {
      await apiClient.request(
        table: 'users',
        type: RequestType.patch,
        query: {'id': id},
        body: {'name': name},
      );
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

  /// mark password reset complete
  @override
  Future<EitherOr<Failure, void>> markPasswordResetDone() {
    return guard.run(() async {
      final userId = authClient.currentUser!.id;

      await apiClient.request(
        table: 'users',
        type: RequestType.patch,
        query: {'id': userId},
        body: {'password_reset_done': true},
      );
    });
  }

  /// check if user needs password reset
  @override
  Future<EitherOr<Failure, bool>> needsPasswordReset() {
    return guard.run(() async {
      final userId = authClient.currentUser!.id;

      final response = await apiClient.request(
        table: 'users',
        type: RequestType.get,
        query: {'id': userId},
      );

      var response_ = ((response ?? []) as List)
          .map((e) => UserModel.fromJson(e))
          .toList();
      if (response_.isEmpty) {
        throw Exception("User not found");
      }

      final resetDone = response_.first.passwordResetDone;

      return !resetDone;
    });
  }
}
