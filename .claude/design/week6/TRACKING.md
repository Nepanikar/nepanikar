# Week 6 — Mezilidské vztahy a sebepojetí — Design Tracking

> Posledná aktualizácia: 2026-08-29
> Plán obrazoviek: `WEEK6_SCREEN_PLAN.md`
> Zdroj obsahu (verbatim): `docs/hpo/source/tyzden-6.md`

## Legenda
- ✅ Hotovo
- ⏳ Mockup vygenerovaný (čaká na review)
- ❌ Treba spraviť
- ➖ Mockup sa zámerne nekreslí
- 🔁 Reuse šablóny
- ⚠️ Blokované rozhodnutím

---

## Stav — Design (HTML mockupy)

**Pre týždeň 6 nie sú nakreslené žiadne mockupy — zámerne.**

Je to prvý týždeň, ktorý nepridáva **ani jeden nový komponent**: každá jeho
strana je vzor, ktorý autorka už videla a schválila v niektorom z týždňov 3–5.

| Strana týždňa 6 | Ten istý vzor už existuje ako |
|-----------------|-------------------------------|
| Mýtový worksheet (D1) | týždeň 3, Deň 1 — `week3/day1_emotions/myth_busting_page.dart` |
| Akronymová strana (D2 PSANÍČKo, D3 Je VýZVa, D5 neZOUFej) | týždeň 4 mockup `day2_page3_stop.html`, týždeň 5 `day2_page3_stop_konflikt.html` |
| Worksheet s rozklikávacím vzorom (D2) | týždeň 3, Deň 2 (`exampleTitle` / `example`) |
| Worksheet bez vzoru (D5) | týždeň 5 mockup `day1_page3_retezova_analyza.html` |
| Menu všímavých techník (D3) | týždeň 2, Deň 6 — `TechniqueMenuPage` |
| Pauza (D4, D6) | `DayPauseScreen`, nezmenený |
| Chat, completion, reflexia | týždne 2–5 |

Namiesto mockupov sú nižšie **screenshoty z bežiacej appky** — pre autorku je to
presnejší podklad než HTML, lebo ukazuje, čo naozaj uvidí.

**Verbatim kontrola je automatická:**
```bash
python .claude/design/week6/verify_verbatim.py       # plán: 77 citácií ✅
python .claude/design/week6/verify_dart_verbatim.py  # kód:  77 viet ✅
```
Kód prešiel **na prvý pokus**; plán mal 12 nepresných citácií (moja interpunkcia
— zdroj drží písmeno a inštrukciu na dvoch riadkoch), opravené.

---

## Stav — Flutter implementácia

| Deň | Názov | Route type | Flutter |
|-----|-------|-----------|---------|
| 1 | Edukace o vztazích | `week6Day1Relationships` | ✅ |
| 2 | Dovednosti pro komunikaci s druhými | `week6Day2Communication` | ✅ |
| 3 | Je VýZVa a všímavost ve vztazích | `week6Day3JeVyzva` | ✅ (názov náš — OQ-4) |
| 4 | Pauza | `pause` | ✅ 🔁 vlastný text |
| 5 | Sebeúcta | `week6Day5SelfEsteem` | ✅ |
| 6 | Pauza | `pause` | ✅ 🔁 vlastný text |
| 7 | Shrnutí | `week6Day7Summary` | ✅ |

Hotové: `_weekDaysContent[6]`, 5 hodnôt `_DayRouteType` + 5 `case`ov, 5 typovaných
routes (anotácia **aj** `_bpdProgrammeRoutes`), `kImplementedBpdWeeks = {1..6}`,
dva záznamy v `DayPauseScreen._pauseCopyByDay`. Analyzer **0 errorov, 0 warningov**.

### Opravené počas implementácie

| Nájdené | Oprava |
|---------|--------|
| **`bpd_weeks_data.json` volal týždeň 6 „Sebepojetí"**, autorka dodala „Mezilidské vztahy a sebepojetí" | prepísané. Presne to riziko, ktoré po týždni 5 viselo ako `W5-02` — potvrdilo sa hneď na ďalšom týždni |
| `BpdRescueItem._icons` nemá kľúče pre tri nové akronymy | doplnené `talk`, `heart`, `shield` |
| Hlavička worksheetu Dňa 2 hovorila „Worksheet PSANÍČKo", hoci Deň 5 to slovo vyhadzuje | zjednotené na **„PSANÍČKo v praxi"** (odlíši sa aj od akronymovej strany) |

### Čo bolo overené kliknutím

