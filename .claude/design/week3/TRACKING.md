# Week 3 - Emoční regulace - Design Tracking

> Posledná aktualizácia: 2026-08-06
> Plán obrazoviek: `WEEK3_SCREEN_PLAN.md`
> Zdroj obsahu: `docs/hpo/source/tyzden-3.md` (doručené 2026-08-06)

## Farebná paleta (SPRÁVNA)
- **Primary:** `#491475` (deep purple)
- **Dark:** `#280446` (very dark purple)
- **Secondary:** `#4EA3AD` (teal)
- **Success:** `#6FD866` (green)
- **Error:** `#D86C66`
- **Font:** Inter
- **Roundness:** 12px

---

## Legenda
- ✅ Hotovo
- ⏳ Vygenerované / prebieha
- ❌ Treba spraviť
- 🔁 Reuse šablóny
- ⛔ Blokované rozhodnutím

---

## ✅ Odblokované 2026-08-06 — kód sa môže začať

OQ-1 rozhodnuté (**edukácia = chat**) a s ním OQ-4, OQ-5, OQ-6, OQ-8, OQ-9,
OQ-10 — tabuľka „Rozhodnuté" v `WEEK3_SCREEN_PLAN.md`. Chat widgety
(`widgets/chat/`) už existujú a bežia v týždni 1, takže **týždeň 3 sa dá stavať
chat-native hneď** — nezávisí na prerobení edukačných strán týždňa 2.

**Kódovateľné teraz:** Dni 1, 2, 3, 6, 7.
**Čaká na obsah od autorky (W3-01):** Deň 4 (chýba cvičenie), Deň 5 (v zdroji
jedna veta). Príklad k worksheetu Dňa 3 tiež chýba — deň sa postaví bez neho,
s miestom na doplnenie.

Dopad rozhodnutí na rozsah: **Deň 1 má 7 strán, nie 6** (výčet mýtov rozdelený
na 2 × 11). Celkom teda **26 strán**, nie 25.

---

## Poznámka k štruktúre týždňa

**Pauza je Deň 6**, nie Deň 5 ako v týždňoch 1–2. Deň 5 je krátky SPOKO recall.

---

## Stav — Design (HTML mockupy)

### Deň 1: Edukace o emocích (6 strán)
| Strana | Názov | Typ | Design |
|--------|-------|-----|--------|
| 1/6 | Co je emoční regulace | chat | ❌ |
| 2/6 | Emoce nejsou fakta | chat | ❌ |
| 3/6 | Slovník emocí (10 emócií + infografika) | referencia | ❌ |
| 4/6 | Proč je regulace těžká (6 důvodů) | edukácia | ❌ |
| 5/6 | Mýty o emocích (22) | edukácia | ❌ |
| 6/6 | Boření mýtů (cvičenie) | cvičenie | ❌ |

### Deň 2: Validace a popis emocí (6 strán)
| Strana | Názov | Typ | Design |
|--------|-------|-----|--------|
| 1/6 | Proč pojmenovávat emoce | chat | ❌ |
| 2/6 | Model pro popis emocí (6 kroků) | edukácia | ❌ |
| 3/6 | Worksheet: moje situace (6 polí) | worksheet | ❌ |
| 4/6 | Validace emocí | edukácia | ❌ |
| 5/6 | Zkusme validaci (5 vetných rámcov) | cvičenie | ❌ |
| 6/6 | Completion | štandard | ❌ |

### Deň 3: Ověřování faktů (4 strany)
| Strana | Názov | Typ | Design |
|--------|-------|-----|--------|
| 1/4 | Myšlenky mezi událostí a emocí | chat | ❌ |
| 2/4 | Jak ověřovat fakta (6 kroků) | edukácia | ❌ |
| 3/4 | Worksheet: OVĚŘOVÁNÍ FAKTŮ (11 vstupov) | worksheet | ❌ |
| 4/4 | Completion | štandard | ❌ |

