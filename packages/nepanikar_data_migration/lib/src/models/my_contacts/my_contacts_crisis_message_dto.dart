import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class MyContactsCrisisMessageDTO extends Equatable {
  const MyContactsCrisisMessageDTO._({
    required this.contactMessageAddress,
    required this.contactMessageBody,
  });

  factory MyContactsCrisisMessageDTO.getAndroidData(Config config) {
    const sectionName = 'General';

    final contactMessageAddress =
        config.get(sectionName, 'contactMessageAddress')?.getIniStrValue();
    final contactMessageBody = config.get(sectionName, 'contactMessageBody')?.getIniStrValue();

    return MyContactsCrisisMessageDTO._(
      contactMessageAddress: contactMessageAddress,
      contactMessageBody: contactMessageBody,
    );
  }

  factory MyContactsCrisisMessageDTO.getIosData(Map<String, Object> config) {
    final contactMessageAddress = config['contactMessageAddress']?.toString();
    final contactMessageBody = config['contactMessageBody']?.toString();

    return MyContactsCrisisMessageDTO._(
      contactMessageAddress: contactMessageAddress,
      contactMessageBody: contactMessageBody,
    );
  }

  final String? contactMessageAddress;
  final String? contactMessageBody;

  @override
  List<Object?> get props => [contactMessageAddress, contactMessageBody];
}
