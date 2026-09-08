# Week 7 — Závěr programu — Screen Plan

> Zdroj obsahu (verbatim): `docs/hpo/source/tyzden-7.md`
> Vytvorené: 2026-08-29
> Stav: **plán hotový.** Kódovateľné celé; nič neblokuje, ale tento týždeň má
> **najviac obsahových medzier zo všetkých siedmich** — rekapituluje dovednosti,
> ktoré program nikdy neučil (viď OQ-1).
> Aplikované OPEN lekcie z `LESSONS.md`: kontrola `titleKey` proti zdroju
> **pred** prvým spustením (tretíkrát po sebe sedela chyba), pole **Typ
> obrazovky**, sekcia **Zdieľané komponenty**, sekcia **Chýbajúci obsah pre
> autorku**, počty prepočítané zo zdroja, pri každom reuse otvorený widget.

---

## Čo je v tomto týždni iné

1. **Žiadny pauzový deň.** Prvý a jediný týždeň, kde má obsah všetkých 7 dní.
2. **Je to záver celého programu, nielen týždňa.** Po Dni 7 je strom kompletný.
   `WeekCompletionPage` hovorí „Týden dokončen" — na siedmy týždeň to je málo,
   toto je koniec sedemtýždňovej cesty. Viď OQ-6.
3. **Dni 3–6 sú rekapitulácie modulov s výberom „čo si chcem precvičiť".**
   Štyrikrát ten istý tvar: dlhý zhrňujúci odstavec → menu dovedností daného
   modulu → záverečná veta. Presne na to je `TechniqueMenuPage`.
4. **Deň 1 potrebuje dáta z Týždňa 1.** „Teď si otevři své SMART cíle, které jsi
   si stanovil/a na začátku programu" — musíme prečítať `BpdSmartGoalsDao`
   a nechať používateľa každý cieľ zhodnotiť. **To je presne task `GEN-02`**,
   ktorý je v TODO od 2026-06-15 rozrobený. Jediný skutočne nový komponent.
5. **Zdroj rekapituluje dovednosti, ktoré sa nikdy neučili.** Overené grepom
   naprieč `source/tyzden-1..6.md`:

   | Dovednosť menovaná v týždni 7 | Naozaj sa učila? |
   |-------------------------------|------------------|
   | **PODPORA** (Deň 4) | ❌ **nikde inde v programe sa nevyskytuje** |
   | **coping ahead** (Deň 3) | ❌ len ako príklad v zátvorke v týždni 5 |
   | **radikální přijetí** (Deň 4) | ❌ len ako príklad v zátvorke v týždni 5 |
   | „zmírňovat citlivost na stresory" (Deň 3) | ⚠️ to je SPOKO z **týždňa 1**, nie emočná regulácia |
   | check the facts, opposite action | ✅ týždeň 3 |
   | TIPS, UZNÁVÁM, STOP, body scan, pět smyslů | ✅ týždne 2 a 4 |
   | PSANÍČKo, Je VýZVa, neZOUFej, řetězová analýza | ✅ týždne 5 a 6 |

   **Riešenie:** rekapitulačný odstavec zostáva verbatim (je to jej text), ale do
   **menu dávam len to, čo v appke naozaj existuje**. Ponúknuť „PODPORA" ako
   niečo na precvičenie by znamenalo poslať používateľa na prázdno. Viď OQ-1.
6. **Dva pomerne veľké preklepy v zdroji:** „dovednosti z můžou přinést úlevu"
   (chýba slovo, Deň 3) a „pSANÍČKoa nenásilnou komunikaci" (Deň 6). Viď OQ-2.

---

## Bezpečnosť — prierezové rozhodnutie tohto týždňa

Týždeň 7 nikoho nič nové neučí a nič telesné nežiada — je to reflexia a výber
z už schválených cvičení. **Žiadna kontraindikácia.**

Jedna vec je ale dôležitá: **Deň 7 je posledný kontakt používateľa s programom.**
Zdroj to rieši sám a dobre — výslovne posiela na krízové kontakty:

