import 'package:artist_ums/features/activity_logs/domain/entities/activity_log_model.dart';

abstract class ActivityLogRepository {
  Stream<List<ActivityLogModel>> streamActivityLogs();
}
