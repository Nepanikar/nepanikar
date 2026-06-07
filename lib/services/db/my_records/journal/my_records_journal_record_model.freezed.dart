// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_records_journal_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JournalRecordAnswer {

 JournalQuestion get question; String get answer;
/// Create a copy of JournalRecordAnswer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JournalRecordAnswerCopyWith<JournalRecordAnswer> get copyWith => _$JournalRecordAnswerCopyWithImpl<JournalRecordAnswer>(this as JournalRecordAnswer, _$identity);

  /// Serializes this JournalRecordAnswer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JournalRecordAnswer&&(identical(other.question, question) || other.question == question)&&(identical(other.answer, answer) || other.answer == answer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,question,answer);

@override
String toString() {
  return 'JournalRecordAnswer(question: $question, answer: $answer)';
}


}

/// @nodoc
abstract mixin class $JournalRecordAnswerCopyWith<$Res>  {
  factory $JournalRecordAnswerCopyWith(JournalRecordAnswer value, $Res Function(JournalRecordAnswer) _then) = _$JournalRecordAnswerCopyWithImpl;
@useResult
$Res call({
 JournalQuestion question, String answer
});




}
/// @nodoc
class _$JournalRecordAnswerCopyWithImpl<$Res>
    implements $JournalRecordAnswerCopyWith<$Res> {
  _$JournalRecordAnswerCopyWithImpl(this._self, this._then);

  final JournalRecordAnswer _self;
  final $Res Function(JournalRecordAnswer) _then;

/// Create a copy of JournalRecordAnswer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? question = null,Object? answer = null,}) {
  return _then(_self.copyWith(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as JournalQuestion,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [JournalRecordAnswer].
extension JournalRecordAnswerPatterns on JournalRecordAnswer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JournalRecordAnswer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JournalRecordAnswer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JournalRecordAnswer value)  $default,){
final _that = this;
switch (_that) {
case _JournalRecordAnswer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JournalRecordAnswer value)?  $default,){
final _that = this;
switch (_that) {
case _JournalRecordAnswer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( JournalQuestion question,  String answer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JournalRecordAnswer() when $default != null:
return $default(_that.question,_that.answer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( JournalQuestion question,  String answer)  $default,) {final _that = this;
switch (_that) {
case _JournalRecordAnswer():
return $default(_that.question,_that.answer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( JournalQuestion question,  String answer)?  $default,) {final _that = this;
switch (_that) {
case _JournalRecordAnswer() when $default != null:
return $default(_that.question,_that.answer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JournalRecordAnswer extends JournalRecordAnswer {
  const _JournalRecordAnswer({required this.question, required this.answer}): super._();
  factory _JournalRecordAnswer.fromJson(Map<String, dynamic> json) => _$JournalRecordAnswerFromJson(json);

@override final  JournalQuestion question;
@override final  String answer;

/// Create a copy of JournalRecordAnswer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JournalRecordAnswerCopyWith<_JournalRecordAnswer> get copyWith => __$JournalRecordAnswerCopyWithImpl<_JournalRecordAnswer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JournalRecordAnswerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JournalRecordAnswer&&(identical(other.question, question) || other.question == question)&&(identical(other.answer, answer) || other.answer == answer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,question,answer);

@override
String toString() {
  return 'JournalRecordAnswer(question: $question, answer: $answer)';
}


}

/// @nodoc
abstract mixin class _$JournalRecordAnswerCopyWith<$Res> implements $JournalRecordAnswerCopyWith<$Res> {
  factory _$JournalRecordAnswerCopyWith(_JournalRecordAnswer value, $Res Function(_JournalRecordAnswer) _then) = __$JournalRecordAnswerCopyWithImpl;
@override @useResult
$Res call({
 JournalQuestion question, String answer
});




}
/// @nodoc
class __$JournalRecordAnswerCopyWithImpl<$Res>
    implements _$JournalRecordAnswerCopyWith<$Res> {
  __$JournalRecordAnswerCopyWithImpl(this._self, this._then);

  final _JournalRecordAnswer _self;
  final $Res Function(_JournalRecordAnswer) _then;

/// Create a copy of JournalRecordAnswer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? question = null,Object? answer = null,}) {
  return _then(_JournalRecordAnswer(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as JournalQuestion,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$JournalRecord {

// ignore: invalid_annotation_target
@JsonKey(name: FilterKeys.dateWithTime) DateTime get dateTime; List<JournalRecordAnswer> get answers;
/// Create a copy of JournalRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JournalRecordCopyWith<JournalRecord> get copyWith => _$JournalRecordCopyWithImpl<JournalRecord>(this as JournalRecord, _$identity);

  /// Serializes this JournalRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JournalRecord&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&const DeepCollectionEquality().equals(other.answers, answers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dateTime,const DeepCollectionEquality().hash(answers));

@override
String toString() {
  return 'JournalRecord(dateTime: $dateTime, answers: $answers)';
}


}

/// @nodoc
abstract mixin class $JournalRecordCopyWith<$Res>  {
  factory $JournalRecordCopyWith(JournalRecord value, $Res Function(JournalRecord) _then) = _$JournalRecordCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: FilterKeys.dateWithTime) DateTime dateTime, List<JournalRecordAnswer> answers
});




}
/// @nodoc
class _$JournalRecordCopyWithImpl<$Res>
    implements $JournalRecordCopyWith<$Res> {
  _$JournalRecordCopyWithImpl(this._self, this._then);

  final JournalRecord _self;
  final $Res Function(JournalRecord) _then;

/// Create a copy of JournalRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dateTime = null,Object? answers = null,}) {
  return _then(_self.copyWith(
dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime,answers: null == answers ? _self.answers : answers // ignore: cast_nullable_to_non_nullable
as List<JournalRecordAnswer>,
  ));
}

}


/// Adds pattern-matching-related methods to [JournalRecord].
extension JournalRecordPatterns on JournalRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JournalRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JournalRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JournalRecord value)  $default,){
final _that = this;
switch (_that) {
case _JournalRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JournalRecord value)?  $default,){
final _that = this;
switch (_that) {
case _JournalRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: FilterKeys.dateWithTime)  DateTime dateTime,  List<JournalRecordAnswer> answers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JournalRecord() when $default != null:
return $default(_that.dateTime,_that.answers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: FilterKeys.dateWithTime)  DateTime dateTime,  List<JournalRecordAnswer> answers)  $default,) {final _that = this;
switch (_that) {
case _JournalRecord():
return $default(_that.dateTime,_that.answers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: FilterKeys.dateWithTime)  DateTime dateTime,  List<JournalRecordAnswer> answers)?  $default,) {final _that = this;
switch (_that) {
case _JournalRecord() when $default != null:
return $default(_that.dateTime,_that.answers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JournalRecord extends JournalRecord {
  const _JournalRecord({@JsonKey(name: FilterKeys.dateWithTime) required this.dateTime, required final  List<JournalRecordAnswer> answers}): _answers = answers,super._();
  factory _JournalRecord.fromJson(Map<String, dynamic> json) => _$JournalRecordFromJson(json);

// ignore: invalid_annotation_target
@override@JsonKey(name: FilterKeys.dateWithTime) final  DateTime dateTime;
 final  List<JournalRecordAnswer> _answers;
@override List<JournalRecordAnswer> get answers {
  if (_answers is EqualUnmodifiableListView) return _answers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answers);
}


/// Create a copy of JournalRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JournalRecordCopyWith<_JournalRecord> get copyWith => __$JournalRecordCopyWithImpl<_JournalRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JournalRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JournalRecord&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&const DeepCollectionEquality().equals(other._answers, _answers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dateTime,const DeepCollectionEquality().hash(_answers));

@override
String toString() {
  return 'JournalRecord(dateTime: $dateTime, answers: $answers)';
}


}

/// @nodoc
abstract mixin class _$JournalRecordCopyWith<$Res> implements $JournalRecordCopyWith<$Res> {
  factory _$JournalRecordCopyWith(_JournalRecord value, $Res Function(_JournalRecord) _then) = __$JournalRecordCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: FilterKeys.dateWithTime) DateTime dateTime, List<JournalRecordAnswer> answers
});




}
/// @nodoc
class __$JournalRecordCopyWithImpl<$Res>
    implements _$JournalRecordCopyWith<$Res> {
  __$JournalRecordCopyWithImpl(this._self, this._then);

  final _JournalRecord _self;
  final $Res Function(_JournalRecord) _then;

/// Create a copy of JournalRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dateTime = null,Object? answers = null,}) {
  return _then(_JournalRecord(
dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime,answers: null == answers ? _self._answers : answers // ignore: cast_nullable_to_non_nullable
as List<JournalRecordAnswer>,
  ));
}


}

// dart format on
