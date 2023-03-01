import 'package:flutter/material.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/helpers/contact_action_helpers.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';

class ChatContactTile extends StatelessWidget {
  const ChatContactTile({
    super.key,
    required this.chatContact,
  });

  final ChatContact chatContact;

  TextStyle get _textTextStyle => NepanikarFonts.bodyBlack;

  TextStyle get _descriptionChatTextStyle => NepanikarFonts.bodyRoman;

  TextStyle get _charUrlTextStyle => NepanikarFonts.bodyBlack.copyWith(
        color: NepanikarColors.primary,
      );

  String _getShortUrlLink(String fullUrl) => Uri.tryParse(fullUrl)?.host ?? fullUrl;

  @override
  Widget build(BuildContext context) {
    return chatContact.map(
      subList: (c) => _buildSubListContact(context, c),
    );
  }

  Widget _buildSubListContact(BuildContext context, ChatContactSubList contact) {
    final subContactsLength = contact.subChatContacts.length;
    final isSingleSubList = subContactsLength == 1;
    return GestureDetector(
      onTap: isSingleSubList ? () async => launchUrLink(contact.subChatContacts.first.url) : null,
      onLongPress: isSingleSubList
          ? () async => copyContact(context, contact.subChatContacts.first.url)
          : null,
      child: LongTile(
        text: contact.title,
        textTextStyle: _textTextStyle,
        description: contact.subtitle,
        descriptionTextStyle: _descriptionChatTextStyle,
        image: Assets.illustrations.contacts.chat.svg(),
        trailing: const SizedBox.shrink(),
        onTap: null,
        subContent: Column(
          children: contact.subChatContacts
              .map(
                (subContact) => ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (subContact.title.isNotEmpty)
                        Flexible(
                          flex: 2,
                          child: Padding(
                            padding: isSingleSubList
                                ? const EdgeInsets.symmetric(vertical: 12)
                                : EdgeInsets.zero,
                            child: Text(
                              subContact.title,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                      Flexible(
                        flex: 3,
                        child: Text(
                          _getShortUrlLink(subContact.url),
                          style: _charUrlTextStyle,
                        ),
                      ),
                    ],
                  ),
                  onTap: () async => launchUrLink(subContact.url),
                  onLongPress: () async => copyContact(context, subContact.url),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
