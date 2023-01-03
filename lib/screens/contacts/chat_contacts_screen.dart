import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/app_constants.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/helpers/contact_action_helpers.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/utils/contacts_data_manager.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';
import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';

class ChatContactsRoute extends GoRouteData {
  const ChatContactsRoute();

  ContactsDataManager get _contactsManager => registry.get<ContactsDataManager>();

  UserSettingsDao get _userSettingsDao => registry.get<UserSettingsDao>();

  @override
  Widget build(BuildContext context, _) {
    final locale = _userSettingsDao.locale;
    final chatContacts = _contactsManager.getContactsFromLocale(locale).chatContacts;
    return ChatContactsScreen(
      appBarTitle: context.l10n.universities,
      chatContacts: chatContacts ?? [],
    );
  }
}

class ChatContactsScreen extends StatelessWidget {
  const ChatContactsScreen({
    super.key,
    required this.appBarTitle,
    required this.chatContacts,
  });

  final String appBarTitle;
  final List<ChatContact> chatContacts;

  @override
  Widget build(BuildContext context) {
    final linkifiedTextStyle = NepanikarFonts.bodyBlack.copyWith(
      color: NepanikarColors.primary,
      decoration: TextDecoration.underline,
      fontSize: 17,
    );

    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.chat,
      isModuleList: false,
      // TODO: description
      appBarDescription: AppConstants.loremIpsumShort,
      isCardStackLayout: true,
      children: [
        ...chatContacts.map((contact) {
          final urlLink = contact.url;
          final displayText = contact.name ?? Uri.tryParse(urlLink)?.host ?? urlLink;

          return Align(
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () async => launchUrLink(urlLink),
                        onLongPress: () async => copyContact(context, urlLink),
                        child: Text(displayText, style: linkifiedTextStyle),
                      ),
                    ),
                  ],
                ),
                style: linkifiedTextStyle,
              ),
            ),
          );
        }),
      ],
    );
  }
}
