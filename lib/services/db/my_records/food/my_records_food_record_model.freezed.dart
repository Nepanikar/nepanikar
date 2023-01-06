// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'my_records_food_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FoodQuestionTextAnswer _$FoodQuestionTextAnswerFromJson(
    Map<String, dynamic> json) {
  return _FoodQuestionTextAnswer.fromJson(json);
}

/// @nodoc
mixin _$FoodQuestionTextAnswer {
  FoodQuestionText get foodQuestionText => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodQuestionTextAnswerCopyWith<FoodQuestionTextAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodQuestionTextAnswerCopyWith<$Res> {
  factory $FoodQuestionTextAnswerCopyWith(FoodQuestionTextAnswer value,
          $Res Function(FoodQuestionTextAnswer) then) =
      _$FoodQuestionTextAnswerCopyWithImpl<$Res, FoodQuestionTextAnswer>;
  @useResult
  $Res call({FoodQuestionText foodQuestionText, String answer});
}

/// @nodoc
class _$FoodQuestionTextAnswerCopyWithImpl<$Res,
        $Val extends FoodQuestionTextAnswer>
    implements $FoodQuestionTextAnswerCopyWith<$Res> {
  _$FoodQuestionTextAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodQuestionText = null,
    Object? answer = null,
  }) {
    return _then(_value.copyWith(
      foodQuestionText: null == foodQuestionText
          ? _value.foodQuestionText
          : foodQuestionText // ignore: cast_nullable_to_non_nullable
              as FoodQuestionText,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FoodQuestionTextAnswerCopyWith<$Res>
    implements $FoodQuestionTextAnswerCopyWith<$Res> {
  factory _$$_FoodQuestionTextAnswerCopyWith(_$_FoodQuestionTextAnswer value,
          $Res Function(_$_FoodQuestionTextAnswer) then) =
      __$$_FoodQuestionTextAnswerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FoodQuestionText foodQuestionText, String answer});
}

/// @nodoc
class __$$_FoodQuestionTextAnswerCopyWithImpl<$Res>
    extends _$FoodQuestionTextAnswerCopyWithImpl<$Res,
        _$_FoodQuestionTextAnswer>
    implements _$$_FoodQuestionTextAnswerCopyWith<$Res> {
  __$$_FoodQuestionTextAnswerCopyWithImpl(_$_FoodQuestionTextAnswer _value,
      $Res Function(_$_FoodQuestionTextAnswer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodQuestionText = null,
    Object? answer = null,
  }) {
    return _then(_$_FoodQuestionTextAnswer(
      foodQuestionText: null == foodQuestionText
          ? _value.foodQuestionText
          : foodQuestionText // ignore: cast_nullable_to_non_nullable
              as FoodQuestionText,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FoodQuestionTextAnswer extends _FoodQuestionTextAnswer {
  const _$_FoodQuestionTextAnswer(
      {required this.foodQuestionText, required this.answer})
      : super._();

  factory _$_FoodQuestionTextAnswer.fromJson(Map<String, dynamic> json) =>
      _$$_FoodQuestionTextAnswerFromJson(json);

  @override
  final FoodQuestionText foodQuestionText;
  @override
  final String answer;

  @override
  String toString() {
    return 'FoodQuestionTextAnswer(foodQuestionText: $foodQuestionText, answer: $answer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FoodQuestionTextAnswer &&
            (identical(other.foodQuestionText, foodQuestionText) ||
                other.foodQuestionText == foodQuestionText) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, foodQuestionText, answer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FoodQuestionTextAnswerCopyWith<_$_FoodQuestionTextAnswer> get copyWith =>
      __$$_FoodQuestionTextAnswerCopyWithImpl<_$_FoodQuestionTextAnswer>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FoodQuestionTextAnswerToJson(
      this,
    );
  }
}

abstract class _FoodQuestionTextAnswer extends FoodQuestionTextAnswer {
  const factory _FoodQuestionTextAnswer(
      {required final FoodQuestionText foodQuestionText,
      required final String answer}) = _$_FoodQuestionTextAnswer;
  const _FoodQuestionTextAnswer._() : super._();

  factory _FoodQuestionTextAnswer.fromJson(Map<String, dynamic> json) =
      _$_FoodQuestionTextAnswer.fromJson;

  @override
  FoodQuestionText get foodQuestionText;
  @override
  String get answer;
  @override
  @JsonKey(ignore: true)
  _$$_FoodQuestionTextAnswerCopyWith<_$_FoodQuestionTextAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyFoodRecordAnswer _$DailyFoodRecordAnswerFromJson(
    Map<String, dynamic> json) {
  return _DailyFoodRecordAnswer.fromJson(json);
}

/// @nodoc
mixin _$DailyFoodRecordAnswer {
  FoodType get foodType => throw _privateConstructorUsedError;
  bool get isTaken => throw _privateConstructorUsedError;
  List<FoodQuestionTextAnswer> get questionTextAnswers =>
      throw _privateConstructorUsedError;
  List<FoodQuestionFeel> get tickedQuestionFeels =>
      throw _privateConstructorUsedError;
  List<FoodQuestionProblem> get tickedQuestionProblems =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyFoodRecordAnswerCopyWith<DailyFoodRecordAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyFoodRecordAnswerCopyWith<$Res> {
  factory $DailyFoodRecordAnswerCopyWith(DailyFoodRecordAnswer value,
          $Res Function(DailyFoodRecordAnswer) then) =
      _$DailyFoodRecordAnswerCopyWithImpl<$Res, DailyFoodRecordAnswer>;
  @useResult
  $Res call(
      {FoodType foodType,
      bool isTaken,
      List<FoodQuestionTextAnswer> questionTextAnswers,
      List<FoodQuestionFeel> tickedQuestionFeels,
      List<FoodQuestionProblem> tickedQuestionProblems});
}

/// @nodoc
class _$DailyFoodRecordAnswerCopyWithImpl<$Res,
        $Val extends DailyFoodRecordAnswer>
    implements $DailyFoodRecordAnswerCopyWith<$Res> {
  _$DailyFoodRecordAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodType = null,
    Object? isTaken = null,
    Object? questionTextAnswers = null,
    Object? tickedQuestionFeels = null,
    Object? tickedQuestionProblems = null,
  }) {
    return _then(_value.copyWith(
      foodType: null == foodType
          ? _value.foodType
          : foodType // ignore: cast_nullable_to_non_nullable
              as FoodType,
      isTaken: null == isTaken
          ? _value.isTaken
          : isTaken // ignore: cast_nullable_to_non_nullable
              as bool,
      questionTextAnswers: null == questionTextAnswers
          ? _value.questionTextAnswers
          : questionTextAnswers // ignore: cast_nullable_to_non_nullable
              as List<FoodQuestionTextAnswer>,
      tickedQuestionFeels: null == tickedQuestionFeels
          ? _value.tickedQuestionFeels
          : tickedQuestionFeels // ignore: cast_nullable_to_non_nullable
              as List<FoodQuestionFeel>,
      tickedQuestionProblems: null == tickedQuestionProblems
          ? _value.tickedQuestionProblems
          : tickedQuestionProblems // ignore: cast_nullable_to_non_nullable
              as List<FoodQuestionProblem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DailyFoodRecordAnswerCopyWith<$Res>
    implements $DailyFoodRecordAnswerCopyWith<$Res> {
  factory _$$_DailyFoodRecordAnswerCopyWith(_$_DailyFoodRecordAnswer value,
          $Res Function(_$_DailyFoodRecordAnswer) then) =
      __$$_DailyFoodRecordAnswerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FoodType foodType,
      bool isTaken,
      List<FoodQuestionTextAnswer> questionTextAnswers,
      List<FoodQuestionFeel> tickedQuestionFeels,
      List<FoodQuestionProblem> tickedQuestionProblems});
}

/// @nodoc
class __$$_DailyFoodRecordAnswerCopyWithImpl<$Res>
    extends _$DailyFoodRecordAnswerCopyWithImpl<$Res, _$_DailyFoodRecordAnswer>
    implements _$$_DailyFoodRecordAnswerCopyWith<$Res> {
  __$$_DailyFoodRecordAnswerCopyWithImpl(_$_DailyFoodRecordAnswer _value,
      $Res Function(_$_DailyFoodRecordAnswer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodType = null,
    Object? isTaken = null,
    Object? questionTextAnswers = null,
    Object? tickedQuestionFeels = null,
    Object? tickedQuestionProblems = null,
  }) {
    return _then(_$_DailyFoodRecordAnswer(
      foodType: null == foodType
          ? _value.foodType
          : foodType // ignore: cast_nullable_to_non_nullable
              as FoodType,
      isTaken: null == isTaken
          ? _value.isTaken
          : isTaken // ignore: cast_nullable_to_non_nullable
              as bool,
      questionTextAnswers: null == questionTextAnswers
          ? _value._questionTextAnswers
          : questionTextAnswers // ignore: cast_nullable_to_non_nullable
              as List<FoodQuestionTextAnswer>,
      tickedQuestionFeels: null == tickedQuestionFeels
          ? _value._tickedQuestionFeels
          : tickedQuestionFeels // ignore: cast_nullable_to_non_nullable
              as List<FoodQuestionFeel>,
      tickedQuestionProblems: null == tickedQuestionProblems
          ? _value._tickedQuestionProblems
          : tickedQuestionProblems // ignore: cast_nullable_to_non_nullable
              as List<FoodQuestionProblem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DailyFoodRecordAnswer extends _DailyFoodRecordAnswer {
  const _$_DailyFoodRecordAnswer(
      {required this.foodType,
      this.isTaken = false,
      final List<FoodQuestionTextAnswer> questionTextAnswers = const [],
      final List<FoodQuestionFeel> tickedQuestionFeels = const [],
      final List<FoodQuestionProblem> tickedQuestionProblems = const []})
      : _questionTextAnswers = questionTextAnswers,
        _tickedQuestionFeels = tickedQuestionFeels,
        _tickedQuestionProblems = tickedQuestionProblems,
        super._();

  factory _$_DailyFoodRecordAnswer.fromJson(Map<String, dynamic> json) =>
      _$$_DailyFoodRecordAnswerFromJson(json);

  @override
  final FoodType foodType;
  @override
  @JsonKey()
  final bool isTaken;
  final List<FoodQuestionTextAnswer> _questionTextAnswers;
  @override
  @JsonKey()
  List<FoodQuestionTextAnswer> get questionTextAnswers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questionTextAnswers);
  }

  final List<FoodQuestionFeel> _tickedQuestionFeels;
  @override
  @JsonKey()
  List<FoodQuestionFeel> get tickedQuestionFeels {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tickedQuestionFeels);
  }

  final List<FoodQuestionProblem> _tickedQuestionProblems;
  @override
  @JsonKey()
  List<FoodQuestionProblem> get tickedQuestionProblems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tickedQuestionProblems);
  }

  @override
  String toString() {
    return 'DailyFoodRecordAnswer(foodType: $foodType, isTaken: $isTaken, questionTextAnswers: $questionTextAnswers, tickedQuestionFeels: $tickedQuestionFeels, tickedQuestionProblems: $tickedQuestionProblems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DailyFoodRecordAnswer &&
            (identical(other.foodType, foodType) ||
                other.foodType == foodType) &&
            (identical(other.isTaken, isTaken) || other.isTaken == isTaken) &&
            const DeepCollectionEquality()
                .equals(other._questionTextAnswers, _questionTextAnswers) &&
            const DeepCollectionEquality()
                .equals(other._tickedQuestionFeels, _tickedQuestionFeels) &&
            const DeepCollectionEquality().equals(
                other._tickedQuestionProblems, _tickedQuestionProblems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      foodType,
      isTaken,
      const DeepCollectionEquality().hash(_questionTextAnswers),
      const DeepCollectionEquality().hash(_tickedQuestionFeels),
      const DeepCollectionEquality().hash(_tickedQuestionProblems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DailyFoodRecordAnswerCopyWith<_$_DailyFoodRecordAnswer> get copyWith =>
      __$$_DailyFoodRecordAnswerCopyWithImpl<_$_DailyFoodRecordAnswer>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DailyFoodRecordAnswerToJson(
      this,
    );
  }
}

abstract class _DailyFoodRecordAnswer extends DailyFoodRecordAnswer {
  const factory _DailyFoodRecordAnswer(
          {required final FoodType foodType,
          final bool isTaken,
          final List<FoodQuestionTextAnswer> questionTextAnswers,
          final List<FoodQuestionFeel> tickedQuestionFeels,
          final List<FoodQuestionProblem> tickedQuestionProblems}) =
      _$_DailyFoodRecordAnswer;
  const _DailyFoodRecordAnswer._() : super._();

  factory _DailyFoodRecordAnswer.fromJson(Map<String, dynamic> json) =
      _$_DailyFoodRecordAnswer.fromJson;

  @override
  FoodType get foodType;
  @override
  bool get isTaken;
  @override
  List<FoodQuestionTextAnswer> get questionTextAnswers;
  @override
  List<FoodQuestionFeel> get tickedQuestionFeels;
  @override
  List<FoodQuestionProblem> get tickedQuestionProblems;
  @override
  @JsonKey(ignore: true)
  _$$_DailyFoodRecordAnswerCopyWith<_$_DailyFoodRecordAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyFoodRecord _$DailyFoodRecordFromJson(Map<String, dynamic> json) {
  return _DailyFoodRecord.fromJson(json);
}

/// @nodoc
mixin _$DailyFoodRecord {
// ignore: invalid_annotation_target
  @JsonKey(name: FilterKeys.dateWithTime)
  DateTime get dateTime => throw _privateConstructorUsedError;
  List<DailyFoodRecordAnswer> get answers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyFoodRecordCopyWith<DailyFoodRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyFoodRecordCopyWith<$Res> {
  factory $DailyFoodRecordCopyWith(
          DailyFoodRecord value, $Res Function(DailyFoodRecord) then) =
      _$DailyFoodRecordCopyWithImpl<$Res, DailyFoodRecord>;
  @useResult
  $Res call(
      {@JsonKey(name: FilterKeys.dateWithTime) DateTime dateTime,
      List<DailyFoodRecordAnswer> answers});
}

/// @nodoc
class _$DailyFoodRecordCopyWithImpl<$Res, $Val extends DailyFoodRecord>
    implements $DailyFoodRecordCopyWith<$Res> {
  _$DailyFoodRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? answers = null,
  }) {
    return _then(_value.copyWith(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<DailyFoodRecordAnswer>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DailyFoodRecordCopyWith<$Res>
    implements $DailyFoodRecordCopyWith<$Res> {
  factory _$$_DailyFoodRecordCopyWith(
          _$_DailyFoodRecord value, $Res Function(_$_DailyFoodRecord) then) =
      __$$_DailyFoodRecordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: FilterKeys.dateWithTime) DateTime dateTime,
      List<DailyFoodRecordAnswer> answers});
}

/// @nodoc
class __$$_DailyFoodRecordCopyWithImpl<$Res>
    extends _$DailyFoodRecordCopyWithImpl<$Res, _$_DailyFoodRecord>
    implements _$$_DailyFoodRecordCopyWith<$Res> {
  __$$_DailyFoodRecordCopyWithImpl(
      _$_DailyFoodRecord _value, $Res Function(_$_DailyFoodRecord) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? answers = null,
  }) {
    return _then(_$_DailyFoodRecord(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<DailyFoodRecordAnswer>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DailyFoodRecord extends _DailyFoodRecord {
  const _$_DailyFoodRecord(
      {@JsonKey(name: FilterKeys.dateWithTime) required this.dateTime,
      required final List<DailyFoodRecordAnswer> answers})
      : _answers = answers,
        super._();

  factory _$_DailyFoodRecord.fromJson(Map<String, dynamic> json) =>
      _$$_DailyFoodRecordFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: FilterKeys.dateWithTime)
  final DateTime dateTime;
  final List<DailyFoodRecordAnswer> _answers;
  @override
  List<DailyFoodRecordAnswer> get answers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  String toString() {
    return 'DailyFoodRecord(dateTime: $dateTime, answers: $answers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DailyFoodRecord &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, dateTime, const DeepCollectionEquality().hash(_answers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DailyFoodRecordCopyWith<_$_DailyFoodRecord> get copyWith =>
      __$$_DailyFoodRecordCopyWithImpl<_$_DailyFoodRecord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DailyFoodRecordToJson(
      this,
    );
  }
}

abstract class _DailyFoodRecord extends DailyFoodRecord {
  const factory _DailyFoodRecord(
      {@JsonKey(name: FilterKeys.dateWithTime) required final DateTime dateTime,
      required final List<DailyFoodRecordAnswer> answers}) = _$_DailyFoodRecord;
  const _DailyFoodRecord._() : super._();

  factory _DailyFoodRecord.fromJson(Map<String, dynamic> json) =
      _$_DailyFoodRecord.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: FilterKeys.dateWithTime)
  DateTime get dateTime;
  @override
  List<DailyFoodRecordAnswer> get answers;
  @override
  @JsonKey(ignore: true)
  _$$_DailyFoodRecordCopyWith<_$_DailyFoodRecord> get copyWith =>
      throw _privateConstructorUsedError;
}
