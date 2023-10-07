import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:olive_quality/utils/logic/helpers/json-serializable/uint8_list_converter.dart';

part 'history_model.freezed.dart';
part 'history_model.g.dart';

@Freezed()
class HistoryModel with _$HistoryModel {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
    explicitToJson: true,
    includeIfNull: false,
  )
  @Uint8ListConverter()
  const factory HistoryModel({
    required String name,
    required String tempPath,
    required bool good,
    required DateTime createdAt,
  }) = _HistoryModel;

  factory HistoryModel.fromJson(Map<String, Object?> json) =>
      _$HistoryModelFromJson(json);
}
