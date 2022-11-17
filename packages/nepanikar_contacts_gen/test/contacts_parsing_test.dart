@Timeout(Duration(minutes: 10))
import 'dart:convert';
import 'dart:io';

import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';
import 'package:test/test.dart';

import '../bin/nepanikar_contacts_gen.dart' as bin;

void main() {
  test(
    'JSON with contacts is parsable',
    () {
      final assetContent =
          File('${bin.appContactsAssetDirPath}/$CONTACTS_ASSET_NAME').readAsStringSync();
      final allContacts = AllContacts.fromJson(jsonDecode(assetContent) as Map<String, dynamic>);
      expect(allContacts.countryContacts.length > 2, true);
      expect(allContacts, equals(bin.allContacts));
    },
  );
}
