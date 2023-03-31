import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';

import 'en.dart';

// ignore: non_constant_identifier_names
final it_Contacts = en_Contacts.copyWith(
  languageCode: NepanikarLanguages.it.languageCode,
  phoneContacts: _phoneContacts,
  chatContacts: _chatContacts,
);

const _phoneContacts = <PhoneContact>[
  PhoneContact(
    title: 'Telefono Azzurro',
    subtitle: 'Per bambini e studenti',
    tel: '19696',
  ),
  PhoneContact(
    title: 'Telefono Amico',
    tel: '199 284 284',
  ),
  PhoneContact(
    title: 'Samaritans Suicide Hotline',
    tel: '800 86 00 22',
  ),
];

const _chatContacts = <ChatContact>[
  ChatContact.subList(
    title: 'La Chat di Telefono Azzurro',
    subChatContacts: [
      SubChatContact(
        title: '',
        url: 'https://azzurro.it/chat/',
      ),
    ],
  ),
];
