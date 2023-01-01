import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class ContactsCrisisMessageDTO extends Equatable {
  const ContactsCrisisMessageDTO._({
    required this.contactMessageAddress,
    required this.contactMessageBody,
  });

  factory ContactsCrisisMessageDTO.getData(Config config) {
    const sectionName = 'General';

    final contactMessageAddress =
        config.get(sectionName, 'contactMessageAddress')?.getIniStrValue();
    final contactMessageBody = config.get(sectionName, 'contactMessageBody')?.getIniStrValue();

    return ContactsCrisisMessageDTO._(
      contactMessageAddress: contactMessageAddress,
      contactMessageBody: contactMessageBody,
    );
  }

  final String? contactMessageAddress;
  final String? contactMessageBody;

  @override
  List<Object?> get props => [contactMessageAddress, contactMessageBody];
}
