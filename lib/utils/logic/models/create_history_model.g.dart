// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateHistoryModelImpl _$$CreateHistoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateHistoryModelImpl(
      name: json['name'] as String,
      bytes: const Uint8ListConverter().fromJson(json['bytes'] as List<int>?),
      good: json['good'] as bool,
    );

Map<String, dynamic> _$$CreateHistoryModelImplToJson(
    _$CreateHistoryModelImpl instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('bytes', const Uint8ListConverter().toJson(instance.bytes));
  val['good'] = instance.good;
  return val;
}