> „Pokud bys potřeboval/a podporu i po skončení programu, můžeš využít kontakty
> na krizové linky, terapeuty nebo online zdroje, které jsme během programu
> sdíleli. Tyto zdroje jsou tu pro tebe kdykoli budeš potřebovat. (Odkaz na
> kontakty nepanikař)"

Ten odkaz **nesmie skončiť pod záverečným poďakovaním**, kam už nikto
nedoscrolluje. Dostane vlastnú kartu v chate, rovnako ako krízová karta na
Dni 2 týždňa 5.

Druhá vec: Deň 1 pýta zhodnotenie SMART cieľov a autorka sama pridáva poistku —
„i když se některý cíl nebo klidně žádný nesplnil, je to úplně v pořádku".
Táto veta musí byť **nad** zoznamom cieľov, nie pod ním.

---

## Zdieľané komponenty týždňa

| Komponenta | Použitie | Reuse? |
|-----------|----------|--------|
| `ChatDayPage` + `ChatBotBubble` / `ChatInfoCard` / `ChatRichMessage` | edukácia D1, D2, D3–D6 recap, D7 | ✅ hotové |
| `TechniqueMenuPage` + `showTechniqueDetailSheet` | D2 (všímavost) a D3–D6 (štyri modulové menu) | ✅ hotové |
| `TechniqueData` | popisy dovedností v tých menu — **zostavené z už nasadených konštánt**, nie prepísané | ✅ hotové |
| `StructuredWorksheet` + `BpdWorksheetDao` | D1 „na co jsem pyšný/á" (5 polí), D7 „tři dovednosti" (3) + záverečný zápis (1) | ✅ hotové |
| `BpdSmartGoalsDao` | D1 — načítanie cieľov z týždňa 1 | ✅ DAO hotové, obrazovka nie |
| `CrisisCenterContactsRoute` | D7 odkaz na kontakty | ✅ hotové |
| `DayCompletionPage`, `WeekCompletionPage`, `DayFlowHeader`, `DayPageBase` | všade | ✅ hotové |
| `DayPauseScreen` | **nepoužije sa** — týždeň nemá pauzu | — |
| **`SmartGoalsReviewPage`** | D1 strana 3/4 | **nová**, ~200 r. |

**Nový kód: jeden komponent.** Zvyšok je skladanie existujúcich dielov.

---

## Ako sa stavia menu na Dňoch 3–6 (kľúčové rozhodnutie)

`TechniqueData.detailParagraphs` je `List<String>`. Pre akronymy ho **generujem
z už nasadených `AcronymLetter` konštánt** (`day2StopLetters`,
`day2PsanickoLetters`, …), takže text v detaile je bit po bite ten istý, aký
používateľ videl, keď sa dovednosť učil — nič sa neprepisuje ručne.

`shortDescription` (jednoriadkový popis v menu) **je náš text** — zdroj ho
nemá. Označené `// TODO: schválit autorem`, viď OQ-4.

| Deň | Modul | Čo bude v menu (len to, čo naozaj existuje) |
|-----|-------|---------------------------------------------|
| 3 | Emoční regulace (T3) | Ověřování faktů · Opačná akce · Validace a popis emocí · Slovník emocí |
| 4 | Snášení tísně (T4) | STOP · TIPS · UZNÁVÁM · Progresivní svalová relaxace |
| 5 | Impulzivita (T5) | STOP · Řetězová analýza · Mých 5 činností · Bezpečnostní plán |
| 6 | Vztahy a sebeúcta (T6) | PSANÍČKo · Je VýZVa · neZOUFej |

STOP je zámerne v dvoch menu — učil sa v týždni 4 aj 5 a zdroj ho v oboch
rekapituláciách menuje. `id` je to isté, takže v záchrannom balíčku bude raz.

---

## Prehľad

| Deň | Názov | # strán | Typ obrazovky | Nové interakcie |
|-----|-------|---------|---------------|-----------------|
| 1 | Ocenění | 4 | chat (1) + worksheet (2) + **SMART revízia (3)** + completion | čítanie cieľov z týždňa 1 |
| 2 | Všímavost | 3 | chat (1) + menu (2) + completion | — |
| 3 | Emoční regulace | 3 | chat recap (1) + menu (2) + completion | — |
| 4 | Snášení tísně | 3 | chat recap (1) + menu (2) + completion | — |
| 5 | Impulzivita | 3 | chat recap (1) + menu (2) + completion | — |
| 6 | Mezilidské vztahy a sebeúcta | 3 | chat recap (1) + menu (2) + completion | — |
| 7 | Shrnutí a ohlédnutí | 5 | chat (1) + worksheet (2) + chat s kontaktmi (3) + worksheet (4) + **koniec programu** | záver celého programu |

