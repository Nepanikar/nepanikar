# Week 2 - Všímavost - Design Tracking

> Posledná aktualizácia: 2026-08-12
> Plán obrazoviek: `WEEK2_SCREEN_PLAN.md`

## ⚠️ Zmena štruktúry 2026-08-12 — edukácia prešla na chat

Edukačné strany týždňa 2 sa prerobili na **chat** (`ChatDayPage`), aby týždeň
sedel s týždňom 3. Pravidlo: **čo učí, je chat; čo zbiera voľbu alebo odpoveď,
zostáva formulár.**

| Deň | Predtým | Teraz | Strán |
|-----|---------|-------|-------|
| 1 | 3 scrollovacie strany + completion | celý §1 ako jeden chat + completion | 4 → **2** |
| 2 | `SkillsIntroPage` + 3 × pick-list | chat intro + 3 × pick-list | 5 (bez zmeny) |
| 3 | `SkillsIntroPage` + 3 × pick-list | chat intro + 3 × pick-list | 5 (bez zmeny) |
| 4 | menu (edukácia v `leadParagraphs`) | chat intro + menu + notifikácia | 3 → **4** |
| 6 | menu | **bez zmeny** — nič neučí, celý úvod je 1 veta | 2 |
| 7 | `Week2RecapPage` (FeatureCards) | chat recap (ako W3 D7) | 3 (bez zmeny) |

Zaniklo: `SkillsIntroPage`, `intro_page.dart`, `benefits_page.dart`,
`dbt_context_page.dart`, `recap_page.dart`. Text z nich je v `day1_content.dart`
a v `week2DayNIntro*` konštantách — **nič sa nestratilo okrem** zoznamu
„CO TĚ DNES ČEKÁ" na Dni 1 (v chate je agendou samotný rozhovor).

Nové zdieľané widgety: `ChatFeatureList` + `ChatFeatureItem` a `ChatLinksCard` +
`ChatLink` v `widgets/chat/chat_lists.dart`.

**Overené na emulátore (2026-08-12)** — debug build, čistá inštalácia:
Deň 1 celý (9 krokov chatu → completion, deň sa označil hotový), Deň 2 chat →
pick-list 2/5, Deň 3 chat 1/5, Deň 4 chat → menu 2/4 (bez `leadParagraphs`
nevznikla diera), Deň 7 chat recap → reflexia 2/3 so 4 otázkami.

## Farebná paleta (SPRÁVNA)
- **Primary:** `#491475` (deep purple)
- **Dark:** `#280446` (very dark purple)
- **Secondary:** `#4EA3AD` (teal)
- **Success:** `#6FD866` (green)
- **Error:** `#D86C66`
- **Font:** Inter
- **Roundness:** 12px

## Design System v Stitch
- **Názov:** "Nepanikar Purple"
- **ID:** `6337495699421443160`
- **Project ID:** `12102936321319572704`

---

## Legenda
- ✅ Hotovo
- ⏳ Vygenerované / prebieha
- ❌ Treba spraviť
- 🔁 Reuse šablóny
- 🗑 Zrušené (nahradené novým návrhom)

---

## ⚠️ Zmena štruktúry 2026-08-03

Týždeň 2 bol prepracovaný (jazyk do češtiny, plné zoznamy cvičení, Dni 4 a 6 z
walkthroughu na menu, nový Deň 7). **Staré Stitch návrhy pre časť strán tým
prestali platiť** — sú nižšie označené 🗑. Nové mockupy sa generujú ako HTML
(`mockups/`, rovnako ako týždeň 1), nie v Stitchi.

Počty strán po prepracovaní: Deň 1 = 4 · Deň 2 = 5 · Deň 3 = 5 · Deň 4 = 3 (+sheet)
· Deň 5 = 🔁 · Deň 6 = 2 (+sheet) · Deň 7 = 3.

---

## Stav — Design (HTML mockupy)

### Deň 1: Edukace všímavosti (4 strany)
| Strana | Názov | Typ | Design |
|--------|-------|-----|--------|
| 1/4 | Co je všímavost | chat | ⏳ generované 2026-08-04 · mockups/day1_page1_co_je_vsimavost.html |
| 2/4 | Proč je všímavost užitečná | chat | ❌ |
| 3/4 | Základ všech dovedností + odkazy | chat | ❌ |
| 4/4 | Completion | štandard | ❌ |

