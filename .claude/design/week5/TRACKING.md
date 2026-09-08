# Week 5 — Impulzivní chování — Design Tracking

> Posledná aktualizácia: 2026-08-28
> Plán obrazoviek: `WEEK5_SCREEN_PLAN.md`
> Zdroj obsahu (verbatim): `docs/hpo/source/tyzden-5.md`

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

Mockupy sú v `mockups/`, prezerajú sa cez `.claude/launch.json` → **`week5-mockups`**
(port 8096). Prehľad + zdôvodnenie, čo nie je nakreslené: `mockups/index.html`.

**Nakreslených 6 z 18 strán (2026-08-28)** — zámerne reprezentatívny výber.
Overené v prehliadači na 390 px: všetkých 6 strán aj `index.html` bez
vodorovného scrollu, `_shared.css` sa aplikuje.

**Verbatim kontrola je automatická, nie ručná.** `verify_verbatim.py` už
neporovnáva ručne vypísaný zoznam viet (ako v týždni 4) — **vyťahuje** každú
citáciu z plánu a každý textový element z mockupov a porovnáva ho znak po znaku
proti zdroju. Vetu teda nejde ticho preformulovať tým, že sa zabudne pridať do
zoznamu. Aktuálny výsledok: **102 citácií verbatim, 11 označených ako naše**
(z toho 3 sú ukážkové odpovede, ktoré existujú len v mockupe).

```bash
python .claude/design/week5/verify_verbatim.py
```

Mockupy používajú **hlavičku a karty tak, ako ich appka reálne renderuje**
(`DayFlowHeader` — ✕ + segmenty + n/N), rovnako ako týždeň 4.

### Deň 1: Edukace o impulzivitě (5 strán)
| Strana | Názov | Typ | Design |
|--------|-------|-----|--------|
| 1/5 | Co je impulzivita | chat | ➖ bez mockupu (chat vzor W2/W4) |
| 2/5 | Analýza chování | chat | ➖ bez mockupu (chat + `ChatNumberedList`) |
| 3/5 | Řetězová analýza | worksheet | ⏳ 2026-08-28 · `mockups/day1_page3_retezova_analyza.html` |
| 4/5 | Analýza chybějících článků | vetvenie | ⏳ 2026-08-28 · `mockups/day1_page4_chybejici_clanky.html` — **jediná nová komponenta týždňa** |
| 5/5 | Completion | completion | ➖ bez mockupu (nezmenená `DayCompletionPage`) |

### Deň 2: Život ohrožující chování (5 strán)
| Strana | Názov | Typ | Design |
|--------|-------|-----|--------|
| 1/5 | Upozornění a dobrovolnost | chat | ⏳ 2026-08-28 · `mockups/day2_page1_upozorneni.html` · ⚠️ OQ-1 |
| 2/5 | Co to je | chat | ➖ bez mockupu (chat vzor) |
| 3/5 | STOP | akronym | ⏳ 2026-08-28 · `mockups/day2_page3_stop_konflikt.html` · ⚠️ **OQ-2** (obe znenia vedľa seba) |
| 4/5 | Mých 5 činností | zoznam | ⏳ 2026-08-28 · `mockups/day2_page4_pet_cinnosti.html` |
| 5/5 | Completion + péče | completion | ➖ bez mockupu (`DayCompletionPage` + 2 odkazy) |

### Deň 3: Pauza
| Strana | Názov | Typ | Design |
|--------|-------|-----|--------|
| — | Pauza (text Dňa 3) | 🔁 `DayPauseScreen` | ➖ bez mockupu — **overené, že widget netreba meniť** |

### Deň 4: Plánování a prevence (2 strany)
| Strana | Názov | Typ | Design |
|--------|-------|-----|--------|
| 1/2 | Plánování a prevence (5 sekcií / 10 polí) | worksheet | ⏳ 2026-08-28 · `mockups/day4_page1_planovani_prevence.html` · ⚠️ OQ-6 |
| 2/2 | Completion | completion | ➖ bez mockupu |

### Deň 5: Všímavost (3 strany)
| Strana | Názov | Typ | Design |
|--------|-------|-----|--------|
| 1/3 | Všímavost u impulzivity | chat | ➖ bez mockupu (chat vzor) |
| 2/3 | Vyzkoušej si techniku | losovanie | ➖ bez mockupu (zhodné s W4 D4) · ⚠️ OQ-9 |
| 3/3 | Completion | completion | ➖ bez mockupu |

