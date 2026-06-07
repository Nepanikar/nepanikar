---
name: implement-screen
description: Implementuje BPD screen vo Flutter - podľa Stitch designu a existujúcich vzorov
disable-model-invocation: true
allowed-tools: Read, Write, Edit, Glob, Grep, Bash
---

# Implement BPD Screen Workflow

Toto je workflow pre implementáciu BPD obrazoviek vo Flutter podľa Stitch designov.

> **Vernosť textu (verbatim).** Všetok zobrazovaný copy (do `programme_content.json`
> aj priamo do Dart screenov) ber **doslovne z `docs/hpo/source/tyzden-<n>.md`** —
> texty napísala študentka psychológie ako odborný obsah a appka sa stavia presne
> podľa nich. Neparafrázuj, neskracuj, nemeň odborné pojmy ani znenie. Ak sa text
> nezmestí, rieš to layoutom/rozdelením, nie skrátením. (Stitch design je len
> vizuál — pri rozpore má prednosť text zo `source/`.)

## Parametre

Argument: `week<číslo>` (napr. `week2`, `week3`)

Ak nie je argument, opýtaj sa používateľa.

## Kroky

### 1. Skontroluj tracking

Načítaj `.claude/design/$ARGUMENTS/TRACKING.md`

Nájdi **prvý deň** kde:
- Stitch je ✅ (design hotový)
- Flutter je ❌ (implementácia chýba)

Preskakuj dni ktoré sú 🔁 (reuse šablóny).

### 2. Analyzuj Stitch design

Pozri sa na vygenerované screeny v Stitch projekte:
- Project ID: viď `.claude/design/DESIGN_PROMPTS.md` → "Stitch projekt a dizajn systém"
- Použi `mcp__stitch__list_screens` alebo `mcp__stitch__get_screen`

Alebo načítaj popis z `WEEK*_STITCH_PROMPTS.md` ak Stitch nie je dostupný.

### 3. Vytvor priečinkovú štruktúru

```
lib/screens/bpd_programme/weeks/week{X}/day{Y}_{nazov}/
├── day{Y}_{nazov}_screen.dart    # Hlavný screen s PageView
├── intro_page.dart               # Page 1
├── {content}_page.dart           # Page 2-N
└── completion_page.dart          # Posledná page
```

### 4. Implementuj hlavný screen

Použi vzor z existujúcich implementácií:

**Referenčný súbor:**
`lib/screens/bpd_programme/weeks/week2/day1_mindfulness_intro/day1_mindfulness_intro_screen.dart`

**Kľúčové časti:**
```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

// Import všetkých page widgetov
import 'intro_page.dart';
// ...

part 'day{Y}_{nazov}_screen.g.dart';

@TypedGoRoute<Week{X}Day{Y}{Nazov}ScreenRoute>(
  path: '/bpd-programme/week/{X}/day/{Y}',
)
class Week{X}Day{Y}{Nazov}ScreenRoute extends GoRouteData
    with $Week{X}Day{Y}{Nazov}ScreenRoute {
  const Week{X}Day{Y}{Nazov}ScreenRoute();

  @override
  Widget build(BuildContext context, _) =>
      const Week{X}Day{Y}{Nazov}Screen();
}

class Week{X}Day{Y}{Nazov}Screen extends StatefulWidget {
  // PageController, _currentPage, _totalPages
  // _goToNextPage(), _completeDay()
  // _buildHeader() s progress bar
  // PageView s jednotlivými pages
}
```

### 5. Implementuj jednotlivé pages

Použi vzor:
`lib/screens/bpd_programme/weeks/week2/day1_mindfulness_intro/intro_page.dart`

**Kľúčové časti:**
```dart
import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

class {Nazov}Page extends StatelessWidget {
  const {Nazov}Page({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return DayPageBase(
      buttonText: 'Pokračovať', // alebo 'Dokončiť' pre poslednú
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Obsah podľa Stitch designu
        ],
      ),
    );
  }
}
```

### 6. Pridaj route do routes.dart

