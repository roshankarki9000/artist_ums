import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_log_model.freezed.dart';
part 'activity_log_model.g.dart';

@freezed
abstract class ActivityLogModel with _$ActivityLogModel {
  const factory ActivityLogModel({
    required String id,

    @JsonKey(name: 'user_id') String? userId,

    required String action,

    required String entity,

    @JsonKey(name: 'entity_id') String? entityId,

    @JsonKey(name: 'entity_name') String? entityName,

    String? description,

    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _ActivityLogModel;

  factory ActivityLogModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityLogModelFromJson(json);
}
