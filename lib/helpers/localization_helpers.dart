import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String _platformLocale = Platform.localeName.split('_').firstOrNull ?? 'en';

final initialLocale = Locale(
  AppLocalizations.supportedLocales.contains(Locale(_platformLocale)) ? _platformLocale : 'en',
);
