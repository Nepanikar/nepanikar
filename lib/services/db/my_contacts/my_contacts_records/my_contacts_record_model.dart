import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_contacts_record_model.freezed.dart';
part 'my_contacts_record_model.g.dart';

@freezed
class MyContactRecord with _$MyContactRecord {
  const factory MyContactRecord({
    required String name,
    required String contactAddress,
  }) = _MyContactRecord;

  const MyContactRecord._();

  factory MyContactRecord.fromJson(Map<String, Object?> json) => _$MyContactRecordFromJson(json);
}