### Deň 4: Opačná akce (4 strany)
| Strana | Názov | Typ | Design |
|--------|-------|-----|--------|
| 1/4 | Co je opačná akce | chat | ❌ |
| 2/4 | Tři roviny opačné akce | edukácia | ❌ |
| 3/4 | Cvičit po malých krocích | edukácia | ❌ |
| 4/4 | Completion | štandard | ❌ |

### Deň 5: Když to, co děláte, nefunguje (2 strany)
| Strana | Názov | Typ | Design |
|--------|-------|-----|--------|
| 1/2 | SPOKO recall + Moje výzvy | recall | ❌ |
| 2/2 | Completion | štandard | ❌ |

### Deň 6: Pauza
🔁 Reuse šablóny `shared/day_pause_screen.dart` (pozn.: text pauzy je hardcoded z týždňa 2 — OQ-9)

### Deň 7: Shrnutí (3 strany)
| Strana | Názov | Typ | Design |
|--------|-------|-----|--------|
| 1/3 | Co jsme prošli (recap) | chat | ❌ |
| 2/3 | Reflexe týdne (3 otázky) | štandard | ❌ |
| 3/3 | Týden dokončen | štandard | ❌ |

---

## Nové komponenty, ktoré týždeň 3 potrebuje

| Komponenta | Pre | Stav |
|-----------|-----|------|
| `EmotionDictionaryScreen` + dáta 10 emócií (trvalá referencia v *Moje záznamy → DBT program*) | D1 3/6 | ❌ |
| `MythBusterCard` (mýtus + pole + príklad na tap) | D1 6/6 | ❌ |
| `StructuredWorksheet` (N polí, príklad na tap, podpolia, perzistencia) | D2 3/6, D3 3/4 | ❌ |
| `SentenceStemFields` (dopĺňanie do vety) | D2 5/6 | ❌ |
| timeline variant `NumberedBenefit` (kroky so spojnicou) | D2 2/6, D3 2/4 | ❌ |
| schéma karta `událost → myšlenky → emoce` | D3 1/4 | ❌ |

Hotové a použiteľné bez zmien: `DayPageBase`, `DayFlowHeader`, `SectionHeader`,
`FeatureCard`, `NumberedBenefit`, `InfoBox`, `ExternalLinkButton`,
`ReflectionQuestionList`, `DayCompletionPage`, `WeekCompletionPage`,
`RescueSaveButton`, `DayPauseScreen`, chat widgety (`widgets/chat/`).

---

## Aktíva

| Súbor | Popis |
|-------|-------|
| `emoce_infografika.png` | Autorská infografika „ZÁKLADNÍ EMOCE" (602×425, 6 emócií), vyňatá z base64 v zdrojovom .md. Pri implementácii prekopírovať do `assets/bpd/` + build_runner. |

---

## Stav — Flutter implementácia (2026-08-06)

Všetkých 7 dní nakódených, `dart analyze` bez chýb a warningov, APK zbuildená.
Overenie na zariadení ešte neprebehlo.

| Deň | Názov | Strán | Flutter |
|-----|-------|-------|---------|
| 1 | Edukace o emocích | 7 | ✅ `weeks/week3/day1_emotions/` |
| 2 | Validace a popis emocí | 6 | ✅ `weeks/week3/day2_describe/` |
| 3 | Ověřování faktů | 4 | ✅ `weeks/week3/day3_check_facts/` |
| 4 | Opačná akce | 2 | ✅ `weeks/week3/day4_opposite_action/` — celý chat, len čítanie |
| 5 | Když to, co děláš, nefunguje | 2 | ✅ `weeks/week3/day5_spoko_recall/` — reuse SPOKO recall + Moje výzvy |
| 6 | Pauza | 1 | ✅ `shared/day_pause_screen.dart` s textom týždňa 3 |
| 7 | Shrnutí | 3 | ✅ `weeks/week3/day7_summary/` |

