# Week 6 — Mezilidské vztahy a sebepojetí — Screen Plan

> Zdroj obsahu (verbatim): `docs/hpo/source/tyzden-6.md`
> Vytvorené: 2026-08-29
> Stav: **plán hotový, kódovateľné celé.** Žiadna otázka neblokuje kód —
> na rozdiel od týždňa 5 tu nie je nič, čo by sa bez autorky nedalo postaviť.
> Aplikované OPEN lekcie z `LESSONS.md`: pole **Typ obrazovky**, plán pokrýva
> celý týždeň, sekcia **Zdieľané komponenty týždňa**, sekcia **Chýbajúci obsah
> pre autorku**, počty položiek **prepočítané zo zdroja**, pri každom 🔁 reuse
> otvorený cieľový widget, a nová (z týždňa 5) kontrola **„má strana niečo
> navyše oproti minulému týždňu? — otvor widget a over parameter"**.

---

## Čo je v tomto týždni iné

1. **Prvý týždeň bez jediného nového komponentu.** Tri akronymy, dva worksheety,
   jeden mýtový worksheet, výber všímavej techniky, dve pauzy a reflexia — na
   všetko existuje overený widget z týždňov 2–5. Odhad nového kódu: **0 nových
   widgetov, 0 úprav zdieľaných widgetov.**
2. **Tri akronymy v jednom týždni, jeden z nich sedempísmenový.** PSANÍČKo (7),
   Je VýZVa (4), neZOUFej (4). `AcronymSkillPage` + `NumberedBenefit.number`
   ako `String` to zvládne bez zmeny — overené v týždni 4 na UZNÁVÁM (7 písmen).
3. **24 mýtov v dvoch pomenovaných skupinách.** Týždeň 3 mal 20 mýtov v jednom
   bloku; tu ich autorka výslovne delí na „Mýty, které brání v prosazování
   vlastních potřeb a cílů" (12) a „Mýty, které brání v budování vztahů a respektu
   k sobě" (12). `StructuredWorksheet` nemá skupinové hlavičky → **dva
   worksheety pod sebou**, každý s vlastným `worksheetId`. Žiadna zmena widgetu.
4. **Deň 2 má autorkin vzorový príklad.** Prvý raz od týždňa 3 nemusíme worked
   example vymýšľať — napísala ho celý (7 krokov + situácia).
   `StructuredWorksheet.example` je presne `List<(String, String)>`.
5. **Deň 3 nemá názov.** Dni 1, 2, 5 a 7 majú v zdroji tučný nadpis; Deň 3 začína
   holým „**3.** Dále v DBT existuje dovednost…". Názov dňa v zozname je náš.
6. **Zdroj má na Dni 5 zlomené formátovanie.** Písmeno „O" akronymu neZOUFej je
   nalepené na koniec inštrukcie písmena „Z" bez zalomenia riadku, u „Va"
   v Dni 3 je editačný artefakt „uznejříkáuznej" a „U – Upřímnosts" má prebytočné
   „s". Rozdelil som to podľa zjavného úmyslu a **každý zásah zapísal** — viď OQ-2.
7. **Deň 3 spája dve témy.** Najprv akronym Je VýZVa, potom „V tomto dni se
   zaměříme na všímavost v kontextu mezilidských vztahů" + výber techniky. Sú to
   dve rôzne veci v jednom dni; plán ich drží ako dve strany, nie jednu.

---

## Bezpečnosť — prierezové rozhodnutie tohto týždňa

Prešiel som všetky cvičenia týždňa 6: tri akronymy (len text), tri worksheety
(len písanie), výber všímavej techniky z **už schválenej** zásoby týždňa 2.
**Žiadne telesné cvičenie, žiadna kontraindikácia, žiadna krízová téma.**
Po týždni 5 (život ohrožující chování) je tento týždeň emočne výrazne ľahší
a nepotrebuje krízové odkazy — dávať ich sem by bolo naše rozhodnutie, nie jej.

