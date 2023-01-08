import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/utils/crashlytics_utils.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_memory.dart';
import 'package:sembast/utils/database_utils.dart';
import 'package:sembast/utils/sembast_import_export.dart';

class ExportService {
  ExportService({
    required this.databaseService,
  });

  final DatabaseService databaseService;

  Future<void> clear() async {
    await databaseService.clearAll();
  }

  Future<void> export({
    VoidCallback? onSuccess,
    VoidCallback? onError,
  }) async {
    try {
      final data = await exportDatabase(databaseService.database);
      final tempDirectory = await getTemporaryDirectory();

      final fileName = 'export_${DateTime.now().toIso8601String()}.json';
      final file = File(p.join(tempDirectory.path, fileName));
      await file.writeAsString(jsonEncode(data));

      final params = SaveFileDialogParams(sourceFilePath: file.path);
      final filePath = await FlutterFileDialog.saveFile(params: params);
      if (filePath != null) {
        onSuccess?.call();
      }
    } catch (e, s) {
      onError?.call();
      await logExceptionToCrashlytics(
        e,
        s,
        logMessage: 'EXPORT_SERVICE: Cannot export data',
      );
    }
  }

  Future<void> import({
    VoidCallback? onSuccess,
    VoidCallback? onError,
  }) async {
    const params = OpenFileDialogParams(
      fileExtensionsFilter: ['json'],
    );
    try {
      final filePath = await FlutterFileDialog.pickFile(params: params);

      if (filePath != null) {
        final data = await File(filePath).readAsString();
        final parsed = jsonDecode(data) as Map<String, dynamic>;

        // `importDatabase` creates a new DB and would require to restart sembast.
        // Therefore we create new memory database from imported data and merge them
        // into currently open database.
        // https://github.com/tekartik/sembast.dart/issues/289
        final importDb = await importDatabase(parsed, newDatabaseFactoryMemory(), 'export');
        await databaseMerge(databaseService.database, sourceDatabase: importDb);

        onSuccess?.call();
      }
    } catch (e, s) {
      onError?.call();
      await logExceptionToCrashlytics(
        e,
        s,
        logMessage: 'EXPORT_SERVICE: Cannot import data',
      );
    }
  }
}
