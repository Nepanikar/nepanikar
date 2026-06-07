// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mood_track_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MoodTrack {

 Mood get mood;// ignore: invalid_annotation_target
@JsonKey(name: FilterKeys.date) DateTime get date; List<String>? get emotions; String? get summary; String? get description;
/// Create a copy of MoodTrack
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoodTrackCopyWith<MoodTrack> get copyWith => _$MoodTrackCopyWithImpl<MoodTrack>(this as MoodTrack, _$identity);

  /// Serializes this MoodTrack to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoodTrack&&(identical(other.mood, mood) || other.mood == mood)&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other.emotions, emotions)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mood,date,const DeepCollectionEquality().hash(emotions),summary,description);

@override
String toString() {
  return 'MoodTrack(mood: $mood, date: $date, emotions: $emotions, summary: $summary, description: $description)';
}


}

/// @nodoc
abstract mixin class $MoodTrackCopyWith<$Res>  {
  factory $MoodTrackCopyWith(MoodTrack value, $Res Function(MoodTrack) _then) = _$MoodTrackCopyWithImpl;
@useResult
$Res call({
 Mood mood,@JsonKey(name: FilterKeys.date) DateTime date, List<String>? emotions, String? summary, String? description
});




}
/// @nodoc
class _$MoodTrackCopyWithImpl<$Res>
    implements $MoodTrackCopyWith<$Res> {
  _$MoodTrackCopyWithImpl(this._self, this._then);

  final MoodTrack _self;
  final $Res Function(MoodTrack) _then;

/// Create a copy of MoodTrack
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mood = null,Object? date = null,Object? emotions = freezed,Object? summary = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
mood: null == mood ? _self.mood : mood // ignore: cast_nullable_to_non_nullable
as Mood,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,emotions: freezed == emotions ? _self.emotions : emotions // ignore: cast_nullable_to_non_nullable
as List<String>?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MoodTrack].
extension MoodTrackPatterns on MoodTrack {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MoodTrack value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MoodTrack() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MoodTrack value)  $default,){
final _that = this;
switch (_that) {
case _MoodTrack():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MoodTrack value)?  $default,){
final _that = this;
switch (_that) {
case _MoodTrack() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Mood mood, @JsonKey(name: FilterKeys.date)  DateTime date,  List<String>? emotions,  String? summary,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MoodTrack() when $default != null:
return $default(_that.mood,_that.date,_that.emotions,_that.summary,_that.description);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Mood mood, @JsonKey(name: FilterKeys.date)  DateTime date,  List<String>? emotions,  String? summary,  String? description)  $default,) {final _that = this;
switch (_that) {
case _MoodTrack():
return $default(_that.mood,_that.date,_that.emotions,_that.summary,_that.description);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Mood mood, @JsonKey(name: FilterKeys.date)  DateTime date,  List<String>? emotions,  String? summary,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _MoodTrack() when $default != null:
return $default(_that.mood,_that.date,_that.emotions,_that.summary,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MoodTrack extends MoodTrack {
  const _MoodTrack({required this.mood, @JsonKey(name: FilterKeys.date) required this.date, final  List<String>? emotions, this.summary, this.description}): _emotions = emotions,super._();
  factory _MoodTrack.fromJson(Map<String, dynamic> json) => _$MoodTrackFromJson(json);

@override final  Mood mood;
// ignore: invalid_annotation_target
@override@JsonKey(name: FilterKeys.date) final  DateTime date;
 final  List<String>? _emotions;
@override List<String>? get emotions {
  final value = _emotions;
  if (value == null) return null;
  if (_emotions is EqualUnmodifiableListView) return _emotions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? summary;
@override final  String? description;

/// Create a copy of MoodTrack
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MoodTrackCopyWith<_MoodTrack> get copyWith => __$MoodTrackCopyWithImpl<_MoodTrack>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MoodTrackToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MoodTrack&&(identical(other.mood, mood) || other.mood == mood)&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other._emotions, _emotions)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mood,date,const DeepCollectionEquality().hash(_emotions),summary,description);

@override
String toString() {
  return 'MoodTrack(mood: $mood, date: $date, emotions: $emotions, summary: $summary, description: $description)';
}


}

/// @nodoc
abstract mixin class _$MoodTrackCopyWith<$Res> implements $MoodTrackCopyWith<$Res> {
  factory _$MoodTrackCopyWith(_MoodTrack value, $Res Function(_MoodTrack) _then) = __$MoodTrackCopyWithImpl;
@override @useResult
$Res call({
 Mood mood,@JsonKey(name: FilterKeys.date) DateTime date, List<String>? emotions, String? summary, String? description
});




}
/// @nodoc
class __$MoodTrackCopyWithImpl<$Res>
    implements _$MoodTrackCopyWith<$Res> {
  __$MoodTrackCopyWithImpl(this._self, this._then);

  final _MoodTrack _self;
  final $Res Function(_MoodTrack) _then;

/// Create a copy of MoodTrack
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mood = null,Object? date = null,Object? emotions = freezed,Object? summary = freezed,Object? description = freezed,}) {
  return _then(_MoodTrack(
mood: null == mood ? _self.mood : mood // ignore: cast_nullable_to_non_nullable
as Mood,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,emotions: freezed == emotions ? _self._emotions : emotions // ignore: cast_nullable_to_non_nullable
as List<String>?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