Celkom **24 strán** — najviac zo všetkých týždňov, a **žiadna pauza**.

---

## Deň 1: Ocenění

### Strana 1/4 — Poslední týden (education · chat)
- **Obsah (verbatim, odrážka 1):**
  - „Dnes začínáme závěrečný týden programu, který je věnovaný shrnutí, reflexi a ocenění toho, co ses během předchozích týdnů naučil/a. Bude to příležitost se zastavit, podívat se zpět na své pokroky a uvědomit si, co ti fungovalo nejlépe, co tě posunulo dál a co chceš dál používat ve svém každodenním životě."
- **Funkčné:** Len čítanie.
- **Reuse vs nové:** `ChatDayPage`. Nič nové.

### Strana 2/4 — Na co jsem pyšný/á (worksheet, 5 polí)
- **Obsah (verbatim, odrážka 2):**
  - „Teď si najdi chvíli a zamysli se nad tím, co se ti během programu podařilo nebo co ses naučil/a. Napiš 3–5 věcí, na které jsi pyšný/á. U každé věci napiš, proč je pro tebe důležitá a jak ti pomáhá v každodenním životě. Tento krok ti pomůže uvědomit si své pokroky a posílit motivaci pokračovat v praxi, kterou ses naučil/a."
- **Funkčné:** `StructuredWorksheet(worksheetId: 'week7_day1_proud')`, **5 polí**
  (zdroj hovorí 3–5, takže päť miest a nič povinné — kto napíše tri, je hotový).
  Hint každého poľa nesie autorkine tri otázky (čo · prečo je to dôležité · ako
  to pomáha), aby sa nemuseli robiť tri polia na položku.
- **UX / vizuál:** Bez `visibleSectionLimit` — päť krátkych polí unesie jedna
  strana a delenie by narušilo „napiš 3–5".
- **Reuse vs nové:** Nič nové.

### Strana 3/4 — Moje SMART cíle (nový komponent)
- **Cieľ:** Vrátiť používateľovi ciele, ktoré si napísal v Týždni 1, Deň 1,
  a nechať ho každý zhodnotiť.
- **Obsah (verbatim, odrážka 3):**
  - „Teď si otevři své SMART cíle, které jsi si stanovil/a na začátku programu. Podívej se na každý cíl a zhodnoť, co se ti podařilo splnit, co jen částečně a co se nepodařilo. Pamatuj, že i když se některý cíl nebo klidně žádný nesplnil, je to úplně v pořádku – i to znamená, že jsi udělal/a obrovský kus práce a posunul/a se dál. Zamysli se, co ti pomohlo a co tě brzdilo, a u každého cíle si napiš, jak ho chceš dál využívat nebo případně upravit, aby ti sloužil i po skončení programu."
- **Funkčné:** Nový `SmartGoalsReviewPage`.
  - Číta `BpdSmartGoalsDao.getAllGoals()` (kľúč → `BpdSmartGoal` s poľami
    `specific / measurable / achievable / relevant / timeBound`).
  - Pre každý cieľ jedna karta s jeho piatimi vetami + **jedno textové pole**
    „Jak ho chceš dál využívat nebo upravit?".
  - Perzistencia cez existujúci `BpdWorksheetDao`,
    `worksheetId: 'week7_day1_smart_review'`, `fieldId = 'goal_<kľúč>'` — teda
    žiadny nový store.
  - **Prázdny stav je povinný:** kto v Týždni 1 cieľ nezadal (alebo začal
    programom neskôr), musí dostať láskavú vetu, nie prázdnu obrazovku. Text je
    náš → OQ-5.
