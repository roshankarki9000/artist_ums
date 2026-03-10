import 'dart:async';

import 'package:artist_ums/core/error/failure/failure.dart';
import 'package:artist_ums/core/presentation/widgets/connectivity/domain/repository/connectivity_repo.dart';
import 'package:artist_ums/core/utils/either_or.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'connectivity_event.dart';
import 'connectivity_state.dart';

@injectable
class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final ConnectivityRepository _repository;

  StreamSubscription<EitherOr<Failure, bool>>? _subscription;

  bool? _lastStatus;
  Timer? _offlineDelayTimer;

  ConnectivityBloc(this._repository)
    : super(const ConnectivityState.initial()) {
    on<ConnectivityEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ConnectivityEvent event,
    Emitter<ConnectivityState> emit,
  ) async {
    await event.map(
      started: (_) async {
        final result = await _repository.isConnected();

        result.fold(
          (failure) => emit(ConnectivityState.failure(failure.message)),
          (connected) {
            _lastStatus = connected;

            emit(
              connected
                  ? const ConnectivityState.connected()
                  : const ConnectivityState.disconnected(),
            );
          },
        );

        _subscription ??= _repository.connectionStream.listen((either) {
          either.fold(
            (failure) =>
                add(ConnectivityEvent.failureReceived(failure.message)),
            (status) => add(ConnectivityEvent.connectionChanged(status)),
          );
        });
      },

      checkRequested: (_) async {
        final result = await _repository.isConnected();

        result.fold(
          (failure) => add(ConnectivityEvent.failureReceived(failure.message)),
          (status) => add(ConnectivityEvent.connectionChanged(status)),
        );
      },

      connectionChanged: (e) async {
        /// DISTINCT behavior
        if (_lastStatus == e.isConnected) return;

        _lastStatus = e.isConnected;

        /// CANCEL pending timers
        _offlineDelayTimer?.cancel();

        if (!e.isConnected) {
          /// SMART DELAY
          _offlineDelayTimer = Timer(const Duration(milliseconds: 600), () {
            add(const ConnectivityEvent.showDisconnected());
          });
        } else {
          emit(const ConnectivityState.connected());
        }
      },

      showDisconnected: (_) async {
        emit(const ConnectivityState.disconnected());
      },

      retryPressed: (_) async {
        final result = await _repository.isConnected();

        result.fold(
          (failure) => add(ConnectivityEvent.failureReceived(failure.message)),
          (status) => add(ConnectivityEvent.connectionChanged(status)),
        );
      },

      failureReceived: (e) async {
        emit(ConnectivityState.failure(e.message));
      },
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    _offlineDelayTimer?.cancel();
    return super.close();
  }
}
