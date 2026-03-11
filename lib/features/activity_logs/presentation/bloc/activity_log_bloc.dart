import 'dart:async';
import 'package:artist_ums/features/activity_logs/domain/entities/activity_log_model.dart';
import 'package:artist_ums/features/activity_logs/domain/repository/activity_log_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'activity_log_event.dart';
import 'activity_log_state.dart';

@injectable
class ActivityLogBloc extends Bloc<ActivityLogEvent, ActivityLogState> {
  final ActivityLogRepository _repository;

  StreamSubscription<List<ActivityLogModel>>? _subscription;

  ActivityLogBloc(this._repository) : super(const ActivityLogState.initial()) {
    on<ActivityLogEvent>((event, emit) async {
      await event.when(
        started: () async {
          emit(const ActivityLogState.loading());

          await _subscription?.cancel();

          _subscription = _repository.streamActivityLogs().listen(
            (logs) {
              add(ActivityLogEvent.logsReceived(logs));
            },
            onError: (e) {
              add(ActivityLogEvent.errorOccurred(e.toString()));
            },
          );
        },

        logsReceived: (logs) async {
          emit(ActivityLogState.loaded(logs));
        },

        errorOccurred: (message) async {
          emit(ActivityLogState.error(message));
        },
      );
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
