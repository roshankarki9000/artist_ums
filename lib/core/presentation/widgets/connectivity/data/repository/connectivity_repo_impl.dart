import 'package:artist_ums/core/error/failure/failure.dart';
import 'package:artist_ums/core/presentation/widgets/connectivity/domain/repository/connectivity_repo.dart';
import 'package:artist_ums/core/presentation/widgets/connectivity/service/connectivity_monitor.dart';
import 'package:artist_ums/core/utils/either_or.dart';
import 'package:artist_ums/core/utils/extensions/either_or_extension.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ConnectivityRepository)
class ConnectivityRepositoryImpl implements ConnectivityRepository {
  final ConnectionMonitor connectionMonitor;

  late final Stream<EitherOr<Failure, bool>> _stream;

  ConnectivityRepositoryImpl(this.connectionMonitor) {
    _stream = connectionMonitor.onStatusChange
        .map<EitherOr<Failure, bool>>(
          (status) => EitherOr<Failure, bool>.right(status.hasInternet),
        )
        .distinct((a, b) => a.rightOrNull == b.rightOrNull)
        .asBroadcastStream();
  }

  @override
  Future<EitherOr<Failure, bool>> isConnected() async {
    try {
      final status = await connectionMonitor.checkNow();
      return EitherOr.right(status.hasInternet);
    } catch (e) {
      return EitherOr.left(NetworkFailure());
    }
  }

  @override
  Stream<EitherOr<Failure, bool>> get connectionStream => _stream;
}