Zapojené: `kImplementedBpdWeeks = {1, 2, 3}`, `_weekDaysContent[3]`,
6 nových `_DayRouteType` hodnôt + case-y, 6 routes v `_bpdProgrammeRoutes`,
infografika v `assets/bpd/` (`Assets.bpd.emoceInfografika`).

### Rozdiely oproti pôvodnému plánu

| Plán | Realita | Prečo |
|------|---------|-------|
| 22 mýtov | **20** | Plán mal chybu, zdroj má 20 párov mýtus/protiargument. |
| „príklad k mýtom treba vymyslieť" | **autorkin obsah** | Zdroj obsahuje 20 hotových protiargumentov, 1:1 párovaných. |
| `MythBusterCard` + `SentenceStemFields` ako nové komponenty | **nevznikli** | Oba prípady sú štrukturálne worksheet (tvrdenie + pole + príklad) → `WorksheetSectionStyle.myth` a číslované sekcie v `StructuredWorksheet`. Jedna perzistencia namiesto troch. |
| timeline variant `NumberedBenefit` | **nevznikol** | Existujúci `NumberedBenefit` pokryl oba 6-krokové modely; variant by pridal kód bez funkcie. |
| Deň 1 = 6 strán, týždeň = 25 strán | **7 strán / 25 strán** | Výčet mýtov rozdelený 2 × 10 (OQ-5). Deň 4 vyšiel na 2 strany namiesto 4 (celý chat), Deň 3 na 4. |
| Deň 4 čaká na cvičenie | **hotový, len čítanie** | Rozhodnutie autora 2026-08-06: deň je zámerne edukačný. |
| Deň 5 čaká na obsah | **hotový, reuse SPOKO** | Rozhodnutie autora 2026-08-06. |

### Nové / upravené komponenty

| Komponenta | Kde | Pozn. |
|-----------|-----|-------|
| `BpdWorksheetDao` | `services/db/bpd/` | keyed store pre worksheety (`week3_day1_myths`, `week3_day2_model`, `week3_day2_validation`, `week3_day3_facts`) |
| `StructuredWorksheet` | `widgets/` | autosave 500 ms + flush v dispose, príklad per-field aj per-worksheet, `visibleSectionLimit` |
| `SpokoRecallList` + `spokoAreas` | `widgets/spoko_recall.dart` | **vytiahnuté z týždňa 1** — písmená SPOKO boli privátne v `week1/day7_reflection/recall_page.dart`, teraz jedna definícia pre oba týždne |
| `EmotionDictionaryScreen` | `home/my_records/emotion_dictionary/` | trvalá referencia, 4. dlaždica v *DBT program* |
| `DayPauseScreen` | `shared/` | text pauzy parametrizovaný per týždeň (OQ-9) |

### Text čakajúci na schválenie autorkou (`// TODO: schválit autorem`)

- completion vety Dní 1, 3, 4, 5 (zdroj ich nemá)
- **príklad k worksheetu Dňa 3** — 7-sekciový vzorový záznam, náš návrh

---

## Súhrn

| Deň | Design (HTML) | Flutter |
|-----|---------------|---------|
| 1 | ❌ 0/6 | ⛔ |
| 2 | ❌ 0/6 | ⛔ |
| 3 | ❌ 0/4 | ⛔ |
| 4 | ❌ 0/4 | ⛔ |
| 5 | ❌ 0/2 | ⛔ |
| 6 | 🔁 šablóna | 🔁 |
| 7 | ❌ 0/3 | ⛔ |

Celkom **25 strán** + 1 trvalá referenčná obrazovka (Slovník emocí).

## Preview mockupov

Po vygenerovaní: `.claude/launch.json` → konfigurácia `week3-mockups` (port 8097,
treba pridať) alebo `python -m http.server 8097 --directory .claude/design/week3/mockups`.
