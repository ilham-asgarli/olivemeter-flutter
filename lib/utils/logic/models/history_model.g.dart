// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryModelImpl _$$HistoryModelImplFromJson(Map<String, dynamic> json) =>
    _$HistoryModelImpl(
      name: json['name'] as String,
      tempPath: json['temp_path'] as String,
      good: json['good'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$HistoryModelImplToJson(_$HistoryModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'temp_path': instance.tempPath,
      'good': instance.good,
      'created_at': instance.createdAt.toIso8601String(),
    };
