# Week 5 — Impulzivní chování — Screen Plan

> Zdroj obsahu (verbatim): `docs/hpo/source/tyzden-5.md`
> Vytvorené: 2026-08-28
> Stav: **plán hotový.** Kódovateľné hneď: Dni 1, 3, 4, 5, 6, 7.
> Deň 2 potrebuje rozhodnutie o dvoch veciach (OQ-1 dobrovoľnosť, OQ-2 znenie STOP).
> Aplikované OPEN lekcie z `LESSONS.md`: pole **Typ obrazovky**, plán pokrýva celý
> týždeň, sekcia **Zdieľané komponenty týždňa**, sekcia **Chýbajúci obsah pre
> autorku**, počty položiek **prepočítané zo zdroja** (nie z odhadu), pri každom
> 🔁 reuse dni **otvorený cieľový widget** a overená parametrizácia, a nová
> otázka **„má cvičenie kontraindikácie?"** (lekcia z týždňa 4).

---

## Čo je v tomto týždni iné

1. **Najcitlivejší deň celého programu je Deň 2** — „Život ohrožující chování".
   Autorka ho sama označuje za **dobrovoľný** („dnešní sekce je dobrovolná") a
   dvakrát v ňom odkazuje mimo program (kontakty, modul „Chci si ublížit").
   Program doteraz nemal koncept dobrovoľného dňa — viď OQ-1.
2. **STOP je v programe druhýkrát, ale s iným znením.** Týždeň 4 (Deň 2) ho už
   učí po česky („T – Tah zpátky", „O – Obhlédni situaci", „P – Postupuj
   všímavě"), týždeň 5 ho učí po anglicky s českým prekladom v zátvorke
   („T – Take a step back (ustup)"). Toto je **rozpor v zdroji**, nie
   implementačný detail — viď OQ-2. Kód pre akronym existuje, netreba nič nové.
3. **Dva worksheety, jeden úplne nový typ interakcie.** Deň 1 má lineárny
   7-poľový worksheet (na to máme `StructuredWorksheet`) **a** „Analýzu
   chybějících článků", čo je **vetviaci sa** reťazec áno/nie → ďalšia otázka.
   Vetvenie v programe zatiaľ nikde nie je — jediný skutočne nový komponent.
4. **Deň 4 nemá ani jednu edukačnú vetu** — otvorí sa rovno worksheetom a končí
   jednou vetou. Po štyroch týždňoch, kde každý deň začína chatom, to bude
   pôsobiť, akoby strana chýbala. Viď OQ-6.
5. **Dva pauzové dni (3 a 6), každý s iným textom** — presne ako týždeň 4.
   Overené v `day_pause_screen.dart`: `_pauseCopyByDay` je kľúčované `(týždeň,
   deň)`, takže stačí pridať dva záznamy. **Žiadna zmena widgetu.**
6. **Týždeň sa silno opiera o týždeň 4.** Deň 4 menuje TIPS, UZNÁVÁM, STOP a
   mindfulness; Deň 5 losuje z všímavých techník týždňa 2. Všetko to už v appke
   je — týždeň 5 je preto obsahovo najťažší, ale infraštruktúrne najľahší.

---

## Bezpečnosť — prierezové rozhodnutie tohto týždňa

Deň 2 je o život ohrozujúcom správaní. Zdroj to rieši sám a dobre — dopredu
varuje, dáva dobrovoľnosť a dvakrát ponúka pomoc. Plán jeho riešenie **nemení
ani nedopĺňa vlastnými vetami**; len ho mapuje na existujúce povrchy appky:

| Miesto v zdroji | Kam to vedie v appke |
|-----------------|----------------------|
| „můžeš nahlédnout do kontaktů, které jsou pro takové chvíle k dispozici. (proklik do Nepanikař kontaktů)" | `CrisisCenterContactsRoute` (rovnaký cieľ ako W4 D2) |
| „můžeš jej opečovat zde (odkaz na nepanikař mód Chci si ublížit a znovu na kontakty)" | `SelfHarmRoute` + `CrisisCenterContactsRoute` |
| „seznam 5 činností, co by Ti mohli alespoň trochu ulevit … uložení na dostupné místo" | `RescuePackageRoute` (`/home/my-records/rescue-package`) — „dostupné místo" už existuje |

**Kontraindikácie cvičení (lekcia z týždňa 4):** prešiel som všetky cvičenia
týždňa 5 — Deň 1 worksheet, Deň 2 zoznam činností, Deň 4 worksheet, Deň 5
losovanie z už schválených techník týždňa 2. **Žiadne telesné cvičenie, žiadna
nová kontraindikácia.** Jediné riziko je emočné (Deň 2) a to zdroj rieši sám.

Jedna vec ale stojí za pozornosť: Deň 1 žiada používateľa, aby si **vybavil
poslednú situáciu, keď jednal impulzívne**, a rozobral ju krok po kroku vrátane
„život ohrožujícího chování" (bod 5 zoznamu analýzy správania). To je expozičné
cvičenie bez varovania — na rozdiel od Dňa 2, ktorý varovanie má. Viď OQ-3.

---

## Zdieľané komponenty týždňa

| Komponenta | Použitie | Reuse? |
|-----------|----------|--------|
| `ChatDayPage` + `ChatBotBubble` / `ChatInfoCard` / `ChatNumberedList` / `ChatFeatureList` | edukácia D1 (2 strany), D2 (2 strany), D5, D7 recap | ✅ hotové |
| `StructuredWorksheet` + `BpdWorksheetDao` | D1 řetězová analýza (7 polí), D2 zoznam (5 polí), D4 plánování a prevence (10 polí) | ✅ hotové |
| `AcronymSkillPage` / `NumberedBenefit` s písmenom | STOP na D2 | ✅ hotové, bez zmeny |
| `RescueSaveButton` + `BpdRescuePackageDao` | STOP na D2, zoznam 5 činností, bezpečnostný plán D4 | ✅ hotové |
| `RescuePackageRoute` (deep-link) | D2 „dostupné místo", D4 „krabička první psychické pomoci" | ✅ hotové |
| `TechniqueRandomiser` + `week4DrawPool` (8 techník T2) | D5 „kolo štěstí" | ✅ hotové (W4 D4) |
| `TechniqueMenuPage` + `showTechniqueDetailSheet` | D5 „vybrat si" (OQ-9) | ✅ hotové |
| `CrisisCenterContactsRoute`, `SelfHarmRoute` | D2 ×3 | ✅ hotové |
| `DayPauseScreen` — text podľa `(týždeň, deň)` | D3, D6 | ✅ **overené**, stačia 2 záznamy v mape |
| `ReflectionQuestionList` + `ReflectionAutosave` | D7, 3 otázky | ✅ hotové |
| `DayCompletionPage`, `WeekCompletionPage`, `DayFlowHeader`, `DayPageBase`, `InfoBox`, `WorksheetFieldExample` | všade | ✅ hotové |
| **`MissingLinksAnalysis`** — vetviaci sa reťazec áno/nie + textové polia | D1 strana 4/5 | **nová**, ~180 riadkov |
| **Dobrovoľný deň** (preskočiť bez „nedokončil som") | D2 | **nová**, malá — OQ-1 |

Celkovo: **jeden nový komponent** + jedno malé rozšírenie správania dňa.
Zvyšok pokryje infraštruktúra týždňov 2–4.

---

## Prehľad

| Deň | Názov | # strán | Typ obrazovky | Reuse | Nové interakcie |
|-----|-------|---------|---------------|-------|-----------------|
| 1 | Edukace o impulzivitě | 5 | chat (1–2) + worksheet (3) + vetvenie (4) + completion | prevažne | řetězová analýza, **analýza chybějících článků** |
| 2 | Život ohrožující chování | 5 | chat (1–2) + akronym (3) + zoznam (4) + completion | prevažne | dobrovoľnosť, 5 činností + uloženie |
| 3 | Pauza | — | 🔁 `DayPauseScreen` | ✅ celé | — |
| 4 | Plánování a prevence | 2 | worksheet (1) + completion | ✅ celé | 5-sekciový worksheet |
| 5 | Všímavost | 3 | chat (1) + losovanie (2) + completion | ✅ celé (kópia W4 D4) | — |
| 6 | Pauza | — | 🔁 `DayPauseScreen` | ✅ celé | — |
| 7 | Shrnutí | 3 | chat recap (1) + reflexia (2) + week completion | ✅ celé | — |

Celkom **18 strán**, dva dni celé na reuse.

---

## Deň 1: Edukace o impulzivitě

Zdroj má na tomto dni **10 edukačných odrážok, 6-položkový zoznam analýzy
správania, 7-poľový worksheet a 4-krokovú vetviacu sa analýzu.** Je to zďaleka
najhustejší deň týždňa; preto 5 strán, nie 3.

### Strana 1/5 — Co je impulzivita (education · chat)
- **Cieľ:** Normalizovať impulzivitu, oddeliť užitočnú od škodlivej a zbaviť ju
  nálepky „slabá vôľa".
- **Obsah (verbatim, odrážky 1–7):**
  1. „V tomto týdnu se budeme věnovat impulzivnímu chování – jednání, ke kterému dochází rychle, bez dlouhého přemýšlení o důsledcích. Impulzivní reakce může být někdy užitečná, například při rychlém rozhodnutí v krizové situaci, ale často může vést k problémům ve vztazích nebo se sebou samým. Ne všechno chování je tedy nežádoucí. V tomto týdnu se budeme zaměřovat jen na to chování, které negativně ovlivňuje život a kterého později třeba litujeme."
  2. „Každý člověk je impulzivní do různé míry - někdy míň, někdo víc. Částečně to ovlivňuje biologie, například genetické predispozice, rozdíly v mozkové aktivitě a funkci neurotransmiterů, které regulují kontrolu impulzů a emoce."
  3. „Dále hraje roli životní zkušenost, stres, únava a návyky. Porozumění tomu, proč jsme někdy impulzivní, je prvním krokem k tomu, abychom se naučili své impulzy rozpoznat a vědomě zvládat."
  4. „Impulzivní chování je často reakce na silné emoce. Čím intenzivnější emoce, tím těžší je ji kontrolovat."
  5. „Mozek má dvě hlavní části, které se podílejí na impulzivitě: prefrontální kortex (řídí plánování a sebeovládání) a amygdala (rychle vyhodnocuje hrozby a spouští emocionální reakce). U některých lidí je aktivita těchto oblastí odlišná, což ovlivňuje, jak snadno podléhají impulsům."
  6. „Impulzivita není znak slabé vůle – je to kombinace biologických, psychologických a environmentálních faktorů."
  7. „Porozumění svým spouštěčům a tělesným projevům impulzivních reakcí je klíčové k tomu, aby člověk mohl své jednání vědomě zastavit nebo změnit."
- **Funkčné:** Len čítanie, bez perzistencie. 7 `ChatStep`ov.
- **UX / vizuál:** Odrážka 1 je dlhá (4 vety) — rozdeliť na **dve bubliny** v
  jednom kroku, aby prvá obrazovka nebola stena textu. Odrážka 5 (mozog) je
  jediný fakt s dvomi pojmami → `ChatFeatureList` s dvomi položkami (ikona +
  názov + popis). `ChatConceptCard` sa nehodí — jeho badge je jedno písmeno.
  Odrážka 6 („není znak slabé vůle") ako `ChatInfoCard` — je to najdôležitejšia
  veta strany a má sa vizuálne oddeliť od faktografie.
- **Používateľ / emočné:** Toto je destigmatizačná strana. Poradie zdroja
  (najprv „môže byť užitočná", až potom „vedie k problémom") je zámerné,
  **nemeniť**. Odrážka 6 nesmie skončiť schovaná na konci scrollu.
- **Reuse vs nové:** `ChatDayPage` + `ChatBotBubble` + `ChatFeatureList` +
  `ChatInfoCard`. Nič nové.
- **Otvorené otázky:** —

### Strana 2/5 — Analýza chování (education · chat)
- **Cieľ:** Predstaviť DBT nástroj a jeho šesť krokov a uviesť dnešnú výzvu.
- **Obsah (verbatim, odrážky 8–10 + 6-položkový zoznam + výzva):**
  - „Jeden z  DBT nástrojů pro porozumění impulzivního a neefektivního chování je  analýza chování." *(dvojité medzery sú v zdroji — viď OQ-4)*
  - „Princip je jednoduchý: sledujeme průběh událostí“, které vedly k určité reakci nebo chování. Pomáhá identifikovat:" *(nepárová úvodzovka — OQ-4)*
    1. „**Spouštěče** – co spustilo emoci nebo impulz (situace, lidé, myšlenky)"
    2. „**Počáteční myšlenky a pocity** – jaké myšlenky a emoce se objevily hned na začátku"
    3. „**Fyzické a psychické signály** – tělesné projevy, napětí, vztek, úzkost apod"
    4. „**Impulzy** – nutkání jednat určitým způsobem"
    5. „**Chování** – samotná impulzivní reakce nebo život ohrožující chování"
    6. „**Důsledky** – pozitivní a negativní následky chování."
  - „Cílem je pochopit, co vede k problémovému jednání, najít body, kde lze zasáhnout a změnit reakci, a připravit alternativní strategie pro zvládnutí situace v budoucnu."
  - „A teď výzva: vzpomeňte si na poslední situaci, kdy jste jednali impulzivně nebo se cítili, že se vaše emoce vymykají kontrole. Vaším úkolem je prozkoumat, co vedlo k této reakci, a zkusit udělat řetězovou analýzu. Pomůže vám to pochopit spouštěče, impulzy a body, kde můžete příště zasáhnout a zareagovat jinak."
- **Funkčné:** Len čítanie. Posledný krok má tlačidlo „Otevřít worksheet".
- **UX / vizuál:** Šesť krokov analýzy ide do `ChatNumberedList` — **je to
  presne ten zoznam, ktorý bude vzápätí worksheetom**, takže čísla musia sedieť
  1:1 s poľami strany 3/5 (worksheet má navyše siedme pole „Alternativní
  strategie"). Má to pôsobiť ako „toto sa teraz naučíš → toto teraz vyplníš".
- **Používateľ / emočné:** Výzva vyká („vzpomeňte si"), zvyšok programu tyká.
  Nemeniť potichu — OQ-5.
- **Reuse vs nové:** `ChatDayPage` + `ChatNumberedList`. Nič nové.
- **Otvorené otázky:** OQ-4 (typografické artefakty), OQ-5 (tykanie/vykanie).

### Strana 3/5 — Řetězová analýza impulzivního chování (worksheet)
- **Cieľ:** Rozobrať jednu konkrétnu situáciu na sedem krokov.
- **Obsah (verbatim — nadpis + 7 polí, každé má názov aj otázku):**
  - Nadpis: „Worksheet – Řetězová analýza impulzivního chování"
  1. „Popiš situaci/spouštěč" — „Co se stalo těsně před tím, než ses cítil/a impulzivně?"
  2. „Myšlenky a pocity" — „Jaké myšlenky a emoce se objevily na začátku?"
  3. „Tělesné signály" — „Co jsi cítil/a ve svém těle (např. napětí, bušení srdce, neklid)?"
  4. „Impulzy" — „Jaké nutkání k jednání jsi cítil/a?"
  5. „Chování" — „Co jsi nakonec udělal/a?"
  6. „Důsledky" — „Jaký byl krátkodobý a dlouhodobý dopad tvého jednání?"
  7. „Alternativní strategie" — „Co bys mohl/a příště udělat jinak, aby ses vyhnul/a impulzivní reakci?"
  - Pod worksheetom: „Tento worksheet můžete vyplnit pomalu, krok za krokem, a využít ho jako nástroj k uvědomění a prevenci dalších impulzivních reakcí."
  - a: „Tento postup si můžete vyzkoušet i v budoucnu kdykoli, kdy pocítíte impulzivní nutkání. Řetězovou analýzu můžete použít jako nástroj, který vám pomůže rychle rozpoznat spouštěče, tělesné signály a impulzy, a naplánovat bezpečnější, uvědomělé reakce. Postupem času se díky pravidelnému používání stane přirozenou součástí vašeho zvládání emocí."
- **Funkčné:** `StructuredWorksheet(worksheetId: 'week5_day1_chain', …)`, 7 polí,
  autosave s debounce (existuje). **Nič nie je povinné** — používateľ smie odísť
  s prázdnym worksheetom a vrátiť sa. `visibleSectionLimit: 3` +
  `revealMoreLabel` (existuje), aby sedem polí naraz nepôsobilo ako dotazník.
- **UX / vizuál:** Presne vzor `week3_day3_facts`. Nadpis zdroja obsahuje slovo
  „Worksheet", ktoré appka v hlavičkách nepoužíva; navrhujem titulok
  **„Řetězová analýza impulzivního chování"** a slovo worksheet vynechať (je to
  názov formátu, nie obsah). OQ-4.
- **Používateľ / emočné:** Bod 5 („Chování") sa podľa zoznamu na strane 2/5
  výslovne týka aj „život ohrožujícího chování". Text pod worksheetom („můžete
  vyplnit pomalu") je jediné, čo dáva povolenie nedokončiť — má byť **nad**
  poľami alebo hneď na začiatku, nie až za siedmym poľom. Viď OQ-3.
- **Reuse vs nové:** `StructuredWorksheet`. Nič nové.
- **Otvorené otázky:** OQ-3, OQ-4.

### Strana 4/5 — Analýza chybějících článků (vetvenie · nový komponent)
- **Cieľ:** Zistiť, prečo sa nepodarilo použiť dovednosť — reťazcom otázok, kde
  „ano" posúva ďalej a „ne" otvorí dve textové polia.
- **Obsah (verbatim):**
  - Úvod: „**Analýza chybějících článků -** Pomocí těchto otázek můžeš zjistit, proč se ti nepodařilo použít dovednost nebo chovat se tak, jak jsi potřeboval/a."
  - **Q1:** „Věděl/a jsi, jaké chování nebo dovednost bylo potřeba použít?"
    - ne → „Co ti bránilo to vědět? (např. nedostatek pozornosti, nejasné instrukce, informace jsi vůbec nedostal/a, byl/a jsi příliš zahlcený/á a nedokázal/a jsi to zpracovat)."
    - ne → „Jak to můžeš příště vyřešit? (např. víc se soustředit, ptát se na upřesnění, hledat si informace, poprosit o pomoc)."
  - **Q2:** „Pokud ano: Byl/a jsi ochotný/á chovat se efektivně?"
    - ne → „Co ti bránilo v ochotě? (např. vzdorovitost, pocit, že to nezvládneš, bezmoc)."
    - ne → „Jak to můžeš příště vyřešit? (např. radikální přijetí, pro a proti, opposite action)."
  - **Q3:** „Pokud ano: Napadlo tě vůbec použít dovednost nebo chování, které bylo potřeba?"
    - ne → „Jak si to můžeš příště víc připomenout? (např. poznámka do kalendáře, nastavit si budík, mít zápisník s dovednostmi po ruce, coping ahead = předem si představit, jak situaci zvládneš)."
  - **Q4:** „Pokud ano: Co ti zabránilo to udělat hned?"
    - „Možné překážky: odkládání, nechuť, zapomněl/a jsi jak na to, pocit, že na tom nezáleží."
    - „Jak to můžeš příště vyřešit? (např. odměnit se za splnění, opposite action, pro a proti)."
- **Funkčné:** Nový `MissingLinksAnalysis`. Stav: 4 otázky × (`ano` | `ne` |
  nezodpovedané) + až 7 textových polí. Perzistencia cez **existujúci**
  `BpdWorksheetDao`, `worksheetId: 'week5_day1_missing_links'`; odpovede
  áno/nie sa uložia ako polia `q1`…`q4` s hodnotou `'ano'`/`'ne'` (DAO je
  `Map<String,String>`, takže netreba nový store ani migráciu).
  Vetvenie: Q(n) sa zobrazí, len keď Q(n-1) = `ano`. Po `ne` sa reťazec končí
  (zobrazia sa dve polia a nič ďalej) — presne ako to popisuje zdroj.
  Prepnutie odpovede z `ne` na `ano` **nemaže** už napísaný text, len ho skryje
  (skryté polia sa nerátajú do počítadla vyplnených).
- **UX / vizuál:** Jedna otázka = jedna karta so segmentovaným „Ano / Ne"
  prepínačom (nie dropdown, nie checkbox — dva veľké dotykové ciele).
  Zodpovedané otázky sa zbalia na jeden riadok „Věděl/a jsi… · **Ano**" s
  možnosťou rozkliknúť. Príklady v zátvorkách zdroja (napr. „např. radikální
  přijetí, pro a proti, opposite action") sa **nedávajú do placeholderu** —
  ten zmizne, len čo používateľ začne písať; idú do rozklikávacieho „Příklady"
  pod poľom, presne ako `WorksheetFieldExample` (existuje).
- **Používateľ / emočné:** Reťazec je konfrontačný („co ti bránilo") — tón
  udrží to, že je krátky a končí sa hneď, ako človek povie „ne". Nesmie
  pôsobiť ako test, ktorým sa dá prepadnúť: **žiadne** hodnotenie výsledku,
  žiadne „správne" vetvy, tlačidlo ďalej je aktívne stále.
- **Reuse vs nové:** **Nový** `MissingLinksAnalysis` (~180 r.) + existujúci
  `WorksheetFieldExample` + existujúci `BpdWorksheetDao`.
- **Otvorené otázky:** OQ-7 (Q4 v zdroji nemá vetvu áno/nie, len prekážky —
  navrhujem ho zobraziť ako záverečnú kartu bez prepínača).

### Strana 5/5 — Completion
- **Obsah (verbatim):** „Tak a to je pro zaátek pátého týdne vše. Potkáme se
  zítra." *(„zaátek" = preklep v zdroji, ponechaný — OQ-4)*
- **Funkčné:** `DayCompletionPage(dayNumber: 1, …)` + `markDayCompleted(5, 1)`
  + `NextDayTeaser` na Deň 2. **Teaser musí Deň 2 pomenovať citlivo** — je to
  prvá vec, ktorú o ňom používateľ uvidí. Viď OQ-12.
- **Reuse vs nové:** `DayCompletionPage`. Nič nové.

---

## Deň 2: Život ohrožující chování

**Najcitlivejší deň programu.** Zdroj sám hovorí, že je dobrovoľný.

### Strana 1/5 — Upozornění a dobrovolnost (chat + krízový odkaz)
- **Cieľ:** Dať človeku vedieť, čo príde, a skutočnú možnosť to preskočiť.
- **Obsah (verbatim):** „Dnešní téma může být pro někoho citlivé, na což bychom
  chtěli dopředu upozornit. Budeme se bavit o život ohrožujícím chování. Pro
  někoho to vůbec nemusí být téma, proto je dnešní sekce dobrovolná. Pro jiné to
  může být naopak téma nepříjemné. Máme pro to pochopení a přijde nám důležité
  říct, že na to nejsi sám. Pokud by ses necítil dobře a chtěl by ses se svými
  pocity někomu svěřit, můžeš nahlédnout do kontaktů, které jsou pro takové
  chvíle k dispozici. (proklik do Nepanikař kontaktů)"
- **Funkčné:** Deep-link `CrisisCenterContactsRoute` ako karta v chate (vzor W4
  D2 2/6). Dole **dve** akcie: primárna „Pokračovat", sekundárna „Přeskočit
  dnešek" → OQ-1.
- **UX / vizuál:** Bez červenej, bez výkričníka, bez modálneho dialógu.
  Varovanie v tóne zdroja je pokojné — vizuál to má rešpektovať. Kontaktná
  karta je **súčasťou** správy, nie plávajúci banner.
- **Používateľ / emočné:** Toto je jediná strana v programe, ktorá musí ponúknuť
  odchod bez pocitu zlyhania. Ak sa OQ-1 rozhodne pre preskočenie, deň sa
  označí ako hotový (nie „vynechaný"), inak sa týždeň zasekne na 6/7.
- **Reuse vs nové:** `ChatDayPage` + `ChatRichMessage` s kontaktnou kartou.
  Nová je len sekundárna akcia.
- **Otvorené otázky:** OQ-1.

### Strana 2/5 — Co to je (education · chat)
- **Obsah (verbatim, 2 odrážky):**
  - „Život ohrožující chování patří mezi impulzivní reakce na silné emoce. Často se objevuje jako způsob, jak rychle ulevit intenzivnímu napětí, smutku, hněvu nebo úzkosti. I když může krátkodobě přinést pocit úlevy, dlouhodobě neřeší problémy a může vést k dalším komplikacím."
  - „Je důležité pochopit, že život ohrožující chování není známka slabé vůle nebo „špatného charakteru“ – jde o reakci mozku a emocí, která se u některých lidí rozvíjí častěji, zejména u těch, kdo mají intenzivní nebo těžko zvládnutelné emoce. Cílem programu je nabídnout bezpečné a efektivní alternativy, jak s těmito impulzy zacházet a zvládat je bez ubližování sobě samému."
- **UX / vizuál:** Druhá odrážka je destigmatizačná — `ChatInfoCard`, rovnaký
  vzor ako odrážka 6 na D1 1/5, aby si používateľ všimol, že je to tá istá
  myšlienka v ťažšej téme.
- **Reuse vs nové:** Nič nové.

### Strana 3/5 — STOP (skill · akronym)
- **Obsah (verbatim, 2 úvodné vety + 4 písmená):**
  - „STOP je krátká technika, která ti pomůže nezareagovat impulzivně"
  - „STOP ti pomůže získat chvíli mezi impulsem a reakcí – a v té chvíli máš šanci vybrat si jinou cestu."
  - „**S – Stop (zastav se):** nic nedělej, nic neříkej."
  - „**T – Take a step back (ustup):** doslova se nadechni a udělej krok zpět, dej si čas."
  - „**O – Observe (pozoruj):** co se právě děje? jaké máš pocity, myšlenky, co říká okolí?"
  - „**P – Proceed mindfully (pokračuj vědomě):** rozhodni se, co ti v té situaci nejvíc pomůže – ne co chce emoce, ale co dává smysl."
- **Funkčné:** `AcronymSkillPage` + `RescueSaveButton` s **tým istým `id`**, aké
  používa W4 D2 (`stop`), aby sa v záchrannom balíčku neobjavil dvakrát.
- **UX / vizuál:** Identické s W4 D2 3/6.
- **Používateľ / emočné:** Kto prešiel týždeň 4, uvidí STOP druhýkrát —
  opakovanie je terapeuticky správne, ale **znenie sa nesmie líšiť**, inak to
  pôsobí ako chyba appky. OQ-2 je preto pre túto stranu blokujúca.
- **Reuse vs nové:** `AcronymSkillPage`, `RescueSaveButton`. Nič nové.
- **Otvorené otázky:** **OQ-2 (blokujúca).**

### Strana 4/5 — Mých 5 činností (zoznam + uloženie)
- **Obsah (verbatim):**
  - „Pokud se nám povede použít techniku STOP, je dobré vědět, co chci udělat místo toho, abychom si ublížili. Zkus si teď napsat seznam 5 činností, co by Ti mohli alepsoň trochu ulevit" *(„alepsoň" = preklep v zdroji — OQ-4)*
  - Príklady (zobrazia sa **po kliknutí**, presne ako v zdroji, všetkých 10):
    „Zavolat někomu blízkému. Jít se projít. Dát si sprchu. Vytřepat se. Pustit
    si oblíbenou hudbu. Napsat si, co právě cítím. Dýchat pomalu a zhluboka.
    Nakreslit nebo něco tvořit. Podívat se na něco uklidňujícího. Dát si čaj
    nebo něco dobrého."
- **Funkčné:** 5 textových polí, autosave, `BpdWorksheetDao`
  (`week5_day2_relief_list`). „Uložení na dostupné místo" = po vyplnení sa
  zoznam **uloží do záchranného balíčka** ako jedna položka („Mých 5 činností")
  s deep-linkom na `RescuePackageRoute`. Nič nie je povinné — 0 z 5 vyplnených
  nesmie blokovať tlačidlo.
- **UX / vizuál:** Päť polí je málo na `visibleSectionLimit`; zobraziť všetkých
  päť naraz, očíslované. „Nevíš, co napsat?" rozbalí 10 príkladov ako chipy —
  **klepnutie na chip vloží text do prvého prázdneho poľa** (rýchla cesta pre
  človeka, ktorý práve nemá kapacitu vymýšľať).
- **Používateľ / emočné:** Toto je jediná strana týždňa, ktorej výstup má
  hodnotu **v krízovej chvíli**, nie pri učení. Preto uloženie na dostupné
  miesto nie je „nice to have" — je to celý bod strany. Zoznam musí byť
  dohľadateľný bez toho, aby človek otváral program.
- **Reuse vs nové:** `StructuredWorksheet` (jedna sekcia, 5 polí) +
  `BpdRescuePackageDao`. Nový je len chip-shortcut; zvážiť, či ho nevynechať
  (OQ-8).
- **Otvorené otázky:** OQ-8.

### Strana 5/5 — Completion + péče
- **Obsah (verbatim):**
  - „Pokud je pro tebe život ohrožující chování náročným tématem, můžeš jej opečovat zde (odkaz na nepanikař mód Chci si ublížit a znovu na kontakty)"
  - „Dnes to mohlo být náročné. Díky že se pouštíš i do takových témat, chce to velkou odvahu."
- **Funkčné:** Dva deep-linky — `SelfHarmRoute` a `CrisisCenterContactsRoute` —
  **nad** poďakovaním, nie pod ním (kto odchádza, nedoscrolluje).
  `markDayCompleted(5, 2)` + `NextDayTeaser` na pauzu.
- **UX / vizuál:** Overiť, či `DayCompletionPage` má slot na obsah nad zhrnutím;
  ak nie, pridať `extraContent` (malá úprava).
- **Reuse vs nové:** `DayCompletionPage` (možná malá úprava).

---

## Deň 3: Pauza 🔁

- **Obsah (verbatim):** „Po včerejším dni může být přirozené cítit únavu. Dovol
  si zpomalit a postarat se o sebe s laskavostí. Každý krok, i ten odpočinkový,
  je důležitou součástí cesty. Proto si dnes dáme od programu pauzu."
- **Reuse:** `DayPauseScreen`. **Overené v kóde:** `_pauseCopyByDay` je
  `Map<(int,int), String>`, takže stačí záznam `(5, 3)`. Widget netreba meniť.
- **Pozn.:** Text výslovne odkazuje na „včerejší den" — teda na Deň 2, ktorý je
  **dobrovoľný**. Kto ho preskočil, prečíta si vetu, ktorá mu nesedí. Viď OQ-1.

---

## Deň 4: Plánování a prevence

### Strana 1/2 — Plánování a prevence (worksheet, 5 sekcií / 10 polí)
- **Cieľ:** Zostaviť si osobný preventívny a bezpečnostný plán.
- **Obsah (verbatim — 5 sekcií po 2 odrážkach):**
  1. **„Rozpoznání spouštěčů"**
     - „Napište si situace, myšlenky nebo emoce, které obvykle vedou k impulzivní reakci nebo život ohrožujícímu chování."
     - „Naučte se všímat tělesných signálů (např. napětí, bušení srdce, neklid)."
  2. **„Bezpečnostní plán"**
     - „Mějte připravený seznam kroků, co uděláte, když přijde silné nutkání (např. zavolat kamarádovi, použít techniku TIPS, jít na procházku)."
     - „Seznam osob nebo kontaktů, na které se můžete obrátit v krizi (blízcí, krizová linka, terapeut)."
  3. **„Nahrazení škodlivých reakcí bezpečnějšími"**
     - „Vyberte si předem techniky (UZNÁVÁM, STOP, TIPS, mindfulness), které můžete použít, až přijde silná emoce."
     - „Připravte si „krabičku první psychické pomoci“ – papír s uklidňujícími myšlenkami, obrázky, věc na zmáčknutí, éterický olej, hudbu."
  4. **„Plánování předem"**
     - „Rozmyslete si, co budete dělat, když víte, že vás čeká těžký den (více odpočinku, připravené copingové strategie)."
     - „Nastavte si malé, reálné cíle, aby byl den zvládnutelnější."
  5. **„Pravidelná prevence"**
     - „Pečujte o sebe pomocí spánku, jídla, pohybu, kontaktu s lidmi (SPOKO model)."
     - „Věnujte se aktivitám, které z dlouhodobého hlediska snižují stres a podporují regulaci emocí."
- **Funkčné:** `StructuredWorksheet(worksheetId: 'week5_day4_prevention')`,
  5 `WorksheetSection`, 10 polí, `visibleSectionLimit: 2` + „Zobrazit další".
  Tiché deep-linky tam, kde ich zdroj sám menuje:
  - sekcia 2 „technika TIPS" → týždeň 4, Deň 2 (alebo záchranný balíček)
  - sekcia 3 „UZNÁVÁM, STOP, TIPS, mindfulness" → `RescuePackageRoute`
  - sekcia 3 „krabička první psychické pomoci" → `RescuePackageRoute`
  - sekcia 5 „SPOKO model" → týždeň 1
  Odkaz na neodomknutý týždeň sa **nezobrazí**. Edge-case: pri sekvenčnom
  odomykaní nemôže nastať, ale DEV hack `unlockAllDaysInWeek` ho umožní —
  nesmie spadnúť.
- **UX / vizuál:** Odrážky zdroja sú v rozkazovacom spôsobe a vykajú
  („Napište si", „Mějte připravený") — sú to **inštrukcie, nie otázky**, takže
  label poľa nemôže byť celá veta. Návrh: label = názov sekcie + krátky
  imperatív, celá veta zdroja ide ako `intro` sekcie / `hint` poľa. Presné
  znenie labelov je **náš text** → OQ-6.
- **Používateľ / emočné:** Desať polí je najviac v celom programe.
  `visibleSectionLimit` je tu nutnosť, nie ozdoba. Sekcia 2 („koho zavolám
  v krizi") je fakticky bezpečnostný plán — po vyplnení má ísť do záchranného
  balíčka rovnako ako zoznam z Dňa 2.
- **Reuse vs nové:** `StructuredWorksheet`. Nič nové.
- **Otvorené otázky:** OQ-6 (chýba úvodný odstavec, labely polí sú naše).

### Strana 2/2 — Completion
- **Obsah (verbatim):** „Dnešek máme za sebou a těšíme se na zítra."
- **Reuse:** `DayCompletionPage`.

---

## Deň 5: Všímavost

Štruktúrne **identický s týždňom 4, Dňom 4.** Kopírovať vzor, nie vymýšľať.

### Strana 1/3 — Všímavost u impulzivity (education · chat)
- **Obsah (verbatim, 3 odrážky):**
  - „Všímavost může v impulzivitě pomoci tím, že nám umožní zastavit se v okamžiku, kdy cítíme silnou emoci, místo aby nás přemohla a vedla k rychlé, nepromýšlené reakci."
  - „Když se naučíme vědomě sledovat své myšlenky, pocity a tělesné signály, můžeme si všimnout prvních známek impulzivního chování. Díky tomu získáme prostor rozhodnout se, jak reagovat, místo aby emoce řídily naše jednání automaticky."
  - „Všímavost také pomáhá snižovat celkovou úroveň stresu a napětí, takže se impulzy objevují méně často a snáze je zvládáme."
- **Reuse vs nové:** `ChatDayPage`. Nič nové.

### Strana 2/3 — Vyzkoušej si techniku (losovanie)
- **Obsah (verbatim):** „Pojďme si teď jednu z technik vyzkoušet (prostor vybrat
  si z všímavých technik, kolo štěstí)"
- **Funkčné:** `TechniqueRandomiser(techniques: week4DrawPool, sourceLabel: …)`.
  Osem techník týždňa 2 (3 dychové + 5 všímavých), detail sheet aj uloženie do
  záchranného balíčka fungujú bez zmeny.
- **UX / vizuál:** Zdroj píše „kolo štěstí". **Používateľ rozhodol 2026-08-12
  (týždeň 4, OQ-2), že to bude tlačidlo „Vylosovat", nie animované koleso** —
  držíme sa toho, inak by ten istý koncept vyzeral v dvoch týždňoch inak.
  Zdroj zároveň píše „prostor **vybrat si**", čo je menu, nie losovanie.
  Navrhujem obe: primárne „Vylosovat", pod tým „Vybrat si sám/sama" →
  `TechniqueMenuPage`. Viď OQ-9.
- **Reuse vs nové:** `TechniqueRandomiser`, prípadne `TechniqueMenuPage`.
  Nič nové.
- **Otvorené otázky:** OQ-9.

### Strana 3/3 — Completion
- **Obsah (verbatim):** „To je pro dnešek vše!"
- **Reuse:** `DayCompletionPage`.

---

## Deň 6: Pauza 🔁

- **Obsah (verbatim):** „Dnešek bude dnem odpočinku. Zasloužíš si ho – Tvoje
  vytrvalost, otevřenost a snaha jdou opravdu vidět. I pauza je součástí cesty
  vpřed, pomáhá tělu i mysli zpracovat všechno, co už máš za sebou."
- **Reuse:** `DayPauseScreen`, záznam `(5, 6)` v `_pauseCopyByDay`.

---

## Deň 7: Shrnutí

### Strana 1/3 — Uzavíráme pátý týden (chat recap)
- **Obsah (verbatim, 1 odrážka):** „Úspěšně uzavíráme pátý týden zaměřený na
  impulzivní chování. Zkoumat své impulsy vyžaduje velkou odvahu a upřímnost k
  sobě, klobouk dolů před tvou prací."
- **Funkčné:** Rekapitulácia dní ako v týždňoch 2–4. **Zdroj rekapituláciu
  neobsahuje** — položky sú náš text → OQ-10.
- **Reuse vs nové:** `ChatDayPage` + `ChatFeatureList`.

### Strana 2/3 — Reflexe týdne (3 otázky)
- **Obsah (verbatim):**
  1. „Co pro tebe bylo v tomto týdnu klíčové? Jaké nové poznatky se ti podařilo získat?"
  2. „Podařilo se ti už něco z nové inspirace uvést do praxe? Co přesně a jak to probíhalo?"
  3. „Ve kterých situacích v nadcházejícím týdnu vidíš pro tuto dovednost největší využití?"
- **Funkčné:** `ReflectionQuestionList` + `ReflectionAutosave`,
  `BpdReflectionDao` pre týždeň 5. Autosave musí fungovať aj pri odchode bez
  dokončenia (lekcia z týždňa 2 — overiť na zariadení).
- **Reuse vs nové:** Nič nové.

### Strana 3/3 — Týden dokončen
- **Funkčné:** `WeekCompletionPage` + `markWeekCompleted(5)` → uzol v strome sa
  zazelená. Teaser na týždeň 6 **neexistuje** (obsah zatiaľ nedodaný) — musí sa
  správať ako posledný implementovaný týždeň, nie ukázať prázdny týždeň 6.
  Viď OQ-11.
- **Otvorené otázky:** OQ-11.

---

## Súhrnné UX rozhodnutia pre týždeň

1. **Edukácia = chat, cvičenie = formulár**, per-strana (pravidlo z
   `implementation-spec.md`). D1 1–2, D2 1–2, D5 1, D7 1 sú chat; D1 3–4,
   D2 4, D4 1, D7 2 sú formuláre; D2 3 je akronymová strana.
2. **Nič nie je povinné.** Ani jedno pole týždňa nesmie blokovať tlačidlo —
   týždeň sa pýta na najťažšie veci programu a človek musí smieť prejsť ďalej.
3. **Dva výstupy patria do záchranného balíčka**, nie do archívu: zoznam 5
   činností (D2) a bezpečnostný plán (D4 sekcia 2). Tie sa čítajú v kríze.
4. **STOP sa nepreučuje nanovo** — je to tá istá technika ako v týždni 4,
   rovnaké `id` v záchrannom balíčku, rovnaké znenie (po vyriešení OQ-2).
5. **Deň 2 má vždy dostupné dva východy** — kontakty a modul „Chci si ublížit"
   — a jeden vstup, ktorý sa dá odmietnuť.

---

## Chýbajúci obsah pre autorku (→ task `W5-01`)

| # | Čo chýba / je sporné | Odporúčanie |
|---|----------------------|-------------|
| OQ-1 | „Dnešní sekce je dobrovolná" — nie je povedané, **čo sa stane**, keď to niekto preskočí. Preskočený deň by inak držal týždeň na 6/7 a Deň 3 mu povie „po včerejším dni". | Preskočenie označí deň za hotový; potrebujeme vetu pre tlačidlo („Přeskočit dnešek") a jednu potvrdzujúcu. |
| OQ-2 | **STOP má v týždni 4 a 5 iné znenie písmen** (česky vs. anglicky s prekladom). | Zjednotiť. Odporúčam znenie týždňa 4 (české) — je už v appke a v záchranných balíčkoch používateľov. |
| OQ-3 | Deň 1 žiada vybaviť si a rozobrať vlastnú impulzívnu situáciu vrátane „život ohrožujícího chování" — **bez varovania**, ktoré má Deň 2. | Doplniť jednu vetu pred worksheet, alebo presunúť povolenie „vyplňte pomalu" nad polia. |
| OQ-4 | Typografia a preklepy v zdroji: „zaátek" (má byť „začátek"), „alepsoň" (má byť „alespoň"), „co by Ti mohli" (má byť „mohly"), nepárová úvodzovka v „průběh událostí“, dvojité medzery v „Jeden z  DBT nástrojů", „apod" bez bodky. | Ponechané verbatim. Autorka nech potvrdí opravy — nemením jej text sám. |
| OQ-5 | Týždeň **mieša tykanie a vykanie**: D1 výzva a worksheet vykajú („vzpomeňte si", „Napište si"), zvyšok programu tyká („ses cítil/a"). | Zjednotiť na tykanie (zvyšok programu). |
| OQ-6 | Deň 4 **nemá úvodný odstavec** ani jednu edukačnú vetu — otvorí sa rovno 10-poľovým worksheetom. Labely polí by boli náš text. | 2–3 vety úvodu od autorky + potvrdenie labelov. |
| OQ-7 | „Analýza chybějících článků": Q4 („Co ti zabránilo to udělat hned?") **nemá vetvu áno/nie**, len zoznam prekážok. | Zobraziť ako záverečnú kartu bez prepínača. |
| OQ-8 | Zoznam 10 príkladov na D2 4/5 — má klepnutie na príklad **vložiť text do poľa**, alebo len ukázať zoznam? | Vložiť (rýchla cesta v ťažkej chvíli). |
| OQ-9 | D5: zdroj píše aj „prostor **vybrat si**", aj „**kolo štěstí**" — sú to dve rôzne interakcie. | Primárne „Vylosovat" (ako týždeň 4), sekundárne „Vybrat si sám/sama". |
| OQ-10 | D7 rekapitulácia týždňa — zdroj ju nemá, v týždňoch 2–4 je to náš text. | Napíšem návrh, autorka schváli (`// TODO: schválit autorem`). |
| OQ-11 | Čo sa stane **po dokončení týždňa 5** — obsah týždňa 6 zatiaľ neexistuje. | Zobraziť „ďalší týždeň sa pripravuje", nie prázdny uzol. |
| OQ-12 | Deň 2 sa volá „Život ohrožující chování" — takto sa zobrazí v zozname dní **skôr**, než človek prečíta varovanie. | Potvrdiť názov v zozname dní a text `NextDayTeaser` na konci Dňa 1. |

**Blokujúce pre kód:** OQ-1 a OQ-2 (Deň 2). Zvyšok sa dá implementovať
s `// TODO: schválit autorem` a upraviť neskôr.

---

## Čo sa dá kódovať hneď

| Deň | Blokované? |
|-----|-----------|
| 1 | ✅ nie (OQ-3/4/5/7 sú kozmetické, riešiteľné TODO komentárom) |
| 2 | ⚠️ **áno** — OQ-1 (dobrovoľnosť) a OQ-2 (znenie STOP) |
| 3 | ✅ nie |
| 4 | ✅ nie (OQ-6 → úvod doplní autorka, labely s TODO) |
| 5 | ✅ nie (OQ-9 → implementovať obe, vypnúť sa dá jedným riadkom) |
| 6 | ✅ nie |
| 7 | ✅ nie (OQ-10 s TODO, OQ-11 je zmena `kImplementedBpdWeeks`) |
