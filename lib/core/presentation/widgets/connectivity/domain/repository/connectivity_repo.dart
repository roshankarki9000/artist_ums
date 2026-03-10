import 'package:artist_ums/core/error/failure/failure.dart';
import 'package:artist_ums/core/utils/either_or.dart';

abstract class ConnectivityRepository {
  Future<EitherOr<Failure, bool>> isConnected();
  Stream<EitherOr<Failure, bool>> get connectionStream;
}
