---
name: plan-screens
description: Zo špecifikácie obsahu (docs/hpo/) vytvorí plán obrazoviek BPD programu - čo má každá obrazovka obsahovať a ako má najlepšie vyzerať, posúdené z funkčného, UX, prístupnostného a emočného hľadiska. Pôvodný text programu používa verbatim (neparafrázuje). Z plánu vygeneruje Stitch prompty a tracking pre /design-screen.
disable-model-invocation: true
allowed-tools: Read, Glob, Grep, Write, Edit
---

# Plan BPD Screens Workflow

Toto je **prvý krok** v pipeline tvorby obrazoviek BPD/HPO programu:

```
[obsah spec]  →  /plan-screens  →  /design-screen  →  /implement-screen
docs/hpo/        plán + prompty     Stitch design     Flutter kód
```

Skill vezme obsahovú špecifikáciu týždňa a vytvorí **plán obrazoviek**: rozbije
obsah na jednotlivé screeny/strany a pre každú navrhne, čo má obsahovať a ako má
najlepšie vyzerať — vzhľadom na to, čo má obsahovať a komu slúži (appka prvej
psychickej pomoci). Z plánu zároveň vygeneruje Stitch prompty a tracking, aby
`/design-screen` mohol hneď pokračovať.

## ZÁSADA č. 1 — vernosť textu (verbatim copy)

Texty programu napísala študentka psychológie ako odborný obsah pre diplomovú
prácu a aplikácia sa stavia **presne podľa nich**. Preto:

- **Používaj pôvodný text čo najviac a doslovne.** Copy do plánu aj do Stitch
  promptov ber **verbatim** z `docs/hpo/source/tyzden-<n>.md` — vrátane
  formulácií, terapeutickej terminológie, úvodzoviek a poradia.
- **Neparafrázuj, neskracuj, neprepisuj, „nevylepšuj" znenie.** Nemeň odborné
  pojmy (napr. DBT termíny, „bez hodnocení", „jednomyslně", názvy cvičení).
- Tvoja práca je text **rozdeliť na obrazovky a navrhnúť okolo neho UX** — nie ho
  prepisovať. Ak sa niečo na stranu nezmestí, **rozdeľ** to na viac strán, neskracuj.
- Ak je niečo v texte nejednoznačné / vyzerá ako preklep alebo chýbajúce slovo,
  **nemeň to potichu** — ponechaj pôvodné znenie a zapíš to do "Otvorené otázky"
  danej obrazovky, nech to rozhodne autor.
- Jediné, čo smieš upraviť, sú zjavné technické artefakty exportu (napr. markdown
  escape `\-`, `\*`) — nikdy nie samotné slová.

## Parametre

Argument: `week<číslo>` (napr. `week1`, `week3`).

Ak nie je argument, opýtaj sa používateľa na týždeň.

## Vstupy (prečítaj pred plánovaním)

1. **Obsah programu** — zdroj pravdy, čo používateľ vidí:
   - `docs/hpo/source/tyzden-<n>.md` — **doslovný (verbatim) text** daného týždňa.
     Toto je must-have copy; presné znenie do promptov ber ODTIAĽTO, nie zo zhrnutia.
   - `docs/hpo/content-reference.md` (štruktúrovaný prehľad daného týždňa)
   - `docs/hpo/implementation-spec.md` (route typy, JSON schéma, nové interakcie)
   - `docs/hpo/TODO.md` — skontroluj otvorené rozhodnutia (`[?]` D1–D4 a pod.).
     Ak sa nejaké týka tohto týždňa a nie je rozhodnuté, neplánuj okolo domnienky
     — uveď ho v sekcii "Otvorené rozhodnutia" plánu a navrhni odporúčanú variantu.
2. **Design system** (aby návrh sedel do appky):
   - `docs/agent/design-system.md` (farby, fonty, veľkosti, reusable widgety)
   - `.claude/design/DESIGN_PROMPTS.md` — design tokeny (farby, typografia, spacing)
   - `lib/screens/bpd_programme/widgets/day_page_base.dart` (DayPageBase,
     SectionHeader, FeatureCard, NumberedBenefit, InfoBox) — preferuj reuse pred
     novými widgetmi
