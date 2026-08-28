# Week 4 — Snášení tísně — Screen Plan

> Zdroj obsahu (verbatim): docs/hpo/source/tyzden-4.md
> Prehľad: docs/hpo/content-reference.md (Week 4)
> Vytvorené: 2026-08-12
> Stav: **plán hotový, kód nezačatý.** Kódovateľné hneď: Dni 1, 2, 5, 7.
> Deň 3 a 6 potrebujú malú zmenu `DayPauseScreen` (viď OQ-1).
> **Rozhodnuté 2026-08-12 (používateľ):** OQ-2 tlačidlo „Vylosovat" (nie kolo),
> OQ-3 losuje sa z 8 pojmenovaných techník týždňa 2, OQ-5 tichý krízový riadok na
> D2 2/6, OQ-4 kontraindikačná veta ako náš návrh s `// TODO: schválit autorem`,
> OQ-11 checklist na 2 strany. Zvyšné OQ ostávajú na autorku (W4-01).
> Aplikované OPEN lekcie z LESSONS.md: pole **Typ obrazovky**, plán pokrýva celý
> týždeň, sekcia **Zdieľané komponenty týždňa**, sekcia **Chýbajúci obsah pre
> autorku**, počty položiek prepočítané zo zdroja (nie z odhadu).

---

## Čo je v tomto týždni iné

1. **Dva pauzové dni, každý s iným textom.** Pauza je **Deň 3 aj Deň 6** — prvý
   raz v programe. Súčasný `DayPauseScreen._pauseCopy` je kľúčovaný **len číslom
   týždňa**, takže by oba dni zobrazili ten istý text a jeden z dvoch autorkiných
   odstavcov by nikto nikdy nevidel. Viď OQ-1.
2. **Iba päť „skutočných" dní** (1, 2, 4, 5, 7). Týždeň je zámerne ľahší — je to
   najnáročnejší modul a autorka to kompenzuje odpočinkom. Plán to nemá „zaplniť".
3. **Tri akronymy v jednom týždni** — STOP (4), TIPS (4), UZNÁVÁM (7). Sú
   štrukturálne identické: písmeno + slovo + inštrukcia. **Nový widget netreba** —
   `NumberedBenefit.number` je `String`, takže `NumberedBenefit(number: 'S', …)`
   funguje hneď. (Lekcia z týždňa 3: najprv sa spýtaj, či to nie je existujúci
   komponent s iným obsahom.)