Jediná citlivejšia vec: **Deň 1 dáva používateľovi prečítať 24 negatívnych
presvedčení o sebe** („Nezasloužím si dostat to, co chci", „Jen slaboši mají
hodnoty"). Týždeň 3 to riešil `WorksheetSectionStyle.myth` — tlmená karta
v úvodzovkách pod štítkom MÝTUS, aby appka nevyzerala, že s tvrdením súhlasí.
Ten istý štýl použijeme aj tu; je to už overené.

---

## Zdieľané komponenty týždňa

| Komponenta | Použitie | Reuse? |
|-----------|----------|--------|
| `ChatDayPage` + `ChatBotBubble` / `ChatInfoCard` / `ChatFeatureList` | edukácia D1, D2, D3, D5, D7 recap | ✅ hotové |
| `AcronymSkillPage` (`NumberedBenefit` s písmenom) | **PSANÍČKo** (D2, 7 písmen), **Je VýZVa** (D3, 4), **neZOUFej** (D5, 4) | ✅ hotové, bez zmeny |
| `StructuredWorksheet` + `WorksheetSectionStyle.myth` | D1 — 24 mýtov v dvoch skupinách | ✅ hotové (vzor W3 D1) |
| `StructuredWorksheet` + `example` | D2 PSANÍČKo worksheet s **autorkiným vzorom** | ✅ hotové |
| `StructuredWorksheet` | D5 neZOUFej worksheet (6 polí) | ✅ hotové |
| `RescueSaveButton` + `BpdRescuePackageDao` | PSANÍČKo, Je VýZVa, neZOUFej | ✅ hotové |
| `TechniqueRandomiser` + `week4DrawPool` + picker sheet | D3 výber všímavej techniky | ✅ hotové (vzor W5 D5) |
| `DayPauseScreen` — text podľa `(týždeň, deň)` | D4, D6 | ✅ **overené**, stačia dva záznamy |
| `ReflectionQuestionList` + `ReflectionAutosave` | D7, 3 otázky | ✅ hotové |
| `DayCompletionPage`, `WeekCompletionPage`, `DayFlowHeader`, `DayPageBase` | všade | ✅ hotové |

**Nový kód: žiadny.** Týždeň 6 je čisto obsahový — presne ten prípad, kde podľa
lekcie z týždňa 4 stačí prejsť nové komponenty a perzistenciu, nie celý týždeň.

---

## Prehľad

| Deň | Názov | # strán | Typ obrazovky | Nové interakcie |
|-----|-------|---------|---------------|-----------------|
| 1 | Edukace o vztazích | 4 | chat (1) + mýty (2–3) + completion | 24-položkový mýtový worksheet v 2 skupinách |
| 2 | Dovednosti pro komunikaci s druhými | 4 | chat (1) + akronym (2) + worksheet (3) + completion | PSANÍČKo worksheet s autorkiným vzorom |
| 3 | Je VýZVa a všímavost ve vztazích | 4 | akronym (1) + chat (2) + technika (3) + completion | — |
| 4 | Pauza | — | 🔁 `DayPauseScreen` | — |
| 5 | Sebeúcta | 4 | chat (1) + akronym (2) + worksheet (3) + completion | neZOUFej worksheet |
| 6 | Pauza | — | 🔁 `DayPauseScreen` | — |
| 7 | Shrnutí | 3 | chat recap (1) + reflexia (2) + week completion | — |

Celkom **19 strán**, dva dni celé na reuse.

---

## Deň 1: Edukace o vztazích

### Strana 1/4 — Proč vztahy (education · chat)
- **Cieľ:** Rámcovať týždeň a pripraviť pôdu pre mýty.
- **Obsah (verbatim, odrážky 1–4):**
  - „Tento týden se zaměříme na vztahy – tedy na to, jak je budovat, posilovat a zvládat v nich obtížné situace. Vztahy jsou pro náš život zásadní, ale často s nimi přichází i výzvy, například obavy říci si o to, co potřebujeme, nebo strach odmítnout něco, co nechceme. Společně se naučíme dovednosti, které ti mohou pomoci být ve vztazích jistější, otevřenější a zároveň si zachovat respekt k sobě i k ostatním. Cílem není mít dokonalé vztahy, ale získat nástroje, jak zvládat situace zdravějším způsobem a postupně tak posilovat pocit stability a spokojenosti v kontaktu s lidmi kolem tebe."
  - „Dovednosti vztahové efektivity ti mohou pomoci navazovat nové vztahy, posilovat ty stávající a zvládat konfliktní situace. Učí, jak umět jasně požádat o to, co potřebuješ, a také jak říci „ne“ tam, kde je to pro tebe důležité. V rámci tohoto programu se tyto dovednosti zaměřuje hlavně na to, jak dosahovat svých cílů ve vztazích – tedy jak získat od druhých to, co potřebuješ, aniž by tím trpěly samotné vztahy nebo tvoje sebeúcta."
  - „Vztahy jsou pro každého z nás důležité – přinášejí podporu, blízkost a pocit sounáležitosti. Někdy ale v hlavě nosíme různé mýty a přesvědčení, které nám brání jednat otevřeně, říkat si o to, co potřebujeme, nebo nastavovat hranice. Tyto myšlenky mohou znít velmi přesvědčivě, ale ve skutečnosti nás často jen oslabují a narušují naše vztahy i respekt k sobě. V tomto bloku se na ně podíváme blíže a naučíme se je zpochybňovat."
  - „Pokud chceš vědět víc, můžeme se podívat na různé mýty, které nám časo mohou komplikovat život v rámci mezilidských vztazích." *(„časo" = preklep v zdroji — OQ-2)*
