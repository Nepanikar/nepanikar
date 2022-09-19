import 'package:nepanikar/services/save_directories.dart';
import 'package:nepanikar/utils/registry.dart';

Future<void> appClear() async {
  await registry.get<SaveDirectories>().clearSaveDirectories();
}
