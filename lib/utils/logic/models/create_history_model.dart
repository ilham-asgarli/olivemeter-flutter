import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:olive_quality/utils/logic/helpers/json-serializable/uint8_list_converter.dart';

part 'create_history_model.freezed.dart';
part 'create_history_model.g.dart';

@Freezed()
class CreateHistoryModel with _$CreateHistoryModel {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    explicitToJson: true,
    includeIfNull: false,
  )
  @Uint8ListConverter()
  const factory CreateHistoryModel({
    required String name,
    required Uint8List? bytes,
    required bool good,
  }) = _CreateHistoryModel;

  factory CreateHistoryModel.fromJson(Map<String, Object?> json) =>
      _$CreateHistoryModelFromJson(json);
}
