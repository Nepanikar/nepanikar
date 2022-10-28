import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

String _platformLocale = Platform.localeName.split('_').firstOrNull ?? 'en';

final initialLocale = Locale(
  AppLocalizations.supportedLocales.contains(Locale(_platformLocale)) ? _platformLocale : 'en',
);

// TODO: l10n
String pluralYears(
  BuildContext context, {
  required int value,
}) {
  return Intl.plural(
    value,
    one: 'Rok',
    few: 'Roky',
    other: 'Roků',
    locale: Localizations.localeOf(context).countryCode,
  );
}

String pluralMonths(
  BuildContext context, {
  required int value,
}) {
  return Intl.plural(
    value,
    one: 'Měsíc',
    few: 'Měsíce',
    other: 'Měsíců',
    locale: Localizations.localeOf(context).countryCode,
  );
}

String pluralDays(
  BuildContext context, {
  required int value,
}) {
  return Intl.plural(
    value,
    one: 'Den',
    few: 'Dny',
    other: 'Dní',
    locale: Localizations.localeOf(context).countryCode,
  );
}

String pluralHours(
  BuildContext context, {
  required int value,
}) {
  return Intl.plural(
    value,
    one: 'Hodina',
    few: 'Hodiny',
    other: 'Hodin',
    locale: Localizations.localeOf(context).countryCode,
  );
}

String pluralMinutes(
  BuildContext context, {
  required int value,
}) {
  return Intl.plural(
    value,
    one: 'Minuta',
    few: 'Minuty',
    other: 'Minut',
    locale: Localizations.localeOf(context).countryCode,
  );
}
