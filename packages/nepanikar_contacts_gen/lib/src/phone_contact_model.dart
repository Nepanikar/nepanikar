import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_contact_model.freezed.dart';
part 'phone_contact_model.g.dart';

@freezed
class PhoneContact with _$PhoneContact {
  const factory PhoneContact({
    @Default(false) bool pinned,
    required String title,
    required String tel,
    String? subtitle,
  }) = PhoneContactSingle;

  const PhoneContact._();

  const factory PhoneContact.subList({
    required String title,
    String? subtitle,
    required List<SubPhoneContact> subPhoneContacts,
  }) = PhoneContactSubList;

  factory PhoneContact.fromJson(Map<String, Object?> json) => _$PhoneContactFromJson(json);
}

@freezed
class SubPhoneContact with _$SubPhoneContact {
  const factory SubPhoneContact({
    required String title,
    required String tel,
    @Default(SubPhoneContactAction.phone) SubPhoneContactAction action,
  }) = _SubPhoneContact;

  const SubPhoneContact._();

  factory SubPhoneContact.fromJson(Map<String, Object?> json) => _$SubPhoneContactFromJson(json);

  String get unformattedTel => tel.unformatPhoneNum();
}

enum SubPhoneContactAction {
  phone,
  whatsApp;
}

extension PhoneContactSingleExt on PhoneContactSingle {
  String get unformattedTel => tel.unformatPhoneNum();
}

extension PhoneContactNumExt on String {
  String unformatPhoneNum() => replaceAll(' ', '');
}