- **UX / vizuál:** Autorkina poistka („i když se některý cíl nebo klidně žádný
  nesplnil, je to úplně v pořádku") ide **nad** zoznam ako `InfoBox`, nie pod
  neho.
- **Používateľ / emočné:** Toto je jediné miesto v programe, kde sa človek
  konfrontuje s tým, čo si predsavzal a nesplnil. Preto nič ako „splněno /
  nesplněno" prepínač — len otvorené pole. Zdroj nikde nežiada, aby si to
  odškrtával.
- **Reuse vs nové:** **Nový** `SmartGoalsReviewPage` + existujúci
  `BpdSmartGoalsDao`, `BpdWorksheetDao`, `ReflectionField`.
- **Otvorené otázky:** OQ-5 (text prázdneho stavu).

### Strana 4/4 — Completion
- **Obsah (verbatim):** „Na další část se zaměříme zítra :) Program už se pomalu
  blíží ke konci, tak zkus ještě vytrvat"
- **Reuse:** `DayCompletionPage`.

---

## Deň 2: Všímavost

### Strana 1/3 — Proč se vracet k všímavosti (chat)
- **Obsah (verbatim):**
  - „Teď přejdeme ke všímavosti. Tento den můžeš využít k tomu, aby ses zamyslel/a nad tím, co ti během programu fungovalo, co bys chtěl/a osvěžit a vyzkoušet znovu. Vyber si z nabídky všímavých cvičení to, které ti právě teď nejvíc vyhovuje, a věnuj mu chvíli pozornosti. Může to být krátká meditace, vědomý dech, body scan nebo jiné cvičení, které jsi během programu poznal/a a chceš si ho zopakovat. Důležité je, že máš možnost si vybrat a zkusit to tak, jak ti to nejvíc pomáhá."
- **Reuse vs nové:** `ChatDayPage`.

### Strana 2/3 — Výběr cvičení (menu)
- **Obsah:** „(Výběr s mindfulness technik)" — pokyn pre nás, nie copy.
- **Funkčné:** `TechniqueMenuPage(techniques: week4DrawPool)` — osem
  pomenovaných techník týždňa 2, rovnako ako Deň 3 týždňa 6.
- **Reuse vs nové:** Nič nové.

### Strana 3/3 — Completion
- **Obsah (verbatim):** „To je pro dnešek vše, těšíme se na zítra."
- **Reuse:** `DayCompletionPage`.

---

## Dni 3–6: štyri modulové rekapitulácie

Všetky štyri majú **identickú stavbu**: chat s jedným dlhým verbatim odstavcom →
menu dovedností daného modulu → completion s jej záverečnou vetou. Preto ich
plán nerozpisuje štyrikrát, ale raz — s tabuľkou rozdielov.

### Strana 1/3 — Co jsme se naučili (chat)
- **Obsah:** jeden odstavec, verbatim. Je dlhý (5–7 viet), preto **rozdelený na
  2–3 bubliny bez zmeny znenia** — rovnaký postup ako v týždňoch 5 a 6.
- **Reuse vs nové:** `ChatDayPage`.

### Strana 2/3 — Co si chci procvičit (menu)
- **Obsah:** poslednú vetu odstavca („Teď si vyber, co z těchto nástrojů chceš
  procvičit…") nesie `pickLead` menu.
- **Funkčné:** `TechniqueMenuPage` s modulovým poolom (viď tabuľku vyššie).
  Detail sheet ponúka uloženie do záchranného balíčka s **rovnakým `id`**, aké
  mala dovednosť pri prvom učení — takže sa v balíčku nezdvojí.
- **Reuse vs nové:** Nič nové.

### Strana 3/3 — Completion

| Deň | Modul | Záverečná veta (verbatim) |
|-----|-------|---------------------------|
| 3 | Emoční regulace | „Díky, že stále pokračuješ! Věříme, že Ti dovednosti z můžou přinést úlevu." *(chýba slovo — OQ-2)* |
| 4 | Snášení tísně | „Skvělá práce, jen tak dál." |
| 5 | Impulzivita | „Dnes je to vše. Zítra naviděnou :)" |
| 6 | Vztahy a sebeúcta | „Předposlední den máš za sebou, díky za Tvoji píli!" |

---

