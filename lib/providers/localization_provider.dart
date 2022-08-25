import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String platformLocale = Platform.localeName.split("_").first;

class LocalizationProvider extends ChangeNotifier {
  Locale locale = Locale(
    AppLocalizations.supportedLocales.contains(Locale(platformLocale)) ? platformLocale : "en",
  );

  void setLocale(String code) {
    locale = Locale(code);
    notifyListeners();
  }
}
