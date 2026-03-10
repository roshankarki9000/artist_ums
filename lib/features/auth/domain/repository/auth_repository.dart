import 'package:artist_ums/core/error/failure/failure.dart';
import 'package:artist_ums/core/utils/either_or.dart';

abstract class AuthRepository {
  Future<EitherOr<Failure, void>> login({
    required String email,
    required String password,
  });

  Future<EitherOr<Failure, void>> register({
    required String name,
    required String email,
    required String password,
  });

  Future<EitherOr<Failure, void>> loginWithGoogle();

  Future<EitherOr<Failure, void>> logout();

  Future<EitherOr<Failure, void>> resetPassword({required String password});

  Future<EitherOr<Failure, bool>> hasSession();
}
