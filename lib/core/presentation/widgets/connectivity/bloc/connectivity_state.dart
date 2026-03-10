import 'package:freezed_annotation/freezed_annotation.dart';

part 'connectivity_state.freezed.dart';

@freezed
class ConnectivityState with _$ConnectivityState {
  const factory ConnectivityState.initial() = _Initial;

  const factory ConnectivityState.loading() = _Loading;

  const factory ConnectivityState.connected() = _Connected;

  const factory ConnectivityState.disconnected() = _Disconnected;

  const factory ConnectivityState.failure(String message) = _Failure;
}