### Deň 6: Pauza
| Strana | Názov | Typ | Design |
|--------|-------|-----|--------|
| — | Pauza (text Dňa 6 — **iný** než Deň 3) | 🔁 `DayPauseScreen` | ➖ bez mockupu |

### Deň 7: Shrnutí (3 strany)
| Strana | Názov | Typ | Design |
|--------|-------|-----|--------|
| 1/3 | Uzavíráme pátý týden | chat recap | ➖ bez mockupu (vzor W2/W3/W4 D7) · ⚠️ OQ-10 |
| 2/3 | Reflexe týdne (3 otázky) | reflexia | ➖ bez mockupu (nezmenený `ReflectionQuestionList`) |
| 3/3 | Týden dokončen | completion | ➖ bez mockupu · ⚠️ OQ-11 |

---

## Stav — Flutter implementácia

**Implementované a overené na zariadení 2026-08-28** (debug build, emulátor
Medium_Phone, existujúca inštalácia s dokončeným týždňom 1).

| Deň | Názov | Route type | Flutter |
|-----|-------|-----------|---------|
| 1 | Edukace o impulzivitě | `week5Day1Impulsivity` | ✅ |
| 2 | Život ohrožující chování | `week5Day2LifeThreatening` | ✅ ⚠️ ship s OQ-1, OQ-2 |
| 3 | Pauza | `pause` | ✅ 🔁 vlastný text |
| 4 | Plánování a prevence | `week5Day4Prevention` | ✅ |
| 5 | Všímavost | `week5Day5Mindfulness` | ✅ |
| 6 | Pauza | `pause` | ✅ 🔁 vlastný text |
| 7 | Shrnutí | `week5Day7Summary` | ✅ |

Hotové: `_weekDaysContent[5]`, 5 hodnôt `_DayRouteType` + 5 `case`ov, 5 typovaných
routes (anotácia **aj** `_bpdProgrammeRoutes`), `kImplementedBpdWeeks = {1,2,3,4,5}`,
dva záznamy v `DayPauseScreen._pauseCopyByDay`. Analyzer: **0 errorov, 0 warningov**
(313 info, o 20 viac než pred zmenou — všetko `withOpacity` deprecation, rovnako
ako vo zvyšku repa).

### Opravené počas implementácie

| Nájdené | Oprava |
|---------|--------|
| **`bpd_weeks_data.json` volal týždeň 5 „Mezilidské vztahy"** — strom aj hlavička dňa by ukazovali názov iného modulu, než ktorý autorka dodala | prepísané na „Impulzivní chování" (+ `descriptionKey`, ktorý nikto nečíta) |
| `BpdRescueItem._icons` nemá kľúče `pause` ani `spa`, ktoré týždeň 4 ukladá | doplnené `pause`, `spa`, `list` — inak STOP aj relaxácia padnú na generickú ikonu |
| `ChatDayPage` nemá sekundárnu akciu | pridaný voliteľný `secondaryAction` (potrebuje ho dobrovoľný Deň 2) |
| `DayCompletionPage` nemá slot nad zhrnutím | pridaný voliteľný `extraContent` (Deň 2 tam dáva dva odkazy na pomoc) |
| `StructuredWorksheet` nedovolí okoliu vyplniť pole | pridaný `WorksheetInsertController` (chip s príkladom na Dni 2 vloží text) |

### Čo bolo overené kliknutím (nie len skompilované)

