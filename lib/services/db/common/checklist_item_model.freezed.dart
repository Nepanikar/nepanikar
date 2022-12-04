// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'checklist_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChecklistItem _$ChecklistItemFromJson(Map<String, dynamic> json) {
  return _ChecklistItem.fromJson(json);
}

/// @nodoc
mixin _$ChecklistItem {
  String get text => throw _privateConstructorUsedError;
  bool get isChecked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChecklistItemCopyWith<ChecklistItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecklistItemCopyWith<$Res> {
  factory $ChecklistItemCopyWith(
          ChecklistItem value, $Res Function(ChecklistItem) then) =
      _$ChecklistItemCopyWithImpl<$Res, ChecklistItem>;
  @useResult
  $Res call({String text, bool isChecked});
}

/// @nodoc
class _$ChecklistItemCopyWithImpl<$Res, $Val extends ChecklistItem>
    implements $ChecklistItemCopyWith<$Res> {
  _$ChecklistItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? isChecked = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      isChecked: null == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChecklistItemCopyWith<$Res>
    implements $ChecklistItemCopyWith<$Res> {
  factory _$$_ChecklistItemCopyWith(
          _$_ChecklistItem value, $Res Function(_$_ChecklistItem) then) =
      __$$_ChecklistItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, bool isChecked});
}

/// @nodoc
class __$$_ChecklistItemCopyWithImpl<$Res>
    extends _$ChecklistItemCopyWithImpl<$Res, _$_ChecklistItem>
    implements _$$_ChecklistItemCopyWith<$Res> {
  __$$_ChecklistItemCopyWithImpl(
      _$_ChecklistItem _value, $Res Function(_$_ChecklistItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? isChecked = null,
  }) {
    return _then(_$_ChecklistItem(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      isChecked: null == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChecklistItem extends _ChecklistItem {
  const _$_ChecklistItem({required this.text, this.isChecked = false})
      : super._();

  factory _$_ChecklistItem.fromJson(Map<String, dynamic> json) =>
      _$$_ChecklistItemFromJson(json);

  @override
  final String text;
  @override
  @JsonKey()
  final bool isChecked;

  @override
  String toString() {
    return 'ChecklistItem(text: $text, isChecked: $isChecked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChecklistItem &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, isChecked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChecklistItemCopyWith<_$_ChecklistItem> get copyWith =>
      __$$_ChecklistItemCopyWithImpl<_$_ChecklistItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChecklistItemToJson(
      this,
    );
  }
}

abstract class _ChecklistItem extends ChecklistItem {
  const factory _ChecklistItem(
      {required final String text, final bool isChecked}) = _$_ChecklistItem;
  const _ChecklistItem._() : super._();

  factory _ChecklistItem.fromJson(Map<String, dynamic> json) =
      _$_ChecklistItem.fromJson;

  @override
  String get text;
  @override
  bool get isChecked;
  @override
  @JsonKey(ignore: true)
  _$$_ChecklistItemCopyWith<_$_ChecklistItem> get copyWith =>
      throw _privateConstructorUsedError;
}
