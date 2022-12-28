import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class ContactsMyContactsDTO extends Equatable {
  const ContactsMyContactsDTO._({
    required this.myContactsEntries,
  });

  factory ContactsMyContactsDTO.getData(Config config) {
    final myContactsNamesMap = config.itemsToMap('myContactsNames');
    final myContactsNumbersMap = config.itemsToMap('myContactsNumbers');

    final myContactsEntries = <MapEntry<String, String>>[];
    if (myContactsNumbersMap != null) {
      final sortedContactsNumbersMapEntries = myContactsNumbersMap.entries.toList()
        ..sort((a, b) => confKeysSorter(a.key, b.key));

      for (final contactNumberEntry in sortedContactsNumbersMapEntries) {
        final name = myContactsNamesMap?[contactNumberEntry.key] ?? '';
        final contact = contactNumberEntry.value ?? '';
        myContactsEntries.add(MapEntry(name, contact));
      }
    }

    return ContactsMyContactsDTO._(
      myContactsEntries: myContactsEntries.isEmpty ? null : myContactsEntries,
    );
  }

  /// Key is name of the contact, value is the phone number or email address.
  final Iterable<MapEntry<String, String>>? myContactsEntries;

  @override
  List<Object?> get props => [myContactsEntries];
}
