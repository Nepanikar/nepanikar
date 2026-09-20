import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/utils/crashlytics_utils.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';

/// Builds the file a pilot participant sends to the researcher at the end.
///
/// This is **not** [ExportService]. That one dumps the whole database — diary,
/// moods, food records, the self-harm timer — which is both far more than a
/// study needs and unreadable when it arrives. This one answers one question:
/// how far did this person get, and how much did they actually do.
///
/// ## What goes in
/// Dates, counts and identifiers the app itself defines. Which days were
/// finished and when, how many worksheet fields were filled, how many exercises
/// were saved, how many challenge check-offs there were.
///
/// ## What never goes in
/// **A single word anyone wrote.** No worksheet answers, no reflections, no
/// goals, no diary, no name, no challenge text. Those are the person's account
/// of their own crises and triggers, and the study was designed around not
/// collecting them (see `bpd_research.dart`). A count of filled fields carries
/// the adherence signal; the sentences in them carry a diagnosis.
///
/// The file is handed to the participant through the system save dialog. The
/// app never uploads it and has no server to upload it to — whether it reaches
/// the researcher is the participant's decision, every time.
class BpdStudyExportService {
  const BpdStudyExportService._();

  /// Bump when the shape changes, so a file from an older build is still
  /// readable by whoever analyses the pilot.
  static const schemaVersion = 'nepanikar-dbt-pilot/1';

  static Database get _db => registry.get<DatabaseService>().database;

  static StoreRef<String, Map<String, dynamic>?> _store(String name) =>
      stringMapStoreFactory.store(name);

  /// Assembles the report. Kept separate from saving it so it can be inspected
  /// and tested without touching the file system.
  static Future<Map<String, dynamic>> build() async {
    final userSettingsDao = registry.get<UserSettingsDao>();
    final status = await userSettingsDao.getBpdProgrammeStatus();
    final packageInfo = await PackageInfo.fromPlatform();

    return <String, dynamic>{
      'schema': schemaVersion,
      'exportedAt': DateTime.now().toIso8601String(),
      'participantCode': await userSettingsDao.getBpdParticipantCode(),
      'appVersion': '${packageInfo.version}+${packageInfo.buildNumber}',
      'programmeStartedAt': status.startedAt?.toIso8601String(),
      'weeks': await _weeks(),
      'days': await _days(),
      'engagement': await _engagement(),
    };
  }

  static Future<List<Map<String, dynamic>>> _weeks() async {
    final records = await _store('bpd_weeks').find(_db);
    final weeks = <Map<String, dynamic>>[
      for (final record in records)
        if (record.value case final value?)
          {
            'week': value['weekNumber'],
            'unlockDate': value['unlockDate'],
            'completed': value['isCompleted'] == true,
            'completedAt': value['completedAt'],
          },
    ];
    weeks.sort((a, b) => _asInt(a['week']).compareTo(_asInt(b['week'])));
    return weeks;
  }

  static Future<List<Map<String, dynamic>>> _days() async {
    final records = await _store('bpd_days_progress').find(_db);
    final days = <Map<String, dynamic>>[
      for (final record in records)
        if (record.value case final value?)
          {
            'week': value['weekNumber'],
            'day': value['dayNumber'],
            'unlockDate': value['unlockDate'],
            'startedAt': value['startedAt'],
            'completed': value['isCompleted'] == true,
            'completedAt': value['completedAt'],
          },
    ];
    days.sort((a, b) {
      final byWeek = _asInt(a['week']).compareTo(_asInt(b['week']));
      return byWeek != 0 ? byWeek : _asInt(a['day']).compareTo(_asInt(b['day']));
    });
    return days;
  }

