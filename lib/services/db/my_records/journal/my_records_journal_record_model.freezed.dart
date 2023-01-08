// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'my_records_journal_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JournalRecordAnswer _$JournalRecordAnswerFromJson(Map<String, dynamic> json) {
  return _JournalRecordAnswer.fromJson(json);
}

/// @nodoc
mixin _$JournalRecordAnswer {
  JournalQuestion get question => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JournalRecordAnswerCopyWith<JournalRecordAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalRecordAnswerCopyWith<$Res> {
  factory $JournalRecordAnswerCopyWith(
          JournalRecordAnswer value, $Res Function(JournalRecordAnswer) then) =
      _$JournalRecordAnswerCopyWithImpl<$Res, JournalRecordAnswer>;
  @useResult
  $Res call({JournalQuestion question, String answer});
}

/// @nodoc
class _$JournalRecordAnswerCopyWithImpl<$Res, $Val extends JournalRecordAnswer>
    implements $JournalRecordAnswerCopyWith<$Res> {
  _$JournalRecordAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answer = null,
  }) {
    return _then(_value.copyWith(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as JournalQuestion,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_JournalRecordAnswerCopyWith<$Res>
    implements $JournalRecordAnswerCopyWith<$Res> {
  factory _$$_JournalRecordAnswerCopyWith(_$_JournalRecordAnswer value,
          $Res Function(_$_JournalRecordAnswer) then) =
      __$$_JournalRecordAnswerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({JournalQuestion question, String answer});
}

/// @nodoc
class __$$_JournalRecordAnswerCopyWithImpl<$Res>
    extends _$JournalRecordAnswerCopyWithImpl<$Res, _$_JournalRecordAnswer>
    implements _$$_JournalRecordAnswerCopyWith<$Res> {
  __$$_JournalRecordAnswerCopyWithImpl(_$_JournalRecordAnswer _value,
      $Res Function(_$_JournalRecordAnswer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = null,
    Object? answer = null,
  }) {
    return _then(_$_JournalRecordAnswer(
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as JournalQuestion,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JournalRecordAnswer extends _JournalRecordAnswer {
  const _$_JournalRecordAnswer({required this.question, required this.answer})
      : super._();

  factory _$_JournalRecordAnswer.fromJson(Map<String, dynamic> json) =>
      _$$_JournalRecordAnswerFromJson(json);

  @override
  final JournalQuestion question;
  @override
  final String answer;

  @override
  String toString() {
    return 'JournalRecordAnswer(question: $question, answer: $answer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JournalRecordAnswer &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, question, answer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JournalRecordAnswerCopyWith<_$_JournalRecordAnswer> get copyWith =>
      __$$_JournalRecordAnswerCopyWithImpl<_$_JournalRecordAnswer>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JournalRecordAnswerToJson(
      this,
    );
  }
}

abstract class _JournalRecordAnswer extends JournalRecordAnswer {
  const factory _JournalRecordAnswer(
      {required final JournalQuestion question,
      required final String answer}) = _$_JournalRecordAnswer;
  const _JournalRecordAnswer._() : super._();

  factory _JournalRecordAnswer.fromJson(Map<String, dynamic> json) =
      _$_JournalRecordAnswer.fromJson;

  @override
  JournalQuestion get question;
  @override
  String get answer;
  @override
  @JsonKey(ignore: true)
  _$$_JournalRecordAnswerCopyWith<_$_JournalRecordAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

JournalRecord _$JournalRecordFromJson(Map<String, dynamic> json) {
  return _JournalRecord.fromJson(json);
}

/// @nodoc
mixin _$JournalRecord {
// ignore: invalid_annotation_target
  @JsonKey(name: FilterKeys.dateWithTime)
  DateTime get dateTime => throw _privateConstructorUsedError;
  List<JournalRecordAnswer> get answers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JournalRecordCopyWith<JournalRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JournalRecordCopyWith<$Res> {
  factory $JournalRecordCopyWith(
          JournalRecord value, $Res Function(JournalRecord) then) =
      _$JournalRecordCopyWithImpl<$Res, JournalRecord>;
  @useResult
  $Res call(
      {@JsonKey(name: FilterKeys.dateWithTime) DateTime dateTime,
      List<JournalRecordAnswer> answers});
}

/// @nodoc
class _$JournalRecordCopyWithImpl<$Res, $Val extends JournalRecord>
    implements $JournalRecordCopyWith<$Res> {
  _$JournalRecordCopyWithImpl(this._value, this._then);

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
              as List<JournalRecordAnswer>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_JournalRecordCopyWith<$Res>
    implements $JournalRecordCopyWith<$Res> {
  factory _$$_JournalRecordCopyWith(
          _$_JournalRecord value, $Res Function(_$_JournalRecord) then) =
      __$$_JournalRecordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: FilterKeys.dateWithTime) DateTime dateTime,
      List<JournalRecordAnswer> answers});
}

/// @nodoc
class __$$_JournalRecordCopyWithImpl<$Res>
    extends _$JournalRecordCopyWithImpl<$Res, _$_JournalRecord>
    implements _$$_JournalRecordCopyWith<$Res> {
  __$$_JournalRecordCopyWithImpl(
      _$_JournalRecord _value, $Res Function(_$_JournalRecord) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? answers = null,
  }) {
    return _then(_$_JournalRecord(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<JournalRecordAnswer>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JournalRecord extends _JournalRecord {
  const _$_JournalRecord(
      {@JsonKey(name: FilterKeys.dateWithTime) required this.dateTime,
      required final List<JournalRecordAnswer> answers})
      : _answers = answers,
        super._();

  factory _$_JournalRecord.fromJson(Map<String, dynamic> json) =>
      _$$_JournalRecordFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: FilterKeys.dateWithTime)
  final DateTime dateTime;
  final List<JournalRecordAnswer> _answers;
  @override
  List<JournalRecordAnswer> get answers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  String toString() {
    return 'JournalRecord(dateTime: $dateTime, answers: $answers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JournalRecord &&
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
  _$$_JournalRecordCopyWith<_$_JournalRecord> get copyWith =>
      __$$_JournalRecordCopyWithImpl<_$_JournalRecord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JournalRecordToJson(
      this,
    );
  }
}

abstract class _JournalRecord extends JournalRecord {
  const factory _JournalRecord(
      {@JsonKey(name: FilterKeys.dateWithTime) required final DateTime dateTime,
      required final List<JournalRecordAnswer> answers}) = _$_JournalRecord;
  const _JournalRecord._() : super._();

  factory _JournalRecord.fromJson(Map<String, dynamic> json) =
      _$_JournalRecord.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(name: FilterKeys.dateWithTime)
  DateTime get dateTime;
  @override
  List<JournalRecordAnswer> get answers;
  @override
  @JsonKey(ignore: true)
  _$$_JournalRecordCopyWith<_$_JournalRecord> get copyWith =>
      throw _privateConstructorUsedError;
}
