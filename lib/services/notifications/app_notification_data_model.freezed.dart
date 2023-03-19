// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_notification_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppNotificationData _$AppNotificationDataFromJson(Map<String, dynamic> json) {
  return _AppNotificationData.fromJson(json);
}

/// @nodoc
mixin _$AppNotificationData {
  NotificationType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppNotificationDataCopyWith<AppNotificationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppNotificationDataCopyWith<$Res> {
  factory $AppNotificationDataCopyWith(
          AppNotificationData value, $Res Function(AppNotificationData) then) =
      _$AppNotificationDataCopyWithImpl<$Res, AppNotificationData>;
  @useResult
  $Res call({NotificationType type});
}

/// @nodoc
class _$AppNotificationDataCopyWithImpl<$Res, $Val extends AppNotificationData>
    implements $AppNotificationDataCopyWith<$Res> {
  _$AppNotificationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppNotificationDataCopyWith<$Res>
    implements $AppNotificationDataCopyWith<$Res> {
  factory _$$_AppNotificationDataCopyWith(_$_AppNotificationData value,
          $Res Function(_$_AppNotificationData) then) =
      __$$_AppNotificationDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NotificationType type});
}

/// @nodoc
class __$$_AppNotificationDataCopyWithImpl<$Res>
    extends _$AppNotificationDataCopyWithImpl<$Res, _$_AppNotificationData>
    implements _$$_AppNotificationDataCopyWith<$Res> {
  __$$_AppNotificationDataCopyWithImpl(_$_AppNotificationData _value,
      $Res Function(_$_AppNotificationData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$_AppNotificationData(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppNotificationData extends _AppNotificationData {
  const _$_AppNotificationData({required this.type}) : super._();

  factory _$_AppNotificationData.fromJson(Map<String, dynamic> json) =>
      _$$_AppNotificationDataFromJson(json);

  @override
  final NotificationType type;

  @override
  String toString() {
    return 'AppNotificationData(type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppNotificationData &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppNotificationDataCopyWith<_$_AppNotificationData> get copyWith =>
      __$$_AppNotificationDataCopyWithImpl<_$_AppNotificationData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppNotificationDataToJson(
      this,
    );
  }
}

abstract class _AppNotificationData extends AppNotificationData {
  const factory _AppNotificationData({required final NotificationType type}) =
      _$_AppNotificationData;
  const _AppNotificationData._() : super._();

  factory _AppNotificationData.fromJson(Map<String, dynamic> json) =
      _$_AppNotificationData.fromJson;

  @override
  NotificationType get type;
  @override
  @JsonKey(ignore: true)
  _$$_AppNotificationDataCopyWith<_$_AppNotificationData> get copyWith =>
      throw _privateConstructorUsedError;
}
