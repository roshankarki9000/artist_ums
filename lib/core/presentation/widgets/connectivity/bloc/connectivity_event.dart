import 'package:freezed_annotation/freezed_annotation.dart';

part 'connectivity_event.freezed.dart';

@freezed
class ConnectivityEvent with _$ConnectivityEvent {
  const factory ConnectivityEvent.started() = _Started;

  const factory ConnectivityEvent.checkRequested() = _CheckRequested;

  const factory ConnectivityEvent.connectionChanged(bool isConnected) =
      _ConnectionChanged;

  const factory ConnectivityEvent.showDisconnected() = _ShowDisconnected;

  const factory ConnectivityEvent.retryPressed() = _RetryPressed;

  const factory ConnectivityEvent.failureReceived(String message) =
      _FailureReceived;
}
