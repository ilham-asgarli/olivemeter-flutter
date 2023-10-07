// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateHistoryModel _$CreateHistoryModelFromJson(Map<String, dynamic> json) {
  return _CreateHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$CreateHistoryModel {
  String get name => throw _privateConstructorUsedError;
  Uint8List? get bytes => throw _privateConstructorUsedError;
  bool get good => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateHistoryModelCopyWith<CreateHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateHistoryModelCopyWith<$Res> {
  factory $CreateHistoryModelCopyWith(
          CreateHistoryModel value, $Res Function(CreateHistoryModel) then) =
      _$CreateHistoryModelCopyWithImpl<$Res, CreateHistoryModel>;
  @useResult
  $Res call({String name, Uint8List? bytes, bool good});
}

/// @nodoc
class _$CreateHistoryModelCopyWithImpl<$Res, $Val extends CreateHistoryModel>
    implements $CreateHistoryModelCopyWith<$Res> {
  _$CreateHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? bytes = freezed,
    Object? good = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      bytes: freezed == bytes
          ? _value.bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      good: null == good
          ? _value.good
          : good // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateHistoryModelImplCopyWith<$Res>
    implements $CreateHistoryModelCopyWith<$Res> {
  factory _$$CreateHistoryModelImplCopyWith(_$CreateHistoryModelImpl value,
          $Res Function(_$CreateHistoryModelImpl) then) =
      __$$CreateHistoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, Uint8List? bytes, bool good});
}

/// @nodoc
class __$$CreateHistoryModelImplCopyWithImpl<$Res>
    extends _$CreateHistoryModelCopyWithImpl<$Res, _$CreateHistoryModelImpl>
    implements _$$CreateHistoryModelImplCopyWith<$Res> {
  __$$CreateHistoryModelImplCopyWithImpl(_$CreateHistoryModelImpl _value,
      $Res Function(_$CreateHistoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? bytes = freezed,
    Object? good = null,
  }) {
    return _then(_$CreateHistoryModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      bytes: freezed == bytes
          ? _value.bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      good: null == good
          ? _value.good
          : good // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(
    fieldRename: FieldRename.snake, explicitToJson: true, includeIfNull: false)
@Uint8ListConverter()
class _$CreateHistoryModelImpl implements _CreateHistoryModel {
  const _$CreateHistoryModelImpl(
      {required this.name, required this.bytes, required this.good});

  factory _$CreateHistoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateHistoryModelImplFromJson(json);

  @override
  final String name;
  @override
  final Uint8List? bytes;
  @override
  final bool good;

  @override
  String toString() {
    return 'CreateHistoryModel(name: $name, bytes: $bytes, good: $good)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateHistoryModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.bytes, bytes) &&
            (identical(other.good, good) || other.good == good));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(bytes), good);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateHistoryModelImplCopyWith<_$CreateHistoryModelImpl> get copyWith =>
      __$$CreateHistoryModelImplCopyWithImpl<_$CreateHistoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateHistoryModelImplToJson(
      this,
    );
  }
}

abstract class _CreateHistoryModel implements CreateHistoryModel {
  const factory _CreateHistoryModel(
      {required final String name,
      required final Uint8List? bytes,
      required final bool good}) = _$CreateHistoryModelImpl;

  factory _CreateHistoryModel.fromJson(Map<String, dynamic> json) =
      _$CreateHistoryModelImpl.fromJson;

  @override
  String get name;
  @override
  Uint8List? get bytes;
  @override
  bool get good;
  @override
  @JsonKey(ignore: true)
  _$$CreateHistoryModelImplCopyWith<_$CreateHistoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
