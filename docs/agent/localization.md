# Localization

20+ languages, managed through **Localazy** and Flutter's gen-l10n. Config: `l10n.yaml`.

## Files

- **Source ARB files**: `lib/app/l10n/arb/app_<lang>.arb` (e.g. `app_cs.arb`, `app_en.arb`).
- **Template**: `app_cs.arb` (Czech is the source language — add new keys here first).
- **Generated**: `lib/app/l10n/app_localizations.dart` (+ `app_localizations_<lang>.dart`).
  These are generated — **don't edit by hand**.

Supported locales (19): ar, cs, de, en, es, fi, fr, hi, it, ja, ko, nb, pl, pt, ru, sk, sv, tr, uk.

## Using a string in UI

There's a `BuildContext` extension (`lib/app/l10n/ext.dart`):
```dart
import 'package:nepanikar/app/l10n/ext.dart';
...
Text(context.l10n.anxiety_panic)   // never hardcode user-facing text
```
`context.l10n` is `AppLocalizations.of(context)!`.

## Adding / changing a string

1. Add the key + value to **`lib/app/l10n/arb/app_cs.arb`** (template) and `app_en.arb`.
2. Run `flutter gen-l10n` to regenerate `AppLocalizations`.
3. Use it via `context.l10n.<key>`.
4. Real translations come from Localazy (`./bin/localazy/localazy_gen.sh`) — don't hand-translate
   every language; just provide cs/en and let translators fill the rest.

## Plurals

Use the helpers in `lib/helpers/localization_helpers.dart` (they wrap `Intl.plural` with the
right ARB keys and the current locale):
```dart
pluralYears(context, value: n);    pluralDays(context, value: n);
pluralMonths(context, value: n);   pluralHours(context, value: n);
pluralMinutes(context, value: n);  pluralSeconds(context, value: n);
```

## Locale-aware behaviour

- Initial locale: `initialLocale` in `localization_helpers.dart` — device locale if supported,
  else `en`.
- Active locale comes from `UserSettingsDao` (`locale` / `localeStream`), settable in the
  Languages settings screen.
- Some content is locale-gated, e.g. relaxations only show for `cs`/`sk`:
  ```dart
  if (['cs', 'sk'].contains(_userSettingsDao.locale.languageCode)) ...
  ```
- Multi-line ARB strings can be split into list items with the
  `String.extractToItems()` extension (splits on `\n`, trims, drops empties).
- App display name is locale-specific (Nepanikař / Nepanikár / Don't Panic).

## Other data sources (not ARB)

- **Contacts / help content**: JSON in `assets/contacts/`, generated from Dart models in
  `packages/nepanikar_contacts_gen/` (run that package's gen script — see `CLAUDE.md`).
- **BPD/HPO programme content**: inline **Czech** strings in the day screens and
  their `dayN_content.dart` files (not ARB, not JSON — it is content, not UI
  chrome). Authored copy lives in `docs/hpo/source/*.md`. Week-level skill-tree
  data is in `assets/bpd/bpd_weeks_data.json`.
- **Psychological tests** (GAD-7, PHQ-9, PSS, BRCS): CSV in `assets/tests/`.
