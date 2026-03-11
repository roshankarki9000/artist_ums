import 'package:artist_ums/features/activity_logs/domain/entities/activity_log_model.dart';
import 'package:artist_ums/features/activity_logs/domain/repository/activity_log_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_client.dart';

@LazySingleton(as: ActivityLogRepository)
class ActivityLogRepositoryImpl implements ActivityLogRepository {
  final ApiClient _apiClient;

  ActivityLogRepositoryImpl(this._apiClient);

  @override
  Stream<List<ActivityLogModel>> streamActivityLogs() {
    return _apiClient.stream<ActivityLogModel>(
      table: 'activity_logs',
      fromJson: ActivityLogModel.fromJson,
      orderBy: 'created_at',
      ascending: false,
    );
  }
}
