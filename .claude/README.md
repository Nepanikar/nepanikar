# .claude - BPD Programme Documentation

Tento priečinok obsahuje dokumentáciu a tracking pre vývoj BPD programu v aplikácii Nepanikař.

---

## Workflow vývoja

### 1. Design (Stitch)
1. Vytvor prompt podľa šablóny v `design/DESIGN_PROMPTS.md`
2. Vygeneruj UI v Stitch s design system "Nepanikar Purple"
3. Zaznač progress v `design/weekX/TRACKING.md`

### 2. Implementácia (Flutter)
1. Vytvor screen v `lib/screens/bpd_programme/weeks/weekX/`
2. Pridaj route do `lib/app/router/routes.dart`
3. Spusti `flutter pub run build_runner build -d`
4. Pridaj route type do `bpd_week_detail_screen.dart`
5. Aktualizuj tracking v `OBRAZOVKY_PREHLAD.md`

### 3. Obsah
- Všetky texty sú v `assets/bpd/programme_content.json`
- Vyplnené dáta pre týždne sú v `data/TYZDEN_X_VYPLNENY.txt`

### Užitočné príkazy
```bash
# Generovanie routes
flutter pub run build_runner build -d

# Spustenie aplikácie
flutter run

# Formátovanie
dart format --line-length 100 ./
```

> **Technické detaily** (štruktúra kódu, widgety, routy) sú v hlavnom `CLAUDE.md` v roote projektu.

---

## Nástroje

| Nástroj | Účel |
|---------|------|
| **Stitch** | UI mockupy a design |
| **Flutter** | Implementácia |
| **Localazy** | Preklady |
| **Claude Code** | AI asistent pre kódenie |

### Stitch Design System
- **Názov:** Nepanikar Purple
- **Project ID:** `12102936321319572704`
- **Primary:** `#491475` (deep purple)
- **Secondary:** `#4EA3AD` (teal)
- **Font:** Inter
- **Roundness:** 12px

---

## Štruktúra priečinkov

```
.claude/
├── README.md                 # Tento súbor
├── OBRAZOVKY_PREHLAD.md      # HLAVNÝ TRACKING - stav implementácie
├── settings.local.json       # Claude Code nastavenia
│
├── design/                   # Design a UI
│   ├── DESIGN_PROMPTS.md     # Všeobecné design prompty
│   └── week2/                # Týždeň 2 design
│       ├── WEEK2_STITCH_PROMPTS.md # Stitch prompty pre týždeň 2
│       └── TRACKING.md       # Tracking pre týždeň 2
│
├── data/                     # Obsah a dáta
│   ├── BPD_DATA_GUIDE.md     # Návod na prácu s dátami
│   ├── bpd_data_template.json
│   ├── bpd_data_template_simple.json
│   ├── TYZDEN_1_VYPLNENY.txt # Vyplnený obsah týždňa 1
│   └── TYZDEN_2_VYPLNENY.txt # Vyplnený obsah týždňa 2
│
└── docs/                     # Referenčné dokumenty
    └── návrh programu - HPO Nepanikař.pdf
```

---

## Hlavné súbory

### `OBRAZOVKY_PREHLAD.md`
**Hlavný tracking súbor** - obsahuje:
- Navrhovanú štruktúru priečinkov pre obrazovky
- Stav implementácie pre každý týždeň (7 tabuliek)
- Celkový progress
- Checklist ďalších krokov

### `design/week2/WEEK2_STITCH_PROMPTS.md`
Detailné prompty pre generovanie UI v Stitch pre týždeň 2 (Mindfulness):
- Day 1: Mindfulness Education ✅
- Day 2: What Skills ✅
- Day 3: How Skills ✅
- Day 4: Breathing ❌
- Day 6: Techniques ❌

### `design/week2/TRACKING.md`
Detailný tracking stavu designu a implementácie pre týždeň 2.

### `data/TYZDEN_X_VYPLNENY.txt`
Vyplnený obsah pre jednotlivé týždne - texty, cvičenia, otázky.

---

## Quick Links

| Čo hľadám | Kde to nájdem |
|-----------|---------------|
| Čo je hotové / čo chýba | `OBRAZOVKY_PREHLAD.md` |
| Týždeň 2 design tracking | `design/week2/TRACKING.md` |
| Design prompty pre Stitch | `design/week2/WEEK2_STITCH_PROMPTS.md` |
| Obsah týždňov (texty) | `data/TYZDEN_X_VYPLNENY.txt` |
| Ako pracovať s dátami | `data/BPD_DATA_GUIDE.md` |
| Pôvodný návrh programu | `docs/návrh programu - HPO Nepanikař.pdf` |

---

## Aktuálny stav (2026-04-01)

| Týždeň | Stav |
|--------|------|
| 1 - Úvod | ✅ 100% |
| 2 - Mindfulness | 🚧 71% (5/7 dní) |
| 3-7 | ❌ len šablóny |

**Celkovo: 49%** (vďaka zdieľaným šablónam pre pauzy a zhrnutia)

### Najbližšie kroky
1. **Týždeň 2** - dokončiť Day 4 (dýchanie) a Day 6 (techniky)
2. **Týždeň 3-7** - design + implementácia podľa `OBRAZOVKY_PREHLAD.md`

---

## Štruktúra dňa (multi-page flow)

Každý deň má viacero strán s týmto patternom:

```dart
class DayXScreen extends StatefulWidget {
  // PageController + _currentPage state
  // PageView s NeverScrollableScrollPhysics (swipe disabled)
  // Progress bar v headeri
  // Jednotlivé page widgety používajú DayPageBase
}
```

**Príklad štruktúry priečinka:**
```
day1_mindfulness_intro/
├── day1_mindfulness_intro_screen.dart  # Hlavný screen s PageView
├── day1_mindfulness_intro_screen.g.dart # Generovaný route
├── intro_page.dart                      # Strana 1
├── benefits_page.dart                   # Strana 2
├── dbt_context_page.dart                # Strana 3
├── reflection_page.dart                 # Strana 4
└── completion_page.dart                 # Strana 5
```
