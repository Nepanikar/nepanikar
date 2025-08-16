import 'package:flutter/material.dart';
import 'package:nepanikar/app/l10n/app_localizations.dart';

extension AppLocalizationsExt on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
