import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/sizes.dart';
import 'package:nepanikar/l10n/ext.dart';
import 'package:nepanikar/router/routes.dart';
import 'package:nepanikar/screens/contacts/phone_contacts_screen.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({
    super.key,
    required this.countryContacts,
  });

  final CountryContacts countryContacts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.contacts)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: SeparatedColumn(
              separatorBuilder: NepanikarSizes.separatorBuilder(),
              children: [
                if (countryContacts.phoneContacts != null)
                  LongTile(
                    text: context.l10n.phone,
                    image: Assets.illustrations.contacts.phones.svg(),
                    onTap: () => context.push(const PhoneContactsRoute().location),
                  ),
                if (countryContacts.crisisCenterContacts != null)
                  LongTile(
                    text: context.l10n.center,
                    image: Assets.illustrations.contacts.crisisCenters.svg(),
                    onTap: () => {},
                  ),
                if (countryContacts.chatContacts != null)
                  LongTile(
                    text: context.l10n.chat,
                    image: Assets.illustrations.contacts.chat.svg(),
                    onTap: () => {},
                  ),
                if (countryContacts.universityContacts != null)
                  LongTile(
                    text: context.l10n.universities,
                    image: Assets.illustrations.contacts.universities.svg(),
                    onTap: () => {},
                  ),
                LongTile(
                  text: context.l10n.my_contacts,
                  image: Assets.illustrations.contacts.myContacts.svg(),
                  onTap: () => {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
