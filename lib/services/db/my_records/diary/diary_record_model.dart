import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nepanikar/services/db/filters.dart';

part 'diary_record_model.freezed.dart';
part 'diary_record_model.g.dart';

@freezed
class DiaryRecord with _$DiaryRecord {
  const factory DiaryRecord({
    // ignore: invalid_annotation_target
    @JsonKey(name: FilterKeys.dateWithTime) required DateTime dateTime,
    required String title,
    required String text,
  }) = _DiaryRecord;

  const DiaryRecord._();

  factory DiaryRecord.fromJson(Map<String, Object?> json) => _$DiaryRecordFromJson(json);
}
