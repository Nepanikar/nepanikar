import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String platformLocale = Platform.localeName.split("_").first;

class LocalizationProvider extends ChangeNotifier {
  Locale _locale = Locale(
    AppLocalizations.supportedLocales.contains(Locale(platformLocale)) ? platformLocale : "en",
  );

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}
