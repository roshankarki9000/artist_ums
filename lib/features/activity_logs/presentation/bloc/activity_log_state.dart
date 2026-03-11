import 'package:artist_ums/features/activity_logs/domain/entities/activity_log_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'activity_log_state.freezed.dart';

@freezed
class ActivityLogState with _$ActivityLogState {
  const factory ActivityLogState.initial() = _Initial;

  const factory ActivityLogState.loading() = _Loading;

  const factory ActivityLogState.loaded(List<ActivityLogModel> logs) = _Loaded;

  const factory ActivityLogState.error(String message) = _Error;
}