- **Funkčné:** Len čítanie. Prvé dve odrážky sú veľmi dlhé (4 a 3 vety) → rozdeliť
  na dve bubliny každú, bez zmeny znenia.
- **UX / vizuál:** Tretia odrážka („nosíme různé mýty") je most k cvičeniu →
  `ChatInfoCard`. Posledná odrážka nesie tlačidlo na ďalšiu stranu.
- **Používateľ / emočné:** „Cílem není mít dokonalé vztahy" je najdôležitejšia
  veta strany — nesmie zapadnúť doprostred dlhej bubliny.
- **Reuse vs nové:** `ChatDayPage`. Nič nové.

### Strana 2/4 — Mýty: prosazování potřeb (mýtový worksheet, 12 položiek)
- **Cieľ:** Spochybniť 12 presvedčení, ktoré bránia požiadať o svoje.
- **Obsah (verbatim, nadpis + 12 mýtov):**
  - Nadpis: „Mýty, které brání v prosazování vlastních potřeb a cílů"
  - Pokyn zdroja: „(nechat prostor na vepsání pravdivé formulace)"
  1. „Nezasloužím si dostat to, co chci nebo potřebuji."
  2. „Když o něco požádám, ukážu tím, že jsem slabý člověk."
  3. „Musím předem vědět, že druhý řekne ano, než vůbec požádám."
  4. „Pokud o něco požádám nebo řeknu ne, nevydržím, když se na mě někdo naštve."
  5. „Když mi někdo řekne ne, zničí mě to."
  6. „Požádat o něco je tlačivé, sobecké nebo špatné."
  7. „Říct ne je vždycky sobecké."
  8. „Měl(a) bych být ochotný/á obětovat své potřeby pro ostatní."
  9. „Pokud si neumím poradit sám/sama, znamená to, že jsem neschopný/á."
  10. „Problém je jen v mé hlavě – kdybych myslel/a jinak, nemusel/a bych tím obtěžovat ostatní."
  11. „Pokud nemám to, co chci nebo potřebuji, je to jedno – vlastně mi na tom nezáleží."
  12. „Umět používat dovednosti je známka slabosti."
- **Funkčné:** `StructuredWorksheet(worksheetId: 'week6_day1_myths_needs')`,
  12 sekcií v štýle `myth`, jedno pole na mýtus, autosave.
  `visibleSectionLimit: 4` + „Chci zpochybnit i další mýty" — 12 polí naraz je
  presne to, čo týždeň 3 riešil rovnako.
  **Bez `example`** — autorka pre týždeň 6 protipríklady nenapísala (v týždni 3
  áno). Viď OQ-1.
- **UX / vizuál:** `WorksheetSectionStyle.myth` — tlmená karta v úvodzovkách pod
  štítkom MÝTUS. Appka nesmie vyzerať, že s tvrdením súhlasí.
- **Používateľ / emočné:** 24 negatívnych viet o sebe za sebou je veľa. Preto
  dve strany (12 + 12), nie jedna s 24, a preto sa naraz ukazujú štyri.
- **Reuse vs nové:** presný vzor `week3/day1_emotions/myth_busting_page.dart`.
- **Otvorené otázky:** OQ-1.

### Strana 3/4 — Mýty: budování vztahů (mýtový worksheet, 12 položiek)
- **Obsah (verbatim, nadpis + 12 mýtov):**
  - Nadpis: „Mýty, které brání v budování vztahů a respektu k sobě"
  1. „Neměl(a) bych muset o něco žádat (nebo říkat ne); ostatní by měli vědět, co chci, a udělat to."
  2. „Ostatní by měli vědět, že jejich chování zraňuje mé pocity; neměl(a) bych jim to muset říkat."
  3. „Neměl(a) bych muset vyjednávat nebo pracovat na tom, abych dostal(a), co chci."
  4. „Ostatní by měli být ochotní udělat pro mě víc."
  5. „Ostatní by mě měli mít rádi, schvalovat mě a podporovat mě."
  6. „Nezaslouží si, abych k nim byl(a) laskavý/á nebo se k nim choval(a) dobře."
  7. „Nejdůležitější je, abych dostal(a), co chci, když to chci."
  8. „Nemusím být férový/á, laskavý/á nebo zdvořilý/á, pokud se ostatní tak nechovají ke mně."
  9. „Pomsta bude skvělá; stojí za všechny negativní následky."
  10. „Jen slaboši mají hodnoty."
  11. „Každý lže."
  12. „Získat to, co chci, je důležitější než způsob, jakým to získám; účel světí prostředky."
- **Funkčné:** `worksheetId: 'week6_day1_myths_relationships'`, inak identické
  so stranou 2/4. Samostatné id, aby sa odpovede skupín nemiešali.
- **Reuse vs nové:** Nič nové.

### Strana 4/4 — Completion
- **Obsah (verbatim):** „Tak dnešní kus práce máš za sebou, jen tak dál."
- **Reuse:** `DayCompletionPage` + `NextDayTeaser` na Deň 2.

---

## Deň 2: Dovednosti pro komunikaci s druhými

### Strana 1/4 — Proč komunikace (education · chat)
- **Obsah (verbatim, odrážka 1 + úvod k PSANÍČKu):**
  - „Dnešní den je zaměřený na dovednosti, které ti pomohou komunikovat s druhými lidmi tak, abys dokázal jasně a s respektem vyjádřit své potřeby, a přitom udržel dobré vztahy a vlastní sebeúctu. Patří sem nástroje, které ti ukážou, jak říkat věci otevřeně a nenásilně, jak prosazovat své cíle, ale zároveň zůstat ohleduplný k ostatním. Díky tomu se můžeš cítit jistější v mezilidských situacích a postupně si budovat zdravější a stabilnější vztahy."
  - „Někdy je těžké jasně říct, co potřebujeme, nebo odmítnout, co nechceme – máme obavy, že budeme působit sobecky, že nás druzí odmítnou, nebo že to povede ke konfliktu. PSANÍČKo je jednoduchý postup, který ti pomůže mluvit otevřeně a přitom respektujícím způsobem. Díky němu se můžeš naučit vyjádřit své potřeby tak, aby tě druzí slyšeli, a zároveň si udržel vztahy i vlastní sebeúctu. Co znamenají jednotlivá písmena PSANÍČKo?"
- **Funkčné:** Len čítanie, posledný krok vedie na akronym.
- **Reuse vs nové:** `ChatDayPage`. Nič nové.

### Strana 2/4 — PSANÍČKo (skill · akronym, 7 písmen)
- **Obsah (verbatim, 7 písmen + záverečná veta):**
  - „**P – Popis:** Jasně a věcně popiš situaci."
  - „**S – Sdělení:** Řekni, co cítíš a co potřebuješ."
  - „**A – Asertivita:** Otevřeně požádej nebo řekni ne."
  - „**N – Nabídka:** Vysvětli, proč se vyplatí vyhovět tvému požadavku."
  - „**Í – Impozantně:** Drž se svého cíle, nenech se odběhnout."
  - „**Č – Cílevědomě:** Vystup klidně a s jistotou."
  - „**Ko – Komunikace:** Buď připraven komunikovat a najít kompromis."
  - Pod písmenami: „Pomáhá to být jasný, přímý a přitom respektující – díky tomu se zvyšuje šance, že tě druzí vyslechnou a vezmou vážně."
- **Funkčné:** `AcronymSkillPage` + `RescueSaveButton`
  (`id: 'week6_psanicko'`). Zdroj tu píše „(infografika)" — obrázok nemáme,
  akronymová strana ho nahrádza. Viď OQ-3.
- **UX / vizuál:** Sedem písmen je najviac v programe hneď po UZNÁVÁM (7);
  overené, že `AcronymSkillPage` to unesie bez scrollovacieho pekla.
  Pozn.: písmeno **Í** je `Í` a **Ko** je dvojznak — `NumberedBenefit.number`
  je `String`, takže obe fungujú.
- **Otvorené otázky:** OQ-3.

### Strana 3/4 — Worksheet PSANÍČKo (worksheet + autorkin vzor)
- **Obsah (verbatim — zadanie + 8 polí + vzor):**
  - Zadanie: „Vzpomněl/a ses na situaci v komunikaci, kdy bylo těžké někoho o něco žádat? Držet svoje hranice? Zkus si doplnit věty do worksheetu PSANÍČKo podle jednotlivých kroků P-S-A-N-Í-Č-Ko tak, aby odrážely tvoji vlastní zkušenost. Pomůže ti to procvičit, jak vyjádřit své pocity a potřeby uvědoměle a sebevědomě, aniž bys podlehl/a impulzivní reakci."
  - Polia: **Situace**, potom P, S, A, N, Í, Č, Ko (8 polí celkom).
  - **Vzor (autorkin, verbatim, odkryje sa klepnutím):**
    - Situace: „Známý ti opakovaně píše nebo říká urážlivé věci, když se neshodnete."
    - P: „Všiml/a jsem si, že když se neshodneme, začneš mi psát nebo říkat urážlivé věci.“
    - S: „Cítím se zraněný/á a smutný/á, když se mnou takhle mluvíš.“
    - A: „Prosím, přestaň mi nadávat a urážet mě, když spolu nesouhlasíme.“
    - N: „Když se budeme bavit bez urážek, bude se mi s tebou mnohem lépe komunikovat a řešit věci.“
    - Í: „Drž se svého sdělení, nenech se vtáhnout do hádky nebo obhajování."
    - Č: „Mluv klidně, dívej se druhému do očí, nezvyšuj hlas, aby bylo jasné, že to myslíš vážně."
    - Ko: „Pokud jsi rozrušený/á, můžeme rozhovor přerušit a vrátit se k němu později, až se uklidníme.“
- **Funkčné:** `StructuredWorksheet(worksheetId: 'week6_day2_psanicko')`,
  8 polí, `example:` = vzor ako `List<(String, String)>`, `exampleTitle:
  'Zobrazit vzor'`. **Bez `exampleNote`** — na rozdiel od týždňa 3 je tento
  príklad jej, nie náš, takže nepotrebuje varovanie.
- **UX / vizuál:** Vzor je jeden rozklikávací blok nad poľami (nie per-pole) —
  je to jeden súvislý príbeh a po častiach by stratil zmysel.
  `visibleSectionLimit` netreba: 8 polí s krátkymi odpoveďami je zvládnuteľné
  a rozdelenie by rozbilo akronym.
- **Používateľ / emočné:** Zadanie sa pýta na situáciu, „kdy bylo těžké někoho
  o něco žádat" — nič povinné, tlačidlo aktívne aj pri prázdnom worksheete.
- **Reuse vs nové:** Nič nové.

### Strana 4/4 — Completion
- **Obsah (verbatim):** „Skvěle, že se do programu pořád pouštíš. Pro dnešní den je to všechno."
- **Reuse:** `DayCompletionPage`.

---

## Deň 3: Je VýZVa a všímavost ve vztazích

Zdroj tento deň **nepomenoval** — začína holým „**3.** Dále v DBT existuje…".
Názov je náš (OQ-4). Deň spája dve témy, preto dve obsahové strany.

### Strana 1/4 — Je VýZVa (skill · akronym, 4 písmená)
- **Obsah (verbatim, úvod + 4 písmená):**
  - „Dále v DBT existuje dovednost “Je VýZVa”. Ta ti pomáhá zlepšit vztahy s ostatními tím, že se učíš být laskavý/á, respektující a pozorný/á, i když se cítíš rozrušený/á. Používáním “Je VýZVa” ukazuješ druhým, že ti na nich záleží, že je slyšíš a že se snažíš komunikovat způsobem, který podporuje porozumění a spolupráci."
  - „**Je - JEmné způsoby**" / „chovej se klidně a laskavě, vyhýbej se kritice, obviňování nebo urážkám"
  - „**Vý - přátelské VYstupování**" / „komunikuj klidně a přátelsky, používej humor nebo lehkost, aby situace nebyla napjatá"
  - „**Z - Zájem**" / „projevuj zájem o druhou osobu, poslouchej ji a vnímej, co říká"
  - „**Va - VAlidace**" / „uznej pocity a názory druhé osoby, ukaž, že je chápeš, i když s nimi nesouhlasíš" *(zdroj má naviac artefakt, viď OQ-2)*
- **Funkčné:** `AcronymSkillPage` + `RescueSaveButton` (`id: 'week6_je_vyzva'`).
  Zdroj píše „(infografika)" — viď OQ-3.
- **UX / vizuál:** Písmená sú dvojznaky („Je", „Vý", „Va") — `NumberedBenefit`
  ich zvládne, ale badge je štvorec 34 px; **overiť na zariadení**, že sa „Vý"
  s dĺžňom zmestí.
- **Otvorené otázky:** OQ-2 (artefakt vo „Va"), OQ-3.

### Strana 2/4 — Všímavost ve vztazích (education · chat)
- **Obsah (verbatim, 2 odrážky):**
  - „V tomto dni se zaměříme na všímavost v kontextu mezilidských vztahů. Všímavost nám pomáhá lépe vnímat sebe i druhé, uvědomovat si své pocity, potřeby a impulzy, a reagovat vědomě místo impulzivně. I když hlavním cílem týdne jsou dovednosti pro efektivní komunikaci, všímavost je skvělý nástroj, který podporuje všechny tyto dovednosti. Je užitečné se k němu pravidelně vracet, protože čím častěji cvičíme vědomou pozornost, tím snazší je zůstat klidný/á, soustředěný/á a konstruktivní ve vztazích s ostatními."
  - „Teď si můžeš vybrat z nabídky všímavých cvičení, které chceš vyzkoušet. Vyber to, které ti nejvíc vyhovuje, a věnuj mu chvíli pozornosti, abys cítil/a, jak ti pomáhá zůstat klidný/á a soustředěný/á v daném okamžiku."
- **Reuse vs nové:** `ChatDayPage`. Nič nové.

### Strana 3/4 — Výběr techniky (exercise)
- **Obsah (verbatim):** „(Klik na výběr všímavých technik)" — pokyn pre nás,
  nie copy.
- **Funkčné:** Zdroj tu na rozdiel od týždňa 5 **nepíše „kolo štěstí"** — píše
  výslovne „**vybrat si z nabídky**" a „Vyber to, které ti nejvíc vyhovuje".
  Preto je tu **primárne menu**, nie losovanie (opak týždňa 5). Zoznam ôsmich
  techník týždňa 2 (`week4DrawPool`), detail sheet a uloženie do balíčka bez zmeny.
- **UX / vizuál:** Aby to nebolo v každom týždni inak, ponúkam pod menu aj
  „Vylosovat za mě" — rovnaká dvojica ako v týždni 5, len prehodené poradie
  podľa toho, čo žiada zdroj. Viď OQ-5.
- **Reuse vs nové:** `TechniqueMenuPage` / picker + `TechniqueRandomiser`.
  Nič nové.
- **Otvorené otázky:** OQ-5.

### Strana 4/4 — Completion
- **Obsah (verbatim):** „Už musíš mít úplně plnou hlavu nových informací. Pro dnešek toho necháme. Chceme tě ocenit za Tvoji práci."
- **Reuse:** `DayCompletionPage`.

---

## Deň 4: Pauza 🔁

- **Obsah (verbatim):** „Dnes program vynecháme. Máš za sebou skvělý pokrok a
  zasloužíš si chvilku odpočinku."
- **Reuse:** `DayPauseScreen`, záznam `(6, 4)`.
- **Pozn.:** Tento text je **doslova rovnaký ako pauza týždňa 3**
  (`_pauseCopy[3]`). Nie je to chyba — autorka ho zopakovala. Zapíšem ho
  explicitne pod `(6, 4)`, aby fallback na týždeň 2 nikdy nezasiahol.

---

## Deň 5: Sebeúcta

### Strana 1/4 — Co je sebeúcta (education · chat)
- **Obsah (verbatim, 2 odrážky):**
  - „Dnes se budeme věnovat budování sebeúcty. Sebeúcta je pocit, že si vážíš sám/sama sebe, svých potřeb, pocitů a práv. Pomáhá nám lépe se rozhodovat, nastavovat zdravé hranice a být odolný/á vůči kritice nebo tlakům z okolí. Silná sebeúcta podporuje zdravé vztahy, snižuje impulzivní reakce a zvyšuje schopnost jednat uvědoměle a sebevědomě v různých životních situacích."
  - „Dovednost “neZOUFej” ti pomáhá chránit a posilovat sebeúctu při komunikaci s ostatními. Umožňuje vyjádřit své potřeby a názory jasně a asertivně, aniž bys ubližoval/a druhým nebo snižoval/a sám/sama sebe. Používáním “neZOUFej” se učíš zachovat respekt k sobě i k druhým a udržet rovnováhu mezi tím, co chceš a co je pro tebe důležité."
- **Reuse vs nové:** `ChatDayPage`. Nič nové.

### Strana 2/4 — neZOUFej (skill · akronym, 4 písmená)
- **Obsah (verbatim, 4 písmená — po rozdelení zlomeného formátovania):**
  - „**Z – Zásadovost**" / „drž se svých hodnot a principů, i když je tlak okolí, aby ses přizpůsobil/a"
  - „**O – bez zbytečných Omluv**" / „neomlouvej se za to, že chráníš své hranice nebo respektuješ své potřeby"
  - „**U – Upřímnost**" / „mluv pravdu a buď upřímný/á o svých pocitech a potřebách" *(zdroj píše „Upřímnosts" — OQ-2)*
  - „**F – Férovost**" / „buď spravedlivý/á k sobě i druhým, nesnaž se druhé manipulovat ani je obviňovat"
- **Funkčné:** `AcronymSkillPage` + `RescueSaveButton` (`id: 'week6_nezoufej'`).
- **UX / vizuál:** Písmeno **O** má v zdroji názov „bez zbytečných Omluv" —
  dlhší než ostatné; `NumberedBenefit` to zalomí, netreba skracovať.
- **Otvorené otázky:** **OQ-2** (v zdroji je „O" nalepené na koniec „Z" a „U"
  má prebytočné „s" — jediné dve miesta, kde som text rozdelil/upravil).

### Strana 3/4 — Worksheet „neZOUFej – chráním své hranice" (worksheet, 6 polí)
- **Obsah (verbatim — zadanie, nadpis, 6 polí):**
  - Zadanie: „Teď si vyzkoušíš dovednost “neZOUFej” na konkrétní situaci, kdy někdo tlačí na tvoje hranice nebo tě kritizuje. Cílem je procvičit, jak zůstat spravedlivý/á, chránit svou sebeúctu, držet se svých hodnot a mluvit pravdu. Doplň si jednotlivé kroky podle vlastních pocitů a potřeb, aby odpovídaly tvé zkušenosti."
  - Nadpis: „worksheet “neZOUFej” – chráním své hranice"
  1. „situace" — „popiš situaci, kdy někdo tlačí na tvoje hranice nebo tě kritizuje"
  2. „Z – zásadovost" — „jaké své hodnoty nebo principy chceš při této situaci dodržet?"
  3. „O – bez zbytečných Omluv" — „jak můžeš jasně chránit své potřeby a hranice, aniž by ses omlouval/a?"
  4. „U – Upřímnost" — „jak můžeš upřímně a klidně vyjádřit své pocity a potřeby?"
  5. „F – Férovost" — „jak můžeš jednat spravedlivě k sobě i druhým, aniž bys je manipuloval/a nebo obviňoval/a?"
  6. „reflexe" — „co ti při používání “neZOUFej” přišlo snadné a co naopak těžké?" + „jak se cítil/a, když jsi si ujasnil/a hranice a reagoval/a podle “neZOUFej”?"
- **Funkčné:** `StructuredWorksheet(worksheetId: 'week6_day5_nezoufej')`, 6 polí.
  Reflexia má **dve otázky** — zdroj ich dáva pod jeden nadpis „reflexe" s jedným
  poľom, takže jedno pole a obe otázky ako `hint`. Nič povinné.
- **UX / vizuál:** Nadpis zdroja začína malým „worksheet" — v appke sa to slovo
  v hlavičkách nepoužíva; titulok bude **„neZOUFej – chráním své hranice"**.
- **Reuse vs nové:** Nič nové.

### Strana 4/4 — Completion
- **Obsah (verbatim):** „Dneska máš za sebou velký kus práce, tak nezoufej a dopřej si odpočinek. Zasloužíš si to."
- **Reuse:** `DayCompletionPage`. (Pekná pointa — „nezoufej" nadväzuje na akronym.)

---

## Deň 6: Pauza 🔁

- **Obsah (verbatim):** „Dnes si dopřej volno. Máš za sebou spoustu práce a je
  vidět, kolik do toho dáváš. Zasloužíš si vypnout, nabrat dech a nechat
  všechno, co se Ti povedlo, trochu doznít."
- **Reuse:** `DayPauseScreen`, záznam `(6, 6)`.

---

## Deň 7: Shrnutí

### Strana 1/3 — Uzavíráme šestý týden (chat recap)
- **Obsah (verbatim):** „Máme za sebou šestý týden, který byl zaměřený na
  mezilidské vztahy. Vztahy s ostatními i sami se sebou bývají velkým zdrojem
  emocí. Chceme tě moc ocenit za to, s jakým nasazením do tohoto důležitého
  tématu nahlížíš!"
- **Funkčné:** Rekapitulácia dní ako v týždňoch 2–5. **Zdroj ju nemá** —
  položky sú náš text → OQ-6.
- **Reuse vs nové:** `ChatDayPage` + `ChatFeatureList`.

### Strana 2/3 — Reflexe týdne (3 otázky)
- **Obsah (verbatim):**
  1. „Zkus se zamyslet, co přineslo nejvíc zajímavých momentů? Co nového se ti daří si odnášet?"
  2. „Máš už zkušenost s využitím nových kroků ve svém životě? Co konkrétně a v jaké situaci to bylo?"
  3. „Kdy přesně se nabízí příležitost tuto dovednost zapojit v dalším týdnu?"
- **Pozn.:** Tri otázky sú **slovo od slova rovnaké ako v týždni 4**. Zdroj ich
  zopakoval; nie je to chyba, len sa neprekvapiť.
- **Funkčné:** `ReflectionQuestionList` + `ReflectionAutosave`, týždeň 6.
- **Reuse vs nové:** Nič nové.

### Strana 3/3 — Týden dokončen
- **Funkčné:** `WeekCompletionPage` + `markWeekCompleted(6)`.
  Teaser na týždeň 7 neexistuje (obsah nedodaný) — musí sa správať ako posledný
  implementovaný týždeň. Viď OQ-7.

---

## Súhrnné UX rozhodnutia pre týždeň

1. **Edukácia = chat, cvičenie = formulár**, per-strana. D1 1/4, D2 1/4,
   D3 2/4, D5 1/4, D7 1/3 sú chat; D1 2–3, D2 3/4, D5 3/4, D7 2/3 sú formuláre;
   D2 2/4, D3 1/4, D5 2/4 sú akronymové strany.
2. **Nič nie je povinné.** Ani jeden z 38 textových polí týždňa neblokuje tlačidlo.
3. **Všetky tri akronymy idú do záchranného balíčka.** PSANÍČKo a neZOUFej sú
   presne to, čo si človek chce prečítať pred ťažkým rozhovorom.
4. **Mýty sa nikdy nezobrazujú ako tvrdenia appky** — vždy `WorksheetSectionStyle.myth`.
5. **Výber techniky je na Dni 3 menu, nie losovanie** — lebo to tak žiada zdroj
   („vyber to, které ti nejvíc vyhovuje"), na rozdiel od týždňa 5.

---

## Chýbajúci obsah pre autorku (→ task `W6-01`)

| # | Čo chýba / je sporné | Odporúčanie |
|---|----------------------|-------------|
| OQ-1 | **24 mýtov bez protipríkladov.** V týždni 3 autorka ku každému mýtu napísala „zborenú" verziu, ktorú si používateľ môže odkryť, keď ho nič nenapadá. Tu píše len „(nechat prostor na vepsání pravdivé formulace)". Bez pomôcky ostane väčšina z 24 polí prázdna. | Dopísať protipríklady aspoň k prvým 4 v každej skupine (tie sa zobrazia ako prvé). |
| OQ-2 | **Zlomené formátovanie a preklepy v zdroji.** (a) Deň 5: písmeno „**O – bez zbytečných Omluv**" je nalepené na koniec inštrukcie písmena Z bez zalomenia — rozdelil som podľa zjavného úmyslu. (b) Deň 5: „U – **Upřímnosts**" → prebytočné „s", odstránil som. (c) Deň 3, písmeno Va: „**uznejříkáuznej** pocity a názory druhé osoby" → editačný artefakt, nechal som „uznej". (d) Deň 3: prázdna odrážka medzi „Vý" a „Z". (e) Deň 1: „**časo** mohou komplikovat". | Toto sú **jediné miesta, kde som zasiahol do textu** — potvrdiť. Ostatné preklepy (napr. „se tyto dovednosti zaměřuje") som nechal verbatim. |
| OQ-3 | **Tri razy „(infografika)"** (PSANÍČKo, Je VýZVa, neZOUFej) — grafiku nemáme. | Akronymová strana ju nahrádza (písmeno + slovo + inštrukcia). Ak chce naozaj obrázok, treba ho dodať. |
| OQ-4 | **Deň 3 nemá název.** Ostatné dni ho majú. | Náš návrh: „Je VýZVa a všímavost ve vztazích". |
| OQ-5 | Deň 3 žiada **výber** techniky („vyber to, které ti nejvíc vyhovuje"), týždeň 5 žiadal **losovanie** („kolo štěstí"). | Ponechať rozdiel — na Dni 3 je primárne menu, losovanie sekundárne. Potvrdiť, že je to zámer. |
| OQ-6 | D7 rekapitulácia — zdroj ju nemá, je to náš text (rovnako ako v týždňoch 3–5). | Napíšem návrh, autorka schváli (`// TODO: schválit autorem`). |
| OQ-7 | Čo po dokončení týždňa 6 — obsah týždňa 7 („Shrnutí programu") ešte nie je. | Zobraziť „ďalší týždeň sa pripravuje", nie prázdny uzol. |
| OQ-8 | Deň 4 má **doslova rovnaký text pauzy ako týždeň 3**. | Ak je to zámer, OK; ak nie, nová veta. |
| OQ-9 | Otázky reflexie na Dni 7 sú **slovo od slova rovnaké ako v týždni 4**. | Pravdepodobne zámer (rovnaká štruktúra každý týždeň), ale potvrdiť. |

**Nič z toho neblokuje kód.** Všetko sa dá implementovať teraz a po odpovedi
zmeniť na jednom mieste v `dayN_content.dart`.

---

## Čo sa dá kódovať hneď

| Deň | Blokované? |
|-----|-----------|
| 1 | ✅ nie (OQ-1 len zhorší vyplnenosť, nie funkčnosť) |
| 2 | ✅ nie |
| 3 | ✅ nie (OQ-2 zásah zapísaný, OQ-4 názov náš) |
| 4 | ✅ nie |
| 5 | ✅ nie (OQ-2 zásah zapísaný) |
| 6 | ✅ nie |
| 7 | ✅ nie (OQ-6 s TODO, OQ-7 je zmena `kImplementedBpdWeeks`) |
