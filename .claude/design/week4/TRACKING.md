# Week 4 — Snášení tísně — Design Tracking

> Posledná aktualizácia: 2026-08-12
> Plán obrazoviek: `WEEK4_SCREEN_PLAN.md`
> Zdroj obsahu (verbatim): `docs/hpo/source/tyzden-4.md`

## Legenda
- ✅ Hotovo
- ⏳ Mockup vygenerovaný (čaká na review)
- ❌ Treba spraviť
- ➖ Mockup sa zámerne nekreslí (opakuje existujúci vzor — dôvod v `mockups/index.html`)
- 🔁 Reuse šablóny
- ⚠️ Blokované rozhodnutím

Design tokeny (paleta, typografia, spacing) → `.claude/design/DESIGN_PROMPTS.md`.
Neduplikujeme ich tu.

---

## Stav — Design (HTML mockupy)

Mockupy sú v `mockups/`, prezerajú sa cez `.claude/launch.json` → **`week4-mockups`**
(port 8097). Prehľad + zdôvodnenie, čo nie je nakreslené: `mockups/index.html`.

**Nakreslených 6 z 19 strán (2026-08-12)** — zámerne reprezentatívny výber, nie
všetko: ostatné strany opakujú vzor, ktorý niektorý z tých šiestich už ukazuje
(dôvod pri každej strane v `index.html`). Overené v prehliadači: všetkých 6 na
390 px bez vodorovného scrollu, `_shared.css` sa aplikuje, a **34 autorkiných
viet prešlo verbatim kontrolou proti `source/tyzden-4.md`** (skript porovnáva
znak po znaku; 13 našich viet je označených ako naše).

Mockupy používajú **hlavičku a karty tak, ako ich appka reálne renderuje**
(`DayFlowHeader` — ✕ + segmenty + n/N), nie starší chat-appbar z mockupov
týždňa 2. Dôvod: autorka má vidieť to, čo uvidí v appke.

### Deň 1: Edukace o stresu (2 strany)
| Strana | Názov | Typ | Design |
|--------|-------|-----|--------|
| 1/2 | Edukace o stresu | chat | ⏳ 2026-08-12 · `mockups/day1_page1_edukace_o_stresu.html` |
| 2/2 | Completion | completion | ⚠️ OQ-8 (bez mockupu — nezmenený `DayCompletionPage`) |

### Deň 2: Dovednosti pro překonání krize (6 strán)
| Strana | Názov | Typ | Design |
|--------|-------|-----|--------|
| 1/6 | Co se děje v krizi | chat | ➖ bez mockupu (rovnaký vzor ako D1 1/2) |
| 2/6 | Kdy tyto dovednosti použít (+ krízový link) | chat | ⏳ 2026-08-12 · `mockups/day2_page2_kdy_pouzit.html` |
| 3/6 | STOP | skill | ⏳ 2026-08-12 · `mockups/day2_page3_stop.html` |
| 4/6 | TIPS | skill | ⏳ 2026-08-12 · `mockups/day2_page4_tips.html` — obsahuje **náš** návrh kontraindikácií |
| 5/6 | Progresivní svalová relaxace | exercise | ➖ bez mockupu (video tlačidlo + veta) |
| 6/6 | Completion | completion | ⚠️ OQ-8 |

### Deň 3: Pauza
| Strana | Názov | Typ | Design |
|--------|-------|-----|--------|
| — | Pauza (text Dňa 3) | 🔁 `DayPauseScreen` | 🔁 ⚠️ OQ-1 |

### Deň 4: Všímavost u stresu (3 strany)
| Strana | Názov | Typ | Design |
|--------|-------|-----|--------|
| 1/3 | Všímavost u stresu | chat | ➖ bez mockupu (chat vzor) |
| 2/3 | Připomeňme si techniku (losovanie) | exercise | ⏳ 2026-08-12 · `mockups/day4_page2_losovani.html` |
| 3/3 | Completion | completion | ⚠️ OQ-8 |

### Deň 5: Techniky pro zvládnutí okamžiku krize (5 strán)
| Strana | Názov | Typ | Design |
|--------|-------|-----|--------|
| 1/5 | Když emoci nejde změnit | chat | ➖ bez mockupu (chat vzor) |
| 2/5 | UZNÁVÁM: sedm triků | edukácia | ⚠️ OQ-10 (vzor = mockup STOP, 7 písmen) |
| 3/5 | Cvičení UZNÁVÁM, část 1 (U/Z/N/Á — 13 položiek) | checklist | ⏳ 2026-08-12 · `mockups/day5_page3_checklist_uznavam.html` |
| 4/5 | Cvičení UZNÁVÁM, část 2 (V/Á/M — 9 položiek) | checklist | ➖ bez mockupu (rovnaký vzor ako část 1) · ⚠️ OQ-4 |
| 5/5 | Completion | completion | ⚠️ OQ-8 |

