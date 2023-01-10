// ignore_for_file: avoid_print, unused_local_variable

import 'dart:io';

import 'package:intl/date_symbol_data_local.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart' as nep_data_migration;

Future<void> main(List<String> arguments) async {
  // const codec = nep_data_migration.NepanikarConfigParser.NEPANIKAR_CONF_CODEC;
  // final a = codec.encode(testStr);
  // final ab = codec.decode(a);

  for (final locale in nep_data_migration.NepanikarConfigParser.fallbackParseLocale) {
    await initializeDateFormatting(locale);
  }
  const testStr = r'Zam\x11b\x159\xedm se na jin\xe9';
  const testStr2 = r'\x10dt pro 17 17:10:00 2020 GMT+0100';
  // print(testStr.cleanUnicodes());
  // print(testStr2.cleanUnicodes());

  const filePath = './bin/example_data/DontPanic_small.conf';
  final conf = nep_data_migration.NepanikarConfigParser.parseAndroidConfigFile(File(filePath));
  print(
    conf.myRecordsModuleConfig?.foodRecordConfig?.records
        .toString()
        .replaceAll('FoodRecordDTO', '\n\nFoodRecordDTO'),
  );

  print('\n');
  print(conf.depressionModuleConfig?.depressionActivityPlanConfig.toString());

  print('\n');
  print(conf.eatingDisorderModuleConfig?.eatingDisorderFoodCreativeConfig.toString());

  // const filePath2 = './bin/example_data/DontPanic_large.conf';
  // final conf2 = nep_data_migration.NepanikarConfigParser.parseConfigFile(File(filePath2));
  // print(conf2.toString());
}
