import 'package:artist_ums/core/api/auth_client.dart';
import 'package:artist_ums/core/error/failure/failure.dart';
import 'package:artist_ums/core/utils/either_or.dart';
import 'package:artist_ums/core/utils/repository_guard.dart';
import 'package:artist_ums/features/auth/domain/repository/auth_repository.dart';
import 'package:artist_ums/features/users/domain/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthClient authClient;
  final RepositoryGuard guard;
  final UserRepository userRepository;
  AuthRepositoryImpl(this.authClient, this.guard, this.userRepository);

  @override
  Future<EitherOr<Failure, void>> login({
    required String email,
    required String password,
  }) async {
    return guard.run(() async {
      await authClient.login(email: email, password: password);
    });
  }

  @override
  Future<EitherOr<Failure, void>> register({
    required String name,
    required String email,
    required String password,
  }) {
    return guard.run(() async {
      await authClient.register(
        email: email,
        password: password,
        data: {"name": name},
      );
    });
  }

  @override
  Future<EitherOr<Failure, void>> loginWithGoogle() {
    return guard.run(() async {
      await authClient.loginWithGoogle();
    });
  }

  @override
  Future<EitherOr<Failure, void>> logout() {
    return guard.run(() async {
      await authClient.logout();
    });
  }

  @override
  Future<EitherOr<Failure, void>> resetPassword({required String password}) {
    return guard.run(() async {
      await authClient.updatePassword(password: password);
      await userRepository.markPasswordResetDone();
    });
  }

  @override
  Future<EitherOr<Failure, bool>> hasSession() {
    return guard.run(() async {
      return authClient.hasSession();
    });
  }
}