## Deň 7: Shrnutí a ohlédnutí

Päť strán — je to záver celého programu, nie len týždňa.

### Strana 1/5 — Došel/a jsi až sem (chat)
- **Obsah (verbatim, odrážka 1):**
  - „Gratuluji, že jsi došel/a až sem. Absolvování celého programu je obrovský kus práce a každý krok, i ty nejmenší pokroky, mají svou hodnotu. Můžeš si na chvíli zastavit a opravdu ocenit, co vše jsi během programu zvládl/a."
- **Reuse vs nové:** `ChatDayPage`.

### Strana 2/5 — Tři dovednosti do života (worksheet, 3 polia)
- **Obsah (verbatim, odrážka 2):**
  - „Zamysli se, které tři dovednosti nebo techniky z programu chceš odnést do svého života a pravidelně je používat. Napiš si je a přemýšlej, jak je můžeš integrovat do každodenního života. Tyto tři dovednosti ti mohou pomoci zvládat stres, emoce, impulzivitu i vztahy s ostatními."
- **Funkčné:** `StructuredWorksheet(worksheetId: 'week7_day7_three_skills')`,
  presne **3 polia** — zdroj hovorí tri, nie „3–5".
- **Používateľ / emočné:** Toto je najhodnotnejší výstup celého programu. Patrí
  do **záchranného balíčka** ako jedna položka („Mé tři dovednosti"), aby ho
  človek našiel aj po skončení programu — rovnaký vzor ako zoznam 5 činností
  v týždni 5. Viď OQ-3.
- **Reuse vs nové:** Nič nové.

### Strana 3/5 — Kam se vracet (chat + kontakty)
- **Obsah (verbatim, odrážky 3–5):**
  - „Připomeň si, že mindfulness a péče o sebe jsou základní nástroje, ke kterým se můžeš kdykoli vrátit. Když se cítíš rozptýlený/á, vystresovaný/á nebo impulzivní, vědomé zastavení, dech nebo krátká praxe mindfulness ti mohou pomoci se uklidnit a znovu se soustředit."
  - „Pokud bys potřeboval/a podporu i po skončení programu, můžeš využít kontakty na krizové linky, terapeuty nebo online zdroje, které jsme během programu sdíleli. Tyto zdroje jsou tu pro tebe kdykoli budeš potřebovat."
  - „Program je jen začátek a každý krok, který jsi udělal/a během něj, se počítá. Představ si, jak tyto tři dovednosti použiješ příští týden, příští měsíc nebo v konkrétní situaci. To ti pomůže udržet si pokrok a rozvíjet ho dál."
- **Funkčné:** „(Odkaz na kontakty nepanikař)" → `CrisisCenterContactsRoute` ako
  karta v chate, hneď za druhou odrážkou. Nie na konci strany.
- **Reuse vs nové:** `ChatDayPage` + `ChatRichMessage`. Nič nové.

### Strana 4/5 — Co si odnáším (worksheet, 1 pole)
- **Obsah (verbatim, odrážka 6):**
  - „Na závěr si můžeš krátce zaznamenat, co si z programu odnášíš, co tě nejvíce posunulo a čeho si na sobě nejvíce ceníš. Toto shrnutí ti může posloužit jako připomenutí tvých pokroků a motivace pokračovat dál."
- **Funkčné:** `StructuredWorksheet(worksheetId: 'week7_day7_closing')`, jedno
  väčšie pole; tri otázky zdroja idú do `hint`.
- **Reuse vs nové:** Nič nové.

### Strana 5/5 — Konec programu
- **Obsah (verbatim, odrážka 7):**
  - „Na závěr Ti patří obrovské ocenění, že do programu jdeš. Za těch sedm týdnu bylo uděláno spoustu práce, která do budoucna může hodně pomoci v cestě ke spokojenému životu. Přejeme Ti hodně sil i podobného odhodlání na celé cestě životem." *(„sedm týdnu" — OQ-2)*
- **Funkčné:** `WeekCompletionPage(weekNumber: 7)` + `markDayCompleted(7, 7)`.
  Po tomto je **celý strom hotový** — sedem zelených uzlov.
