---
name: build-screens
description: Orchestrátor celej pipeline tvorby BPD/HPO obrazoviek pre jeden týždeň - postupne prevedie plán → Stitch design → Flutter implementáciu, s checkpointmi na schválenie medzi fázami. Spúšťa pod-skilly plan-screens, design-screen, implement-screen.
disable-model-invocation: true
allowed-tools: Read, Glob, Grep, Write, Edit, Bash, mcp__stitch__generate_screen_from_text
---

# Build BPD Screens — orchestrátor pipeline

Prevedie celý týždeň BPD/HPO programu od obsahu po Flutter kód tým, že riadi tri
fázové pod-skilly:

```
FÁZA 1  plan-screens      docs/hpo/ spec → plán + Stitch prompty + tracking
   ↓  (checkpoint)
FÁZA 2  design-screen     prompty → Stitch designy (loop cez všetky strany)
   ↓  (checkpoint)
FÁZA 3  implement-screen  designy → Flutter kód (loop cez všetky dni)
```

## Parametre

`week<číslo> [auto]`

- `week<číslo>` — povinné (napr. `week1`).
- `auto` — voliteľné. Ak je uvedené, **preskoč checkpointy** a bež celou pipeline
  bez pýtania. Bez `auto` (default) sa po každej fáze zastav a počkaj na schválenie.

Ak nie je týždeň, opýtaj sa používateľa.

## Ako orchestrátor volá fázy

Pod-skilly sú `disable-model-invocation` (slash-only), preto ich **nevolaj cez
Skill tool**. Namiesto toho pre každú fázu:

1. Prečítaj príslušný `SKILL.md` (`.claude/skills/<skill>/SKILL.md`).
2. Vykonaj jeho kroky pre `$ARGUMENTS` presne ako sú tam popísané.
3. Dodrž jeho pravidlá (build_runner max 2×, formátovanie, theme farby atď.).

Nikdy neduplikuj logiku pod-skillu sem — vždy ju načítaj zo zdroja, nech sa
nerozíde.

## Stav a obnova (resume)

Pravdivý stav je v `.claude/design/$ARGUMENTS/TRACKING.md`. Na začiatku ho
prečítaj (ak existuje) a **začni od prvej nehotovej fázy** — nerob znova to, čo
už je ✅. Pipeline je tým idempotentná a dá sa kedykoľvek znova spustiť.

Na začiatku tiež prečítaj **`.claude/skills/LESSONS.md`** (OPEN lekcie pre
všetky štyri skilly + "Docs & cross-cutting") a aplikuj relevantné. Fázové
pod-skilly počas inline behu **svoju per-skill retrospektívu NEROBIA** — spravíš
jednu súhrnnú na konci (viď Záver).

---

## FÁZA 1 — Plán (plan-screens)

Spusti vtedy, keď `WEEK<N>_SCREEN_PLAN.md` / `STITCH_PROMPTS.md` / `TRACKING.md`
pre týždeň ešte neexistujú, alebo o to používateľ požiada.

1. Vykonaj `.claude/skills/plan-screens/SKILL.md` pre `$ARGUMENTS`.
2. Výsledok: `WEEK<N>_SCREEN_PLAN.md`, `WEEK<N>_STITCH_PROMPTS.md`, `TRACKING.md`.

**CHECKPOINT 1** (ak nie je `auto`): ukáž zhrnutie plánu — počet dní/strán, čo sa
reusuje, kľúčové UX rozhodnutia a otvorené otázky. Spýtaj sa, či pokračovať do
fázy designu, alebo či chce používateľ plán najprv upraviť. **Pokračuj až po
schválení.**

---

## FÁZA 2 — Design (design-screen, loop)

Cieľ: všetky strany v sekcii "Stav — Stitch Design" v `TRACKING.md` sú ⏳/✅.

Opakuj, kým zostáva nejaká strana ❌:
1. Vykonaj `.claude/skills/design-screen/SKILL.md` pre `$ARGUMENTS` (vyrieši
   jednu — prvú ❌ — stranu a označí ju ⏳).
2. Generovanie trvá minúty — **neopakuj ten istý prompt**; po dokončení choď na
   ďalšiu ❌ stranu.

Strany označené 🔁 (reuse šablóny) preskakuj.

**CHECKPOINT 2** (ak nie je `auto`): oznám, koľko designov sa vygenerovalo + link
na Stitch projekt, a vyzvi používateľa, nech si ich prejde. Spýtaj sa, či
pokračovať do implementácie. **Pokračuj až po schválení.** (Designy býva fajn
skontrolovať očami pred kódením.)

---

## FÁZA 3 — Implementácia (implement-screen, loop)

Cieľ: všetky dni v sekcii "Stav — Flutter implementácia" v `TRACKING.md` sú ✅.

Opakuj, kým zostáva deň s Flutter ❌ (a Stitch ✅/🔁):
1. Vykonaj `.claude/skills/implement-screen/SKILL.md` pre `$ARGUMENTS` (vyrieši
   jeden — prvý taký — deň, vytvorí screen, route, spustí build_runner, označí ✅).
2. Dni typu pauza/summary napoj na zdieľané šablóny (`day_pause_screen.dart`,
   `week_review_screen.dart`).

Po dobehnutí: spusti `dart format --line-length 100 lib/screens/bpd_programme/`.

---

## Záver

Ukáž finálny súhrn z `TRACKING.md` (Stitch % a Flutter % po dňoch) a čo ešte
zostáva (napr. ručné napojenie šablón, otvorené rozhodnutia). Pripomeň, že kód
treba overiť (`flutter analyze` / spustenie appky) — orchestrátor negarantuje
behovú správnosť, len prejde pipeline.

### Súhrnná retrospektíva (povinný posledný krok)

Sprav **jednu** retrospektívu za celú pipeline podľa protokolu v
`.claude/skills/LESSONS.md` → "NA KONCI behu":
- Čo bolo naprieč fázami nepohodlné / chýbalo v `docs/hpo/` spec / naviedlo zle?
- Ktoré fázy boli trecie (napr. plán musel byť veľa upravovaný, prompty zlyhali,
  build_runner padal) → zaznač, do ktorej časti ktorého skillu to patrí.
- Bezpečné konkrétne opravy SKILL.md/docs aplikuj hneď (`applied`), zvyšok zaloguj
  ako `open`. Opakujúce sa lekcie (`seen ≥3`) nahlás používateľovi v súhrne.

---

## Príklad použitia

```
/build-screens week1            # s checkpointmi (odporúčané)
/build-screens week1 auto       # celé bez pýtania
```

Priebeh `week1`:
1. FÁZA 1 → plán + prompty + tracking → **checkpoint** (schváľ plán)
2. FÁZA 2 → loop generovania Stitch strán → **checkpoint** (prezri designy)
3. FÁZA 3 → loop Flutter implementácie dní → formátovanie → súhrn

## Súvisiace
- Konštanty (paleta, Stitch ID): `.claude/design/DESIGN_PROMPTS.md` (jediný zdroj).
- Obsah programu: `docs/hpo/` (content-reference, implementation-spec, TODO).
