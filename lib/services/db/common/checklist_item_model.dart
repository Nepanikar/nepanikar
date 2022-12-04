import 'package:freezed_annotation/freezed_annotation.dart';

part 'checklist_item_model.freezed.dart';
part 'checklist_item_model.g.dart';

@freezed
class ChecklistItem with _$ChecklistItem {
  const factory ChecklistItem({
    required String text,
    @Default(false) bool isChecked,
  }) = _ChecklistItem;

  const ChecklistItem._();

  factory ChecklistItem.fromJson(Map<String, Object?> json) => _$ChecklistItemFromJson(json);
}
