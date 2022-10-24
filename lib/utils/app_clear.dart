import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/services/save_directories.dart';
import 'package:nepanikar/utils/registry.dart';

Future<void> appClear() async {
  await registry.get<SaveDirectories>().clearSaveDirectories();
  await registry.get<DatabaseService>().clearAll();
}
