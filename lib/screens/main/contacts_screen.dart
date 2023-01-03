import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/screens/contacts/chat_contacts_screen.dart';
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
    final modules = <Widget>[
      LongTile(
        text: '${context.l10n.contacts_message} TODO',
        image: Assets.illustrations.contacts.phones.svg(color: Colors.white),
        textTextStyle: NepanikarFonts.bodyHeavy.copyWith(color: Colors.white),
        backgroundColor: NepanikarColors.secondary,
        onTap: () => {},
      ),
      if (countryContacts.phoneContacts != null)
        LongTile(
          text: context.l10n.phone,
          image: Assets.illustrations.contacts.phones.svg(),
          onTap: () => context.push(const PhoneContactsRoute().location),
        ),
      if (countryContacts.crisisCenterContacts != null)
        LongTile(
          text: '${context.l10n.center} TODO doplnit kontakty',
          image: Assets.illustrations.contacts.crisisCenters.svg(),
          onTap: () => context.push(const CrisisCenterContactsRoute().location),
        ),
      if (countryContacts.chatContacts != null)
        LongTile(
          text: context.l10n.chat,
          image: Assets.illustrations.contacts.chat.svg(),
          onTap: () => context.push(const ChatContactsRoute().location),
        ),
      if (countryContacts.universityRegionContacts != null)
        LongTile(
          text: context.l10n.universities,
          image: Assets.illustrations.contacts.universities.svg(),
          onTap: () => context.push(const UniversityContactsRoute().location),
        ),
      LongTile(
        text: '${context.l10n.my_contacts} TODO',
        image: Assets.illustrations.contacts.myContacts.svg(),
        onTap: () => {},
      ),
    ];

    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.contacts,
      children: modules,
    );
  }
}
