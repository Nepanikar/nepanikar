# Skills — lessons & retrospective log

Continuous-improvement log pre pipeline tvorby BPD/HPO obrazoviek
(`plan-screens`, `design-screen`, `implement-screen`, `build-screens`).
Cieľ: **každý beh nechá skill/dokumentáciu o kúsok lepšie, než ich našiel.**

Toto nie je pasívny log — je to **uzavretá slučka**: na začiatku behu lekcie
čítaš a aplikuješ, na konci pridávaš nové.

---

## Protokol

### NA ZAČIATKU behu ktoréhokoľvek pipeline skillu
1. Prečítaj tento súbor — sekciu pre daný skill + "Docs & cross-cutting".
2. Aplikuj každú **OPEN** lekciu relevantnú pre tento beh (môže ti povedať, aby
   si niečo urobil inak).

### NA KONCI behu (retrospektíva — povinný posledný krok)
1. Krátko sa zamysli: čo bolo nepohodlné, chýbajúce, nejasné alebo náchylné na
   chybu? Chýbalo niečo v spec/docs? Naviedli inštrukcie v SKILL.md zle?
2. Pre každý poznatok zvoľ JEDNO:
   - **Apply now** — ak je to bezpečná, konkrétna oprava SKILL.md alebo
     dokumentácie → urob edit hneď a zaloguj ako `applied`.
   - **Log as open** — ak treba ľudské rozhodnutie, väčší refaktor, alebo je to
     opakujúci sa vzor na sledovanie → pridaj `open` záznam.
   - **Skip** — triviality/jednorazovky nezapisuj (žiadny šum).
3. **Dedupe:** ak lekcia už existuje, zvýš jej `seen ×N` namiesto duplikátu.
   Opakujúce sa `open` lekcie (`seen ≥3`) explicitne nahlás používateľovi.
4. Záznamy drž na 1–3 riadky. `applied` staršie než ~10 behov pokojne zmaž.

### Formát záznamu
```
- [open|applied] (RRRR-MM-DD, seen ×N) <skill>: <lekcia> → <akcia / ďalší krok>
```

> Pozn.: keď fázy spúšťa orchestrátor `build-screens` inline, **per-skill
> retrospektívu nerob** — orchestrátor spraví jednu súhrnnú na konci celej
> pipeline (inak by vznikol šum). Per-skill retro rob len pri samostatnom behu.

---

## Lessons

### plan-screens
_(zatiaľ žiadne)_

### design-screen
- [open] (2026-07-08, seen ×1) design-screen+plan-screens: pribudli schválené šablóny "chat" (jednosmerný feed) a "skill tree" — tokeny v `DESIGN_PROMPTS.md` → "Koncept komponenty", hotové Flutter widgety (`widgets/chat/`, `widgets/skill_tree.dart`). Skilly zatiaľ poznajú len DayPageBase layout. → Pridať do plánu pole "Typ obrazovky" (štandard/chat/mapa) a do design-screen kroku 3 vetvenie šablón; pri implementácii reusovať hotové widgety.
- [open] (2026-06-19, seen ×1) design-screen: `WEEK1_SCREEN_PLAN.md` pokrýval len Deň 1, takže dni 3–6 sa museli rozkresliť priamo zo `source/tyzden-1.md` (obísť krok 2 skillu). → Pred design fázou dať doplniť plán cez `plan-screens` pre celý týždeň, alebo nechať design-screen čítať priamo source keď plán chýba.
- [applied] (2026-06-19, seen ×1) design-screen: SPOKO reuse dni (3–6) majú reálne **3 strany** (edukácia+otázky → výzva → completion), NIE 4 — úvodná strana s modelom (5 písmen) je len v Dni 2. Pôvodný odhad „~5 strán/deň" v pláne bol nadhodnotený.
- [applied] (2026-06-19, seen ×1) design-screen: `preview_start` slúži pre dev-servery z `launch.json`, nie pre statické HTML mockupy — na screenshot statického súboru treba buď static-file server, alebo sa spoľahnúť na auto Launch preview panel (hooky po Write). Skill krok 4 to nereflektuje presne.

### implement-screen
- [applied] (2026-06-19, seen ×1) implement-screen: HTML mockupy môžu mať **skrátený** copy oproti `source/` (Deň 2 infobox vynechal vetu „Péče o spánek, jídlo…“ a vetu o priebehu týždňa; q-note zlúčil/orezal). Pri implementácii vždy zlaďuj text proti `docs/hpo/source/tyzden-<n>.md`, nie proti mockupu — source má prednosť, žiadna veta nesmie vypadnúť (radšej dlhší scroll).
- [applied] (2026-06-19, seen ×1) implement-screen: pri implementácii **redizajnovaného dňa** over `_weekDaysContent` + `routes.dart` na starý deň s **kolidujúcou cestou** (Deň 2 mal starý `day2Education` na `week/1/day/2`). Treba prepojiť enum/switch/content-map + route entry naraz, inak kolízia cesty alebo mŕtvy switch case.
- [applied] (2026-06-19, seen ×1) implement-screen: pri **repointe celého týždňa** skontroluj aj generický summary/review screen (`week_review_screen.dart` `_weekData[<week>]`) — jeho per-week obsah (learnedItems, next-week) zostarne a začne zobrazovať odstránené dni. Tu to vyriešil dedikovaný Deň 7 screen (týždeň už nesmeruje na WeekReviewScreen).
- [applied] (2026-06-19, seen ×1) implement-screen: dni reusujúce šablónu (SPOKO 3–6) rieš **jedným data-driven screenom** (`SpokoDayScreen` + `SpokoDayData` const objekty + per-deň `@TypedGoRoute` triedy v jednom súbore), nie kopírovaním 4 obrazoviek. go_router_builder zvládne viac `@TypedGoRoute` v jednom súbore. Pozn.: const data s adjacent-string wrapom v listoch → `// ignore_for_file: no_adjacent_strings_in_list` (`+` nie je const).

### build-screens (orchestrátor)
_(zatiaľ žiadne)_

### Docs & cross-cutting (docs/hpo, DESIGN_PROMPTS.md, CLAUDE.md)
_(zatiaľ žiadne)_