3. **Existujúce obrazovky** — `lib/screens/bpd_programme/` (Grep/Glob), nech
   nenavrhuješ niečo, čo už existuje (pauza, week review, smart, …).

> Ak verbatim text pre daný týždeň ešte nie je v `docs/hpo/source/tyzden-<n>.md`,
> zastav sa a vypýtaj si ho. Neplánuj z domnienok ani z neúplného zhrnutia.

## Kroky

### 1. Rozbi obsah na obrazovky/strany

Pre každý deň urči zoznam strán (pattern: `intro → 1 strana na koncept →
reflexia? → completion`). Dni typu pauza/summary označ ako 🔁 reuse šablóny.
Skontroluj, či už deň/strana neexistuje ako screen alebo route type.

Rozdeľuj tak, aby sa **zmestil celý pôvodný text** (viď ZÁSADA č. 1) — radšej viac
strán než skrátiť copy. Žiadna veta/položka zo `source/` nesmie pri rozbití vypadnúť.

### 2. Pre KAŽDÚ obrazovku napíš plán cez 4 hľadiská

Toto je jadro skillu. Každú obrazovku posúď zo všetkých štyroch uhlov — nikdy
nenavrhuj vzhľad oddelene od obsahu a účelu:

- **Obsah (Content)** — cieľ strany jednou vetou + **doslovný text**, ktorý sa na
  nej zobrazí, **odcitovaný verbatim zo `source/`** (nie prerozprávaný). Pri
  výberových zoznamoch (cvičenia, challenge) uveď **všetky** položky presne. Ak je
  textu veľa, rozdeľ na viac strán — neskracuj (viď ZÁSADA č. 1).
- **Funkčné (Functional)** — inputy a ich perzistencia, navigácia (next/back,
  progress), stav, deep-linky (Moje záznamy, kontakty PPP/Podané ruce, challenge,
  externé odkazy), edge-cases (prázdny vstup, offline, locked deň), či sa data
  majú znovu zobraziť neskôr (napr. ciele v poslednom týždni).
- **UX / vizuál (Design)** — layout a hierarchia (čo je dominantné), ktoré
  reusable widgety použiť, počet prvkov na obrazovku (drž nízky kognitívny load —
  ideálne 1 hlavná myšlienka na stranu), ikony, farby z design systému (nikdy
  nehardcoduj brand fialovú — z theme), spacing, primárna akcia dole.
- **Používateľ / emočné (User & care)** — appka prvej psychickej pomoci, preto:
  nehodnotiaci a láskavý tón, žiadne zahltenie, bezpečnosť (krízové kontakty kde
  je téma citlivá — PPP, návykové látky), prístupnosť (kontrast, veľkosť dotyku,
  čitateľnosť, žiadne spoliehanie sa len na farbu), pocit progresu a ocenenia,
  dobrovoľnosť (challenge je voliteľný).

Pre každú obrazovku tiež uveď **Reuse vs nové** (existujúci widget/screen? alebo
nový?) a **Otvorené otázky / riziká** ak nejaké sú.

### 3. Zapíš plán

Vytvor `.claude/design/$ARGUMENTS/WEEK<N>_SCREEN_PLAN.md` podľa šablóny nižšie.
Tento súbor je vstupom pre `/design-screen` (HTML mockup generovanie).

### 4. Vygeneruj tracking

Z plánu vytvor (alebo aktualizuj):
- `.claude/design/$ARGUMENTS/TRACKING.md` — tabuľky strán so stavom ❌, sekcia
  Design (HTML mockupy) + Flutter implementácia + Súhrn. Dni na reuse označ 🔁.

Formát tracking sekcie:
```markdown
## Stav — Design

### Deň X: Názov (N strán)
| Strana | Názov | Design |
|--------|-------|--------|
| 1/N    | ...   | ❌     |

## Stav — Flutter implementácia
| Deň | Názov | Flutter |
|-----|-------|---------|
| X   | ...   | ❌      |
```

