# Week 3 — Emoční regulace — Screen Plan

> Zdroj obsahu (verbatim): docs/hpo/source/tyzden-3.md
> Prehľad: docs/hpo/content-reference.md (Week 3)
> Vytvorené: 2026-08-06
> Stav: **plán hotový, kód nezačatý — ale už nič neblokuje.** OQ-1 rozhodnuté
> (edukácia = chat), OQ-4 až OQ-6, OQ-8, OQ-9 a OQ-10 rozhodnuté 2026-08-06
> (viď „Rozhodnuté" nižšie). Kódovateľné hneď: Dni 1, 2, 3, 6, 7. Dni 4 a 5
> čakajú na obsah od autorky (OQ-2, OQ-3 → task W3-01).
> Aplikované OPEN lekcie z LESSONS.md: pole **Typ obrazovky**, plán pokrýva celý
> týždeň, sekcia **Zdieľané komponenty týždňa**.

---

## Čo je v tomto týždni iné

1. **Poradie dní sa mení.** Pauza je **Deň 6** (nie 5 ako v týždňoch 1–2) a Deň 5
   je krátky SPOKO recall. `_weekDaysContent[3]` to musí odraziť; `pause`
   routeType je parametrizovaný číslom dňa, takže to funguje bez zmien.
2. **Deň 1 je najväčší edukačný deň programu** — slovníček 10 emócií + 6 prekážok
   regulácie + 22 mýtov + cvičenie na ich borenie. Na jednu stranu sa to nezmestí
   ani zďaleka; návrh je 6 strán a slovníček **vytiahnutý ako trvalá referencia**.
3. **Dva worksheety** (Deň 2 model popisu emócií, Deň 3 ověřování faktů) — sú to
   najkomplexnejšie vstupné formuláre programu (6 a 7 polí, s príkladmi na tap).
   Vzor existuje: SMART worksheet z týždňa 1.
4. **Dni 4 a 5 sú obsahovo tenké.** Deň 4 nemá v zdroji žiadne cvičenie, Deň 5 má
   jednu vetu. Viď OQ-2 a OQ-3 — treba rozhodnutie autora.

---

## Hlavný návrh — „Slovník emocí" ako trvalá referencia

Zdroj to hovorí dvakrát explicitne:

> „(zpracovat jako takový „slovníček" emocí, ke kterému se může uživatel jednoduše vrátit)"
> „Tento seznam může být užitečný i jako takový „slovník emocí", který si můžeš kdykoliv projít, když třeba nevíš, jak se zrovna cítíš."

To nie je strana v dni — to je **funkcia appky**. Navrhujeme presne ten istý vzor,
aký sa použil pre záchranný balíček v týždni 2:

- nová obrazovka **„Slovník emocí"** v *Moje záznamy → DBT program* (štvrtá dlaždica),
- 10 emócií, každá s funkciou zo zdroja, tapnutie rozbalí detail,
- Deň 1 na ňu odkazuje a používateľ sa k nej vracia kedykoľvek neskôr,
- obsah je **statický** (žiadne DAO netreba) — je to referencia, nie záznam.

Bonus: appka už má modul nálad; slovník emócií je jeho prirodzený doplnok
(„neviem, ako sa cítim" → slovník → záznam nálady).

---

## Zdieľané komponenty týždňa

| Komponenta | Použitie | Reuse? |
|-----------|----------|--------|
| `EmotionDictionary` (obrazovka + dáta 10 emócií) | Deň 1, trvalá referencia v Moje záznamy | **nová** |
| `MythBusterCard` (mýtus + pole na vlastnú vetu + príklad na tap) | Deň 1 strana 6/6 | **nová** |
| `StructuredWorksheet` (N polí s labelom, príkladom na tap, perzistenciou) | Deň 2 (6 polí), Deň 3 (7 polí) | **nová**, vzor: `smart_worksheet_page.dart` |
| `SentenceStemFields` (veta s medzerami + príklad na tap) | Deň 2 strana 5/6 | **nová** |
| `ReflectionQuestionList`, `ReflectionField` | Deň 7 | ✅ hotové |
| `DayCompletionPage`, `WeekCompletionPage`, `DayFlowHeader`, `DayPageBase`, `InfoBox`, `FeatureCard`, `SectionHeader`, `ExternalLinkButton` | všade | ✅ hotové |
| `DayPauseScreen` | Deň 6 | ✅ hotové |
| `SkillPracticePage` | — | nepoužije sa (týždeň 3 nemá „vyber ≥2" zoznamy) |

---

## Prehľad

| Deň | Názov | # strán | Typ obrazovky | Reuse | Nové interakcie |
|-----|-------|---------|---------------|-------|-----------------|
| 1 | Edukace o emocích | 6 | chat (1–2) + referencia (3) + edukácia (4–5) + cvičenie (6) | ExternalLinkButton | slovník emócií, borenie mýtov |
| 2 | Validace a popis emocí | 6 | chat (1) + worksheet (2–3) + edukácia (4) + cvičenie (5) + completion | — | 6-poľový worksheet s príkladom, vetné rámce |
| 3 | Ověřování faktů | 4 | chat (1) + edukácia (2) + worksheet (3) + completion | — | 7-poľový worksheet |
| 4 | Opačná akce | 4 | chat (1) + edukácia (2–3) + completion | — | žiadne (viď OQ-2) |
| 5 | Když to, co děláte, nefunguje | 2 | recall + completion | SPOKO recall z T1 D7 | deep-link na SPOKO |
| 6 | Pauza | — | 🔁 DayPauseScreen | ✅ celé | — |
| 7 | Shrnutí | 3 | chat (1) + reflexia (2) + week completion | ✅ celé | 3 otázky, perzistencia |

Celkom **25 strán** + 1 trvalá referenčná obrazovka. Deň 6 celý na reuse.

---

## Deň 1: Edukace o emocích

### Strana 1/6 — Co je emoční regulace (education · chat)
- **Cieľ:** Uviesť tému týždňa a definovať emočnú reguláciu; prepojiť na všímavost.
- **Obsah (verbatim):**
  - „Tématem třetího týdne je emoční regulace. Emoční regulace znamená rozpoznat a pojmenovat, co cítím, porozumět tomu a vědomě si zvolit, jak na emoci zareaguju. Nejde o potlačování, ale o to, aby emoce pomáhaly, místo aby mě ovládaly."
  - „Emoční regulaci nám pomáhá zvládat i všímavost (z minulého týdne) – díky ní si všímáme svých pocitů včas a dokážeme na ně reagovat s větším klidem a nadhledem."
- **Funkčné:** Len čítanie.
- **UX / vizuál:** Chat: bublina s definíciou + `ChatInfoCard` „Nejde o potlačování" + bublina o previazaní s minulým týždňom. Odkaz na týždeň 2 je dôležitý — má budovať pocit, že sa dovednosti vrstvia.
- **Používateľ / emočné:** „Nejde o potlačování" musí byť vidno hneď — mnoho ľudí čaká, že terapia znamená „nesmieš cítiť". Preto zvýraznená karta, nie riadok v odstavci.
- **Reuse vs nové:** `ChatDayPage`, `ChatBotBubble`, `ChatInfoCard`.
- **Otvorené otázky:** —

### Strana 2/6 — Emoce nejsou fakta (education · chat)
- **Cieľ:** Oddeliť „cítim to" od „je to tak" a stanoviť cieľ týždňa.
- **Obsah (verbatim):**
  - „Emoce nejsou fakta – i když se někdy zdají velmi silné a přesvědčivé. To, že něco cítíme, ještě neznamená, že je to skutečnost. Emoce jsou spíše jako signály nebo ukazatele, které nám říkají, co je pro nás důležité. Pomáhají nám zorientovat se, ale není nutné se jimi vždy řídit doslova."
  - „Naším cílem tedy není zbavit se emocí, ale zmírnit trápení s pocity související."
- **Funkčné:** Len čítanie.
- **UX / vizuál:** Chat, dve bubliny; druhá veta ako `ChatInfoCard` s ikonou cieľa — je to tézis celého týždňa.
- **Používateľ / emočné:** Najcitlivejšie miesto strany je „emoce nejsou fakta" — u človeka s intenzívnymi emóciami to môže znieť ako „tvoje pocity sa nepočítajú". Zdroj to hneď vyvažuje („signály… co je pro nás důležité") a to vyváženie **musí byť na tej istej obrazovke**, nikdy nie odklikané zvlášť.
- **Reuse vs nové:** ako 1/6.
- **Otvorené otázky:** —

### Strana 3/6 — Slovník emocí (reference · nová obrazovka)
- **Cieľ:** Predstaviť funkcie 10 emócií a odovzdať používateľovi trvalú referenciu.
- **Obsah (verbatim):** „Protože emoce mají své funkce…" + všetkých 10:
  - **Vztek** – „chrání naše hranice a pomáhá bránit se nespravedlnosti."
  - **Strach** – „varuje před nebezpečím a připravuje tělo na obranu nebo útěk."
  - **Radost** – „motivuje nás opakovat příjemné chování a posiluje vztahy."
  - **Smutek** – „signalizuje ztrátu, podporuje zpomalení a hledání podpory."
  - **Znechucení** – „upozorňuje nás na věci, které by nám mohly uškodit nebo nám nejsou příjemné; chrání nás před nebezpečím nebo nepříjemnými situacemi."
  - **Stud** – „pomáhá udržovat sociální vazby a přizpůsobovat se pravidlům skupiny."
  - **Vina** – „signalizuje, že jsme porušili vlastní hodnoty nebo normy; motivuje nás napravit chybu nebo se omluvit."
  - **Překvapení** – „reaguje na neočekávané události; pomáhá nám rychle přesměrovat pozornost a přizpůsobit se nové situaci."
  - **Žárlivost** – „upozorňuje na ohrožení vztahu nebo důležitých sociálních vazeb; pomáhá nám chránit to, co je pro nás cenné."
  - **Závist** – „ukazuje, co si přejeme nebo co nám chybí; může nás motivovat k osobnímu růstu, pokud ji dokážeme zpracovat konstruktivně."
  - „Tento seznam může být užitečný i jako takový „slovník emocí", který si můžeš kdykoliv projít, když třeba nevíš, jak se zrovna cítíš."
  - „Chci vědět víc: https://psychologie.cz/emoce-chteji-ven/"
- **Funkčné:** 10 rozbaliteľných dlaždíc (tap = funkcia emócie). Tlačidlo **„Otevřít slovník emocí"** → nová trvalá obrazovka (rovnaký obsah, dostupná z *Moje záznamy → DBT program*). Externý odkaz cez `launchUrLink`. Žiadna perzistencia — je to referencia.
- **UX / vizuál:** Autorská infografika `ZÁKLADNÍ EMOCE` navrchu (602×425, už v Nepanikař palete) ako obrázok, pod ňou zoznam 10 emócií. Každá dlaždica: emócia bold + krátka funkcia; farebné odlíšenie nepoužívať ako nosič významu (emócie nemajú „dobré/zlé" farby — všetky rovnaký vizuál, to je zámer).
- **Používateľ / emočné:** Kľúčová správa dňa: **každá emócia má funkciu, žiadna nie je chyba.** Preto rovnaký vizuál pre všetky vrátane závisti a žiarlivosti, ktoré ľudia vnímajú ako „hanebné". Trvalá dostupnosť slovníka je opora pre chvíle, keď človek nevie pomenovať, čo cíti.
- **Reuse vs nové:** **Nová** obrazovka `EmotionDictionaryScreen` + dáta; vzor pre umiestnenie: `RescuePackageScreen` v *DBT program*. Infografiku treba prekopírovať do `assets/bpd/` a zaregistrovať (build_runner).
- **Otvorené otázky:** **OQ-4** — infografika zobrazuje 6 emócií, text vymenúva 10 (chýba Vina, Překvapení, Žárlivost, Závist). Doplniť infografiku, alebo ju použiť len ako ilustráciu k prvým šiestim?

### Strana 4/6 — Proč je regulace těžká (education · štandard)
- **Cieľ:** Vysvetliť 6 dôvodov, prečo regulácia nejde sama — a normalizovať to.
- **Obsah (verbatim):** „Regulace emocí může být těžká z více důvodů:" + 6 položiek:
  **Biologie** („někteří lidé mají vrozeně citlivější emoční systém, a proto reagují rychleji a intenzivněji"), **Nedostatek dovedností** („často jsme se nikde nenaučili, jak s emocemi pracovat, takže nevíme, co dělat"), **Posilování emočního chování** („okolí může nevědomky podporovat naše silné emoční reakce"), **Náladovost** („naše momentální nálada někdy řídí, co děláme, místo aby rozhodoval rozum"), **Přehlcení emocemi** („když jsou emoce příliš silné, je snadné ztratit přehled a zapomenout na naučené dovednosti"), **Mýty o emocích** („pokud věříme, že emoce jsou špatné, slabé, nebo naopak že je musíme prožívat naplno, může nám to bránit v jejich regulaci"). Záver: „Dobrá zpráva je, že právě dovednosti, které se v programu naučíš, pomáhají tyto překážky překonat."
- **Funkčné:** Len čítanie.
- **UX / vizuál:** `SectionHeader` + 6 × `NumberedBenefit` (číslované, lebo je to uzavretý výčet) + záverečná veta v `InfoBox` s pozitívnou ikonou.
- **Používateľ / emočné:** Toto je **destigmatizačná strana** — „nie si rozbitý, máš citlivejší systém a nikto ťa to neučil". Záverečná dobrá správa nesmie chýbať ani byť odklikaná zvlášť; patrí na tú istú obrazovku ako zoznam prekážok.
- **Reuse vs nové:** `DayPageBase`, `SectionHeader`, `NumberedBenefit`, `InfoBox`.
- **Otvorené otázky:** —

### Strana 5/6 — Mýty o emocích (education · štandard)
- **Cieľ:** Ukázať 22 mýtov ako zoznam na prečítanie, pred cvičením na ich borenie.
- **Obsah (verbatim):** „Chci vědět víc - mýty o emocích:" + všetkých 22 mýtov zo zdroja (od „Existuje správný způsob, jak se cítit v každé situaci." po „Emoce by se měly vždy brát jako pravdivé.").
- **Funkčné:** Len čítanie; scroll. Prechod na cvičenie.
- **UX / vizuál:** Zoznam 22 krátkych viet — vizuálne ako citácie v úvodzovkách, **vizuálne odlíšené ako „to, čo si ľudia myslia"**, nie ako fakty (napr. tlmená karta, ikona bubliny). Kritické: čitateľ nesmie ani na sekundu nabyť dojem, že appka tie tvrdenia podporuje. Nadpis strany preto „Mýty o emocích" veľkým, hneď nad zoznamom.
- **Používateľ / emočné:** 22 negatívnych tvrdení za sebou je emočne náročné. Preto: (a) jasné rámovanie „mýty", (b) na konci strany veta, ktorá vedie k borenie („Pojďme si zkusit tyto mýty zbořit…"), aby strana nekončila na negatívnej nôte.
- **Reuse vs nové:** `DayPageBase`; nový tlmený `MythTile` (zobrazovací).
- **Otvorené otázky:** **OQ-5** — 22 mýtov na jednej strane je veľmi dlhý scroll. Rozdeliť na 2 strany po 11, alebo nechať jednu dlhú?

### Strana 6/6 — Boření mýtů (exercise · štandard)
- **Cieľ:** Nechať používateľa preformulovať mýty vlastnými slovami.
- **Obsah (verbatim):** „Pojďme si zkusit tyti mýty zbořit…(Nechat klienty přeformulovat mýty - vždy se promítne mýtus a bude prostor pro vepsání jejich věty co ten mýtus boří)" · „(Kliknutím se zobrazí příklad zbořeného mýtu..):" + všetkých 22 autorských „zborených" verzií zo zdroja.
- **Funkčné:** Jeden mýtus naraz (karta), pod ním textové pole na vlastnú vetu, tlačidlo „Zobrazit příklad" odkryje autorskú verziu. Navigácia medzi mýtmi (napr. `‹ 3/22 ›`), **žiadny mýtus nie je povinný**. Vpísané vety sa ukládají (nový DAO alebo `BpdReflectionDao` s vlastným kľúčom) — používateľ ich má mať k dispozícii aj neskôr.
- **UX / vizuál:** Karta s mýtom (tlmená, ako na strane 5) → pole „Jak bych to řekl/a jinak?" → outline tlačidlo „Zobrazit příklad", ktoré po tape rozbalí autorskú vetu v zelenom/success tinte. Vizuálne ide o **preklápanie** mýtu na vyvrátenie — tá metafora má byť viditeľná (mýtus zhora tlmene, vyvrátenie zdola zvýraznene).
- **Používateľ / emočné:** Toto je jediné aktívne cvičenie dňa a je kognitívne náročné. Preto **jeden mýtus naraz** (nie 22 polí pod sebou), explicitná dobrovoľnosť, a príklad vždy po ruke — bez neho je prázdne pole u 22 tvrdení paralyzujúce.
- **Reuse vs nové:** Nový `MythBusterCard`; vzor príkladu-na-tap zo `smart_worksheet_page.dart`.
- **Otvorené otázky:** **OQ-6** — má používateľ prejsť všetkých 22, alebo mu appka nabídne napr. 5 (náhodne / na výber) a zvyšok nechá dobrovoľne? 22 vstupov v jednom dni je nad rámec „5–20 minút denne", ktoré program sľubuje v týždni 1.

> **Pozn.:** Deň 1 nemá v zdroji completion vetu. Navrhujeme `DayCompletionPage`
> so zhrnutím + teaser na Deň 2 (konzistencia s ostatnými dňami) — text bude
> potrebovať autorské doplnenie.

---

## Deň 2: Validace a popis emocí

### Strana 1/6 — Proč pojmenovávat emoce (education · chat)
- **Obsah (verbatim):** „Včera jsme se seznámili s jednotlivými emocemi. Ne vždy je ale jednoduché poznat, o jakou emoci (nebo více emocí) jedná." · „Naučit se pojmenovat emoce pomáhá snižovat jejich intenzitu. Bez pojmenování nemůžeme emoci nijak regulovat" · „Emoce mají svoji strukturu, není to jeden neoddělitelný shluk, ale spíš řetězec událostí" · „V tomto řetězci existují body, na které když se zaměříme, dokážeme dosáhnout nějaké změny k lepšímu." · „Základem emoční regulace je tedy **popisování emocí**"
- **Funkčné:** Len čítanie; odkaz na slovník emócií z Dňa 1 (tlačidlo „Nevím, co cítím → slovník").
- **UX / vizuál:** Chat. Veta o **řetězci** je nosná myšlienka celej strany — vizualizovať ako reťaz/kroky (`ChatNumberedList` s 6 krokmi modelu ako teaser, detail až na strane 2).
- **Používateľ / emočné:** „Bez pojmenování nemůžeme emoci nijak regulovat" je silné tvrdenie — hneď ho vyvážiť dostupnosťou slovníka, aby to nebolo „musíš vedieť, čo cítiš, inak nič".
- **Reuse vs nové:** `ChatDayPage`, `ChatNumberedList`; deep-link na slovník.
- **Otvorené otázky:** —

### Strana 2/6 — Model pro popis emocí (education · štandard)
- **Obsah (verbatim):** „K tomu nám může pomoci model popisu emocí…je to vlastně popsání našich emocí jako ve zpomaleném filmu. To pomáhá porozumět tomu, jak emoce fungují, z jakých částí se skládají a jak je lze měnit. Když rozumíme tomu, co v nás situaci vyvolalo, lépe se ná s ní pracuje…" + **6 krokov** modelu verbatim (Spouštěcí událost / Interpretace / Biologické změny a prožívání / Výrazy a činy / Pojmenování emoce / Následky) vrátane pomocných otázok v každom.
- **Funkčné:** Len čítanie; 6 krokov môže byť rozbaliteľných (tap = pomocná otázka).
- **UX / vizuál:** 6 krokov ako **vertikálna časová os** (číslo v kruhu + spojnica) — metafora „zpomaleného filmu" zo zdroja. `SectionHeader` + `NumberedBenefit` varianta so spojnicou.
- **Používateľ / emočné:** Metafora spomaleného filmu je terapeuticky presná a laicky pochopiteľná — nechať ju verbatim a podporiť vizuálom.
- **Reuse vs nové:** `DayPageBase`, `SectionHeader`; nový timeline variant `NumberedBenefit`.
- **Otvorené otázky:** —

### Strana 3/6 — Worksheet: moje situace (worksheet · štandard)
- **Obsah (verbatim):** „Nyní si pojďme rozebrat nějakou nedávnou situaci, která vyvolala silné emoce (prostor pro vyplnění jednotlivých kroků)" · „(Po kliknutí se zobrazí příklad):" + celý autorský príklad zo zdroja (zlá známka z testu — všetkých 6 krokov).
- **Funkčné:** 6 multiline polí (labely = kroky modelu), pri každom tlačidlo „Příklad" → rozbalí autorskú verziu daného kroku. Ukládá sa (nový `BpdEmotionDescriptionDao` alebo `BpdReflectionDao` s kľúčom `week3_day2`); pri návrate predvyplnené. Prázdne polia povolené.
- **UX / vizuál:** Ako SMART worksheet z týždňa 1: label kroku bold + malý badge s číslom, pod ním pole, vedľa „Příklad" chip. Dlhý scroll (6 polí) — v poriadku.
- **Používateľ / emočné:** Používateľ tu píše o **reálnej vlastnej ťaživej situácii**. Preto: príklady pri každom kroku (znižujú úzkosť z prázdneho poľa), žiadna povinnosť, žiadne hodnotenie odpovede, a nikde nie výzva „vyber najhoršiu situáciu" — zdroj hovorí „nějakou nedávnou".
- **Reuse vs nové:** Nový `StructuredWorksheet` (zdieľaný s Dňom 3); vzor `smart_worksheet_page.dart`.
- **Otvorené otázky:** Ukladať priebežne (onChange) alebo pri „Pokračovat"? Návrh: pri „Pokračovat", ako T1.

### Strana 4/6 — Validace emocí (education · štandard)
- **Obsah (verbatim):** „**Validace emocí** - Validace neznamená souhlasit se svým chováním (např. s tím, že jsem na někoho křičel), ale znamená **uznat pravdu o svém vnitřním prožitku**. Je to potvrzení, že moje emoce má v tuhle chvíli svou logiku a že mám právo ji cítit." · „K čemu mi validace emocí je?" + 4 body verbatim (snižuje intenzitu / vnitřní svět dává smysl / zastavuje sekundární emoce (s definíciou a príkladmi) / umožňuje změnu).
- **Funkčné:** Len čítanie.
- **UX / vizuál:** Definícia validácie v `InfoBox` (je to najčastejšie nechápaný pojem — „validovať ≠ schvaľovať"); 4 prínosy ako `FeatureCard`. Pojem **sekundárne emócie** zaslúži vlastnú kartu s príkladmi zo zdroja („Jsem naštvaná, že jsem byla celý den smutná").
- **Používateľ / emočné:** Rozlíšenie „neschvaľujem chovanie, uznávam prežitie" je pre človeka so studom a vinou zásadné — musí byť vizuálne dominantné, nie schované v odstavci.
- **Reuse vs nové:** `DayPageBase`, `InfoBox`, `FeatureCard`.
- **Otvorené otázky:** —

### Strana 5/6 — Zkusme validaci (exercise · štandard)
- **Obsah (verbatim):** „Pojďme si teď zkusit tuto dovednost (prostor pro doplnění vlastních textů do vět):" + 5 vetných rámcov („To, že cítím …… je oprávněné, protože…." / „Teď prožívám ….. a je to v pořádku." / „Dává smysl že se cítím ….., když ….." / „Je přirozené ……, protože ….." / „Vzhledem k tomu, že……, je pochopitelné, že se cítím ….") + „(Zobrazit příklady po kliknutí):" + 5 autorských príkladov verbatim.
- **Funkčné:** 5 rámcov, každý s jedným alebo dvoma vstupmi v mieste medzier; „Zobrazit příklad" na každom. Ukládá sa spolu s worksheetom. Dobrovoľné.
- **UX / vizuál:** Veta ako **text s vloženými poľami** (inline), nie label + prázdny box — vizuálne to má vyzerať ako dopĺňanie vety, lebo tak funguje aj terapeuticky (človek si tú vetu prečíta celú a uveria jej).
- **Používateľ / emočné:** Najláskavejšie cvičenie týždňa — používateľ doslova napíše „a je to v pořádku". Preto pokojný, nie „úlohový" vizuál; príklady zo zdroja sú konkrétne a citlivé (odmietnutie, osamelosť), nechať verbatim.
- **Reuse vs nové:** Nový `SentenceStemFields`.
- **Otvorené otázky:** Technicky: rámce majú 1–2 medzery. Riešiť jedným poľom na celý zvyšok vety, alebo dvoma poľami? Návrh: presne podľa počtu medzier v zdroji.

### Strana 6/6 — Completion (completion · štandard)
- **Obsah (verbatim):** „Pro dnešní den toho bylo až až, oceňujeme tvoji snahu a odhodlání."
- **Reuse:** `DayCompletionPage` + teaser „Ověřování faktů".

---

## Deň 3: Změna odezvy na emoce — ověřování faktů

### Strana 1/4 — Myšlenky mezi událostí a emocí (education · chat)
- **Obsah (verbatim):** „Intenzivní negativní emoce můžou být velkou přítěží do života." · „Včera jsme se bavili o tom, že mnoho emocí a reakcí nevzniká přímo kvůli událostem, ale kvůli našim myšlenkám a interpretacím těchto událostí. Tedy co si o dané situaci myslíme." · „Událost tedy ovlivňuje myšlenky a až ty ovlivňují naše emoce." · „Naopak naše emoce mohou ovlivnit i naše myšlenky o události." · „Pokud ověříme fakta a své myšlenky, můžeme změnit i to, co cítíme."
- **Funkčné:** Len čítanie.
- **UX / vizuál:** Chat + jedna **schéma karta**: `událost → myšlenky → emoce` s obojsmernou spätnou strelkou medzi emóciami a myšlienkami. Toto je jediný diagram, ktorý strana potrebuje, a nesie celý koncept.
- **Používateľ / emočné:** Nádej: „môžeš zmeniť to, čo cítiš" — ale bez sľubu, že to je jednoduché.
- **Reuse vs nové:** `ChatDayPage`; nová malá schéma karta (alebo statický SVG).
- **Otvorené otázky:** —

### Strana 2/4 — Jak ověřovat fakta (education · štandard)
- **Obsah (verbatim):** „Jak ověřovat fakta a měnit odezvu na emoce?" + **6 krokov** verbatim vrátane podotázok (1. Urči emoci… 2. Popiš událost… 3. Zamysli se nad svými myšlenkami… 4. Zjisti, zda předpokládáš hrozbu… 5. Představ si nejhorší scénář… 6. Zhodnoť, jestli tvoje emoce odpovídají faktům…).
- **Funkčné:** Len čítanie; kroky môžu byť rozbaliteľné.
- **UX / vizuál:** 6 číslovaných krokov s podbodmi ako odrážky. Krok 5 („představ si, že bys dokázal/a situaci zvládnout") vizuálne zvýrazniť — je to bezpečnostný prvok, nie voliteľná poznámka.
- **Používateľ / emočné:** Krok 5 vedie človeka k predstave katastrofy. Zdroj ju hneď uzatvára zvládnutím — **tie dve časti sa nesmú vizuálne rozdeliť** ani rozhodiť na dve strany. Ak by sa strana delila, delí sa medzi krokom 4 a 5, nikdy vnútri kroku 5.
- **Reuse vs nové:** `DayPageBase`, `NumberedBenefit`, `InfoBox`.
- **Otvorené otázky:** —

### Strana 3/4 — Worksheet: OVĚŘOVÁNÍ FAKTŮ (worksheet · štandard)
- **Obsah (verbatim):** „Pojď se teď zamyslet, kdy jsi naposledy cítil/a nepříjemnou emoci a zkusme si ověřit fakta:" + worksheet **7 blokov** verbatim: 1. Emoce, kterou chci změnit · 2. Událost (popiš fakta) · 3. Moje myšlenky, interpretace a předpoklady · 4. Jiné možné pohledy nebo interpretace · 5. Předpokládám nějakou hrozbu? (3 podotázky: jaká · jak pravděpodobné · jaké další výsledky) · 6. Nejhorší scénář + „Jak bych situaci zvládl/a?" · 7. Odpovídá moje emoce a její intenzita skutečným faktům?
- **Funkčné:** 7 blokov, z toho blok 5 má 3 podpolia a blok 6 dve → celkovo **11 vstupov**. Perzistencia rovnako ako Deň 2 (kľúč `week3_day3`). Dobrovoľné.
- **UX / vizuál:** Rovnaký `StructuredWorksheet` ako Deň 2 (konzistencia), s podporou **vnorených podpolí** (blok 5 a 6). Nadpis worksheetu verzálkami ako v zdroji („OVĚŘOVÁNÍ FAKTŮ").
- **Používateľ / emočné:** 11 polí je najviac v celom programe — pri worksheete musí byť explicitné, že sa dá vyplniť postupne a vrátiť sa k nemu. Zdroj nemá príklad pre tento worksheet (na rozdiel od Dňa 2) → viď OQ-7.
- **Reuse vs nové:** `StructuredWorksheet` (zo Dňa 2, rozšírený o podpolia).
- **Otvorené otázky:** **OQ-7** — Deň 2 má autorský príklad, Deň 3 nie. Doplní autor príklad aj sem? Bez neho je 11 prázdnych polí náročné.

### Strana 4/4 — Completion (completion · štandard)
- **Obsah:** Bez zdrojovej vety → potrebné autorské doplnenie; teaser „Opačná akce".
- **Reuse:** `DayCompletionPage`.

---

## Deň 4: Změna odezvy na emoce — opačná akce

### Strana 1/4 — Co je opačná akce (education · chat)
- **Obsah (verbatim):** „Opačná akce (apposite action) je technika používaná k regulaci emocí." · „Jednoduše řečeno, Když máme silnou emoci, často nás nutí jednat způsobem, který ji posiluje nebo způsobuje problémy (např. úzkost → vyhýbání se, hněv → hádka)." · „Opačná akce znamená jednat opačně, než by nás emoce nutila, pokud by byla emoce nepřiměřená nebo neprospěšná."
- **Funkčné:** Len čítanie.
- **UX / vizuál:** Chat; dvojica príkladov (úzkost → vyhýbání / hněv → hádka) ako malé „pred/po" karty.
- **Používateľ / emočné:** Podmienka „**pokud by byla emoce nepřiměřená nebo neprospěšná**" je bezpečnostne kritická — opačná akcia sa nemá používať na oprávnené emócie (napr. strach v reálnom nebezpečenstve). Musí byť zvýraznená, nie zamiešaná do vety.
- **Reuse vs nové:** `ChatDayPage`, `ChatInfoCard`.
- **Otvorené otázky:** **OQ-8** — nemá appka pri tejto technike explicitne varovať, kedy ju **nepoužiť** (oprávnený strach, reálne ohrozenie)? Zdroj to hovorí len jednou vedľajšou vetou.

### Strana 2/4 — Tři rovinny opačné akce (education · štandard)
- **Obsah (verbatim):** „Funguje ve třech rovinách:" + **Rovina tělesná** („Zahrnuje změnu výrazu tváře, postoje těla a dýchání. Pokud cítíme hněv, opačnou akcí v této rovině je uvolnění zaťatých pěstí, narovnání obočí a nepatrný úsměv. Tělo pak posílá mozku signál, že nejsme v ohrožení.") · **Rovina kognitivní** („Když změníme to, co si o situaci říkáme, myslíme. Pokud cítíme strach a chceme se něčemu vyhnout, opačná akce v myšlení znamená přestat přemýšlet nad nejhorším a začít se soustředit na fakta nebo na to, co můžeme zvládnout. Jde o aktivní změnu toho, co si uvnitř myslíme.") · **Rovina chování** („To je to, co uděláme navenek. Místo toho, abysme utekli (strach), zaútočili (hněv) nebo se schovali (stud), uděláme pravý opak - jdeme do situace.")
- **Funkčné:** Len čítanie; tri roviny rozbaliteľné.
- **UX / vizuál:** Tri veľké karty (telo / myslenie / činy) s ikonami — každá s konkrétnym príkladom zo zdroja. Hierarchia: rovnocenné, nie kroky za sebou.
- **Používateľ / emočné:** Telesná rovina je najprístupnejšia („uvolnit pěsti, nepatrný úsměv") — dať ju prvú, presne ako zdroj.
- **Reuse vs nové:** `DayPageBase`, `FeatureCard` / rozbaliteľné karty.
- **Otvorené otázky:** —

### Strana 3/4 — Cvičit po malých krocích (education · štandard)
- **Obsah (verbatim):** „Cílem je změnit emoci nebo její intenzitu, získat kontrolu nad chováním a nepodlehnout impulsivní reakci." · „Technika opačná akce může znít jednoduše – jen udělej opak toho, co ti emoce říká. V realitě se to ale často zdá hodně těžké, protože emoce jsou silné a návykové. Je potřeba cvičit na malých krocích – zkoušet opačné akce u situací, kde se cítíš bezpečně, a postupně přecházet k náročnějším. Cvičení a opakování ti pomohou získat kontrolu nad reakcemi a emoce se postupně zmírní."
- **Funkčné:** Len čítanie. **Návrh nad rámec zdroja:** ponúknuť uloženie techniky do **záchranného balíčku** (existuje z týždňa 2) — opačná akcia je presne tá vec, ktorú človek potrebuje po ruke v krízovej chvíli.
- **UX / vizuál:** Text + `InfoBox` „Cvič na malých krocích" + `RescueSaveButton`.
- **Používateľ / emočné:** Priznanie, že „v realite je to ťažké", je dôveryhodné — nechať verbatim, neupravovať na optimistickejšie.
- **Reuse vs nové:** `DayPageBase`, `InfoBox`, `RescueSaveButton` (hotové).
- **Otvorené otázky:** **OQ-2** — Deň 4 nemá v zdroji žiadne cvičenie ani worksheet, hoci ostatné dni týždňa ho majú. Doplní autor cvičenie (napr. „vyber si situáciu a napíš svoju opačnú akciu v troch rovinách")? Inak je Deň 4 čisto na čítanie.

### Strana 4/4 — Completion (completion · štandard)
- **Obsah:** Bez zdrojovej vety → autorské doplnenie; teaser „Když to, co děláte, nefunguje".
- **Reuse:** `DayCompletionPage`.

---

## Deň 5: Když to, co děláte, nefunguje

### Strana 1/2 — SPOKO recall (recall · štandard)
- **Obsah (verbatim):** Celý zdroj dňa: „Zkusite si připomenout svoje SPOKO dovednosti (odkaz na model SPOKO)"
- **Funkčné:** Pripomenutie 5 oblastí SPOKO (odkryť na tap — rovnaký vzor ako `Day7RecallPage` z týždňa 1) + deep-link na **Moje výzvy** (`MyChallengesRoute`), kde má používateľ svoje SPOKO výzvy z týždňa 1.
- **UX / vizuál:** 5 dlaždíc S-P-O-K-O, tap odkryje oblasť; pod tým tlačidlo „Moje výzvy". Reuse vzoru z T1 D7.
- **Používateľ / emočné:** Názov dňa („Když to, co děláte, nefunguje") naznačuje záchrannú sieť pre chvíle, keď dovednosti zlyhávajú — návrat k biologickým základom je logický. Tón: bez viny, „niekedy telo potrebuje základy, nie techniky".
- **Reuse vs nové:** Vzor `Day7RecallPage` (T1); `MyChallengesRoute` deep-link.
- **Otvorené otázky:** **OQ-3** — Deň 5 má v zdroji **jednu vetu**, ale nesie názov „Když to, co děláte, nefunguje", ktorý sľubuje viac (v DBT je to samostatná téma). Doplní autor obsah, alebo je Deň 5 zámerne len krátke pripomenutie? Ak zostane takto, je to najkratší deň programu (~1 min) — možno zlúčiť s Dňom 4 alebo s pauzou.

### Strana 2/2 — Completion (completion · štandard)
- **Reuse:** `DayCompletionPage` + teaser „Pauza".

---

## Deň 6: Pauza — 🔁 reuse

- **Obsah (verbatim):** „Dnes program vynecháme. Máš za sebou skvělý pokrok a zasloužíš si chvilku odpočinku."
- **Funkčné:** `DayPauseScreen(weekNumber: 3, dayNumber: 6)` — existujúca šablóna vrátane deep-linku na záznam nálady. **Pozor:** pauza je v tomto týždni Deň 6, nie 5.
- **UX / vizuál / emočné:** Bez zmien oproti týždňu 2. Text pauzy je v šablóne zapísaný natvrdo (text týždňa 2) → viď OQ-9.
- **Otvorené otázky:** **OQ-9** — `DayPauseScreen` má text pauzy hardcoded z týždňa 2 („Už teď máš za sebou spoustu skvělé práce…"). Týždeň 3 má vlastné znenie. Parametrizovať šablónu textom, alebo nechať jeden spoločný text pre všetky pauzy?

---

## Deň 7: Shrnutí

### Strana 1/3 — Co jsme prošli (recap · chat)
- **Obsah (verbatim):** „Úspěšně uzavíráme třetí týden zaměřený na emoční regulaci. Sledovat a mírnit intenzivní emoční vlny stojí spoustu energie, takže ti patří obrovské uznání za celou tvou týdenní práci." + prehľad tém (slovník emócií · popis a validace · ověřování faktů · opačná akce · SPOKO).
- **UX / vizuál + reuse:** Chat + `ChatNumberedList`; vzor `Week2RecapPage`.

### Strana 2/3 — Reflexe týdne (reflection · štandard)
- **Obsah (verbatim), 3 otázky:** „Co pro tebe bylo v tomto týdnu klíčové? Jaké nové poznatky se ti podařilo získat?" · „Podařilo se ti už něco z nové inspirace uvést do praxe? Co přesně a jak to probíhalo?" · „Ve kterých situacích v nadcházejícím týdnu vidíš pro tuto dovednost největší využití?"
- **Funkčné:** 3 polia, `BpdReflectionDao(week: 3)`; predvyplnenie pri návrate.
- **UX / vizuál + reuse:** `ReflectionQuestionList` (hotové). Pozn.: týždeň 3 má **3** otázky, týždne 1–2 mali 4 — komponenta to zvláda.
- **Používateľ / emočné:** Rovnako ako T2: informovať, že sa to ukládá.

### Strana 3/3 — Týden dokončen (completion · štandard)
- **Reuse:** `WeekCompletionPage(weekNumber: 3, praise: …)` — text z úvodnej vety zdroja.

---

## Súhrnné UX rozhodnutia pre týždeň

- **Slovník emocí je funkcia, nie strana** — trvalá referencia v *Moje záznamy → DBT program*, presne ako záchranný balíček. Zdroj si to vyžiadal dvakrát.
- **Jeden worksheet komponent pre Deň 2 aj Deň 3** (`StructuredWorksheet`) — dva najväčšie formuláre programu majú vyzerať a fungovať rovnako.
- **Príklad na tap všade, kde má používateľ písať** — Deň 1 (mýty), Deň 2 (worksheet, vetné rámce). Deň 3 príklad v zdroji nemá (OQ-7).
- **Mýty vždy vizuálne označené ako mýty** — tlmená karta, úvodzovky, nadpis; appka nesmie pôsobiť, že tie tvrdenia zdieľa.
- **Bezpečnostné vety sa nikdy neoddeľujú od svojho obsahu** — „predstav si, že to zvládneš" musí byť na tej istej obrazovke ako katastrofický scenár; „len keď je emócia nepřiměřená" musí byť pri opačnej akcii.
- **Emócie majú rovnocenný vizuál** — žiadne farebné delenie na dobré/zlé, ani u závisti a žiarlivosti.
- Perzistencia všade, kde sa píše: `week3_day1_myths`, `week3_day2`, `week3_day3`, `BpdReflectionDao(week 3)`.
- Pauza je **Deň 6**; `_weekDaysContent[3]` a `kImplementedBpdWeeks` treba upraviť pri implementácii.

## Rozhodnuté (2026-08-06)

| OQ | Rozhodnutie | Dôsledok pre implementáciu |
|----|-------------|----------------------------|
| **OQ-1** | Edukácia = **chat** | 6 chat strán týždňa 3 stavať priamo cez `widgets/chat/`. Widgety existujú, žiadna závislosť na prerobení týždňa 2. |
| **OQ-4** | Infografika ako **ilustrácia k prvým šiestim** emóciám | Zvyšné 4 (Vina, Překvapení, Žárlivost, Závist) ako text. Autorskú grafiku neprekresľovať. |
| **OQ-5** | Výčet mýtov na **dve strany po 11** | Deň 1 má teda 7 strán, nie 6. Progress bar zostane čitateľný. |
| **OQ-6** | Cvičenie nabídne **~5 mýtov**, zvyšok dobrovoľne | `MythBusterCard` + rozbaľovacia sekcia „chci pokračovat" so zvyšnými 17. Perzistencia na všetkých 22 (`week3_day1_myths`), aby sa dalo dopisovať priebežne. Deň zostane v sľúbených 5–20 min. |
| **OQ-8** | **Pridať** explicitné varovanie k opačnej akcii | Kedy ju *nepoužiť* (oprávnený strach, reálne ohrozenie) — na tej istej obrazovke ako technika, nie ako poznámka. Bezpečnostné rozhodnutie, nie štylistické. |
| **OQ-9** | `DayPauseScreen` **parametrizovať** textom per týždeň | Týždeň 3 dostane vlastné verbatim znenie; pripraví to aj týždne 4–7. |
| **OQ-10** | Napísať **návrh v tóne autorky** + `// TODO: schválit autorem` | Rovnaký postup ako v týždni 2. Týka sa Dní 1, 3, 4, 5. |

## Zostáva len obsah od autorky (task W3-01)

Tieto tri veci sa nedajú nahradiť rozhodnutím — je to klinický obsah:

- **OQ-2:** Deň 4 (opačná akce) nemá v zdroji žiadne cvičenie ani worksheet, hoci ostatné dni týždňa ho majú. Bez neho je Deň 4 čisto na čítanie.
- **OQ-3:** Deň 5 má v zdroji **jednu vetu** pri názve „Když to, co děláte, nefunguje", ktorý v DBT sľubuje samostatnú tému. Doplniť, alebo potvrdiť, že je to zámerne len krátke pripomenutie (~1 min, najkratší deň programu)?
- **OQ-7:** Worksheet Dňa 3 (ověřování faktů, 11 polí) nemá príklad, Deň 2 ho má. Bez príkladu je 11 prázdnych polí náročné. Postavím ho s miestom, kam sa príklad doplní.