### Deň 2: Co dovednosti (5 strán)
| Strana | Názov | Typ | Design |
|--------|-------|-----|--------|
| 1/5 | Co dovednosti — úvod | chat | ❌ |
| 2/5 | Pozorování (9 cvičení) | prax | ⏳ generované 2026-08-04 · mockups/day2_page2_pozorovani.html |
| 3/5 | Popisování (5 cvičení) | prax | ❌ |
| 4/5 | Participace (6 cvičení) | prax | ❌ |
| 5/5 | Completion | štandard | ❌ |

### Deň 3: Jak dovednosti (5 strán)
| Strana | Názov | Typ | Design |
|--------|-------|-----|--------|
| 1/5 | Jak dovednosti — úvod | chat | ❌ |
| 2/5 | Jednomyslně (6 cvičení) | prax | ❌ |
| 3/5 | Bez hodnocení (7 cvičení + páry) | prax | ❌ |
| 4/5 | Efektivně (4 cvičení + SMART) | prax | ❌ |
| 5/5 | Completion | štandard | ❌ |

### Deň 4: Všímavé dýchání (3 strany + sheet)
| Strana | Názov | Typ | Design |
|--------|-------|-----|--------|
| 1/3 | Nabídka dechových cvičení | menu | ⏳ generované 2026-08-04 · mockups/day4_page1_nabidka_dychani.html |
| — | Detail sheet cvičení (zdieľané s D6) | komponenta | ⏳ generované 2026-08-04 · mockups/day4_sheet_detail_cviceni.html |
| 2/3 | Čas na všímavost (notifikácia) | štandard | ❌ |
| 3/3 | Completion | štandard | ❌ |

### Deň 5: Pauza
🔁 Reuse šablóny `shared/day_pause_screen.dart` (doplnený deep-link na záznam nálady)

### Deň 6: Techniky všímavosti (2 strany + sheet)
| Strana | Názov | Typ | Design |
|--------|-------|-----|--------|
| 1/2 | Nabídka technik (5, pick one) | menu | ❌ |
| 2/2 | Completion | štandard | ❌ |

### Deň 7: Shrnutí týdne (3 strany)
| Strana | Názov | Typ | Design |
|--------|-------|-----|--------|
| 1/3 | Co jsme prošli (recap) | chat | ❌ |
| 2/3 | Reflexe týdne (4 otázky) | štandard | ⏳ generované 2026-08-04 · mockups/day7_page2_reflexe.html |
| 3/3 | Týden dokončen | štandard | ❌ |

---

## Zrušené Stitch návrhy (🗑)

