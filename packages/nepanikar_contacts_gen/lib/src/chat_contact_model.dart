import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_contact_model.freezed.dart';

part 'chat_contact_model.g.dart';

@freezed
class ChatContact with _$ChatContact {
  const factory ChatContact({
    required String title,
    String? subtitle,
  }) = _ChatContact;

  const ChatContact._();

  factory ChatContact.fromJson(Map<String, Object?> json) => _$ChatContactFromJson(json);
}
