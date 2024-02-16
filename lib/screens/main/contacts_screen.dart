import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/app_constants.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/helpers/contact_action_helpers.dart';
import 'package:nepanikar/screens/contacts/chat_contacts_screen.dart';
import 'package:nepanikar/screens/contacts/crisis_message_screen.dart';
import 'package:nepanikar/screens/contacts/email_counselling_screen.dart';
import 'package:nepanikar/screens/contacts/my_contacts_screen.dart';
import 'package:nepanikar/screens/contacts/phone_contacts_screen.dart';
import 'package:nepanikar/screens/contacts/region_contacts_screen.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/utils/contacts_data_manager.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';
import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';

class ContactsRoute extends GoRouteData {
  const ContactsRoute();

  ContactsDataManager get _contactsDataManager => registry.get<ContactsDataManager>();

  UserSettingsDao get _userSettingsDao => registry.get<UserSettingsDao>();

  @override
  Widget build(BuildContext context, _) {
    final locale = _userSettingsDao.locale;
    return ContactsScreen(
      countryContacts: _contactsDataManager.getContactsFromLocale(locale),
    );
  }
}

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({
    super.key,
    required this.countryContacts,
  });

  final CountryContacts countryContacts;

  @override
  Widget build(BuildContext context) {

    final currentTheme = Theme.of(context);
    final isDarkMode = currentTheme.brightness == Brightness.dark;
    final svgColor = svgColorBasedOnDarkMode(context);

    final locale = Localizations.localeOf(context);

    final modules = <Widget>[
      LongTile(
        text: context.l10n.contacts_message,
        image: Assets.illustrations.contacts.phones.svg(color: Colors.white),
        textTextStyle: NepanikarFonts.bodyHeavy.copyWith(color: Colors.white),
        backgroundColor: NepanikarColors.secondary,
        trailing:
            Assets.icons.navigation.arrowRight.svg(width: 16, height: 16, color: Colors.white),
        onTap: () => context.push(const CrisisMessageRoute().location),
        isDarkMode: isDarkMode,
      ),
      if (countryContacts.phoneContacts != null)
        LongTile(
          text: context.l10n.phone,
          image: Assets.illustrations.contacts.phones.svg(color: svgColor),
          onTap: () => context.push(const PhoneContactsRoute().location),
          isDarkMode: isDarkMode,
        ),
      if (countryContacts.crisisCenterContacts != null)
        LongTile(
          text: context.l10n.center,
          image: Assets.illustrations.contacts.crisisCenters.svg(color: svgColor),
          onTap: () => context.push(const CrisisCenterContactsRoute().location),
          isDarkMode: isDarkMode,
        ),
      if (countryContacts.chatContacts != null)
        LongTile(
          text: context.l10n.chat,
          image: Assets.illustrations.contacts.chat.svg(color: svgColor),
          onTap: () => context.push(const ChatContactsRoute().location),
          isDarkMode: isDarkMode,
        ),
      if (countryContacts.universityRegionContacts != null)
        LongTile(
          text: context.l10n.universities,
          image: Assets.illustrations.contacts.universities.svg(color: svgColor),
          onTap: () => context.push(const UniversityContactsRoute().location),
          isDarkMode: isDarkMode,
        ),
      LongTile(
        text: context.l10n.my_contacts,
        image: Assets.illustrations.contacts.myContacts.svg(color: svgColor),
        onTap: () => context.push(const MyContactsRecordsRoute().location),
        isDarkMode: isDarkMode,
      ),
      if ([NepanikarLanguages.cs.languageCode, NepanikarLanguages.sk.languageCode]
          .contains(locale.languageCode)) ...[
        LongTile(
          text: context.l10n.online_therapy,
          image: Assets.illustrations.modules.onlineTherapy.svg(color: svgColor),
          onTap: () => launchUrLink(AppConstants.nepanikarTherapyUrl),
          isDarkMode: isDarkMode,
        ),
        LongTile(
          text: context.l10n.email_consultation,
          image: Assets.illustrations.modules.emailHelp.svg(color: svgColor),
          onTap: () => context.push(
            const EmailCounsellingRoute().location,
            extra: CrisisMessageRouteExtraData(
              contactAddress: AppConstants.nepanikarContactEmail,
              subjectMessage: context.l10n.counselling_email_subject,
            ),
          ),
          isDarkMode: isDarkMode,
        ),
      ],
    ];

    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.contacts,
      children: modules,
    );
  }
}
