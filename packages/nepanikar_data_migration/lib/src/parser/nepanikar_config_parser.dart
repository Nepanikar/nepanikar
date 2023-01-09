// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:ini/ini.dart';
import 'package:intl/intl.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class NepanikarConfigParser {
  const NepanikarConfigParser._();

  static const NEPANIKAR_CONF_CODEC = Utf8Codec(allowMalformed: true);

  static const QT_UNICODE_PATTERN = '\\x([0-9a-f]{2,3})';

  static const QT_DATE_TIME_PATTERN = 'E MMM d HH:mm:ss yyyy z';

  static const QT_DATE_PATTERN = 'd.M.yyyy';

  static final fallbackParseLocale = ['cs', 'en'];

  static NepanikarConfig parseAndroidConfigFile(File configFile) {
    final config = Config.fromStrings(configFile.readAsLinesSync(encoding: NEPANIKAR_CONF_CODEC));
    return NepanikarConfig.getAndroidData(config);
  }

  static NepanikarConfig parseIosConfigFile(Map<String, Object> config) {
    return NepanikarConfig.getIosData(config);
  }
}

extension NepanikarParserStringExt on String {
  String cleanUnicodes() {
    return replaceAllMapped(
      RegExp(NepanikarConfigParser.QT_UNICODE_PATTERN, caseSensitive: false),
      (match) {
        final hex = match.group(1) ?? '';
        if (hex.isEmpty) return '?';
        final charCode = int.tryParse(hex, radix: 16);
        return charCode == null ? '?' : String.fromCharCode(charCode);
      },
    ).replaceAll('\\n', '\n').replaceAll('\\', ''); // Replace all backslashes except newline.
  }

  String? getIniStrValue({bool cleanFromUnicodes = true}) {
    if (isEmpty) {
      return null;
    }
    return cleanFromUnicodes ? cleanUnicodes() : this;
  }

  DateTime? getIniDateTimeValue({bool cleanFromUnicodes = true, String? dateTimePattern}) {
    final strValue = getIniStrValue(cleanFromUnicodes: cleanFromUnicodes);
    if (strValue == null) return null;
    DateTime? dateTime;

    try {
      dateTime =
          DateFormat(dateTimePattern ?? NepanikarConfigParser.QT_DATE_TIME_PATTERN).parse(strValue);
    } catch (e) {
      print(e.toString());

      // Trying out fallback languages.
      for (final locale in NepanikarConfigParser.fallbackParseLocale) {
        try {
          dateTime =
              DateFormat(dateTimePattern ?? NepanikarConfigParser.QT_DATE_TIME_PATTERN, locale)
                  .parse(strValue);
          break;
        } catch (e) {
          print(e.toString());
          continue;
        }
      }
    }

    return dateTime;
  }

  int? getIniIntValue({bool cleanFromUnicodes = false}) {
    final strValue = getIniStrValue(cleanFromUnicodes: cleanFromUnicodes);
    return strValue == null ? null : int.tryParse(strValue);
  }

  bool? getIniBoolValue({bool cleanFromUnicodes = false}) {
    final strValue = getIniStrValue(cleanFromUnicodes: cleanFromUnicodes)?.toLowerCase();
    final trueValues = ['true', 't'];
    final falseValues = ['false', 'f'];
    final isBool = trueValues.contains(strValue) || falseValues.contains(strValue);
    if (isBool) {
      return trueValues.contains(strValue);
    }
    return null;
  }
}

extension ConfigItemsToMapExt on Config {
  /// The key is typically in format "1\value".
  Map<String, String?>? itemsToMap(String sectionName, [String? keyNamePart = 'value']) {
    final sectionEntries = items(sectionName);
    if (sectionEntries == null) return null;
    final map = <String, String?>{};
    for (final keyValuePair in sectionEntries) {
      if (keyValuePair.length == 2) {
        final key = keyValuePair[0];
        final value = keyValuePair[1]?.getIniStrValue();
        if (key != null) {
          if (keyNamePart != null && key.contains(keyNamePart)) {
            map[key] = value;
          } else if (keyNamePart == null) {
            map[key] = value;
          }
        }
      }
    }
    return map;
  }
}

int confKeysSorter(String a, String b) {
  final keyA = a.split('\\');
  final keyB = b.split('\\');
  if (keyA.isNotEmpty && keyB.isNotEmpty) {
    final intA = int.tryParse(keyA.first);
    final intB = int.tryParse(keyB.first);
    if (intA != null && intB != null) {
      return intA.compareTo(intB);
    }
  }
  return a.compareTo(b);
}
