import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class MyContactsRecordsDTO extends Equatable {
  const MyContactsRecordsDTO._({
    required this.recordEntries,
  });

  factory MyContactsRecordsDTO.getAndroidData(Config config) {
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

    return MyContactsRecordsDTO._(
      recordEntries: myContactsEntries.isEmpty ? null : myContactsEntries,
    );
  }

  factory MyContactsRecordsDTO.getIosData(Map<String, Object> config) {
    final myContactsNumbersSize = config['myContactsNumbers.size']?.toString().getIniIntValue();

    final myContactsEntries = <MapEntry<String, String>>[];
    if (myContactsNumbersSize != null) {
      for (var i = 1; i <= myContactsNumbersSize; i++) {
        final name = config['myContactsNames.$i.value']?.toString() ?? '';
        final contact = config['myContactsNumbers.$i.value']?.toString() ?? '';
        myContactsEntries.add(MapEntry(name, contact));
      }
    }

    return MyContactsRecordsDTO._(
      recordEntries: myContactsEntries.isEmpty ? null : myContactsEntries,
    );
  }

  /// Key is name of the contact, value is the phone number or email address.
  final List<MapEntry<String, String>>? recordEntries;

  @override
  List<Object?> get props => [recordEntries];
}
