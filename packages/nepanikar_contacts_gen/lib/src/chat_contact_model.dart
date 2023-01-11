import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_contact_model.freezed.dart';
part 'chat_contact_model.g.dart';

@freezed
class ChatContact with _$ChatContact {
  const factory ChatContact({
    @Default(false) bool pinned,
    required String title,
    required String url,
    String? subtitle,
  }) = ChatContactSingle;

  const ChatContact._();

  const factory ChatContact.subList({
    required String title,
    String? subtitle,
    required List<SubChatContact> subChatContacts,
  }) = ChatContactSubList;

  factory ChatContact.fromJson(Map<String, Object?> json) => _$ChatContactFromJson(json);
}

@freezed
class SubChatContact with _$SubChatContact {
  const factory SubChatContact({
    required String title,
    required String url,
  }) = _SubChatContact;

  const SubChatContact._();

  factory SubChatContact.fromJson(Map<String, Object?> json) => _$SubChatContactFromJson(json);
}
