// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_results_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TestResult {

 String get testId; DateTime get completedAt; int get totalScore; Map<String, String> get answers;
/// Create a copy of TestResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestResultCopyWith<TestResult> get copyWith => _$TestResultCopyWithImpl<TestResult>(this as TestResult, _$identity);

  /// Serializes this TestResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestResult&&(identical(other.testId, testId) || other.testId == testId)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.totalScore, totalScore) || other.totalScore == totalScore)&&const DeepCollectionEquality().equals(other.answers, answers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,testId,completedAt,totalScore,const DeepCollectionEquality().hash(answers));

@override
String toString() {
  return 'TestResult(testId: $testId, completedAt: $completedAt, totalScore: $totalScore, answers: $answers)';
}


}

/// @nodoc
abstract mixin class $TestResultCopyWith<$Res>  {
  factory $TestResultCopyWith(TestResult value, $Res Function(TestResult) _then) = _$TestResultCopyWithImpl;
@useResult
$Res call({
 String testId, DateTime completedAt, int totalScore, Map<String, String> answers
});




}
/// @nodoc
class _$TestResultCopyWithImpl<$Res>
    implements $TestResultCopyWith<$Res> {
  _$TestResultCopyWithImpl(this._self, this._then);

  final TestResult _self;
  final $Res Function(TestResult) _then;

/// Create a copy of TestResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? testId = null,Object? completedAt = null,Object? totalScore = null,Object? answers = null,}) {
  return _then(_self.copyWith(
testId: null == testId ? _self.testId : testId // ignore: cast_nullable_to_non_nullable
as String,completedAt: null == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime,totalScore: null == totalScore ? _self.totalScore : totalScore // ignore: cast_nullable_to_non_nullable
as int,answers: null == answers ? _self.answers : answers // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

}


/// Adds pattern-matching-related methods to [TestResult].
extension TestResultPatterns on TestResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestResult value)  $default,){
final _that = this;
switch (_that) {
case _TestResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestResult value)?  $default,){
final _that = this;
switch (_that) {
case _TestResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String testId,  DateTime completedAt,  int totalScore,  Map<String, String> answers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestResult() when $default != null:
return $default(_that.testId,_that.completedAt,_that.totalScore,_that.answers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String testId,  DateTime completedAt,  int totalScore,  Map<String, String> answers)  $default,) {final _that = this;
switch (_that) {
case _TestResult():
return $default(_that.testId,_that.completedAt,_that.totalScore,_that.answers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String testId,  DateTime completedAt,  int totalScore,  Map<String, String> answers)?  $default,) {final _that = this;
switch (_that) {
case _TestResult() when $default != null:
return $default(_that.testId,_that.completedAt,_that.totalScore,_that.answers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TestResult extends TestResult {
  const _TestResult({required this.testId, required this.completedAt, required this.totalScore, required final  Map<String, String> answers}): _answers = answers,super._();
  factory _TestResult.fromJson(Map<String, dynamic> json) => _$TestResultFromJson(json);

@override final  String testId;
@override final  DateTime completedAt;
@override final  int totalScore;
 final  Map<String, String> _answers;
@override Map<String, String> get answers {
  if (_answers is EqualUnmodifiableMapView) return _answers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_answers);
}


/// Create a copy of TestResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestResultCopyWith<_TestResult> get copyWith => __$TestResultCopyWithImpl<_TestResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TestResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestResult&&(identical(other.testId, testId) || other.testId == testId)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.totalScore, totalScore) || other.totalScore == totalScore)&&const DeepCollectionEquality().equals(other._answers, _answers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,testId,completedAt,totalScore,const DeepCollectionEquality().hash(_answers));

@override
String toString() {
  return 'TestResult(testId: $testId, completedAt: $completedAt, totalScore: $totalScore, answers: $answers)';
}


}

/// @nodoc
abstract mixin class _$TestResultCopyWith<$Res> implements $TestResultCopyWith<$Res> {
  factory _$TestResultCopyWith(_TestResult value, $Res Function(_TestResult) _then) = __$TestResultCopyWithImpl;
@override @useResult
$Res call({
 String testId, DateTime completedAt, int totalScore, Map<String, String> answers
});




}
/// @nodoc
class __$TestResultCopyWithImpl<$Res>
    implements _$TestResultCopyWith<$Res> {
  __$TestResultCopyWithImpl(this._self, this._then);

  final _TestResult _self;
  final $Res Function(_TestResult) _then;

/// Create a copy of TestResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? testId = null,Object? completedAt = null,Object? totalScore = null,Object? answers = null,}) {
  return _then(_TestResult(
testId: null == testId ? _self.testId : testId // ignore: cast_nullable_to_non_nullable
as String,completedAt: null == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime,totalScore: null == totalScore ? _self.totalScore : totalScore // ignore: cast_nullable_to_non_nullable
as int,answers: null == answers ? _self._answers : answers // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}


/// @nodoc
mixin _$TestAnswer {

 String get questionId; String get answerId; int get score;
/// Create a copy of TestAnswer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestAnswerCopyWith<TestAnswer> get copyWith => _$TestAnswerCopyWithImpl<TestAnswer>(this as TestAnswer, _$identity);

  /// Serializes this TestAnswer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestAnswer&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.answerId, answerId) || other.answerId == answerId)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,questionId,answerId,score);

@override
String toString() {
  return 'TestAnswer(questionId: $questionId, answerId: $answerId, score: $score)';
}


}

/// @nodoc
abstract mixin class $TestAnswerCopyWith<$Res>  {
  factory $TestAnswerCopyWith(TestAnswer value, $Res Function(TestAnswer) _then) = _$TestAnswerCopyWithImpl;
@useResult
$Res call({
 String questionId, String answerId, int score
});




}
/// @nodoc
class _$TestAnswerCopyWithImpl<$Res>
    implements $TestAnswerCopyWith<$Res> {
  _$TestAnswerCopyWithImpl(this._self, this._then);

  final TestAnswer _self;
  final $Res Function(TestAnswer) _then;

/// Create a copy of TestAnswer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questionId = null,Object? answerId = null,Object? score = null,}) {
  return _then(_self.copyWith(
questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as String,answerId: null == answerId ? _self.answerId : answerId // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TestAnswer].
extension TestAnswerPatterns on TestAnswer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestAnswer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestAnswer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestAnswer value)  $default,){
final _that = this;
switch (_that) {
case _TestAnswer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestAnswer value)?  $default,){
final _that = this;
switch (_that) {
case _TestAnswer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String questionId,  String answerId,  int score)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestAnswer() when $default != null:
return $default(_that.questionId,_that.answerId,_that.score);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String questionId,  String answerId,  int score)  $default,) {final _that = this;
switch (_that) {
case _TestAnswer():
return $default(_that.questionId,_that.answerId,_that.score);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String questionId,  String answerId,  int score)?  $default,) {final _that = this;
switch (_that) {
case _TestAnswer() when $default != null:
return $default(_that.questionId,_that.answerId,_that.score);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TestAnswer extends TestAnswer {
  const _TestAnswer({required this.questionId, required this.answerId, required this.score}): super._();
  factory _TestAnswer.fromJson(Map<String, dynamic> json) => _$TestAnswerFromJson(json);

@override final  String questionId;
@override final  String answerId;
@override final  int score;

/// Create a copy of TestAnswer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestAnswerCopyWith<_TestAnswer> get copyWith => __$TestAnswerCopyWithImpl<_TestAnswer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TestAnswerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestAnswer&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.answerId, answerId) || other.answerId == answerId)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,questionId,answerId,score);

@override
String toString() {
  return 'TestAnswer(questionId: $questionId, answerId: $answerId, score: $score)';
}


}

/// @nodoc
abstract mixin class _$TestAnswerCopyWith<$Res> implements $TestAnswerCopyWith<$Res> {
  factory _$TestAnswerCopyWith(_TestAnswer value, $Res Function(_TestAnswer) _then) = __$TestAnswerCopyWithImpl;
@override @useResult
$Res call({
 String questionId, String answerId, int score
});




}
/// @nodoc
class __$TestAnswerCopyWithImpl<$Res>
    implements _$TestAnswerCopyWith<$Res> {
  __$TestAnswerCopyWithImpl(this._self, this._then);

  final _TestAnswer _self;
  final $Res Function(_TestAnswer) _then;

/// Create a copy of TestAnswer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questionId = null,Object? answerId = null,Object? score = null,}) {
  return _then(_TestAnswer(
questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as String,answerId: null == answerId ? _self.answerId : answerId // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
