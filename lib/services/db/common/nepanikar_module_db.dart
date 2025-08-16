import 'package:nepanikar/app/l10n/app_localizations.dart';

abstract class NepanikarModuleDb {
  Future<Object> initModuleDaos();

  Future<void> clearModule();

  Future<void> preloadDefaultModuleData(AppLocalizations l10n);
}
