// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChecklistItem _$ChecklistItemFromJson(Map<String, dynamic> json) =>
    _ChecklistItem(
      text: json['text'] as String,
      isChecked: json['isChecked'] as bool? ?? false,
    );

Map<String, dynamic> _$ChecklistItemToJson(_ChecklistItem instance) =>
    <String, dynamic>{'text': instance.text, 'isChecked': instance.isChecked};
