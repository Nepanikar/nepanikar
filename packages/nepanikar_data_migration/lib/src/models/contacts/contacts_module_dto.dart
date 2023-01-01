import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class ContactsModuleDTO extends Equatable {
  const ContactsModuleDTO._({
    required this.contactsMyContactsConfig,
    required this.contactsCrisisMessageConfig,
  });

  factory ContactsModuleDTO.getData(Config config) {
    ContactsMyContactsDTO? contactsMyContactsConfig;
    try {
      contactsMyContactsConfig = ContactsMyContactsDTO.getData(config);
    } catch (_) {}

    ContactsCrisisMessageDTO? contactsCrisisMessageConfig;
    try {
      contactsCrisisMessageConfig = ContactsCrisisMessageDTO.getData(config);
    } catch (_) {}

    return ContactsModuleDTO._(
      contactsMyContactsConfig: contactsMyContactsConfig,
      contactsCrisisMessageConfig: contactsCrisisMessageConfig,
    );
  }

  final ContactsMyContactsDTO? contactsMyContactsConfig;
  final ContactsCrisisMessageDTO? contactsCrisisMessageConfig;

  @override
  List<Object?> get props => [contactsMyContactsConfig, contactsCrisisMessageConfig];
}
