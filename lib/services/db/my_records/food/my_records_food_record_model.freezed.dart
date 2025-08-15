// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_records_food_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FoodQuestionTextAnswer {

 FoodQuestionText get foodQuestionText; String get answer;
/// Create a copy of FoodQuestionTextAnswer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodQuestionTextAnswerCopyWith<FoodQuestionTextAnswer> get copyWith => _$FoodQuestionTextAnswerCopyWithImpl<FoodQuestionTextAnswer>(this as FoodQuestionTextAnswer, _$identity);

  /// Serializes this FoodQuestionTextAnswer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodQuestionTextAnswer&&(identical(other.foodQuestionText, foodQuestionText) || other.foodQuestionText == foodQuestionText)&&(identical(other.answer, answer) || other.answer == answer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,foodQuestionText,answer);

@override
String toString() {
  return 'FoodQuestionTextAnswer(foodQuestionText: $foodQuestionText, answer: $answer)';
}


}

/// @nodoc
abstract mixin class $FoodQuestionTextAnswerCopyWith<$Res>  {
  factory $FoodQuestionTextAnswerCopyWith(FoodQuestionTextAnswer value, $Res Function(FoodQuestionTextAnswer) _then) = _$FoodQuestionTextAnswerCopyWithImpl;
@useResult
$Res call({
 FoodQuestionText foodQuestionText, String answer
});




}
/// @nodoc
class _$FoodQuestionTextAnswerCopyWithImpl<$Res>
    implements $FoodQuestionTextAnswerCopyWith<$Res> {
  _$FoodQuestionTextAnswerCopyWithImpl(this._self, this._then);

  final FoodQuestionTextAnswer _self;
  final $Res Function(FoodQuestionTextAnswer) _then;

/// Create a copy of FoodQuestionTextAnswer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? foodQuestionText = null,Object? answer = null,}) {
  return _then(_self.copyWith(
foodQuestionText: null == foodQuestionText ? _self.foodQuestionText : foodQuestionText // ignore: cast_nullable_to_non_nullable
as FoodQuestionText,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FoodQuestionTextAnswer].
extension FoodQuestionTextAnswerPatterns on FoodQuestionTextAnswer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FoodQuestionTextAnswer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FoodQuestionTextAnswer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FoodQuestionTextAnswer value)  $default,){
final _that = this;
switch (_that) {
case _FoodQuestionTextAnswer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FoodQuestionTextAnswer value)?  $default,){
final _that = this;
switch (_that) {
case _FoodQuestionTextAnswer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FoodQuestionText foodQuestionText,  String answer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FoodQuestionTextAnswer() when $default != null:
return $default(_that.foodQuestionText,_that.answer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FoodQuestionText foodQuestionText,  String answer)  $default,) {final _that = this;
switch (_that) {
case _FoodQuestionTextAnswer():
return $default(_that.foodQuestionText,_that.answer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FoodQuestionText foodQuestionText,  String answer)?  $default,) {final _that = this;
switch (_that) {
case _FoodQuestionTextAnswer() when $default != null:
return $default(_that.foodQuestionText,_that.answer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FoodQuestionTextAnswer extends FoodQuestionTextAnswer {
  const _FoodQuestionTextAnswer({required this.foodQuestionText, required this.answer}): super._();
  factory _FoodQuestionTextAnswer.fromJson(Map<String, dynamic> json) => _$FoodQuestionTextAnswerFromJson(json);

@override final  FoodQuestionText foodQuestionText;
@override final  String answer;

/// Create a copy of FoodQuestionTextAnswer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FoodQuestionTextAnswerCopyWith<_FoodQuestionTextAnswer> get copyWith => __$FoodQuestionTextAnswerCopyWithImpl<_FoodQuestionTextAnswer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FoodQuestionTextAnswerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FoodQuestionTextAnswer&&(identical(other.foodQuestionText, foodQuestionText) || other.foodQuestionText == foodQuestionText)&&(identical(other.answer, answer) || other.answer == answer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,foodQuestionText,answer);

@override
String toString() {
  return 'FoodQuestionTextAnswer(foodQuestionText: $foodQuestionText, answer: $answer)';
}


}

/// @nodoc
abstract mixin class _$FoodQuestionTextAnswerCopyWith<$Res> implements $FoodQuestionTextAnswerCopyWith<$Res> {
  factory _$FoodQuestionTextAnswerCopyWith(_FoodQuestionTextAnswer value, $Res Function(_FoodQuestionTextAnswer) _then) = __$FoodQuestionTextAnswerCopyWithImpl;
@override @useResult
$Res call({
 FoodQuestionText foodQuestionText, String answer
});




}
/// @nodoc
class __$FoodQuestionTextAnswerCopyWithImpl<$Res>
    implements _$FoodQuestionTextAnswerCopyWith<$Res> {
  __$FoodQuestionTextAnswerCopyWithImpl(this._self, this._then);

  final _FoodQuestionTextAnswer _self;
  final $Res Function(_FoodQuestionTextAnswer) _then;

/// Create a copy of FoodQuestionTextAnswer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? foodQuestionText = null,Object? answer = null,}) {
  return _then(_FoodQuestionTextAnswer(
foodQuestionText: null == foodQuestionText ? _self.foodQuestionText : foodQuestionText // ignore: cast_nullable_to_non_nullable
as FoodQuestionText,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$DailyFoodRecordAnswer {

 FoodType get foodType; bool get isTaken; List<FoodQuestionTextAnswer> get questionTextAnswers; List<FoodQuestionFeel> get tickedQuestionFeels; List<FoodQuestionProblem> get tickedQuestionProblems;
/// Create a copy of DailyFoodRecordAnswer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyFoodRecordAnswerCopyWith<DailyFoodRecordAnswer> get copyWith => _$DailyFoodRecordAnswerCopyWithImpl<DailyFoodRecordAnswer>(this as DailyFoodRecordAnswer, _$identity);

  /// Serializes this DailyFoodRecordAnswer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyFoodRecordAnswer&&(identical(other.foodType, foodType) || other.foodType == foodType)&&(identical(other.isTaken, isTaken) || other.isTaken == isTaken)&&const DeepCollectionEquality().equals(other.questionTextAnswers, questionTextAnswers)&&const DeepCollectionEquality().equals(other.tickedQuestionFeels, tickedQuestionFeels)&&const DeepCollectionEquality().equals(other.tickedQuestionProblems, tickedQuestionProblems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,foodType,isTaken,const DeepCollectionEquality().hash(questionTextAnswers),const DeepCollectionEquality().hash(tickedQuestionFeels),const DeepCollectionEquality().hash(tickedQuestionProblems));

@override
String toString() {
  return 'DailyFoodRecordAnswer(foodType: $foodType, isTaken: $isTaken, questionTextAnswers: $questionTextAnswers, tickedQuestionFeels: $tickedQuestionFeels, tickedQuestionProblems: $tickedQuestionProblems)';
}


}

/// @nodoc
abstract mixin class $DailyFoodRecordAnswerCopyWith<$Res>  {
  factory $DailyFoodRecordAnswerCopyWith(DailyFoodRecordAnswer value, $Res Function(DailyFoodRecordAnswer) _then) = _$DailyFoodRecordAnswerCopyWithImpl;
@useResult
$Res call({
 FoodType foodType, bool isTaken, List<FoodQuestionTextAnswer> questionTextAnswers, List<FoodQuestionFeel> tickedQuestionFeels, List<FoodQuestionProblem> tickedQuestionProblems
});




}
/// @nodoc
class _$DailyFoodRecordAnswerCopyWithImpl<$Res>
    implements $DailyFoodRecordAnswerCopyWith<$Res> {
  _$DailyFoodRecordAnswerCopyWithImpl(this._self, this._then);

  final DailyFoodRecordAnswer _self;
  final $Res Function(DailyFoodRecordAnswer) _then;

/// Create a copy of DailyFoodRecordAnswer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? foodType = null,Object? isTaken = null,Object? questionTextAnswers = null,Object? tickedQuestionFeels = null,Object? tickedQuestionProblems = null,}) {
  return _then(_self.copyWith(
foodType: null == foodType ? _self.foodType : foodType // ignore: cast_nullable_to_non_nullable
as FoodType,isTaken: null == isTaken ? _self.isTaken : isTaken // ignore: cast_nullable_to_non_nullable
as bool,questionTextAnswers: null == questionTextAnswers ? _self.questionTextAnswers : questionTextAnswers // ignore: cast_nullable_to_non_nullable
as List<FoodQuestionTextAnswer>,tickedQuestionFeels: null == tickedQuestionFeels ? _self.tickedQuestionFeels : tickedQuestionFeels // ignore: cast_nullable_to_non_nullable
as List<FoodQuestionFeel>,tickedQuestionProblems: null == tickedQuestionProblems ? _self.tickedQuestionProblems : tickedQuestionProblems // ignore: cast_nullable_to_non_nullable
as List<FoodQuestionProblem>,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyFoodRecordAnswer].
extension DailyFoodRecordAnswerPatterns on DailyFoodRecordAnswer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyFoodRecordAnswer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyFoodRecordAnswer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyFoodRecordAnswer value)  $default,){
final _that = this;
switch (_that) {
case _DailyFoodRecordAnswer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyFoodRecordAnswer value)?  $default,){
final _that = this;
switch (_that) {
case _DailyFoodRecordAnswer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FoodType foodType,  bool isTaken,  List<FoodQuestionTextAnswer> questionTextAnswers,  List<FoodQuestionFeel> tickedQuestionFeels,  List<FoodQuestionProblem> tickedQuestionProblems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyFoodRecordAnswer() when $default != null:
return $default(_that.foodType,_that.isTaken,_that.questionTextAnswers,_that.tickedQuestionFeels,_that.tickedQuestionProblems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FoodType foodType,  bool isTaken,  List<FoodQuestionTextAnswer> questionTextAnswers,  List<FoodQuestionFeel> tickedQuestionFeels,  List<FoodQuestionProblem> tickedQuestionProblems)  $default,) {final _that = this;
switch (_that) {
case _DailyFoodRecordAnswer():
return $default(_that.foodType,_that.isTaken,_that.questionTextAnswers,_that.tickedQuestionFeels,_that.tickedQuestionProblems);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FoodType foodType,  bool isTaken,  List<FoodQuestionTextAnswer> questionTextAnswers,  List<FoodQuestionFeel> tickedQuestionFeels,  List<FoodQuestionProblem> tickedQuestionProblems)?  $default,) {final _that = this;
switch (_that) {
case _DailyFoodRecordAnswer() when $default != null:
return $default(_that.foodType,_that.isTaken,_that.questionTextAnswers,_that.tickedQuestionFeels,_that.tickedQuestionProblems);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyFoodRecordAnswer extends DailyFoodRecordAnswer {
  const _DailyFoodRecordAnswer({required this.foodType, this.isTaken = false, final  List<FoodQuestionTextAnswer> questionTextAnswers = const [], final  List<FoodQuestionFeel> tickedQuestionFeels = const [], final  List<FoodQuestionProblem> tickedQuestionProblems = const []}): _questionTextAnswers = questionTextAnswers,_tickedQuestionFeels = tickedQuestionFeels,_tickedQuestionProblems = tickedQuestionProblems,super._();
  factory _DailyFoodRecordAnswer.fromJson(Map<String, dynamic> json) => _$DailyFoodRecordAnswerFromJson(json);

@override final  FoodType foodType;
@override@JsonKey() final  bool isTaken;
 final  List<FoodQuestionTextAnswer> _questionTextAnswers;
@override@JsonKey() List<FoodQuestionTextAnswer> get questionTextAnswers {
  if (_questionTextAnswers is EqualUnmodifiableListView) return _questionTextAnswers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questionTextAnswers);
}

 final  List<FoodQuestionFeel> _tickedQuestionFeels;
@override@JsonKey() List<FoodQuestionFeel> get tickedQuestionFeels {
  if (_tickedQuestionFeels is EqualUnmodifiableListView) return _tickedQuestionFeels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tickedQuestionFeels);
}

 final  List<FoodQuestionProblem> _tickedQuestionProblems;
@override@JsonKey() List<FoodQuestionProblem> get tickedQuestionProblems {
  if (_tickedQuestionProblems is EqualUnmodifiableListView) return _tickedQuestionProblems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tickedQuestionProblems);
}


/// Create a copy of DailyFoodRecordAnswer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyFoodRecordAnswerCopyWith<_DailyFoodRecordAnswer> get copyWith => __$DailyFoodRecordAnswerCopyWithImpl<_DailyFoodRecordAnswer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyFoodRecordAnswerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyFoodRecordAnswer&&(identical(other.foodType, foodType) || other.foodType == foodType)&&(identical(other.isTaken, isTaken) || other.isTaken == isTaken)&&const DeepCollectionEquality().equals(other._questionTextAnswers, _questionTextAnswers)&&const DeepCollectionEquality().equals(other._tickedQuestionFeels, _tickedQuestionFeels)&&const DeepCollectionEquality().equals(other._tickedQuestionProblems, _tickedQuestionProblems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,foodType,isTaken,const DeepCollectionEquality().hash(_questionTextAnswers),const DeepCollectionEquality().hash(_tickedQuestionFeels),const DeepCollectionEquality().hash(_tickedQuestionProblems));

@override
String toString() {
  return 'DailyFoodRecordAnswer(foodType: $foodType, isTaken: $isTaken, questionTextAnswers: $questionTextAnswers, tickedQuestionFeels: $tickedQuestionFeels, tickedQuestionProblems: $tickedQuestionProblems)';
}


}

/// @nodoc
abstract mixin class _$DailyFoodRecordAnswerCopyWith<$Res> implements $DailyFoodRecordAnswerCopyWith<$Res> {
  factory _$DailyFoodRecordAnswerCopyWith(_DailyFoodRecordAnswer value, $Res Function(_DailyFoodRecordAnswer) _then) = __$DailyFoodRecordAnswerCopyWithImpl;
@override @useResult
$Res call({
 FoodType foodType, bool isTaken, List<FoodQuestionTextAnswer> questionTextAnswers, List<FoodQuestionFeel> tickedQuestionFeels, List<FoodQuestionProblem> tickedQuestionProblems
});




}
/// @nodoc
class __$DailyFoodRecordAnswerCopyWithImpl<$Res>
    implements _$DailyFoodRecordAnswerCopyWith<$Res> {
  __$DailyFoodRecordAnswerCopyWithImpl(this._self, this._then);

  final _DailyFoodRecordAnswer _self;
  final $Res Function(_DailyFoodRecordAnswer) _then;

/// Create a copy of DailyFoodRecordAnswer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? foodType = null,Object? isTaken = null,Object? questionTextAnswers = null,Object? tickedQuestionFeels = null,Object? tickedQuestionProblems = null,}) {
  return _then(_DailyFoodRecordAnswer(
foodType: null == foodType ? _self.foodType : foodType // ignore: cast_nullable_to_non_nullable
as FoodType,isTaken: null == isTaken ? _self.isTaken : isTaken // ignore: cast_nullable_to_non_nullable
as bool,questionTextAnswers: null == questionTextAnswers ? _self._questionTextAnswers : questionTextAnswers // ignore: cast_nullable_to_non_nullable
as List<FoodQuestionTextAnswer>,tickedQuestionFeels: null == tickedQuestionFeels ? _self._tickedQuestionFeels : tickedQuestionFeels // ignore: cast_nullable_to_non_nullable
as List<FoodQuestionFeel>,tickedQuestionProblems: null == tickedQuestionProblems ? _self._tickedQuestionProblems : tickedQuestionProblems // ignore: cast_nullable_to_non_nullable
as List<FoodQuestionProblem>,
  ));
}


}


/// @nodoc
mixin _$DailyFoodRecord {

// ignore: invalid_annotation_target
@JsonKey(name: FilterKeys.dateWithTime) DateTime get dateTime; List<DailyFoodRecordAnswer> get answers;
/// Create a copy of DailyFoodRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyFoodRecordCopyWith<DailyFoodRecord> get copyWith => _$DailyFoodRecordCopyWithImpl<DailyFoodRecord>(this as DailyFoodRecord, _$identity);

  /// Serializes this DailyFoodRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyFoodRecord&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&const DeepCollectionEquality().equals(other.answers, answers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dateTime,const DeepCollectionEquality().hash(answers));

@override
String toString() {
  return 'DailyFoodRecord(dateTime: $dateTime, answers: $answers)';
}


}

/// @nodoc
abstract mixin class $DailyFoodRecordCopyWith<$Res>  {
  factory $DailyFoodRecordCopyWith(DailyFoodRecord value, $Res Function(DailyFoodRecord) _then) = _$DailyFoodRecordCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: FilterKeys.dateWithTime) DateTime dateTime, List<DailyFoodRecordAnswer> answers
});




}
/// @nodoc
class _$DailyFoodRecordCopyWithImpl<$Res>
    implements $DailyFoodRecordCopyWith<$Res> {
  _$DailyFoodRecordCopyWithImpl(this._self, this._then);

  final DailyFoodRecord _self;
  final $Res Function(DailyFoodRecord) _then;

/// Create a copy of DailyFoodRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dateTime = null,Object? answers = null,}) {
  return _then(_self.copyWith(
dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime,answers: null == answers ? _self.answers : answers // ignore: cast_nullable_to_non_nullable
as List<DailyFoodRecordAnswer>,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyFoodRecord].
extension DailyFoodRecordPatterns on DailyFoodRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyFoodRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyFoodRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyFoodRecord value)  $default,){
final _that = this;
switch (_that) {
case _DailyFoodRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyFoodRecord value)?  $default,){
final _that = this;
switch (_that) {
case _DailyFoodRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: FilterKeys.dateWithTime)  DateTime dateTime,  List<DailyFoodRecordAnswer> answers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyFoodRecord() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: FilterKeys.dateWithTime)  DateTime dateTime,  List<DailyFoodRecordAnswer> answers)  $default,) {final _that = this;
switch (_that) {
case _DailyFoodRecord():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: FilterKeys.dateWithTime)  DateTime dateTime,  List<DailyFoodRecordAnswer> answers)?  $default,) {final _that = this;
switch (_that) {
case _DailyFoodRecord() when $default != null:
return $default(_that.dateTime,_that.answers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyFoodRecord extends DailyFoodRecord {
  const _DailyFoodRecord({@JsonKey(name: FilterKeys.dateWithTime) required this.dateTime, required final  List<DailyFoodRecordAnswer> answers}): _answers = answers,super._();
  factory _DailyFoodRecord.fromJson(Map<String, dynamic> json) => _$DailyFoodRecordFromJson(json);

// ignore: invalid_annotation_target
@override@JsonKey(name: FilterKeys.dateWithTime) final  DateTime dateTime;
 final  List<DailyFoodRecordAnswer> _answers;
@override List<DailyFoodRecordAnswer> get answers {
  if (_answers is EqualUnmodifiableListView) return _answers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answers);
}


/// Create a copy of DailyFoodRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyFoodRecordCopyWith<_DailyFoodRecord> get copyWith => __$DailyFoodRecordCopyWithImpl<_DailyFoodRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyFoodRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyFoodRecord&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&const DeepCollectionEquality().equals(other._answers, _answers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dateTime,const DeepCollectionEquality().hash(_answers));

@override
String toString() {
  return 'DailyFoodRecord(dateTime: $dateTime, answers: $answers)';
}


}

/// @nodoc
abstract mixin class _$DailyFoodRecordCopyWith<$Res> implements $DailyFoodRecordCopyWith<$Res> {
  factory _$DailyFoodRecordCopyWith(_DailyFoodRecord value, $Res Function(_DailyFoodRecord) _then) = __$DailyFoodRecordCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: FilterKeys.dateWithTime) DateTime dateTime, List<DailyFoodRecordAnswer> answers
});




}
/// @nodoc
class __$DailyFoodRecordCopyWithImpl<$Res>
    implements _$DailyFoodRecordCopyWith<$Res> {
  __$DailyFoodRecordCopyWithImpl(this._self, this._then);

  final _DailyFoodRecord _self;
  final $Res Function(_DailyFoodRecord) _then;

/// Create a copy of DailyFoodRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dateTime = null,Object? answers = null,}) {
  return _then(_DailyFoodRecord(
dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime,answers: null == answers ? _self._answers : answers // ignore: cast_nullable_to_non_nullable
as List<DailyFoodRecordAnswer>,
  ));
}


}

// dart format on