| Deň | Strana | Prečo zrušené |
|-----|--------|---------------|
| 1 | 4/5 Reflection — Krátka reflexia | Zdroj §1 reflexiu neobsahuje; v kóde sa neukládala → strana odstránená |
| 4 | 2/6 – 5/6 (mindful/box/7-11/reflection) | Nahradené menu + detail sheetom (zdroj: „vyber z několika možností") |
| 6 | 1/7 – 7/7 (všetkých 5 techník + intro + completion) | Nahradené menu + detail sheetom (zdroj: „vyber si jedno cvičení") |
| 7 | 🔁 WeekReviewScreen | Šablóna zmazaná (neukládala vstupy, chýbal `_weekData[2]`) → dedikovaný Deň 7 |

---

## Stav — Flutter implementácia

| Deň | Názov | Flutter | Pozn. |
|-----|-------|---------|-------|
| 1 | Edukace všímavosti | ✅ `weeks/week2/day1_mindfulness_intro/` | karty; chat prerobenie = OQ-1 |
| 2 | Co dovednosti | ✅ `weeks/week2/day2_what_skills/` | intro karty; chat = OQ-1 |
| 3 | Jak dovednosti | ✅ `weeks/week2/day3_how_skills/` | intro karty; chat = OQ-1 |
| 4 | Všímavé dýchání | ✅ `weeks/week2/day4_breathing/` | menu + sheet + notifikácia |
| 5 | Pauza | ✅ `shared/day_pause_screen.dart` | + záznam nálady |
| 6 | Techniky všímavosti | ✅ `weeks/week2/day6_techniques/` | menu + sheet; route doplnená |
| 7 | Shrnutí týdne | ✅ `weeks/week2/day7_summary/` | reflexia sa ukládá |

---

## Stav — Overenie na zariadení (2026-08-06, emulator-5554)

Celý týždeň prejdený deň po dni, všetkých 7 dní dokončených. Prešlo: všetky
strany sa vykreslia bez overflow, deep-link do dychovej hry, detail sheety,
perzistencia výberov cvičení, záchranný balíček (uloženie + zobrazenie v
*Moje záznamy → DBT program*), záznam nálady z pauzy, denné aj týždňové
completion strany, agregovaný progres na strome.

Nájdené a opravené počas overenia (5 defektov, žiaden nechytil `dart analyze`):

| # | Defekt | Dosah | Oprava |
|---|--------|-------|--------|
| 1 | Reflexia Dňa 7 sa ukladala len v `_completeWeek()` → odchod pred stranou 3/3 zmazal odpovede, hoci strana sľubuje opak | týždeň 1 **aj** 2 | nový `widgets/reflection_autosave.dart` (debounce 400 ms + flush v `dispose`) |
| 2 | `requestPermissionIfNeeded()` vracia `false`, keď awesome_notifications odošle používateľa do systémových nastavení → switch zostal vypnutý aj po povolení | Deň 4 + *Moje výzvy* | čaká na `AppLifecycleListener.onResume` a znova overí povolenie |
| 3 | `markWeekCompleted` nemalo **žiadneho volajúceho** → „0 ze 7 týdnů hotovo" navždy, strom sa nikdy neposunul | celý program | rollup v `BpdDaysDao.markDayCompleted` |
| 4 | Countdown „Ďalšia lekcia sa odomkne o: 18:42:05" bol hardcoded `const Duration` na každej karte | týždeň 1 aj 2 | reálny čas do odomknutia **ďalšieho** dňa, banner sa skryje keď nie je čo čakať |
| 5 | `activeColor: primaryColor` na switche pripomienky → fialový palec na fialovom tracku, stav nečitateľný | Deň 4 | `activeTrackColor: Theme.of(context).highlightColor` (konvencia appky) |

Plus slovenské UI stringy okolo obsahu (`Deň`, `Týždeň`, `Začať deň`,
`Ďalšia lekcia…`, „Tento deň je ešte zamknutý“) prepísané do češtiny —
týkalo sa to týždňa 1 aj 2.

**Neopravené, na rozhodnutie:** „Vybráno 0 z minimálně 2" nie je tvrdá
podmienka, `Pokračovat` prejde aj s nulou (zámer: neblokovať používateľa);
landing screen tvrdí „Tento **7denní** program", pričom program má 7 **týždňov**;
`weeks/week1/day2_education/` je mŕtvy kód s kolidujúcou route (viď LESSONS.md).

---

## Súhrn

| Deň | Design (HTML) | Flutter |
|-----|---------------|---------|
| 1 | ⏳ 1/4 | ✅ 100% |
| 2 | ⏳ 1/5 | ✅ 100% |
| 3 | ❌ 0/5 | ✅ 100% |
| 4 | ⏳ 2/4 | ✅ 100% |
| 5 | 🔁 šablóna | ✅ |
| 6 | ❌ 0/2 | ✅ 100% |
| 7 | ⏳ 1/3 | ✅ 100% |

Vygenerované 2026-08-04: 5 z 22 — vybrané tak, aby pokryli **všetky štyri typy
strán** (chat edukácia, prax s výberom, menu + detail sheet, reflexia). Zvyšok sú
varianty týchto vzorov. Prehľad: `mockups/index.html`.

> Poradie prác je oproti týždňu 1 obrátené — Flutter predbehol dizajn. Mockupy
> preto slúžia na **review a doladenie** už hotových obrazoviek, nie ako zadanie.

## Preview mockupov

```bash
# statický server nad mockups/ (rovnako ako week1, port 8098)
python -m http.server 8098 --directory .claude/design/week2/mockups
```
Alebo cez `.claude/launch.json` → konfigurácia `week2-mockups`.
