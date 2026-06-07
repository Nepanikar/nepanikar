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
_(zatiaľ žiadne)_

### implement-screen
_(zatiaľ žiadne)_

### build-screens (orchestrátor)
_(zatiaľ žiadne)_

### Docs & cross-cutting (docs/hpo, DESIGN_PROMPTS.md, CLAUDE.md)
_(zatiaľ žiadne)_
