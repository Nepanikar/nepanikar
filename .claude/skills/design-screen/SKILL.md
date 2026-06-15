---
name: design-screen
description: Vytvorí HTML/CSS mockup nového BPD screenu - podľa plánu screenu a design systému vygeneruje HTML, zobrazí ho cez Claude Preview, uloží screenshot a HTML lokálne
disable-model-invocation: true
allowed-tools: Read, Glob, Edit, Write, mcp__Claude_Preview__preview_start, mcp__Claude_Preview__preview_screenshot, mcp__Claude_Preview__preview_stop, mcp__Claude_Preview__preview_list
---

# Design BPD Screen Workflow

Workflow pre vytváranie mockupov BPD obrazoviek pomocou Claude Preview.

## Parametre

Argument: `week<číslo>` (napr. `week2`, `week3`)

Ak nie je argument poskytnutý, opýtaj sa používateľa na týždeň.

## Kroky

### 1. Skontroluj tracking

Načítaj tracking súbor pre daný týždeň:
- `.claude/design/$ARGUMENTS/TRACKING.md`

Nájdi **prvú položku so stavom ❌** v sekcii "Stav — Design".

Ak všetky položky sú ✅ alebo ⏳, informuj používateľa že všetky designy pre tento týždeň sú hotové.

Ak `TRACKING.md` ani `WEEK*_SCREEN_PLAN.md` pre týždeň neexistujú, najprv ich
treba vygenerovať cez `/plan-screens $ARGUMENTS` — informuj o tom používateľa a zastav sa.

### 2. Načítaj spec screenu

Otvor plán obrazoviek:
- `.claude/design/$ARGUMENTS/WEEK*_SCREEN_PLAN.md`

Nájdi sekciu pre konkrétny deň a stranu (podľa tracking položky).

Pre danú stranu potrebuješ:
- **Obsah** — verbatim text zo spec (nadpisy, body, zoznamy)
- **UX / vizuál** — layout, widgety, hierarchia, ikony
- **Funkčné** — čo je interaktívne, primárna akcia

Načítaj tiež design systém:
- `.claude/design/DESIGN_PROMPTS.md` — farby, typografia, spacing (jediný zdroj pravdy)

### 3. Vygeneruj HTML/CSS mockup

Vytvor HTML súbor, ktorý presne reprezentuje screen podľa plánu.

**Mobile frame:** 390 × 844 px (iPhone 14 proporcie)

**Povinná štruktúra HTML:**
```html
<!DOCTYPE html>
<html lang="cs">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=390">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;700;900&display=swap" rel="stylesheet">
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
      font-family: 'Inter', sans-serif;
      background: #FBF6FF;
      width: 390px;
      min-height: 844px;
      overflow-x: hidden;
    }
    /* ... design systém farby a komponenty ... */
  </style>
</head>
<body>
  <!-- app bar, obsah, tlačidlo -->
</body>
</html>
```

**Design tokens (z DESIGN_PROMPTS.md):**
- Pozadie: `#FBF6FF`
- Primary (fialová): `#491475`
- Primary Dark: `#280446`
- Secondary (tyrkys): `#4EA3AD`
- Container: `#EDE8F3`
- Purple 200: `#E2D2EF`
- Success: `#6FD866`
- Screen padding: `24px`
- Card radius: `16px` · Button radius: `12px`
- Card shadow: `0 8px 32px rgba(73,20,117,0.08)`
- Button height: `52px`

**Štandard komponentov:**
- App bar: primary background (`#491475`), biely text, výška 56px, progress bar ak je viac strán
- Primárne tlačidlo (dole): `#491475` fill, biely text, w900, radius 12, šírka 100%, height 52px
- Karty: `#EDE8F3` bg, radius 16, padding 16, card shadow
- Nadpisy: `#280446`, weight 800
- Body text: `#280446` alebo `rgba(40,4,70,0.7)` pre sekundárny
- Srdiečka / dekorácie: `#4EA3AD`

**Verbatim text:** Všetok zobrazovaný copy ber presne zo screen plánu (zo `source/`) — neparafrázuj.

### 4. Zobraz cez Claude Preview

1. Ulož HTML do `.claude/design/$ARGUMENTS/mockups/day{X}_page{Y}_{nazov}.html`
2. Spusti preview: `mcp__Claude_Preview__preview_start` s cestou k HTML súboru
3. Sprav screenshot: `mcp__Claude_Preview__preview_screenshot`
4. Zastav preview: `mcp__Claude_Preview__preview_stop`

Priečinok `mockups/` vytvor ak neexistuje.

### 5. Aktualizuj tracking

Po úspešnom vygenerovaní, updatuj TRACKING.md:
- Zmeň ❌ na ⏳ pre vygenerovanú položku
- Pridaj dátum a cestu k súboru: `⏳ generované YYYY-MM-DD · mockups/day{X}_page{Y}_{nazov}.html`

### 6. Informuj používateľa

Ukáž používateľovi:
- Ktorý screen bol vygenerovaný (Deň X, Strana Y/N)
- Cestu k HTML súboru a screenshotu
- Čo je ďalší krok (ďalšia strana alebo Flutter implementácia)

---

## Priebežné zlepšovanie (povinné)

Riaď sa protokolom v **`.claude/skills/LESSONS.md`**:
- **Na začiatku** behu prečítaj OPEN lekcie pre `design-screen` + "Docs &
  cross-cutting" a aplikuj ich.
- **Na konci** behu sprav retrospektívu — bezpečné drobnosti rovno oprav, zvyšok
  zaloguj. (Pri behu cez `build-screens` to nerob — retro spraví orchestrátor.)

## Príklad použitia

```
/design-screen week3
```

Výstup:
1. Načíta `.claude/design/week3/TRACKING.md`
2. Nájde: "Day 1, Page 1/5 - Intro" (prvá ❌)
3. Načíta spec z `WEEK3_SCREEN_PLAN.md`
4. Vygeneruje HTML mockup + zobrazí cez Claude Preview
5. Uloží do `mockups/day1_page1_intro.html`
6. Aktualizuje tracking na ⏳
