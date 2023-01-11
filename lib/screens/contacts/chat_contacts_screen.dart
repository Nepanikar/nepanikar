import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/utils/contacts_data_manager.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/contacts/chat_contact_tile.dart';
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
      chatContacts: chatContacts ?? [],
    );
  }
}

class ChatContactsScreen extends StatelessWidget {
  const ChatContactsScreen({
    super.key,
    required this.chatContacts,
  });

  final List<ChatContact> chatContacts;

  @override
  Widget build(BuildContext context) {
    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.chat,
      children: chatContacts.map((c) => ChatContactTile(chatContact: c)).toList(),
    );
  }
}