  /// Counts only. Every value here is a number, a date, or an id the app chose
  /// — deliberately, so no future edit can leak free text by accident.
  static Future<Map<String, dynamic>> _engagement() async {
    final worksheets = <Map<String, dynamic>>[];
    var worksheetFieldsFilled = 0;
    for (final record in await _store('bpd_worksheets').find(_db)) {
      final answers = record.value?['answers'];
      final filled = answers is Map ? answers.length : 0;
      if (filled == 0) continue;
      worksheetFieldsFilled += filled;
      worksheets.add({
        'id': record.key,
        'fieldsFilled': filled,
        'updatedAt': record.value?['updatedAt'],
      });
    }

    final reflections = <Map<String, dynamic>>[];
    for (final record in await _store('bpd_reflection').find(_db)) {
      final answers = record.value?['answers'];
      final filled = answers is List
          ? answers.whereType<String>().where((a) => a.trim().isNotEmpty).length
          : 0;
      if (filled == 0) continue;
      reflections.add({
        'week': record.key,
        'answersFilled': filled,
        'updatedAt': record.value?['updatedAt'],
      });
    }

    final challenges = <Map<String, dynamic>>[];
    var challengeCheckOffs = 0;
    for (final record in await _store('bpd_challenge_tracker').find(_db)) {
      final value = record.value;
      if (value == null) continue;
      final dates = value['completedDates'];
      final ticks = dates is List ? dates.length : 0;
      challengeCheckOffs += ticks;
      challenges.add({
        // The challenge text is the user's own commitment, so only where it
        // came from and how often it was ticked travel.
        'week': value['weekNumber'],
        'day': value['dayNumber'],
        'area': value['area'],
        'createdAt': value['createdAt'],
        'hasReminder': value['reminderHour'] != null,
        'checkOffs': ticks,
      });
    }

    var challengesPicked = 0;
    for (final record in await _store('bpd_challenges').find(_db)) {
      final items = record.value?['items'];
      if (items is List) challengesPicked += items.length;
    }

    final rescueItems = <Map<String, dynamic>>[
      for (final record in await _store('bpd_rescue_package').find(_db))
        if (record.value case final value?)
          {'id': value['id'], 'savedAt': value['savedAt']},
    ];

    final goals = await _store('bpd_smart_goals').count(_db);

    return <String, dynamic>{
      'worksheetsStarted': worksheets.length,
      'worksheetFieldsFilled': worksheetFieldsFilled,
      'worksheets': worksheets,
      'weeklyReflectionsFilled': reflections.length,
      'reflections': reflections,
      'challengesPicked': challengesPicked,
      'challengesTracked': challenges.length,
      'challengeCheckOffs': challengeCheckOffs,
      'challenges': challenges,
      'rescuePackageItems': rescueItems.length,
      'rescuePackage': rescueItems,
      'smartGoals': goals,
    };
  }

  static int _asInt(Object? value) => value is num ? value.toInt() : 0;

  /// Writes the report and hands it to the system save dialog.
  ///
  /// Returns true only when a file actually landed somewhere — [onSuccess] must
  /// not fire when the person backed out of the dialog, or the screen would
  /// tell them they had sent something they had not.
  static Future<bool> saveToFile() async {
    try {
      final report = await build();
      final code = report['participantCode'] as String?;
      final date = DateTime.now().toIso8601String().split('T').first;
      final fileName = 'nepanikar-dbt-${code ?? 'bez-cisla'}-$date.json';

      final directory = await getTemporaryDirectory();
      final file = File(p.join(directory.path, fileName));
      await file.writeAsString(const JsonEncoder.withIndent('  ').convert(report));

      final savedPath = await FlutterFileDialog.saveFile(
        params: SaveFileDialogParams(sourceFilePath: file.path, fileName: fileName),
      );
      return savedPath != null;
    } catch (e, s) {
      debugPrint('BPD_STUDY_EXPORT: Could not export: $e');
      await logExceptionToCrashlytics(
        e,
        s,
        logMessage: 'BPD_STUDY_EXPORT: Cannot export study data',
      );
      return false;
    }
  }
}