### 5. Informuj používateľa

Zhrň: koľko obrazoviek/strán, ktoré sa reusujú, kľúčové UX rozhodnutia, otvorené
otázky na rozhodnutie, a že ďalší krok je `/design-screen $ARGUMENTS` (vygeneruje
HTML mockupy cez Claude Preview).

---

## Šablóna plánu (`WEEK<N>_SCREEN_PLAN.md`)

```markdown
# Week <N> — <téma> — Screen Plan

> Zdroj obsahu (verbatim): docs/hpo/source/tyzden-<N>.md
> Prehľad: docs/hpo/content-reference.md (Week <N>)
> Vytvorené: <dátum>

## Prehľad
| Deň | Názov | # strán | Reuse | Nové interakcie |
|-----|-------|---------|-------|-----------------|
| 1 | … | 5 | — | meno+zámeno, mood check-in |
| … | … | … | 🔁 pauza | — |

## Deň <X>: <názov>

### Strana <i>/<n> — <názov> (<typ: intro/education/skill/.../completion>)
- **Cieľ:** <jedna veta>
- **Obsah:** <doslovný text strany, citovaný verbatim zo source/; všetky položky>
- **Funkčné:** <inputy, perzistencia, navigácia, deep-linky, edge-cases>
- **UX / vizuál:** <layout, hierarchia, widgety, ikony, počet prvkov, akcia>
- **Používateľ / emočné:** <tón, bezpečnosť, prístupnosť, kognit. load>
- **Reuse vs nové:** <DayPageBase + … / nový widget pre …>
- **Otvorené otázky:** <ak nejaké>

## Súhrnné UX rozhodnutia pre týždeň
- <prierezové veci: napr. spoločná SPOKO šablóna strán, vzor challenge listu>

## Otvorené rozhodnutia pre používateľa
- <veci, ktoré treba potvrdiť pred /design-screen>
```

---

## Design system

Paleta, Stitch ID, typografia a komponenty → **`.claude/design/DESIGN_PROMPTS.md`**
(jediný zdroj pravdy). Tu ich neduplikuj.

Brand fialovú v kóde NIKDY nehardcoduj — číta sa z `Theme.of(context).primaryColor`
/ `NepanikarColors.*(context)` (theme je dynamický).

## Reusable widgety (preferuj pred novými)
| Widget | Použitie |
|--------|----------|
| `DayPageBase` | strana so scroll obsahom + fixným tlačidlom dole |
| `SectionHeader` | hlavička sekcie s ikonou |
| `FeatureCard` | karta ikona + titulok + popis |
| `NumberedBenefit` | číslovaná položka zoznamu |
| `InfoBox` | zvýraznený info box |

Šablóny na reuse pre celé dni: `day_pause_screen.dart` (pauza),
`week_review_screen.dart` (summary).

---

## Priebežné zlepšovanie (povinné)

Riaď sa protokolom v **`.claude/skills/LESSONS.md`**:
- **Na začiatku** behu prečítaj OPEN lekcie pre `plan-screens` + "Docs &
  cross-cutting" a aplikuj ich.
- **Na konci** behu sprav retrospektívu — bezpečné drobnosti rovno oprav, zvyšok
  zaloguj. (Pri behu cez `build-screens` to nerob — retro spraví orchestrátor.)

## Príklad použitia

```
/plan-screens week1
```

Výstup:
1. Načíta Week 1 z `docs/hpo/content-reference.md` + design system.
2. Rozbije 7 dní na strany (Deň 1 viacsekčný, Dni 2–6 SPOKO šablóna, Deň 7
   reflexia).
3. Pre každú stranu napíše plán cez 4 hľadiská (obsah/funkčné/UX/používateľ).
4. Zapíše `WEEK1_SCREEN_PLAN.md` + vygeneruje `WEEK1_STITCH_PROMPTS.md` a
   `TRACKING.md`.
5. Zhrnie kľúčové UX rozhodnutia a otvorené otázky; ďalší krok `/design-screen week1`.
```
