import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:nepanikar/app/l10n/ext.dart';

String _platformLocale = Platform.localeName.split('_').firstOrNull ?? 'en';

final initialLocale = Locale(
  AppLocalizations.supportedLocales.contains(Locale(_platformLocale)) ? _platformLocale : 'en',
);

String pluralYears(
  BuildContext context, {
  required int value,
}) {
  return Intl.plural(
    value,
    one: context.l10n.plural_year_one,
    few: context.l10n.plural_year_few,
    other: context.l10n.plural_year_other,
    locale: Localizations.localeOf(context).languageCode,
  );
}

String pluralMonths(
  BuildContext context, {
  required int value,
}) {
  return Intl.plural(
    value,
    one: context.l10n.plural_month_one,
    few: context.l10n.plural_month_few,
    other: context.l10n.plural_month_other,
    locale: Localizations.localeOf(context).languageCode,
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
    locale: Localizations.localeOf(context).languageCode,
  );
}

String pluralHours(
  BuildContext context, {
  required int value,
}) {
  return Intl.plural(
    value,
    one: context.l10n.plural_hour_one,
    few: context.l10n.plural_hour_few,
    other: context.l10n.plural_hour_other,
    locale: Localizations.localeOf(context).languageCode,
  );
}

String pluralMinutes(
  BuildContext context, {
  required int value,
}) {
  return Intl.plural(
    value,
    one: context.l10n.plural_minutes_one,
    few: context.l10n.plural_minutes_few,
    other: context.l10n.plural_minutes_other,
    locale: Localizations.localeOf(context).languageCode,
  );
}

String pluralSeconds(
  BuildContext context, {
  required int value,
}) {
  return Intl.plural(
    value,
    one: context.l10n.plural_second_one,
    few: context.l10n.plural_second_few,
    other: context.l10n.plural_second_other,
    locale: Localizations.localeOf(context).languageCode,
  );
}

extension LocalizationTextExtractor on String {
  List<String> extractToItems() {
    return split('\n').map((line) => line.trim()).where((line) => line.isNotEmpty).toList();
  }
}
