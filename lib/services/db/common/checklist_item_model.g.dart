// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChecklistItem _$$_ChecklistItemFromJson(Map<String, dynamic> json) =>
    _$_ChecklistItem(
      text: json['text'] as String,
      isChecked: json['isChecked'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ChecklistItemToJson(_$_ChecklistItem instance) =>
    <String, dynamic>{
      'text': instance.text,
      'isChecked': instance.isChecked,
    };
