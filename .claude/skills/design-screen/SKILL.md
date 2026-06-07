---
name: design-screen
description: Vytvorí nový BPD screen - skontroluje tracking, načíta prompt a vygeneruje design v Stitch
disable-model-invocation: true
allowed-tools: Read, Glob, Edit, mcp__stitch__generate_screen_from_text
---

# Design BPD Screen Workflow

Toto je workflow pre vytváranie nových obrazoviek BPD programu v Stitch.

## Parametre

Argument: `week<číslo>` (napr. `week2`, `week3`)

Ak nie je argument poskytnutý, opýtaj sa používateľa na týždeň.

## Kroky

### 1. Skontroluj tracking

Načítaj tracking súbor pre daný týždeň:
- `.claude/design/$ARGUMENTS/TRACKING.md`

Nájdi **prvú položku so stavom ❌** (nezačatá) v sekcii "Stav — Stitch Design".

Ak všetky položky sú ✅ alebo ⏳, informuj používateľa že všetky designy pre tento týždeň sú hotové.

Ak `TRACKING.md` ani `WEEK*_STITCH_PROMPTS.md` pre týždeň neexistujú, najprv ich
treba vygenerovať cez `/plan-screens $ARGUMENTS` — informuj o tom používateľa a zastav sa.

### 2. Načítaj stitch prompt

Otvor súbor s promptami:
- `.claude/design/$ARGUMENTS/WEEK*_STITCH_PROMPTS.md`

Nájdi prompt pre konkrétny deň a stranu ktorú treba vygenerovať.

Prompty sú organizované takto:
```
## Prompt X: Day Y - Názov (počet strán)
### Page Z/N - Názov strany
```

### 3. Vygeneruj design v Stitch

Použi `mcp__stitch__generate_screen_from_text`. Hodnoty `projectId`, `deviceType`,
`modelId` vezmi z **`.claude/design/DESIGN_PROMPTS.md` → "Stitch projekt a dizajn
systém"** (jediný zdroj pravdy):
- **projectId**: viď DESIGN_PROMPTS.md
- **prompt**: Načítaný prompt zo súboru
- **deviceType** / **modelId**: viď DESIGN_PROMPTS.md

**DÔLEŽITÉ**: Generovanie môže trvať niekoľko minút. Nepokúšaj sa opakovať.

### 4. Aktualizuj tracking

Po úspešnom vygenerovaní, updatuj TRACKING.md:
- Zmeň ❌ na ⏳ pre vygenerovanú položku
- Pridaj dátum: `⏳ generované YYYY-MM-DD`

### 5. Informuj používateľa

Ukáž používateľovi:
- Ktorý screen bol vygenerovaný
- Link na prehliadnutie v Stitch
- Čo je ďalší krok (ďalšia strana alebo Flutter implementácia)

---

## Konštanty (Stitch ID, paleta, typografia)

Všetky v **`.claude/design/DESIGN_PROMPTS.md`** (jediný zdroj pravdy). Tu ich
neduplikuj.

---

## Priebežné zlepšovanie (povinné)

Riaď sa protokolom v **`.claude/skills/LESSONS.md`**:
- **Na začiatku** behu prečítaj OPEN lekcie pre `design-screen` + "Docs &
  cross-cutting" a aplikuj ich (napr. čo v promptoch zlepšiť).
- **Na konci** behu sprav retrospektívu — bezpečné drobnosti rovno oprav, zvyšok
  zaloguj. (Pri behu cez `build-screens` to nerob — retro spraví orchestrátor.)

## Príklad použitia

```
/design-screen week2
```

Výstup:
1. Načíta `.claude/design/week2/TRACKING.md`
2. Nájde: "Day 4, Page 1/6 - Intro" (prvá ❌)
3. Načíta prompt z `WEEK2_STITCH_PROMPTS.md`
4. Vygeneruje screen v Stitch
5. Aktualizuje tracking na ⏳
