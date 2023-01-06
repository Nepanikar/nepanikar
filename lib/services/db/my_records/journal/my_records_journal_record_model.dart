import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nepanikar/services/db/filters.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

part 'my_records_journal_record_model.freezed.dart';
part 'my_records_journal_record_model.g.dart';

@freezed
class JournalRecordAnswer with _$JournalRecordAnswer {
  const factory JournalRecordAnswer({
    required JournalQuestion question,
    required String answer,
  }) = _JournalRecordAnswer;

  const JournalRecordAnswer._();

  factory JournalRecordAnswer.fromJson(Map<String, Object?> json) =>
      _$JournalRecordAnswerFromJson(json);
}

@freezed
class JournalRecord with _$JournalRecord {
  const factory JournalRecord({
    // ignore: invalid_annotation_target
    @JsonKey(name: FilterKeys.dateWithTime) required DateTime dateTime,
    required List<JournalRecordAnswer> answers,
  }) = _JournalRecord;

  const JournalRecord._();

  factory JournalRecord.fromJson(Map<String, Object?> json) => _$JournalRecordFromJson(json);
}
