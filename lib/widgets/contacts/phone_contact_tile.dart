import 'package:flutter/material.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/helpers/contact_action_helpers.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';

class PhoneContactTile extends StatelessWidget {
  const PhoneContactTile({
    super.key,
    required this.phoneContact,
  });

  final PhoneContact phoneContact;

  TextStyle get _textTextStyle => NepanikarFonts.bodyBlack;

  TextStyle get _descriptionNumTextStyle => NepanikarFonts.bodyRoman;

  TextStyle get _phoneNumTextStyle => NepanikarFonts.bodyBlack.copyWith(
        color: NepanikarColors.primary,
      );

  @override
  Widget build(BuildContext context) {
    return phoneContact.map(
      (c) => _buildSingleContact(context, c),
      subList: (c) => _buildSubListContact(context, c),
    );
  }

  Widget _buildSingleContact(BuildContext context, PhoneContactSingle contact) {
    final isPinned = contact.pinned;
    final textColor = isPinned ? Colors.white : null;
    return LongTile(
      text: contact.title,
      textTextStyle: _textTextStyle.copyWith(color: textColor),
      description: contact.subtitle,
      descriptionTextStyle: _descriptionNumTextStyle.copyWith(color: textColor),
      image: Assets.illustrations.contacts.phones.svg(color: textColor),
      trailing: Text(
        contact.formattedPhoneNumber,
        style: _phoneNumTextStyle.copyWith(color: textColor),
      ),
      backgroundColor: isPinned ? NepanikarColors.secondary : null,
      onTap: () async => launchPhoneNum(contact.number),
      onLongPress: () async => copyPhoneNum(context, contact.number),
    );
  }

  Widget _buildSubListContact(BuildContext context, PhoneContactSubList contact) {
    return LongTile(
      text: contact.title,
      textTextStyle: _textTextStyle,
      description: contact.subtitle,
      descriptionTextStyle: _descriptionNumTextStyle,
      image: Assets.illustrations.contacts.phones.svg(),
      trailing: const SizedBox.shrink(),
      onTap: null,
      subContent: Column(
        children: contact.subPhoneContacts
            .map(
              (subContact) => ListTile(
                leading: Text(subContact.title),
                trailing: Text(subContact.formattedPhoneNumber, style: _phoneNumTextStyle),
                onTap: () async => launchPhoneNum(subContact.number),
                onLongPress: () async => copyPhoneNum(context, subContact.number),
              ),
            )
            .toList(),
      ),
    );
  }
}