| Overené | Výsledok |
|---------|----------|
| Strom ukazuje **„Týden 6 · Mezilidské vztahy a sebepojetí"**, odomknutý | ✅ |
| Zoznam 7 dní so správnymi názvami | ✅ |
| D1 chat vrátane preklepu „časo" verbatim | ✅ |
| D1 mýtové karty — štítok MÝTUS, tlmená kurzíva v úvodzovkách | ✅ |
| **D1 text v mýtovom poli prežije odchod z dňa** | ✅ |
| **D2 PSANÍČKo — všetkých 7 písmen vrátane `Í` a dvojznaku `Ko`** | ✅ |
| D2 záverečná veta visí pod posledným písmenom | ✅ |
| **D2 „Zobrazit vzor" rozbalí celý autorkin príklad (situácia + 7 krokov)** | ✅ |
| **D3 Je VýZVa — dvojznaky `Je`/`Vý`/`Va`, `Vý` s dĺžňom sa zmestí do badge** | ✅ |
| D3 „uznej" namiesto artefaktu „uznejříkáuznej" | ✅ |
| D3 menu ôsmich techník (nie losovanie — tak to žiada zdroj) | ✅ |
| **D4 a D6 majú rôzny text pauzy** | ✅ |
| **D5 neZOUFej — Z a O rozdelené, „Upřímnost" bez prebytočného „s"** | ✅ |
| D5 uloženie do záchranného balíčka | ✅ prepne na „V záchranném balíčku" |
| D5 worksheet, 6 polí vrátane spojenej reflexie | ✅ |
| D7 rekapitulácia s piatimi položkami | ✅ |
| **Dokončenie všetkých 7 dní → uzol týždňa 6 zelený** | ✅ |
| **Reflexia Dňa 7 prežije odchod bez dokončenia** | ✅ „psanicko" po návrate na mieste |
| Záchranný balíček drží neZOUFej so správnou ikonou štítu | ✅ |
| Tmavý režim: strom, DBT záložka, mýtový worksheet | ✅ bez nečitateľného textu |
| **`logcat` za celý prechod týždňa** | ✅ **úplne čistý** — ani jeden `E/flutter`, žiadny overflow |

### Čo overené NEBOLO

- **PSANÍČKo a Je VýZVa v záchrannom balíčku** — tlačidlo som pri automatickom
  prechode stlačil len na neZOUFej. Mechanizmus aj `id`/`iconKey` sú zapojené
  rovnako, ale kliknuté to nebolo.
- **Release build, iOS.**
- **Týždne 1–5 po tejto zmene** (dotkol som sa `BpdRescueItem._icons`
  a `bpd_weeks_data.json`; obe zmeny sú aditívne).

### Dva nálezy mimo týždňa 6

1. **Prázdna DBT záložka po rýchlej automatizovanej navigácii.** Videl som to
   dvakrát (týždeň 5 aj 6) po sérii rýchlych ťuknutí, ktoré vyskočia z pushnutej
   route späť na záložku. Po čistom reštarte sa vždy vykreslí správne a
   **v logcate nie je žiadna výnimka**, takže to nevyzerá na chybu vykresľovania
   — skôr na stav, ktorý reálny používateľ nevyrobí. Nechávam ako pozorovanie,
   nie ako defekt.
2. **„Možná později" na `BpdLandingScreen` je v tmavom režime takmer neviditeľné**
   (tmavá fialová na fialovej). Pre-existujúce, netýka sa týždňa 6.

---

## Nové / upravené komponenty

| Komponenta | Stav |
|-----------|------|
| — žiadny nový widget — | ✅ |
| `BpdRescueItem._icons` | ✅ tri nové kľúče (aditívne) |
| `DayPauseScreen._pauseCopyByDay` | ✅ dva záznamy, bez zmeny widgetu |

### Odchýlky od plánu

| Plán hovoril | Realita | Prečo |
|--------------|---------|-------|
| D3 ponúkne **aj** „Vylosovat za mě" pod menu | len menu (`TechniqueMenuPage`) | widget nemá slot na sekundárnu akciu a pridať ho by porušilo sľub „0 úprav zdieľaných widgetov". Zdroj navyše žiada výslovne výber, nie losovanie. |
| D2 worksheet bez `visibleSectionLimit` | tak aj je | 8 krátkych polí; rozdelenie by rozbilo akronym |

---

## Súhrn

- **19 strán**, dva dni celé na reuse, **žiadny nový komponent**.
- **9 otvorených otázok** (OQ-1 … OQ-9) → task `W6-01`. **Ani jedna neblokuje kód.**
- Najdôležitejšia pre autorku: **OQ-1** — k 24 mýtom nenapísala protipríklady
  (v týždni 3 áno), takže väčšina polí zostane prázdna.
