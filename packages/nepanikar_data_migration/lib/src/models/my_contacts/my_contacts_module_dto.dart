import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class MyContactsModuleDTO extends Equatable {
  const MyContactsModuleDTO._({
    required this.contactsMyContactsConfig,
    required this.contactsCrisisMessageConfig,
  });

  factory MyContactsModuleDTO.getAndroidData(Config config) {
    MyContactsRecordsDTO? contactsMyContactsConfig;
    try {
      contactsMyContactsConfig = MyContactsRecordsDTO.getAndroidData(config);
    } catch (_) {}

    MyContactsCrisisMessageDTO? contactsCrisisMessageConfig;
    try {
      contactsCrisisMessageConfig = MyContactsCrisisMessageDTO.getAndroidData(config);
    } catch (_) {}

    return MyContactsModuleDTO._(
      contactsMyContactsConfig: contactsMyContactsConfig,
      contactsCrisisMessageConfig: contactsCrisisMessageConfig,
    );
  }

  factory MyContactsModuleDTO.getIosData(Map<String, Object> config) {
    MyContactsRecordsDTO? contactsMyContactsConfig;
    try {
      contactsMyContactsConfig = MyContactsRecordsDTO.getIosData(config);
    } catch (_) {}

    MyContactsCrisisMessageDTO? contactsCrisisMessageConfig;
    try {
      contactsCrisisMessageConfig = MyContactsCrisisMessageDTO.getIosData(config);
    } catch (_) {}

    return MyContactsModuleDTO._(
      contactsMyContactsConfig: contactsMyContactsConfig,
      contactsCrisisMessageConfig: contactsCrisisMessageConfig,
    );
  }

  final MyContactsRecordsDTO? contactsMyContactsConfig;
  final MyContactsCrisisMessageDTO? contactsCrisisMessageConfig;

  @override
  List<Object?> get props => [contactsMyContactsConfig, contactsCrisisMessageConfig];
}
