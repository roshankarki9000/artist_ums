import 'dart:async';
import 'package:artist_ums/core/utils/connectivity_service.dart';
import 'package:injectable/injectable.dart';

typedef RetryAction = Future<void> Function();

@lazySingleton
class RetryManager {
  final ConnectivityService connectivityService;

  RetryManager(this.connectivityService) {
    _listenToConnectivity();
  }

  final List<RetryAction> _queue = [];

  void add(RetryAction action) {
    _queue.add(action);
  }

  void _listenToConnectivity() {
    connectivityService.connectionStream.listen((connected) {
      if (connected) {
        retryAll();
      }
    });
  }

  Future<void> retryAll() async {
    if (_queue.isEmpty) return;

    final actions = List<RetryAction>.from(_queue);
    _queue.clear();

    for (final action in actions) {
      try {
        await action();
      } catch (_) {
        // retry failed again -> keep it
        _queue.add(action);
      }
    }
  }
}