| Overené | Výsledok |
|---------|----------|
| Strom týždňov ukazuje **„Týden 5 · Impulzivní chování"** a je odomknutý | ✅ |
| Zoznam 7 dní so správnymi názvami a časmi | ✅ |
| D1: chat 1/5 a 2/5, `ChatFeatureList` (mozog), `ChatNumberedList` (6 krokov) | ✅ |
| D1 3/5 worksheet, `visibleSectionLimit: 3` + „Zobrazit zbývající kroky" | ✅ |
| **D1 4/5 vetvenie: „Ano" odkryje ďalšiu otázku, „Ne" otvorí 2 polia a reťaz končí** | ✅ |
| **Worksheet aj vetvenie prežijú odchod bez dokončenia** | ✅ text „hadka vecer", odpoveď „Ano", „Ne" aj „bezmoc" po návrate sedeli |
| „Zobrazit příklad" ukáže autorkin zoznam v zátvorke | ✅ |
| D1 completion drží preklep „zaátek" verbatim | ✅ |
| D2 1/5 varovanie + **„Přeskočit dnešek"** je vidieť od prvej obrazovky | ✅ |
| D2 krízová karta → *Crisis centers* | ✅ (obsah anglicky — emulátor beží v EN, dátová medzera z týždňa 1) |
| D2 3/5 STOP + uloženie do balíčka („V záchranném balíčku") | ✅ |
| **D2 4/5 klepnutie na príklad vloží text do prvého prázdneho poľa** | ✅ dva chipy → polia 1 a 2 |
| D2 5/5 dva odkazy na pomoc **nad** poďakovaním | ✅ |
| **Dva pauzové dni majú rôzny text** | ✅ Deň 3 aj Deň 6 zobrazili vlastný odstavec |
| D4 worksheet, `visibleSectionLimit: 2`, odkaz na balíček | ✅ |
| D5 losovanie + **„Vybrat si sám/sama"** → sheet s 8 technikami → detail | ✅ |
| D7 rekapitulácia, reflexia, **autosave po odchode** | ✅ „retezova analyza" po návrate na mieste |
| Dokončenie všetkých 7 dní → **uzol týždňa 5 zelený** | ✅ |
| Záchranný balíček drží „Můj bezpečnostní plán", „Mých 5 činností" a STOP | ✅ so správnymi ikonami |
| Tmavý režim: strom, D1 worksheet, D1 vetvenie | ✅ bez nečitateľného textu |
| `logcat` počas celého prechodu | ✅ žiadny `E/flutter`, žiadny RenderFlex overflow |

### Čo overené nebolo

- **Release build** — všetko vyššie je debug.
- **Týždne 1–4 po tejto zmene.** Dotkol som sa štyroch zdieľaných súborov
  (`ChatDayPage`, `DayCompletionPage`, `StructuredWorksheet`,
  `BpdRescueItem`); všetky zmeny sú aditívne a voliteľné, ale prejdené neboli.
- **iOS.**

---

## Nové / upravené komponenty

| Komponenta | Stav | Pozn. |
|-----------|------|-------|
| `MissingLinksAnalysis` | ✅ nová, 430 r. | vetvenie áno/nie, perzistencia cez existujúci `BpdWorksheetDao` (žiadny nový store) |
| Dobrovoľný deň (`ChatDayPage.secondaryAction`) | ✅ nová, malá | OQ-1 — preskočenie označí deň za hotový |
| `DayCompletionPage.extraContent` | ✅ malá úprava | D2 5/5 potrebuje odkazy **nad** zhrnutím |
| `StructuredWorksheet` + `WorksheetInsertController` | ✅ malá úprava | chip s príkladom vloží text do prvého prázdneho poľa (OQ-8) |
| `BpdRescueItem._icons` | ✅ malá oprava | chýbali kľúče, ktoré už ukladal **týždeň 4** |
| `DayPauseScreen` | ✅ bez zmeny | `_pauseCopyByDay` už je kľúčované `(týždeň, deň)` — overené v kóde aj na zariadení |
| `AcronymSkillPage`, `RescueSaveButton`, `TechniqueRandomiser`, `ReflectionQuestionList`, `ChatFeatureList`, `ChatNumberedList` | ✅ bez zmeny | — |

### Odchýlky od plánu

| Plán hovoril | Realita | Prečo |
|--------------|---------|-------|
| Deň 4 má **tiché deep-linky v jednotlivých sekciách** (TIPS, SPOKO, balíček) | jeden odkaz na záchranný balíček pod worksheetom | `StructuredWorksheet` nemá slot na obsah v sekcii; pridať ho by bola väčšia zmena než celý deň |
| Zoznam 5 činností je „`StructuredWorksheet` bez zmeny" | worksheet **plus** nový `WorksheetInsertController` | inak by chip iba svietil a nedal sa použiť — a to bol celý zmysel OQ-8 |
| STOP použije „`id` z týždňa 4" | áno, `week4_stop`, ale **text z týždňa 5** | verbatim vyhráva nad konzistenciou, kým OQ-2 nerozhodne autorka |

---

## Súhrn

- **18 strán** + 2 dni celé na reuse (pauzy).
- **Nový kód je minimálny:** 1 komponent (vetvenie) + 1 malé správanie
  (dobrovoľný deň). Infraštruktúra z týždňov 2–4 pokrýva zvyšok — týždeň 5 je
  obsahovo najhustejší, ale infraštruktúrne najľahší doteraz.
- **12 otvorených otázok** (OQ-1 … OQ-12) → task `W5-01` v `docs/hpo/TODO.md`.
- **Blokujúce:** OQ-1 a OQ-2 (obe Deň 2). Ostatné sa dajú kódovať s
  `// TODO: schválit autorem`.
- Kódovateľné hneď: **Dni 1, 3, 4, 5, 6, 7.**
