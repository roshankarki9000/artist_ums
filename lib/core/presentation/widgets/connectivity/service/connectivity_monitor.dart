import 'dart:async';
import 'package:artist_ums/core/presentation/widgets/connectivity/service/internet_service.dart';
import 'package:artist_ums/core/utils/extensions/debouncer_stream_extension.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@lazySingleton
class ConnectionMonitor {
  final Connectivity _connectivity;
  final InternetConnectionChecker _checker;

  late final Stream<InternetStatus> _statusStream;

  ConnectionMonitor(this._connectivity, this._checker) {
    _statusStream = _createStream().asBroadcastStream();
  }

  Stream<InternetStatus> get onStatusChange => _statusStream;

  final Duration debounceDuration = const Duration(milliseconds: 600);
  final Duration lossDelay = const Duration(milliseconds: 600);
  final Duration restoreDelay = const Duration(milliseconds: 600);

  Stream<InternetStatus> _createStream() async* {
    InternetStatus? lastStatus;

    /// initial state
    final initialConnectivity = await _connectivity.checkConnectivity();
    final initialInternet = await _checker.hasConnection;

    lastStatus = InternetStatus(
      hasInternet: initialInternet,
      isWifi: initialConnectivity.contains(ConnectivityResult.wifi),
      isMobile: initialConnectivity.contains(ConnectivityResult.mobile),
    );

    yield lastStatus;

    await for (final results in _connectivity.onConnectivityChanged.debounce(
      debounceDuration,
    )) {
      bool hasInternet;

      if (results.isEmpty ||
          results.every((r) => r == ConnectivityResult.none)) {
        hasInternet = false;
      } else {
        hasInternet = await _checker.hasConnection;
      }

      /// Internet lost
      if (!hasInternet) {
        await Future.delayed(lossDelay);

        final status = const InternetStatus(
          hasInternet: false,
          isWifi: false,
          isMobile: false,
        );

        if (status != lastStatus) {
          lastStatus = status;
          yield status;
        }
      }
      /// Internet restored
      else {
        await Future.delayed(restoreDelay);

        final status = InternetStatus(
          hasInternet: true,
          isWifi: results.contains(ConnectivityResult.wifi),
          isMobile: results.contains(ConnectivityResult.mobile),
        );

        if (status != lastStatus) {
          lastStatus = status;
          yield status;
        }
      }
    }
  }

  /// quick boolean check
  Future<bool> isConnected() async {
    return _checker.hasConnection;
  }

  /// detailed check
  Future<InternetStatus> checkNow() async {
    final connectivity = await _connectivity.checkConnectivity();
    final hasInternet = await _checker.hasConnection;

    return InternetStatus(
      hasInternet: hasInternet,
      isWifi: connectivity.contains(ConnectivityResult.wifi),
      isMobile: connectivity.contains(ConnectivityResult.mobile),
    );
  }
}
