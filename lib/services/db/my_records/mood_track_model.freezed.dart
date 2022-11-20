// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mood_track_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MoodTrack _$MoodTrackFromJson(Map<String, dynamic> json) {
  return _MoodTrack.fromJson(json);
}

/// @nodoc
mixin _$MoodTrack {
  Mood get mood =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(name: FilterKeys.date)
  DateTime get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoodTrackCopyWith<MoodTrack> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoodTrackCopyWith<$Res> {
  factory $MoodTrackCopyWith(MoodTrack value, $Res Function(MoodTrack) then) =
      _$MoodTrackCopyWithImpl<$Res, MoodTrack>;
  @useResult
  $Res call({Mood mood, @JsonKey(name: FilterKeys.date) DateTime date});
}

/// @nodoc
class _$MoodTrackCopyWithImpl<$Res, $Val extends MoodTrack>
    implements $MoodTrackCopyWith<$Res> {
  _$MoodTrackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mood = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      mood: null == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as Mood,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MoodTrackCopyWith<$Res> implements $MoodTrackCopyWith<$Res> {
  factory _$$_MoodTrackCopyWith(
          _$_MoodTrack value, $Res Function(_$_MoodTrack) then) =
      __$$_MoodTrackCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Mood mood, @JsonKey(name: FilterKeys.date) DateTime date});
}

/// @nodoc
class __$$_MoodTrackCopyWithImpl<$Res>
    extends _$MoodTrackCopyWithImpl<$Res, _$_MoodTrack>
    implements _$$_MoodTrackCopyWith<$Res> {
  __$$_MoodTrackCopyWithImpl(
      _$_MoodTrack _value, $Res Function(_$_MoodTrack) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mood = null,
    Object? date = null,
  }) {
    return _then(_$_MoodTrack(
      mood: null == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as Mood,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MoodTrack extends _MoodTrack {
  const _$_MoodTrack(
      {required this.mood, @JsonKey(name: FilterKeys.date) required this.date})
      : super._();

  factory _$_MoodTrack.fromJson(Map<String, dynamic> json) =>
      _$$_MoodTrackFromJson(json);

  @override
  final Mood mood;
// ignore: invalid_annotation_target
  @override
  @JsonKey(name: FilterKeys.date)
  final DateTime date;

  @override
  String toString() {
    return 'MoodTrack(mood: $mood, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MoodTrack &&
            (identical(other.mood, mood) || other.mood == mood) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mood, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MoodTrackCopyWith<_$_MoodTrack> get copyWith =>
      __$$_MoodTrackCopyWithImpl<_$_MoodTrack>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MoodTrackToJson(
      this,
    );
  }
}

abstract class _MoodTrack extends MoodTrack {
  const factory _MoodTrack(
          {required final Mood mood,
          @JsonKey(name: FilterKeys.date) required final DateTime date}) =
      _$_MoodTrack;
  const _MoodTrack._() : super._();

  factory _MoodTrack.fromJson(Map<String, dynamic> json) =
      _$_MoodTrack.fromJson;

  @override
  Mood get mood;
  @override // ignore: invalid_annotation_target
  @JsonKey(name: FilterKeys.date)
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$_MoodTrackCopyWith<_$_MoodTrack> get copyWith =>
      throw _privateConstructorUsedError;
}
