# Week 7 — Závěr programu — Design Tracking

> Posledná aktualizácia: 2026-08-29
> Plán obrazoviek: `WEEK7_SCREEN_PLAN.md`
> Zdroj obsahu (verbatim): `docs/hpo/source/tyzden-7.md`

## Legenda
- ✅ Hotovo · ❌ Treba spraviť · ➖ Mockup sa zámerne nekreslí · ⚠️ Blokované

---

## Stav — Design (HTML mockupy)

**Žiadne mockupy — zámerne**, rovnako ako pri týždni 6. Týždeň 7 pridáva jediný
nový komponent (revízia SMART cieľov); všetko ostatné je vzor, ktorý autorka už
schválila v týždňoch 2–6.

| Strana týždňa 7 | Ten istý vzor už existuje ako |
|-----------------|-------------------------------|
| Chat (D1, D2–D6 recap, D7) | týždne 2–6 |
| Worksheet (D1 „pyšný/á", D7 tri dovednosti, D7 záver) | týždeň 5 `day1_page3_retezova_analyza.html` |
| Menu dovedností (D2–D6) | `TechniqueMenuPage`, týždeň 2 Deň 6 |
| **Revízia SMART cieľov (D1 3/4)** | **nič — jediná nová obrazovka** |

**Verbatim kontrola:**
```bash
python .claude/design/week7/verify_verbatim.py       # plán: 20 citácií ✅
python .claude/design/week7/verify_dart_verbatim.py  # kód:  37 viet ✅
```
Skript pribudlo pravidlo: literál s Dart interpoláciou (`${…}`) je šablóna, nie
copy, takže sa nekontroluje.

---

## Stav — Flutter implementácia

| Deň | Názov | Route type | Flutter |
|-----|-------|-----------|---------|
| 1 | Ocenění | `week7Day1Appreciation` | ✅ |
| 2 | Všímavost | `week7Day2Mindfulness` | ✅ |
| 3 | Emoční regulace | `week7Day3Emotions` | ✅ |
| 4 | Snášení tísně | `week7Day4Distress` | ✅ |
| 5 | Impulzivita | `week7Day5Impulsivity` | ✅ |
| 6 | Mezilidské vztahy a sebeúcta | `week7Day6Relationships` | ✅ |
| 7 | Shrnutí a ohlédnutí | `week7Day7Conclusion` | ✅ |

Hotové: `_weekDaysContent[7]`, 7 hodnôt `_DayRouteType` + 7 `case`ov, 7 typovaných
routes, `kImplementedBpdWeeks = {1..7}` — **program je kompletný**.
Analyzer **0 errorov, 0 warningov**.

Dni 2–6 sú **jedna dátovo riadená obrazovka** (`Week7RecapDayScreen`) s piatimi
sadami dát — rovnaký vzor ako SPOKO dni týždňa 1, nie päť takmer rovnakých
súborov.

### Opravené / doplnené počas implementácie

| Nájdené | Oprava |
|---------|--------|
| **`bpd_weeks_data.json` volal týždeň 7 „Shrnutí programu"**, zdroj hovorí „Závěr programu" | prepísané. **Tretí týždeň po sebe**, kde titulok nesedel — `W5-02` sa tým uzatvára |
| `WeekCompletionPage` má natvrdo „TÝDEN n DOKONČEN" | pridaný voliteľný `eyebrow`; týždeň 7 hovorí „PROGRAM DOKONČEN" |
| `BpdRescueItem._icons` nemá kľúče pre dovednosti týždňov 3 a 5 | doplnené `facts`, `swap`, `chain` |
| Labely SMART v novej revízii boli „Dosažitelný"/„Časově ohraničený" | opravené na **„Adekvátní"/„Termínovaný"** — to sú tie, ktoré používateľ videl v týždni 1 |

### Čo bolo overené kliknutím

| Overené | Výsledok |
|---------|----------|
| Strom ukazuje **„Týden 7 · Závěr programu"**, odomknutý (trofej) | ✅ |
| Zoznam 7 dní, **žiadna pauza** | ✅ |
| D1 chat a worksheet „na co jsem pyšný/á" (5 polí) | ✅ |
| **D1 revízia SMART — prázdny stav** (kto cieľ nemá) | ✅ láskavá karta, nie prázdna obrazovka |
| **D1 revízia SMART — naplnený stav** | ✅ cieľ zadaný v Týždni 1 sa vrátil so všetkými piatimi riadkami a poľom na zhodnotenie |
| Labely S/M/A/R/T sedia s tými z Týždňa 1 | ✅ „Adekvátní", „Termínovaný" |
| D4 menu — STOP, TIPS, UZNÁVÁM (bez PODPORA, ktorá neexistuje) | ✅ |
| **Detail dovednosti poskladaný zo zdieľaných konštánt týždňa 4** | ✅ znenie identické s tým, čo sa učilo |
| Zdieľané `id` s pôvodnou dovednosťou | ✅ STOP hlási „V záchranném balíčku", nezdvojí sa |
| D7 tri dovednosti + poznámka o záchrannom balíčku | ✅ |
| **D7 karta s kontaktmi visí pri vete, ktorá ju ponúka** | ✅ nie na konci strany |
| **Posledná obrazovka programu** | ✅ „PROGRAM DOKONČEN / Program dokončen! / Dokončit program", text autorky verbatim |
| `logcat` za celý prechod | ✅ **čistý** — žiadny `E/flutter`, žiadny overflow |
| **Dokončenie všetkých 7 dní** (2026-09-07) | ✅ dni 1–6 prejdené a dokončené |
| **Siedmy uzol v strome zozelenel** | ✅ trofej je zelená, strom kompletný |
| **Tmavý režim — celý týždeň 7** (2026-09-07) | ⚠️ odhalil **6 defektov kontrastu**, všetky opravené — viď nižšie |
| D2 menu všímavosti + detail + uloženie do balíčka (tmavý režim) | ✅ |
| D1 revízia SMART v tmavom režime | ✅ cieľ z Týždňa 1 sa vrátil, labely „Adekvátní“/„Termínovaný“ |

### Tmavý režim — 6 opravených defektov kontrastu (2026-09-07)

Prvý poriadny prechod týždňa v tmavom režime. Všetky nájdené chyby sú **ten istý
vzor**: v tmavom režime je pozadie scaffoldu `NepanikarColors.containerColor(primaryColor)`
— teda **samotná primárna fialová**. Čokoľvek, čo použije `primaryColor` ako
*popredie* (text, ikonu, okraj), tým zmizne. Ani jedna z chýb nie je z týždňa 7;
sú vo **zdieľaných komponentoch, ktoré používajú všetky týždne**.

| Súbor | Čo bolo zle | Závažnosť |
|-------|-------------|-----------|
| `bpd_week_detail_screen.dart` | aktívny deň mal natvrdo `Colors.white` pozadie, text bol tiež biely → **zoznam dní bol úplne prázdny** | 🔴 kritická |
| `bpd_week_detail_screen.dart` | dokončený deň: názov aj fajka vo `primaryColor` na fialovom pozadí | 🟠 |
| `day_completion_page.dart` | „Den N dokončen“, „Zítra“ a šípka vo `primaryColor` — **na konci každého dňa programu** | 🟠 |
| `external_link_button.dart`, `rescue_save_button.dart` | „Otevřít video“ a „Uložit do záchranného balíčku“ | 🟠 |
| `technique_menu_page.dart` | ikony dovedností v menu aj v detailnom sheete | 🟡 |
| `day_page_base.dart` (`SectionHeader`, `InfoBox`), `worksheet_parts.dart`, `chat_lists.dart`, `day_preview_sheet.dart`, `selectable_exercise_tile.dart`, `technique_randomiser.dart`, `week_completion_page.dart` | odznaky, podnadpisy, hlavičky `InfoBox`-u, nápovedy | 🟡 |

Opravené jednotne: `final accent = isDarkMode ? Colors.white : primaryColor;`.
**Pozadia zostali nedotknuté** — `BoxDecoration(color: primaryColor)` s bielym
textom je správne (odznaky písmen v SPOKO, SMART, UZNÁVÁM, avatar v chate).

Analyzer **0/0**, všetkých šesť verbatim skriptov zelených, `logcat` čistý.

### Čo overené NEBOLO

- **Svetlý režim po týchto zmenách.** Každá oprava je vetvená cez `isDarkMode`,
  takže svetlá vetva je znakovo tá istá ako predtým — ale preklikané to nebolo.
- **Týždne 1–6 v tmavom režime.** Opravy sú v zdieľaných komponentoch, takže by
  im mali pomôcť rovnako; overený bol týždeň 7.
- **Záverečná oslavná obrazovka sa nezopakuje.** `WeekCompletionPage` je posledná
  strana **Dňa 7**, nie odmena za dokončenie všetkých siedmich dní. Kto spraví
  Deň 7 skôr než ostatné (systém to dovolí), uvidí ju vtedy — a po doplnení
  zvyšných dní už nie. Overené: po dokončení posledného chýbajúceho dňa sa appka
  len vráti na zoznam. → otázka pre autorku, nie chyba kódu.
- `flutter test`, release build, iOS.
- `smart_goal_fields.dart:167` — `focusedBorder` je stále `primaryColor`
  (fialový focus ring na tmavom). Nechané zámerne: je to len fokusový prstenec
  a pole samotné má viditeľný okraj.

---

## Nové / upravené komponenty

| Komponenta | Stav |
|-----------|------|
| **`SmartGoalsReview`** | ✅ nová, ~250 r. — číta `BpdSmartGoalsDao`, ukladá cez existujúci `BpdWorksheetDao`. **Uzatvára `GEN-02`.** |
| `WeekCompletionPage.eyebrow` | ✅ voliteľný parameter |
| `BpdRescueItem._icons` | ✅ tri nové kľúče |

### Odchýlky od plánu

| Plán hovoril | Realita | Prečo |
|--------------|---------|-------|
| Deň 7 má 5 strán vrátane worksheetu „co si odnáším" | tak aj je | — |
| Menu na D3 obsahuje 4 dovednosti (+ validace, slovník emocí) | obsahuje 2 (ověřování faktů, opačná akce) | pre validáciu a slovník emocí neexistuje samostatná textová konštanta, z ktorej by sa dal detail poskladať bez vymýšľania. Radšej menej položiek než vymyslený obsah. |

---

## Súhrn

- **24 strán** — najviac zo všetkých týždňov, a **jediný týždeň bez pauzy**.
- **Jeden nový komponent** (revízia SMART cieľov), ktorý zároveň uzatvára
  rozrobený task `GEN-02` z júna.
- **8 otvorených otázok** (OQ-1 … OQ-8) → task `W7-01`. **Ani jedna neblokuje kód.**
- **Tmavý režim (2026-09-07): 6 defektov kontrastu v zdieľaných komponentoch,
  všetky opravené.** Najhorší — zoznam dní bol v tmavom režime úplne prázdny.
  Netýkalo sa to len týždňa 7, platilo pre **všetkých sedem týždňov**.
- Najdôležitejšia pre autorku: **OQ-1** — rekapitulácie menujú **PODPORA**,
  **coping ahead** a **radikální přijetí**, ktoré program nikdy neučil.
