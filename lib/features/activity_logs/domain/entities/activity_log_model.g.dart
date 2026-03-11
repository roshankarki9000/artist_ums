// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ActivityLogModel _$ActivityLogModelFromJson(Map<String, dynamic> json) =>
    _ActivityLogModel(
      id: json['id'] as String,
      userId: json['user_id'] as String?,
      action: json['action'] as String,
      entity: json['entity'] as String,
      entityId: json['entity_id'] as String?,
      entityName: json['entity_name'] as String?,
      description: json['description'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ActivityLogModelToJson(_ActivityLogModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'action': instance.action,
      'entity': instance.entity,
      'entity_id': instance.entityId,
      'entity_name': instance.entityName,
      'description': instance.description,
      'created_at': instance.createdAt.toIso8601String(),
    };