4. **Najcitlivejší týždeň programu.** Zdroj sám hovorí o „neudělat nic, co nejde
   vzít zpátky" — teda o momente, keď je človek najbližšie k sebapoškodeniu.
   Krízové kontakty appky sem patria (viď „Bezpečnosť" nižšie), nie ako varovanie,
   ale ako ruka podaná na dosah.
5. **Dve telesné techniky s reálnymi kontraindikáciami** (studená voda + zadržanie
   dychu, intenzívne cvičenie). Appka má modul poruchy príjmu potravy aj
   sebapoškodzovania — tie isté techniky môžu byť pre časť používateľov riziko.
   Viď OQ-4; je to jediné miesto, kde navrhujem **pridať** vetu k autorkinmu textu.

---

## Bezpečnosť — prierezové rozhodnutie tohto týždňa

Zdroj na Dni 2 píše:

> „Cílem v tuhle chvíli není vyřešit tvůj problém, ale prostě to přečkat a neudělat
> nic, co nejde vzít zpátky."

Používateľ, ktorý toto čítá v krízi, nemá listovať appkou, aby našiel pomoc.
Appka má hotové krízové povrchy (`CrisisCenterContactsRoute`, `PhoneContactsRoute`,
`ChatContactsRoute`, `CrisisMessageRoute`) a na home „Quick help".

**Návrh:** na strane 2/6 Dňa 2 (a len tam, nie na každej strane) je pod obsahom
tichý, nedramatický riadok s deep-linkom na krízové kontakty — formulácia typu
„Když je toho moc právě teď, tady je pomoc" s ikonou. Nie červený banner, nie
modálny dialóg. Dôvod: modálne varovanie človeka v kríze odrádza a pôsobí ako
poplach; jeden vždy prítomný riadok pôsobí ako podaná ruka.

**Toto je návrh, nie autorkin text** — musí to schváliť (viď W4-01, OQ-5).

---

## Zdieľané komponenty týždňa

| Komponenta | Použitie | Reuse? |
|-----------|----------|--------|
| `NumberedBenefit` s **písmenom** namiesto čísla | STOP (D2), TIPS (D2), UZNÁVÁM (D5) | ✅ hotové, bez zmeny |
| `ChatDayPage` + `ChatBotBubble` / `ChatInfoCard` / `ChatLinksCard` | edukácia D1, D2 (2 strany), D4, D7 recap | ✅ hotové |
| `SelectableExerciseTile` + `BpdChallengesDao` (sekcia = písmeno) | checklist UZNÁVÁM, D5 (7 sekcií, 22 položiek) | ✅ hotové |
| `SkillPracticePage` | D5 checklist — **ale** potrebuje `minimumPicks: 0` a iný hint (viď OQ-6) | ⚠️ malé rozšírenie |
| `RescueSaveButton` + `BpdRescuePackageDao` | STOP, TIPS, progresívna relaxácia | ✅ hotové |
| `ExternalLinkButton` / `ChatLinksCard` | YouTube D1, PMR video D2 | ✅ hotové |
| `BreathingGameRoute` | TIPS → „P – Pravidelné dýchání" | ⚠️ chýba preset 4/6–8 (OQ-7) |
| `TechniqueRandomiser` (vylosuje techniku z týždňa 2) | D4 strana 2/3 | **nová**, malá |
| `week2Day4Techniques` + `week2Day6Techniques` (`TechniqueData` konštanty) | zdroj dát pre losovanie | ✅ hotové, len import |
| `showTechniqueDetailSheet` | detail vylosovanej techniky | ✅ hotové |
| `DayPauseScreen` | D3 a D6 | ⚠️ kľúčovanie textu (OQ-1) |
| `ReflectionField` / `ReflectionQuestionList` + `ReflectionAutosave` | D7, 3 otázky | ✅ hotové |
| `DayCompletionPage`, `WeekCompletionPage`, `DayFlowHeader`, `DayPageBase`, `SectionHeader`, `InfoBox`, `FeatureCard` | všade | ✅ hotové |

Celkovo: **jeden nový malý komponent** (losovanie) + dve malé rozšírenia
existujúcich. Týždeň 4 je infrastruktúrne najľahší zo všetkých doteraz — celá
ťažká práca sa spravila v týždňoch 2 a 3.

---

## Prehľad

| Deň | Názov | # strán | Typ obrazovky | Reuse | Nové interakcie |
|-----|-------|---------|---------------|-------|-----------------|
| 1 | Edukace o stresu | 2 | chat (1) + completion | ✅ celé | — |
| 2 | Dovednosti pro překonání krize | 6 | chat (1–2) + skill (3–4) + cvičenie (5) + completion | ✅ celé | krízový deep-link, rescue save ×3 |
| 3 | Pauza | — | 🔁 `DayPauseScreen` | ⚠️ text podľa dňa | — |
| 4 | Všímavost u stresu | 3 | chat (1) + losovanie (2) + completion | technika z T2 | losovanie techniky |
| 5 | Techniky pro zvládnutí okamžiku krize | 5 | chat (1) + edukácia (2) + checklist (3–4) + completion | ✅ celé | 22-položkový checklist „čo som vyzkoušel" |
| 6 | Pauza | — | 🔁 `DayPauseScreen` | ⚠️ text podľa dňa | — |
| 7 | Shrnutí | 3 | chat recap (1) + reflexia (2) + week completion | ✅ celé | 3 otázky, perzistencia |

Celkom **19 strán**, dva dni celé na reuse.

---

## Deň 1: Edukace o stresu

### Strana 1/2 — Edukace o stresu (education · chat)
- **Cieľ:** Normalizovať stres, odlíšiť stres od distresu a rámcovať, na čo sa
  týždeň zameria (akútne chvíle, nie dlhodobé stresory).
- **Obsah (verbatim, všetkých 6 odrážok + odkaz):**
  - „Stres je přirozená reakce našeho těla i mysli, která nám pomáhá zvládat náročné situace a chránit se před nebezpečím."
  - „Každý člověk stres prožívá a v menší míře může být dokonce užitečný – dodá nám energii a motivaci k výkonu."
  - „Když je ale stres příliš silný nebo trvá dlouhodobě, mění se v distres, který nám může ubírat síly, oslabovat zdraví a komplikovat vztahy."
  - „Je naprosto pochopitelné, že stres někdy působí nepříjemně a že je těžké se s ním vyrovnat – neznamená to slabost, ale lidskost."
  - „Dlouhodobé stresory, jako jsou opakující se problémy doma, ve škole, v práci nebo třeba zdravotní potíže, je potřeba řešit postupně a z dlouhodobého hlediska."
  - „V tomto týdnu se ale zaměříme hlavně na to, jak lépe zvládat akutní stresové chvíle a zvýšit svoji odolnost v okamžiku, kdy to nejvíce potřebujeme."
  - „Chci vědět víc:" → https://youtu.be/gNY1u33-_uw?si=ZBszT5qnBdwEZJU4
- **Funkčné:** Len čítanie. Odkaz cez `launchUrLink` v `ChatLinksCard` (rovnako
  ako W2 D1). Bez perzistencie.
- **UST / vizuál:** Chat, 6 krokov + karta s odkazom. Odrážka 3 (distres) ako
  `ChatInfoCard` — je to jediný nový pojem strany. Odrážka 4 („neznamená to
  slabost, ale lidskost") tiež ako karta, ale s iným, mäkkým akcentom.
- **Používateľ / emočné:** Toto je najlaskavejšia veta celého týždňa
  („neznamená to slabost, ale lidskost") a musí byť **vizuálne odlíšená**, nie
  utopená ako štvrtý riadok v rade. Poradie zo zdroja neporušujeme: normalizácia
  ide **pred** definíciou distresu, takže používateľ najprv počuje „to je normálne"
  a až potom „a keď je to príliš, má to názov".
- **Reuse vs nové:** `ChatDayPage`, `ChatBotBubble`, `ChatInfoCard`, `ChatLinksCard`.
- **Otvorené otázky:** Autorka nemá completion vetu pre tento deň (OQ-8).

### Strana 2/2 — Completion (completion · štandard)
- **Cieľ:** Uzavrieť deň a nadviazať na Deň 2.
- **Obsah:** Naša veta (`// TODO: schválit autorem`) + `NextDayTeaser` na
  „Dovednosti pro překonání krize".
- **Funkčné:** `markDayCompleted(4, 1)`.
- **UX / vizuál:** `DayCompletionPage` bez zmien.
- **Reuse vs nové:** ✅ hotové.

---

## Deň 2: Dovednosti pro překonání krize

Najväčší deň týždňa: 6 rámcujúcich odrážok + dva akronymy + video. Delíme na
**6 strán** tak, aby rámcovanie („kedy áno / kedy nie") stálo **pred** technikami —
inak by človek dostal nástroj bez toho, aby vedel, na čo je.

### Strana 1/6 — Co se děje v krizi (education · chat)
- **Cieľ:** Povedať, že cieľom v kríze nie je vyriešiť, ale prežiť bez škody.
- **Obsah (verbatim, odrážky 1–3):**
  - „Když se ocitneme v krizi nebo velmi silném stresu, často máme pocit, že nezvládneme nic. Mozek je zahlcený a tělo reaguje bouřlivě. V takových chvílích není cílem hned všechno vyřešit, ale přežít těžký moment, aniž bychom si ublížili nebo situaci zhoršili."
  - „Právě k tomu slouží dovednosti pro zvládání krize. Pomůžou ti získat odstup, uklidnit tělo a najít trochu prostoru k nadechnutí. Neřeší dlouhodobý problém, ale pomůžou ti přečkat bouři, dokud se nevrátí klidnější chvíle."
  - „Pak se dají použít strategie, které ti pomůžou se stresory pracovat v delším čase. Ale teď se společně naučíme pár jednoduchých nástrojů, které můžeš použít hned, kdykoli je toho moc."
- **Funkčné:** Len čítanie.
- **UX / vizuál:** Chat, 3 kroky. „Neřeší dlouhodobý problém, ale pomůžou ti
  přečkat bouři" ako `ChatInfoCard` — je to celý kontrakt tohto týždňa.
- **Používateľ / emočné:** Metafora búrky je autorkina a je dobrá — nesmie sa
  stratiť. Nesľubujeme vyriešenie, sľubujeme prežitie; to je úprimné a znižuje
  tlak na výkon.
- **Reuse vs nové:** ✅ hotové.

### Strana 2/6 — Kdy tyto dovednosti použít (education · chat + krízový link)
- **Cieľ:** Naučiť rozpoznať krízu a **ohraničiť**, kedy sa tieto nástroje
  nepoužívajú.
- **Obsah (verbatim, odrážky 4–6):**
  - „Jak poznáme, že se nacházíme v krizi? Být v krizi neznamená jen mít trápení. Je to situace, kdy jsou tvé pocity tak silné, že ztrácíš nadhled. Cítíš obrovský impuls jednat hned teď a bez přemýšlení. Cílem v tuhle chvíli není vyřešit tvůj problém, ale prostě to přečkat a neudělat nic, co nejde vzít zpátky."
  - „Dovednosti přežití krize je dobré používat, když máme intenzivní bolest nebo silné emoce, které nelze rychle zmírnit, a kdy by jednání podle emocí situaci jen zhoršilo. Pomáhají nám zůstat schopni jednat, i když se cítíme zahlcení nebo rozrušeni problémy, které nelze okamžitě vyřešit."
  - „Tyto dovednosti není dobré používat pro běžné každodenní problémy, pro řešení všech životních problémů ani pro hledání smyslu života."
- **Funkčné:** Deep-link na krízové kontakty (`CrisisCenterContactsRoute` alebo
  `ContactsRoute` — viď OQ-5). Návrat späť do flowu musí zachovať pozíciu v
  `PageView` (rovnaký vzor ako mood deep-link na pauzovom dni).
- **UX / vizuál:** Chat, 3 kroky. **„Kedy nie" je posledná karta strany**, vizuálne
  odlíšená ako hranica (rovnaký vzor ako `day4WarningTitle` v týždni 3) — a je na
  **tej istej strane** ako „kedy áno", nikdy odklikaná zvlášť. Pod obsahom tichý
  riadok s krízovým kontaktom.
- **Používateľ / emočné:** Najcitlivejšia strana týždňa. Dve veci sa nesmú stať:
  (a) aby veta „neudělat nic, co nejde vzít zpátky" ostala bez ponuky pomoci na
  dosah, (b) aby sa z tej ponuky stal poplach, ktorý človeka vystraší alebo mu dá
  najavo, že appka ho má za rizikového. Preto jeden pokojný riadok, nie banner.
- **Reuse vs nové:** ✅ hotové + krízový deep-link.
- **Otvorené otázky:** OQ-5 (formulácia a cieľ krízového linku — chce to autorka?).

### Strana 3/6 — STOP (skill · štandard)
- **Cieľ:** Dať prvý nástroj — pauzu medzi impulzom a reakciou.
- **Obsah (verbatim, 2 úvodné odrážky + 4 písmená):**
  - „STOP je krátká technika, která ti pomůže nezareagovat impulzivně"
  - „STOP ti pomůže získat chvíli mezi impulsem a reakcí – a v té chvíli máš šanci vybrat si jinou cestu."
  - **S – Stop!:** „zastav se na chvíli -  nic nedělej, nic neříkej."
  - **T – Tah zpátky:** „udělej krok zpět, dej si čas."
  - **O – Obhlédni situaci:** „co se právě děje? jaké máš pocity, myšlenky, co říká okolí?"
  - **P – Postupuj všímavě:** „rozhodni se, co ti v té situaci nejvíc pomůže – ne co chce emoce, ale co dává smysl, co je efektivní."
- **Funkčné:** `RescueSaveButton` → uloží STOP do záchranného balíčka
  (`BpdRescueItem`, id napr. `week4_stop`). Bez ďalších vstupov.
- **UX / vizuál:** `DayPageBase` + `SectionHeader('STOP')` + 4 ×
  `NumberedBenefit(number: 'S'|'T'|'O'|'P', …)`. Písmená sú **veľké a farebné** —
  akronym si má človek zapamätať, nie prečítať.
- **Používateľ / emočné:** Toto je technika, ktorú si používateľ vytiahne v
  najhoršej chvíli, takže **musí byť uložiteľná do záchranného balíčka** — inak by
  ju musel hľadať cez program. Kognitívny load: 4 položky, jedna myšlienka na
  stranu, žiadny vstup.
- **Reuse vs nové:** ✅ všetko hotové (`NumberedBenefit` s písmenom).
- **Otvorené otázky:** V zdroji je „zastav se na chvíli -  nic nedělej" (pomlčka +
  dvojitá medzera). Ponechávame verbatim; typografiu nech rozhodne autorka (OQ-9).

### Strana 4/6 — TIPS (skill · štandard)
- **Cieľ:** Dať druhý nástroj — zásah cez telo, keď mysl nestíha.
- **Obsah (verbatim, úvod + 4 písmená):**
  - „Když je tělo v maximálním stresu, někdy je nejrychlejší začít právě u něj. TIPS techniky ti pomůžou rychle stáhnout intenzitu emocí:"
  - **T – Teplota:** „opláchni obličej studenou vodou, drž kostku ledu v dlani, použij studený obklad. když se ponoříš do studené vody a dohromady na chvíli zadržíš dech, tělo automaticky zpomalí srdeční tep, snižuje napětí a aktivuje uklidňující reakce nervového systému."
  - **I – Intenzivní cvičení:** „udělej 30 dřepů/kliků, běž na krátký sprint, protřep tělo. krátký intenzivní pohyb nebo cvičení zmírňuje napětí a emoce, takže se tělo i mysl uklidní."
  - **P – Pravidelné dýchání:** „zpomal dech – nádech na 4, výdech na 6–8. pomalé a hluboké dýchání zklidňuje  nervový systému a snižuje stres a úzkost." + „(Odkaz na předchozí dechová cvičení)."
  - **S - svalová relaxace:** „střídavé napínání a uvolňování svalů snižuje fyzické napětí a tím i emocionální napětí."
- **Funkčné:**
  - „P" má **deep-link na dechové cvičenie** — autorka to explicitne píše.
    Zdroj chce nádech 4 / výdech 6–8; existujúce presety sú `box` (4-4-4-4) a
    `7-11`. Ani jeden nesedí → OQ-7.
  - `RescueSaveButton` → `week4_tips`.
  - „S" vedie na stranu 5/6 (progresívna relaxácia) — v zdroji nasleduje hneď za ňou.
- **UX / vizuál:** Ako 3/6, 4 × `NumberedBenefit`. Pri „P" tlačidlo
  „Otevřít dechové cvičení" pod položkou, nie na konci strany — patrí k tomu písmenu.
- **Používateľ / emočné:** Tu je **kontraindikačné riziko** (OQ-4): studená voda so
  zadržaním dychu spomaľuje srdcový tep (potápačský reflex) a intenzívne cvičenie
  môže byť pre časť používateľov kompenzačné správanie. Appka má modul PPP aj
  sebapoškodzovania, takže tú časť publika reálne má. Navrhujeme **jednu vetu**
  odporúčajúcu opatrnosť pri srdcových potiažach a poruchách príjmu potravy —
  ale je to zásah do autorkinho odborného textu, takže **rozhoduje ona**.
- **Reuse vs nové:** ✅ hotové + preset dýchania.
- **Otvorené otázky:** OQ-4 (kontraindikácie), OQ-7 (preset 4/6–8), OQ-9 (typo
  „zklidňuje  nervový systému").

### Strana 5/6 — Progresivní svalová relaxace (exercise · štandard)
- **Cieľ:** Spoločne si vyskúšať PMR — jediné vedené cvičenie tohto dňa.
- **Obsah (verbatim):** „Pojďme si teď společně vyzkoušet progresivní svalovou
  relaxaci" + https://youtu.be/6U3C_uhKfUc?si=A9IQOakEibQEww5l
- **Funkčné:** `ExternalLinkButton` (YouTube, otvorí externe). `RescueSaveButton`
  → `week4_pmr`. Bez vstupov, bez podmienky na pokračovanie (dobrovoľnosť).
- **UX / vizuál:** Samostatná strana — je to **výzva niečo urobiť**, nie riadok na
  prečítanie. Veľké video tlačidlo, krátky text, primárna akcia „Pokračovat" dole.
- **Používateľ / emočné:** „Pojďme si **teď společně**" je pozvanie, nie zadanie —
  formulácia tlačidla to musí udržať („Pustit video", nie „Splnit cvičení").
  Používateľ, ktorý si video nepustí, nesmie mať pocit, že deň nesplnil.
- **Reuse vs nové:** ✅ hotové.

### Strana 6/6 — Completion (completion · štandard)
- **Obsah:** Naša veta (`// TODO: schválit autorem`) + `NextDayTeaser` na pauzu.
- **Funkčné:** `markDayCompleted(4, 2)`.
- **Reuse vs nové:** ✅ hotové.

---

## Deň 3: Pauza — 🔁 reuse

- **Obsah (verbatim):** „Dnes program vynecháme. Udělal/a jsi velký pokrok a
  zasloužíš si chvíli klidu pro načerpání nové energie."
- **Funkčné:** `DayPauseScreen(weekNumber: 4, dayNumber: 3)` + mood deep-link.
- **Reuse vs nové:** ⚠️ obrazovka hotová, ale **text sa musí kľúčovať (týždeň,
  deň)** — dnes je kľúčovaný len týždňom a Deň 6 má iný text (OQ-1).

---

## Deň 4: Všímavost u stresu

### Strana 1/3 — Všímavost u stresu (education · chat)
- **Cieľ:** Prepojiť týždeň 2 s týmto týždňom — všímavost ako nástroj na stres,
  akútny aj dlhodobý.
- **Obsah (verbatim, 3 odrážky):**
  - „V této sekci si ukážeme, jak nám už dobře známáé všímavost může pomoci zůstat klidní a soustředění i ve stresových situacích, vnímat své pocity a myšlenky bez hodnocení a reagovat uvědoměle."
  - „Všímavost ti může pomoci, když jsi ve stresu v daný moment. Pomáhá se zastavit, zklidnit dech a tělo, všimnout si, co právě cítíš, a reagovat klidně místo impulzivně."
  - „Když je stres dlouhodobý, všímavost ti pomáhá být odolnější. Učí pravidelně vnímat své myšlenky a pocity, snižuje napětí a postupně zlepšuje schopnost zvládat náročné situace."
- **Funkčné:** Len čítanie.
- **UX / vizuál:** Chat, 3 kroky. Odrážky 2 a 3 sú pekná dvojica „akútne vs
  dlhodobé" — navrhujeme ich ako `ChatFeatureList` s dvomi položkami
  („V daný moment" / „Dlouhodobě"), aby bol ten kontrast vidno na prvý pohľad.
- **Používateľ / emočné:** „už dobře známá všímavost" predpokladá, že týždeň 2
  človek prešiel — a on ho prešiel, takže je to oprávnené a buduje pocit, že sa
  dovednosti vrstvia. Zároveň to nesmie byť výčitka pre toho, kto si nepamätá.
- **Reuse vs nové:** ✅ hotové.
- **Otvorené otázky:** V zdroji je preklep „už dobře **známáé** všímavost".
  Ponechávame verbatim (OQ-9) — opraviť má autorka.

### Strana 2/3 — Připomeňme si techniku (exercise · nová komponenta)
- **Cieľ:** Vrátiť do hry jednu konkrétnu všímavú techniku z týždňa 2 — vylosovanú,
  nie vybranú.
- **Obsah (verbatim):** „Pojďme si teď připomenout jednu z všímavých technik z
  předchozích týdnů (výběr z technik z týdne 2 - například i formou „kola štěstí",
  které jednu techniku vylosuje)"
- **Funkčné:** Vylosuje jednu techniku z konštánt týždňa 2 a otvorí jej existujúci
  detail sheet (`showTechniqueDetailSheet`), z ktorého sa dá spustiť dychové
  cvičenie aj uložiť do záchranného balíčka — všetko už hotové. Losovanie sa
  **nemá zapamätať** (nie je to záznam), ale musí ísť **losovať znova**, ak
  používateľovi vylosovaná technika nesedí. Toto je dôležité: bez „losovať znova"
  by appka nutila robiť práve tú jednu vec, čo je opak dobrovoľnosti.
- **UX / vizuál:** Dve možnosti (OQ-2):
  - **(a) Tlačidlo „Vylosovat techniku" + karta s výsledkom** — jednoduché,
    prístupné, funguje so screen readerom, ~40 riadkov kódu.
  - **(b) Skutočné kolo štěstí s animáciou** — bližšie autorkinej predstave,
    ale potrebuje animáciu, `prefers-reduced-motion` ekvivalent a je to ~200+
    riadkov. Odporúčam **(a)** teraz a (b) neskôr, ak to bude chcieť.
  Pod výsledkom vždy „Vylosovat jinou" (sekundárna akcia).
- **Používateľ / emočné:** Losovanie je hravé a odbúrava paralýzu z výberu — to je
  jeho jediný účel. Ale nesmie sa z neho stať príkaz („dostal si toto, cvič to"),
  preto sekundárna akcia na prelosovanie a možnosť pokračovať bez cvičenia.
- **Reuse vs nové:** **nová** `TechniqueRandomiser` (malá) + ✅ `TechniqueData`
  konštanty a detail sheet z týždňa 2.
- **Otvorené otázky:** OQ-2 (kolo vs tlačidlo), OQ-3 (z ktorých techník sa losuje).

### Strana 3/3 — Completion (completion · štandard)
- **Obsah:** Naša veta (`// TODO: schválit autorem`) + `NextDayTeaser`.
- **Reuse vs nové:** ✅ hotové.

---

## Deň 5: Techniky pro zvládnutí okamžiku krize (UZNÁVÁM)

### Strana 1/5 — Když emoci nejde změnit (education · chat)
- **Cieľ:** Vysvetliť, prečo je odvedenie pozornosti legitímna stratégia (a nie
  vyhýbanie sa).
- **Obsah (verbatim, 2 odrážky):**
  - „Když přijde silná emoce, někdy ji nejde hned změnit. V takové chvíli pomáhá odvést pozornost jinam, dokud bouře trochu neodezní."
  - „UZNÁVÁM je sada drobných triků, které ti můžou ulevit, jak?:"
- **Funkčné:** Len čítanie.
- **UX / vizuál:** Chat, 2 kroky; druhá veta je most na stranu 2/5, takže tlačidlo
  má viesť priamo do akronymu („Ukázat UZNÁVÁM").
- **Používateľ / emočné:** Dôležité rámcovanie: „dokud bouře trochu neodezní" —
  odvedenie pozornosti je **dočasné a zámerné**, nie únik. Kto má za sebou týždeň
  3 (kde sa učil emócie *nepotláčať*), by inak mohol cítiť protirečenie.
  Odporúčam v našej completion vete túto niť explicitne dotiahnuť.
- **Reuse vs nové:** ✅ hotové.

### Strana 2/5 — UZNÁVÁM: sedm triků (education · štandard)
- **Cieľ:** Dať celý akronym naraz, aby si ho človek zapamätal.
- **Obsah (verbatim, 7 položiek):**
  - **Ú-silím:** „dělej vědomě něco, co tě zabaví – uklízení, kreslení, seriál."
  - **Z-apojením:** „udělej drobnost pro někoho jiného – napiš zprávu, nabídni pomoc."
  - **Ná-hledem:** „připomeň si, kdy už ti bylo podobně nebo i hůř – a zvládl/a jsi to."
  - **A-ktivní obranou:** „představ si, že emoci dáš do krabice a na chvíli ji odložíš."
  - **V-ytvořením jiné emoce:** „pusť si hudbu nebo film, který vyvolá jinou emoci."
  - **A-ktivací smyslů:** „využij tělo – dej si studenou sprchu, drž v ruce kostku ledu, protáhni se."
  - **M-yšlenkami:** „zkus počítat, luštit sudoku, říkat si básničku"
- **Funkčné:** `RescueSaveButton` → `week4_uznavam` (7 trikov je presne to, čo si
  človek chce mať v krízi po ruke).
- **UX / vizuál:** 7 × `NumberedBenefit` s písmenom. **Pozor:** 7 položiek je na
  hranici únosnosti jednej strany — preto tu nie sú žiadne iné prvky okrem
  hlavičky a uloženia.
- **Používateľ / emočné:** Akronym má 7 písmen (U-Z-N-Á-V-Á-M) a je to najdlhší
  v programe; nikto si ho nezapamätá na prvé prečítanie a **nemá to byť cieľ** —
  preto uloženie do balíčka a checklist na ďalšej strane.
- **Reuse vs nové:** ✅ hotové.
- **Otvorené otázky:** **OQ-10 — písmená si v zdroji nezodpovedajú.** Tento zoznam
  má „Ú-silím", „Ná-hledem", „A-ktivní", „A-ktivací"; checklist nižšie má
  „U – Úsilí", „N – Náhled", „Á – Aktivní obrana", „Á – Aktivace smyslů".
  Akronym UZNÁVÁM = U-Z-N-Á-V-Á-M, takže **konzistentný je checklist** a tento
  zoznam má preklepy. Neopravujeme potichu.

### Strana 3/5 — Cvičení UZNÁVÁM, část 1 (exercise · checklist)
- **Cieľ:** Nechať používateľa označiť, čo z prvých štyroch skupín vyzkoušel.
- **Obsah (verbatim, 4 sekcie / 13 položiek):**
  - **U – Úsilí (činnosti)** — 5: „Uklidit si pokoj nebo srovnat věci v šuplíku." · „Kreslit si, vybarvovat nebo tvořit." · „Skládat puzzle nebo stavebnici." · „Jít na krátkou, svižnou procházku." · „Pustit si oblíbený seriál nebo film."
  - **Z – Zapojení (přispívání)** — 3: „Napsat někomu blízkému povzbudivou zprávu." · „Nabídnout pomoc kamarádovi nebo někomu v rodině." · „Udělat pro někoho jiného jakoukoli drobnost, která odvede pozornost od vlastní bolesti."
  - **N – Náhled (porovnávání)** — 3: „Připomenout si jinou těžkou situaci, kterou už jsi v minulosti zvládl/a." · „Uvědomit si, že i ostatní lidé mají své skryté boje a problémy." · „Srovnat aktuální moment s chvílemi, kdy ti bylo podobně nebo i hůř."
  - **Á – Aktivní obrana (odstranění)** — 2: „Představit si, že svou emoci dáváš do krabice a na chvíli ji odkládáš stranou." · „Zapsat si trápící myšlenky na papír a ten fyzicky schovat nebo odložit."
- **Funkčné:** `SelectableExerciseTile`, výber persistovaný cez `BpdChallengesDao`
  so sekciou per písmeno (`week4_day5_u`, `_z`, `_n`, `_a1`). **Minimum je 0** —
  zdroj hovorí „zaznačí co vyzkoušeli", teda ide o **retrospektívny záznam**, nie
  o zadanie na dnes (rozdiel oproti týždňu 2, kde bolo „vyber ≥2").
- **UX / vizuál:** 4 sekcie pod sebou, každá s hlavičkou písmena. Bez počítadla
  „vybráno X z minimálně Y" — nahradiť neutrálnym „Označ, co jsi zkusil/a".
- **Používateľ / emočné:** Nulové minimum je zásadné: človek, ktorý neskúsil nič,
  nesmie dostať červené počítadlo. Tento checklist je **spätná väzba pre neho**,
  nie test.
- **Reuse vs nové:** ✅ `SelectableExerciseTile` + `BpdChallengesDao`;
  ⚠️ `SkillPracticePage` potrebuje `minimumPicks: 0` a voliteľný hint (OQ-6).

### Strana 4/5 — Cvičení UZNÁVÁM, část 2 (exercise · checklist)
- **Cieľ:** Zvyšné tri skupiny.
- **Obsah (verbatim, 3 sekcie / 9 položiek):**
  - **V – Vytvoření jiné emoce** — 2: „Pustit si hudbu, která vyvolá úplně jiný pocit, než máš teď." · „Podívat se na video nebo film, který tě rozesměje nebo napne."
  - **Á – Aktivace smyslů** — 4: „Podržet v ruce kostku ledu, dokud se nerozpustí." · „Dát si studenou sprchu nebo si opláchnout obličej ledovou vodou." · „Vnímat tělo skrze intenzivní protažení." · „Soustředit se na to, co právě teď vidíš, slyšíš nebo cítíš hmatem."
  - **M – Myšlenky** — 3: „Počítat cokoli v okolí nebo si v duchu opakovat básničku." · „Luštit sudoku, křížovku nebo hrát logickou hru." · „Opakovat si neutrální myšlenku, citát nebo afirmaci, která tě uklidňuje."
- **Funkčné:** Ako 3/5 (sekcie `week4_day5_v`, `_a2`, `_m`).
- **UX / vizuál:** Ako 3/5.
- **Používateľ / emočné:** „Á – Aktivace smyslů" znovu obsahuje studenú vodu a
  ľad — tá istá kontraindikačná otázka ako pri TIPS (OQ-4). Ak sa pridá
  upozornenie, musí byť na oboch miestach, inak je nekonzistentné.
- **Reuse vs nové:** ako 3/5.
- **Otvorené otázky:** Alternatíva — všetkých 22 položiek na **jednej** strane so
  7 skladacími sekciami. Rozhodnutie je o tom, či je checklist „menu na dnes"
  (2 strany, ako týždeň 2) alebo „referencia na vracanie sa" (1 strana +
  uloženie do balíčka). Odporúčam 2 strany (OQ-11).

### Strana 5/5 — Completion (completion · štandard)
- **Obsah:** Naša veta (`// TODO: schválit autorem`) — vhodné miesto dotiahnuť
  niť „odvedenie pozornosti je dočasné, nie potlačovanie" zo strany 1/5.
- **Reuse vs nové:** ✅ hotové.

---

## Deň 6: Pauza — 🔁 reuse

- **Obsah (verbatim):** „Dnes si dopřejeme volnější den bez programu. Máš za sebou
  opravdu velký kus práce – je vidět, kolik energie, odvahy a odhodlání do toho
  dáváš. Dnes si můžeš s klidem odpočinout a nechat své pokroky v klidu „doznít"."
- **Funkčné:** `DayPauseScreen(weekNumber: 4, dayNumber: 6)`.
- **Reuse vs nové:** ⚠️ viď OQ-1 — **bez tej zmeny zobrazí text Dňa 3.**

---

## Deň 7: Shrnutí

### Strana 1/3 — Co jsme prošli (recap · chat)
- **Cieľ:** Zhrnúť týždeň a oceniť, že ho človek zvládol.
- **Obsah (verbatim):** „Máme za sebou čtvrtý týden, který byl zaměřený na snášení
  tísně. Velké uznání za to, jak tento náročný modul zvládáš!" + náš recap zoznam
  (STOP, TIPS, progresívna relaxácia, všímavost u stresu, UZNÁVÁM).
- **Funkčné:** Len čítanie.
- **UX / vizuál:** Chat + `ChatFeatureList` s 5 položkami — presne vzor W2/W3 D7.
- **Používateľ / emočné:** Autorka sama píše „náročný modul" — to uznanie je
  najdôležitejšia veta strany a nesmie sa stratiť v recap zozname.
- **Reuse vs nové:** ✅ hotové. Recap položky sú **naše** (zdroj ich nemá).

### Strana 2/3 — Reflexe týdne (reflection · štandard)
- **Cieľ:** Tri otázky s perzistenciou.
- **Obsah (verbatim, 3 otázky):**
  - „Zkus se zamyslet, co přineslo nejvíc zajímavých momentů? Co nového se ti daří si odnášet?"
  - „Máš už zkušenost s využitím nových kroků ve svém životě? Co konkrétně a v jaké situaci to bylo?"
  - „Kdy přesně se nabízí příležitost tuto dovednost zapojit v dalším týdnu?"
- **Funkčné:** `BpdReflectionDao(week: 4)` + **`ReflectionAutosave`** — povinne,
  inak sa odpovede stratia pri odchode (defekt nájdený v týždni 2).
- **UX / vizuál:** `ReflectionQuestionList`, bez zmien.
- **Používateľ / emočné:** Otázky sú otvorené a nič nevynucujú; prázdne pole
  nesmie blokovať dokončenie týždňa.
- **Reuse vs nové:** ✅ hotové.

### Strana 3/3 — Týden dokončen (completion · štandard)
- **Funkčné:** `markDayCompleted(4, 7)` → rollup `markWeekCompleted(4)` → strom sa
  posunie na „N ze 7 týdnů hotovo".
- **Reuse vs nové:** ✅ `WeekCompletionPage`.

---

## Súhrnné UX rozhodnutia pre týždeň

1. **Edukácia = chat, prax = formulár** (pravidlo z `implementation-spec.md` →
   „Which pages are chats"). Chat: D1 1/2, D2 1/6 a 2/6, D4 1/3, D5 1/5, D7 1/3.
   Formulár: akronymy, checklisty, PMR, reflexia.
2. **Akronymy nedostávajú nový widget** — `NumberedBenefit` s písmenom.
3. **Tri veci sa dajú uložiť do záchranného balíčka** (STOP, TIPS, UZNÁVÁM) +
   PMR video. Týždeň o kríze musí byť dostupný **bez** prechádzania programu.
4. **Hranice pred nástrojmi.** „Kedy tieto dovednosti nepoužívať" stojí na tej
   istej strane ako „kedy áno" a **pred** STOP/TIPS — nie ako dodatok na konci.
5. **Nulové minimum na checkliste.** UZNÁVÁM je retrospektívny záznam, nie zadanie.
6. **Losovanie sa dá zopakovať.** Inak z hravého prvku vznikne príkaz.
7. **Krízový kontakt raz, tichý, na najcitlivejšej strane** — nie na každej.

---

## Otvorené rozhodnutia pre používateľa (pred `/design-screen week4`)

| # | Vec | Odporúčanie |
|---|-----|-------------|
| OQ-1 | `DayPauseScreen._pauseCopy` je kľúčovaný len týždňom, ale týždeň 4 má **dva pauzové dni s iným textom** | Prekľúčovať na `(týždeň, deň)` s fallbackom na text týždňa. Malá zmena, inak jeden autorkin odstavec nikto neuvidí. |
| OQ-2 | Deň 4: skutočné „kolo štěstí" s animáciou, alebo tlačidlo „Vylosovat" + karta? | ✅ **Rozhodnuté: tlačidlo.** Kolo neskôr, ak bude chcieť — autorka píše „například i formou", takže kolo je návrh, nie požiadavka. |
| OQ-3 | Deň 4: z čoho sa losuje? | ✅ **Rozhodnuté: tých 8 pojmenovaných techník** (D4 3 dychové + D6 5 techník) — už sú `TechniqueData` s detail sheetom a rescue id. |
| OQ-4 | TIPS „Teplota" (studená voda + zadržanie dychu) a „Intenzivní cvičení" majú reálne kontraindikácie (srdcové potiaže, PPP) | ✅ **Rozhodnuté: napíšeme návrh vety** a označíme `// TODO: schválit autorem`, na oboch miestach (TIPS aj D5 „Á – Aktivace smyslů"). Finálne znenie ostáva na autorke (W4-01). |
| OQ-5 | Krízový deep-link na D2 2/6 — s akou formuláciou? | ✅ **Rozhodnuté: tichý riadok**, `CrisisCenterContactsRoute`. Bez bannera a bez modálu. Formuláciu ešte potvrdí autorka. |
| OQ-6 | `SkillPracticePage` nemá `minimumPicks: 0` ani voliteľný hint | Rozšíriť existujúci widget (netreba nový). |
| OQ-7 | TIPS chce dýchanie 4 / 6–8; existujú len `box` a `7-11` | Pridať preset, alebo odkázať na menu Dňa 4 týždňa 2. Odporúčam **preset**, aby odkaz viedol presne na to, čo text sľubuje. |
| OQ-8 | Chýbajú completion vety pre Dni 1, 2, 4, 5 (zdroj ich nemá) | Napíšeme v autorkinom tóne + `// TODO: schválit autorem`, ako v týždni 3. |
| OQ-9 | Preklepy v zdroji: „známáé" (D4), „zklidňuje  nervový systému" (TIPS P), „zastav se na chvíli -  nic nedělej" (STOP S), „S - svalová relaxace :" | Ponechané **verbatim**. Opraviť má autorka — nemeníme jej text potichu. |
| OQ-10 | UZNÁVÁM: krátky zoznam („Ú-silím", „Ná-hledem", „A-ktivní") nesedí s checklistom („U – Úsilí", „N – Náhled", „Á – Aktivní obrana") | Konzistentný je **checklist** (U-Z-N-Á-V-Á-M). Potvrdiť a zjednotiť. |
| OQ-11 | Checklist UZNÁVÁM: 2 strany (4+3 sekcie), alebo 1 strana so 7 skladacími sekciami? | ✅ **Rozhodnuté: 2 strany** (U/Z/N/Á = 13 položiek, V/Á/M = 9), ako pick-listy týždňa 2. |
| OQ-12 | Deň 2 hovorí „**tři** klíčové dovednosti", ale uvádza dve (STOP, TIPS) — tretia (UZNÁVÁM) prichádza až Deň 5 | Buď preformulovať, alebo na D2 pridať vetu „třetí (UZNÁVÁM) si ukážeme ve dni 5". Odporúčam **druhé** — sľub sa dodrží a vznikne oblúk cez týždeň. |

---

## Chýbajúci obsah pre autorku (→ task W4-01)

1. **Completion vety** pre Dni 1, 2, 4, 5 (OQ-8).
2. **Recap položky** pre Deň 7 stranu 1/3 — zdroj má len uznanie, nie zoznam.
3. **Tretia dovednosť na Dni 2** — text sľubuje tri, dodáva dve (OQ-12).
4. **Kontraindikácie telesných techník** — áno/nie a v akej formulácii (OQ-4).
5. **Zjednotenie písmen UZNÁVÁM** medzi krátkym zoznamom a checklistom (OQ-10).
6. **Formát losovania na Dni 4** a z čoho sa losuje (OQ-2, OQ-3).
7. **Preklepy** (OQ-9).
8. **Krízový kontakt na Dni 2** — súhlas s formuláciou (OQ-5).
