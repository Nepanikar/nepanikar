import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

class SaveDirectories {
  SaveDirectories();

  late final Directory supportDir;

  Future<void> init() async {
    supportDir = await getApplicationSupportDirectory();
  }

  Future<void> clearSaveDirectories() async {
    try {
      await supportDir.delete(recursive: true);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