Otvor `lib/app/router/routes.dart` a pridaj novú route do `_bpdProgrammeRoutes`:

```dart
TypedGoRoute<Week{X}Day{Y}{Nazov}ScreenRoute>(
  path: 'week/{X}/day/{Y}',
),
```

### 7. Spusti build_runner

```bash
flutter pub run build_runner build -d
```

**DÔLEŽITÉ:** Ak build_runner zlyhá, manuálne vytvor `.g.dart` súbor podľa vzoru z existujúcich.

### 8. Pridaj route type do bpd_week_detail_screen.dart

V súbore `lib/screens/bpd_programme/bpd_week_detail_screen.dart`:

1. Pridaj do enum `_DayRouteType`:
```dart
week{X}Day{Y}{Nazov},
```

2. Pridaj case do `_handleDayTap`. **Použi `.push(context).then(...)` so znovu-
načítaním progresu** — rovnako ako všetky ostatné cases v tomto súbore. NIE
`.go(context)` (inak sa po dokončení dňa neobnoví stav dní):
```dart
case _DayRouteType.week{X}Day{Y}{Nazov}:
  const Week{X}Day{Y}{Nazov}ScreenRoute().push(context).then((_) {
    _loadDaysProgress();
  });
```
(switch je `case` bez `break` — pozri existujúce cases.)

3. Pridaj do `_weekDaysContent` mapy pre týždeň {X}.

### 9. Aktualizuj tracking

V `.claude/design/$ARGUMENTS/TRACKING.md`:
- Zmeň ❌ na ✅ pre Flutter stĺpec
- Pridaj cestu k súboru

### 10. Formátuj kód

```bash
dart format --line-length 100 lib/screens/bpd_programme/weeks/
```

---

## Reusable widgety

Použi widgety z `lib/screens/bpd_programme/widgets/day_page_base.dart`:

| Widget | Použitie |
|--------|----------|
| `DayPageBase` | Wrapper pre stránku s tlačidlom dole |
| `SectionHeader` | Hlavička sekcie s ikonou |
| `FeatureCard` | Karta s ikonou, titulkom, popisom |
| `NumberedBenefit` | Číslovaná položka zoznamu |
| `InfoBox` | Zvýraznený info box |

---

## Farby a štýly

```dart
// Dark mode check
final isDarkMode = Theme.of(context).brightness == Brightness.dark;
final primaryColor = Theme.of(context).primaryColor;

// Pozadie karty
color: isDarkMode
    ? Colors.white.withOpacity(0.05)
    : Colors.grey.shade50,

// Text
color: isDarkMode ? Colors.white : NepanikarColors.dark,

// Sekundárny text
color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.6),
```

---

## Priebežné zlepšovanie (povinné)

Riaď sa protokolom v **`.claude/skills/LESSONS.md`**:
- **Na začiatku** behu prečítaj OPEN lekcie pre `implement-screen` + "Docs &
  cross-cutting" a aplikuj ich (napr. vzory, ktoré sa minule ukázali ako lepšie).
- **Na konci** behu sprav retrospektívu — bezpečné drobnosti rovno oprav, zvyšok
  zaloguj. (Pri behu cez `build-screens` to nerob — retro spraví orchestrátor.)

## Príklad použitia

```
/implement-screen week2
```

Výstup:
1. Načíta tracking → nájde Day 4 (Stitch ✅, Flutter ❌)
2. Vytvorí `weeks/week2/day4_breathing/`
3. Vytvorí hlavný screen + 6 page widgetov
4. Pridá route do `routes.dart`
5. Spustí build_runner
6. Aktualizuje tracking

---

## Kontrolný zoznam

- [ ] Priečinok vytvorený
- [ ] Hlavný screen s `@TypedGoRoute`
- [ ] Všetky page widgety
- [ ] Route pridaná do `routes.dart`
- [ ] `.g.dart` súbor vygenerovaný
- [ ] Enum a switch v `bpd_week_detail_screen.dart`
- [ ] `_weekDaysContent` aktualizovaný
- [ ] Tracking aktualizovaný
- [ ] Kód naformátovaný