### Deň 6: Pauza
| Strana | Názov | Typ | Design |
|--------|-------|-----|--------|
| — | Pauza (text Dňa 6 — **iný** než Deň 3) | 🔁 `DayPauseScreen` | 🔁 ⚠️ OQ-1 |

### Deň 7: Shrnutí (3 strany)
| Strana | Názov | Typ | Design |
|--------|-------|-----|--------|
| 1/3 | Co jsme prošli | chat recap | ⚠️ W4-01 (recap položky) · ➖ bez mockupu (vzor W2/W3 D7) |
| 2/3 | Reflexe týdne (3 otázky) | reflexia | ➖ bez mockupu (nezmenený `ReflectionQuestionList`) |
| 3/3 | Týden dokončen | completion | ➖ bez mockupu (nezmenený `WeekCompletionPage`) |

---

## Stav — Flutter implementácia

**Implementované a overené na zariadení 2026-08-12** (debug build, čistá inštalácia).

| Deň | Názov | Route type | Flutter |
|-----|-------|-----------|---------|
| 1 | Edukace o stresu | `week4Day1Stress` | ✅ |
| 2 | Dovednosti pro překonání krize | `week4Day2CrisisSkills` | ✅ |
| 3 | Pauza | `pause` | ✅ 🔁 vlastný text |
| 4 | Všímavost u stresu | `week4Day4Mindfulness` | ✅ |
| 5 | Techniky pro zvládnutí okamžiku krize | `week4Day5Uznavam` | ✅ |
| 6 | Pauza | `pause` | ✅ 🔁 vlastný text |
| 7 | Shrnutí | `week4Day7Summary` | ✅ |

Hotové: `_weekDaysContent[4]`, 5 hodnôt `_DayRouteType` + 5 `case`ov, 5 typovaných
routes (anotácia **aj** `_bpdProgrammeRoutes`), `kImplementedBpdWeeks = {1,2,3,4}`.

### Čo bolo overené kliknutím (nie len skompilované)

| Overené | Výsledok |
|---------|----------|
| Dva pauzové dni majú **rôzny** text (W4-02) | ✅ Deň 3 aj Deň 6 zobrazili vlastný odstavec |
| Krízový odkaz na D2 2/6 | ✅ otvorí *Crisis centers* |
| „Kedy nie" na tej istej strane ako „kedy áno" | ✅ |
| STOP / TIPS ako `NumberedBenefit` s písmenom | ✅ bez nového widgetu |
| Uloženie STOP do záchranného balíčka | ✅ tlačidlo prepne na „V záchranném balíčku" + snackbar |
| Kontraindikačná karta pod „Intenzivní cvičení" | ✅ červená, na správnom mieste |
| Dychový odkaz u písmena P → preset 4/6 | ✅ spustí cvičenie s dvomi fázami (bez zádrží) |
| Losovanie techniky + „Vylosovat jinou" | ✅ druhé losovanie dalo inú techniku |
| Checklist UZNÁVÁM bez „z minimálně 0" | ✅ „Označeno: 2" |
| **Checklist prežije odchod bez dokončenia** | ✅ fajky aj počítadlo po návrate sedeli |
| **Reflexia D7 prežije odchod bez dokončenia** | ✅ text po návrate na mieste |
| Dokončenie všetkých 7 dní → rollup týždňa | ✅ „1 ze 7 týdnů hotovo", zelená značka |

---

## Nové / upravené komponenty

| Komponenta | Stav | Pozn. |
|-----------|------|-------|
| `TechniqueRandomiser` | ❌ nová | malá; losuje z `TechniqueData` týždňa 2 |
| `DayPauseScreen` — text podľa `(týždeň, deň)` | ❌ úprava | OQ-1, inak Deň 6 zobrazí text Dňa 3 |
| `SkillPracticePage` — `minimumPicks: 0` + voliteľný hint | ❌ úprava | OQ-6 |
| Breathing preset 4 / 6–8 | ❌ úprava | OQ-7 |
| `NumberedBenefit` s písmenom | ✅ bez zmeny | `number` je `String` |

---

## Súhrn

- **19 strán** + 2 dni celé na reuse (pauzy).
- **Nový kód je minimálny:** 1 malý komponent + 3 malé úpravy existujúcich.
  Infrastruktúra z týždňov 2 a 3 (chat, checklisty, záchranný balíček, reflexia
  s autosave, akronymové karty) pokrýva zvyšok.
- **12 otvorených otázok** (OQ-1 … OQ-12), z toho 8 potrebuje autorku → task
  `W4-01` v `docs/hpo/TODO.md`.
- Kódovateľné hneď bez čakania: **Dni 1, 5 (okrem písmen), 7.**
- Bez rozhodnutia sa nedá dokončiť: **Dni 3 a 6** (OQ-1), **Deň 4** (OQ-2, OQ-3).