- **UX / vizuál:** `WeekCompletionPage` píše „Týden dokončen". Na siedmy týždeň
  to je málo; malo by tam byť niečo ako „Program dokončen". Je to jednoriadková
  úprava (parameter `heading`), ale text je náš → OQ-6.
- **Otvorené otázky:** OQ-6.

---

## Súhrnné UX rozhodnutia pre týždeň

1. **Edukácia = chat, cvičenie = formulár**, per-strana. D1 1, D2 1, D3–D6 1,
   D7 1 a 3 sú chat; D1 2–3, D7 2 a 4 sú formuláre; D2–D6 2 sú menu.
2. **Nič nie je povinné**, vrátane zhodnotenia SMART cieľov.
3. **Do menu ide len to, čo v appke existuje** — nie to, čo rekapitulačný
   odstavec menuje. Rozdiel je vysvetlený autorke v OQ-1.
4. **Dva výstupy patria do záchranného balíčka:** tri dovednosti (D7) a čokoľvek,
   čo si uloží z modulových menu.
5. **Krízové kontakty na D7 nesmú byť pod poďakovaním** — je to posledná
   obrazovka programu.

---

## Chýbajúci obsah pre autorku (→ task `W7-01`)

| # | Čo chýba / je sporné | Odporúčanie |
|---|----------------------|-------------|
| OQ-1 | **Rekapitulácie menujú tri dovednosti, ktoré program nikdy neučil.** „PODPORA" (Deň 4) sa v žiadnom inom týždni nevyskytuje vôbec; „coping ahead" (Deň 3) a „radikální přijetí" (Deň 4) boli len príklady v zátvorke v týždni 5. Deň 3 navyše pripisuje emočnej regulácii „zmírňovat citlivost na stresory", čo je SPOKO z týždňa 1. | Buď ich z rekapitulácie vyškrtnúť, alebo doplniť do príslušného týždňa. Do menu som ich nedal — ponúknuť ich by znamenalo poslať používateľa na prázdno. |
| OQ-2 | **Preklepy v zdroji:** „Věříme, že Ti dovednosti z můžou přinést úlevu" (Deň 3 — chýba slovo), „pSANÍČKoa nenásilnou komunikaci" (Deň 6), „JeVýZVa" bez medzery (Deň 6), „Za těch sedm týdnu" (Deň 7). Ponechané verbatim. | Potvrdiť opravy. Ten na Dni 3 je vecný — vete chýba slovo. |
| OQ-3 | Majú sa „tri dovednosti" z Dňa 7 uložiť do **záchranného balíčka**, aby ich človek našiel po skončení programu? | Áno — je to najhodnotnejší výstup celého programu. |
| OQ-4 | Jednoriadkové popisy dovedností v menu (Dni 3–6) sú **náš text** — zdroj ich nemá. | Napíšem návrh, autorka schváli (`// TODO: schválit autorem`). |
| OQ-5 | **Prázdny stav SMART revízie** — čo uvidí niekto, kto si v Týždni 1 cieľ nezadal. | Krátka láskavá veta + odkaz naspäť na Týždeň 1, nie prázdna obrazovka. Text náš. |
| OQ-6 | Posledná obrazovka programu hovorí „**Týden dokončen**". | Zmeniť na „Program dokončen" (jednoriadková úprava), text potvrdiť. |
| OQ-7 | Deň 1 pýta „3–5 věcí" — dal som **5 polí**, nič povinné. | Potvrdiť, že päť miest je v poriadku. |
| OQ-8 | **Titulok týždňa.** `bpd_weeks_data.json` hovorí „Shrnutí programu", zdroj „Závěr programu". | Opravené na „Závěr programu" podľa zdroja. Tretí týždeň po sebe, kde titulok nesedel. |

**Nič z toho neblokuje kód.**

---

## Čo sa dá kódovať hneď

| Deň | Blokované? |
|-----|-----------|
| 1 | ✅ nie (OQ-5 prázdny stav s TODO) |
| 2 | ✅ nie |
| 3–6 | ✅ nie (OQ-1 riešený tým, že menu obsahuje len existujúce; OQ-4 s TODO) |
| 7 | ✅ nie (OQ-6 jednoriadková úprava) |
