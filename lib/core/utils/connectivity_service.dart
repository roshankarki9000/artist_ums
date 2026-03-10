import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@lazySingleton
class ConnectivityService {
  final InternetConnectionChecker checker;

  ConnectivityService(this.checker);

  bool _lastStatus = true;

  Future<bool> get isConnected async {
    _lastStatus = await checker.hasConnection;
    return _lastStatus;
  }

  bool get lastKnownStatus => _lastStatus;

  Stream<bool> get connectionStream => checker.onStatusChange.map(
    (status) => status == InternetConnectionStatus.connected,
  );
}
