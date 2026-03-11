import 'package:artist_ums/features/activity_logs/domain/entities/activity_log_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_log_event.freezed.dart';

@freezed
class ActivityLogEvent with _$ActivityLogEvent {
  const factory ActivityLogEvent.started() = _Started;

  const factory ActivityLogEvent.logsReceived(List<ActivityLogModel> logs) =
      _LogsReceived;

  const factory ActivityLogEvent.errorOccurred(String message) = _ErrorOccurred;
}
