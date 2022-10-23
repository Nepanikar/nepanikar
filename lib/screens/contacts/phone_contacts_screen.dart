import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/sizes.dart';
import 'package:nepanikar/l10n/ext.dart';
import 'package:nepanikar/providers/localization_provider.dart';
import 'package:nepanikar/utils/contacts_data_manager.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/contacts/phone_contact_tile.dart';
import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';
import 'package:provider/provider.dart';

class PhoneContactsRoute extends GoRouteData {
  const PhoneContactsRoute();

  ContactsDataManager get contactsManager => registry.get<ContactsDataManager>();

  @override
  Widget build(BuildContext context) {
    final localizationProvider = context.read<LocalizationProvider>();
    final phoneContacts =
        contactsManager.getContactsFromLocale(localizationProvider.locale).phoneContacts;
    return PhoneContactsScreen(phoneContacts: phoneContacts ?? []);
  }
}

class PhoneContactsScreen extends StatelessWidget {
  const PhoneContactsScreen({
    super.key,
    required this.phoneContacts,
  });

  final Iterable<PhoneContact> phoneContacts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.phone),
      ),
      body: SafeArea(
        child: Padding(
          padding: NepanikarSizes.screenContentPadding,
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            child: SeparatedColumn(
              separatorBuilder: NepanikarSizes.separatorBuilder(),
              children: [
                // Not passing list to the children directly because of library bug, TODO: make a PR to lib :D
                ...phoneContacts.map((contact) => PhoneContactTile(phoneContact: contact)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
