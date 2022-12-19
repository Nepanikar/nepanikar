import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class SaveDirectories {
  SaveDirectories();

  Future<void> init() async {
    supportDir = await getApplicationSupportDirectory();
    tempDir = await getTemporaryDirectory();
    libraryDir = Platform.isIOS ? await getLibraryDirectory() : null;
    appsDocsDir = await getApplicationDocumentsDirectory();

    // Creates a directory for db, if it doesn't exist.
    await Directory(dbDirPath).create(recursive: true);
  }

  late final Directory supportDir;
  late final Directory tempDir;
  late final Directory? libraryDir;
  late final Directory appsDocsDir;

  String get dbDirPath => join(supportDir.path, 'db');

  String get oldAppDataConfigFilePath =>
      join(supportDir.path, '.config', 'DontPanicDevs', 'DontPanic.conf');

  Future<void> clearSaveDirectories() async {
    try {
      await supportDir.delete(recursive: true);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<String> listAllDir() async {
    final dirs = [
      supportDir,
      tempDir,
      libraryDir,
      appsDocsDir,
    ].whereType<Directory>().toList();

    int dirCount = 0;
    final sb = StringBuffer();
    for (final dir in dirs) {
      dirCount++;
      sb.writeln('\n\nDirectory ($dirCount): ${dir.path}');
      final files = dir.listSync(recursive: true);
      for (final file in files) {
        sb.writeln(file.path);
      }
    }
    return sb.toString();
  }
}