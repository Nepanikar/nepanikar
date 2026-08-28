# Week 2 — Všímavost — Screen Plan

> Zdroj obsahu (verbatim): docs/hpo/source/tyzden-2.md
> Prehľad: docs/hpo/content-reference.md (Week 2)
> Vytvorené: 2026-08-04
> Stav kódu: týždeň 2 je **implementovaný** (prepracovaný 2026-08-03) — tento plán
> popisuje reálnu štruktúru a navrhuje jeden dizajnový posun (viď „Hlavný návrh").
> Aplikované OPEN lekcie z LESSONS.md: pole **Typ obrazovky** (chat/štandard/menu),
> plán pokrýva **celý týždeň** (nie len prvý deň).

---

## Hlavný návrh — edukácia ako chat, prax ako karty

Týždeň 1 rieši edukačný obsah **chat šablónou** (jednosmerný feed, schválené
2026-07-08, Flutter widgety `widgets/chat/`): Deň 1 strany 1–5 sú konverzácia
s „Nepanikař · průvodce programem". Týždeň 2 je dnes implementovaný celý
klasickými kartami (`DayPageBase`), takže používateľ prejde z konverzačného tónu
do „učebnice".

Navrhujeme rozdelenie podľa **funkcie strany**, nie podľa dňa:

| Typ obsahu | Šablóna | Prečo |
|-----------|---------|-------|
| Edukácia (Deň 1 celý, intro strany Dní 2–3, Deň 7 recap) | **chat** | Text je dlhý a vysvetľujúci; chat ho dávkuje po vetách, drží tón sprievodcu a znižuje pocit prednášky. |
| Prax — výber cvičení (Dni 2–3), menu techník (Dni 4, 6) | **štandard / menu** | Používateľ tu **koná** (zaškrtáva, vyberá), nie čita. Chat by prekážal — potrebuje vidieť celý zoznam naraz. |
| Reflexia (Deň 7 strana 2), pauza (Deň 5) | **štandard** | Písanie do polí, žiadna narácia. |

To znamená prerobiť **6 strán** (Deň 1: 3 edukačné, Deň 2 intro, Deň 3 intro,
Deň 7 recap) na `ChatDayPage`. Praktické strany zostávajú ako sú. Rozhodnutie
je na autorovi — viď „Otvorené rozhodnutia", OQ-1.

---

## Prehľad

| Deň | Názov | # strán | Typ obrazovky | Reuse | Nové interakcie |
|-----|-------|---------|---------------|-------|-----------------|
| 1 | Edukace všímavosti | 4 | chat (1–3) + completion | ChatDayPage, DayCompletionPage | 2 externé odkazy (muni.cz, YouTube) |
| 2 | Co dovednosti | 5 | chat (1) + prax (2–4) + completion | SkillPracticePage | pick ≥2 z 9/5/6, perzistencia |
| 3 | Jak dovednosti | 5 | chat (1) + prax (2–4) + completion | SkillPracticePage | príkladové páry, SMART cieľ z T1 |
| 4 | Všímavé dýchání | 3 + sheet | menu + štandard + completion | TechniqueMenuPage | detail sheet, dychová hra, balíček, notifikácia |
| 5 | Pauza | — | 🔁 DayPauseScreen | day_pause_screen.dart | deep-link záznam nálady |
| 6 | Techniky všímavosti | 2 + sheet | menu + completion | TechniqueMenuPage | pick one, balíček |
| 7 | Shrnutí týdne | 3 | chat (1) + štandard (2) + week completion | ReflectionQuestionList, WeekCompletionPage | 4 otázky, perzistencia |

Celkom **22 strán** + 1 zdieľaný detail sheet. Deň 5 celý na reuse.

---

## Deň 1: Edukace všímavosti

Edukačný deň bez cvičení (zdroj §1). Dnes 4 strany kariet; navrhujeme strany 1–3
ako jeden chat feed s 3 krokmi.

### Strana 1/4 — Co je všímavost (education · chat)
- **Cieľ:** Uviesť tému týždňa a vysvetliť, čo všímavost je a čo nie.
- **Obsah (verbatim):**
  - „Dostáváme se do druhého týdne programu. Tématem tohoto týdne je všímavost."
  - „Všímavost je schopnost vědomě zaměřit pozornost na přítomný okamžik. Na to, co právě teď prožíváme, cítíme nebo děláme, a to bez posuzování."
  - „Není to o tom „mít prázdnou hlavu", ale spíš o tom umět si všimnout, co se v nás i kolem nás děje, a zůstat u toho chvíli přítomní."
- **Funkčné:** Len čítanie. Krok chatu odkryje 3 bubliny; tlačidlo „Pokračovat".
- **UX / vizuál:** Chat feed — 2 bot bubliny + `ChatInfoCard` pre vetu o „prázdné hlavě" (je to vyvrátenie mýtu, patrí do zvýrazneného boxu). App bar: avatar 💜, „Den 1 · 1/4", tyrkysový progress.
- **Používateľ / emočné:** Otvorenie nového týždňa — priateľské a bez nároku. Veta o „prázdné hlavě" zníži obavu „ja to nezvládnem meditovať".
- **Reuse vs nové:** `ChatDayPage` + `ChatBotBubble` + `ChatInfoCard`. Dnes: `intro_page.dart` (karty) → prerobiť.
- **Otvorené otázky:** —

### Strana 2/4 — Proč je všímavost užitečná (education · chat)
- **Cieľ:** Ukázať, čo všímavost dáva človeku so silnými emóciami a impulzivitou.
- **Obsah (verbatim):**
  - „Pro lidi, kteří zažívají silné emoce, mají sklony jednat bez uvážení nebo prožívají silný stres, může být všímavost užitečná v tom, že přináší větší klid a prostor k uvědomění si možností, jak reagovat."
  - „Díky tomu se snižuje riziko jednat čistě pod vlivem emocí a roste schopnost zvládat situace s větší rozvahou."
- **Funkčné:** Len čítanie.
- **UX / vizuál:** Bot bublina + `ChatNumberedList` „Co to přináší": větší klid · prostor pro volbu · méně jednání pod vlivem emocí · větší rozvaha. Zoznam je rozklad druhej vety — čísla robia z abstraktného textu 4 uchopiteľné body.
- **Používateľ / emočné:** Cieľová skupina sa má poznať v prvej vete („mám sklony jednat bez uvážení") bez toho, aby to znelo ako obvinenie — preto verbatim, žiadne „vy".
- **Reuse vs nové:** `ChatBotBubble`, `ChatNumberedList`. Dnes: `benefits_page.dart` (4 × FeatureCard).
- **Otvorené otázky:** —

### Strana 3/4 — Základ všech dovedností + odkazy (education · chat)
- **Cieľ:** Výskumné zázemie + prečo je všímavost v DBT prvá dovednosť; odkazy na viac.
- **Obsah (verbatim):**
  - „Výzkumy ukazují, že pravidelný trénink všímavosti pomáhá snižovat úzkost, depresi i napětí, posiluje soustředění a zlepšuje kvalitu mezilidských vztahů."
  - „V rámci DBT je všímavost považována za základní dovednost, na které stojí všechny ostatní - protože nám pomáhá „zastavit se" a všimnout si, co se skutečně děje, než uděláme další krok."
  - „Chci vědet víc:" → `https://mindfulness.med.muni.cz/mindfulness/co-je-to-mindfulness-a-jak-zacit` a `https://youtu.be/5VmE_iofvuw?si=2PC8KgPSXxptokpS`
- **Funkčné:** Dva externé odkazy → `launchUrLink` v externom prehliadači. Zvyšok čítanie.
- **UX / vizuál:** `ChatStatsRow` pre tri efekty (úzkost ↓ / soustředění ↑ / vztahy ↑) — rovnaký vzor ako T1; `ChatConceptCard` s badge „DBT" pre vetu o základnej dovednosti a **oboma link tlačidlami** (concept karta už link riadok má). Vizuálne to spojí „čo to je" a „chcem vedieť viac" do jedného bloku.
- **Používateľ / emočné:** Dôkaz účinnosti bez čísiel a štúdií (žiadne p-hodnoty); odkazy sú dobrovoľné, nie domáca úloha.
- **Reuse vs nové:** `ChatStatsRow`, `ChatConceptCard` (link riadok), `ChatBotBubble`. Dnes: `dbt_context_page.dart` + `ExternalLinkButton`.
- **Otvorené otázky:** Concept karta má v T1 jeden link — treba variantu s dvoma (článok + video), alebo dva samostatné link riadky pod sebou?

### Strana 4/4 — Completion (completion · štandard)
- **Cieľ:** Oceniť dokončenie a naladiť na Co dovednosti.
- **Obsah:** Zhrnutie dňa („co je všímavost a proč je v DBT základní dovednost") + teaser zajtra: „Co dovednosti".
- **Funkčné:** `markDayCompleted(2, 1)`, `context.pop()`.
- **UX / vizuál:** `DayCompletionPage` — success kruh, „Výborně!", „Den 1 dokončen", teaser karta. Zhodné s T1 Deň 1 stranou 10/10.
- **Používateľ / emočné:** Čistý záver, žiadny ďalší obsah, anticipácia zajtrajška.
- **Reuse vs nové:** `DayCompletionPage` + `NextDayTeaser` (hotové).
- **Otvorené otázky:** —

> **Pozn.:** Stitch mal pre Deň 1 navrhnutých 5 strán vrátane „Reflection —
> Krátka reflexia". Zdroj §1 reflexiu neobsahuje a v kóde sa neukládala, preto
> strana vypadla. Ak ju autor chce, patrí do plánu ako 4/5 s perzistenciou.

---

## Deň 2: Co dovednosti

Zdroj §2. Intro + 3 dovednosti, z každej si používateľ vyberá **min. 2 cvičenia**.

### Strana 1/5 — Co dovednosti — úvod (intro · chat)
- **Cieľ:** Predstaviť tri CO dovednosti a pozvať k praxi.
- **Obsah (verbatim):**
  - „Jedná se o dovednosti, které popisují *co vlastně dělám*, když praktikuji všímavost. Jedná se o tyto tři body:"
  - „**Pozorování** - jen si všímám toho, co se děje. To může být dech, tělesný pocit, myšlenka nebo něco kolem mě. Nehodnotím to, jen to zaznamenám, jako bych byl třeba fotograf."
  - „**Popisování** - když si něčeho všimnu, dám tomu slova. Například: „Teď cítím napětí v ramenou." nebo „Objevila se myšlenka, že to nezvládnu." Dávání slov pomáhá získat odstup a vyjasnit si, co se děje."
  - „**Participace** - když něco dělám, snažím se být do toho naplno ponořený. Ne napůl myslet na něco jiného, ale věnovat pozornost aktivitě, ve které právě jsem."
  - „CO dovednosti jsou tedy tři: pozorování, popisování a participace. Pojďme si to teď prakticky vyzkoušet."
- **Funkčné:** Len čítanie; tlačidlo „Pojďme to zkusit" (kontextový label namiesto „Pokračovat").
- **UX / vizuál:** Chat: bublina s úvodom → 3 × `ChatConceptCard` (badge „1/3 CO", „2/3 CO", „3/3 CO") → záverečná bublina. Zdroj tu žiada infografiku — tri concept karty za sebou v chate ju nahradia bez toho, aby sa text skracoval.
- **Používateľ / emočné:** Tri pojmy naraz sú maximum; chat ich oddelí do troch nádychov. Metafora fotografa je konkrétna — nechať ju verbatim.
- **Reuse vs nové:** `ChatDayPage`, `ChatConceptCard`. Dnes: `SkillsIntroPage` (FeatureCard).
- **Otvorené otázky:** Zdroj má „(Infografika)" — má sa dokresliť skutočná grafika, alebo stačia concept karty?

### Strana 2/5 — Pozorování (skill · prax)
- **Cieľ:** Vybrať si min. 2 z 9 cvičení na pozorovanie.
- **Obsah (verbatim):** Edukácia = definícia pozorovania (viď strana 1). Pokyn: „Vyber si alespoň dvě krátká cvičení z nabídky pro trénink pozorování. Nemusí to být dnes. Úplně stačí kdykoliv během dnešního dne." Zoznam **9 položiek** verbatim: Očima · Ušima · Čichem · Chuť · Tělem · Dotek · Napětí · Dech · Myšlenky (plné znenie v `day2_content.dart`, prevzaté zo §2).
- **Funkčné:** Zaškrtávací zoznam, výber sa ukladá pri „Pokračovat" cez `BpdChallengesDao(week 2, day 2, section 'pozorovani')`; pri návrate sa predvyplní. Minimum **nie je vynucované** (dobrovoľnosť) — počítadlo len informuje.
- **UX / vizuál:** `SectionHeader` (ikona oko) + „Co dovednost 1/3", pokyn tučne, `PickCounterHint` („Vybráno 2 z minimálně 2"), 9 × `SelectableExerciseTile` s ikonou a popisom. 9 položiek s dlhými popismi = dlhý scroll; to je v poriadku (radšej scroll než skrátený text), ale počítadlo musí byť **nad** zoznamom, aby bolo vidno bez scrollu.
- **Používateľ / emočné:** „Nemusí to být dnes" je dôležitá veta — znižuje tlak, patrí vizuálne k pokynu, nie do drobného textu. Zaškrtnutie dáva pocit voľby, nie povinnosti; nič sa nedeje, keď si nevyberie nič.
- **Reuse vs nové:** `SkillPracticePage` (hotové), `SelectableExerciseTile`, `PickCounterHint`.
- **Otvorené otázky:** Má sa počítadlo pri splnení 2/2 nejako odmeniť (mikroanimácia), alebo stačí zmena farby?

### Strana 3/5 — Popisování (skill · prax)
- **Cieľ:** Vybrať si min. 2 z 5 cvičení na popisovanie.
- **Obsah (verbatim):** Pokyn: „Během dneška si vyzkoušíme i popisování. Zkus si vybrat minimálně dvě cvičení z nabídky:" Zoznam **5**: Popisuj okolí · Popisuj řeč a chování · Popisuj emoce · Popisuj myšlenky · Popisuj dech.
- **Funkčné:** Ako 2/5, `section 'popisovani'`.
- **UX / vizuál:** Identický layout ako 2/5 (ikona bubliny). Konzistencia medzi tromi stranami je zámer — používateľ sa učí jeden vzor a ďalej ho už len používa.
- **Používateľ / emočné:** Cvičenia obsahujú príklady vo vnútri („Cítím vztek") — ponechať v popise, sú to opory, nie balast.
- **Reuse vs nové:** `SkillPracticePage`.
- **Otvorené otázky:** —

### Strana 4/5 — Participace (skill · prax)
- **Cieľ:** Vybrať si min. 2 zo 6 cvičení na participáciu.
- **Obsah (verbatim):** Pokyn: „I u této dovednosti pro sebe na dnešní den vyber minimálně dvě cvičení, která vyzkoušíš:" Zoznam **6**: Zapojení se u běžných aktivit · Prožij spojení s okolím · Hudba a pohyb · Aktivity s druhými · Tělesné aktivity · Slova a dech.
- **Funkčné:** Ako 2/5, `section 'participace'`.
- **UX / vizuál:** Identický layout. Ikony volené na aktivitu (hudba, ľudia, beh) — pomáhajú skenovať zoznam očami.
- **Používateľ / emočné:** Najnižší vstupný prah z troch dovedností („čistíš zuby") — dobré miesto na uistenie, že všímavost nie je meditácia na podložke.
- **Reuse vs nové:** `SkillPracticePage`.
- **Otvorené otázky:** —

### Strana 5/5 — Completion (completion · štandard)
- **Obsah:** Zhrnutie + teaser „Jak dovednosti".
- **UX / vizuál + reuse:** `DayCompletionPage`, ako Deň 1 4/4.

---

## Deň 3: Jak dovednosti

Zdroj §3. Rovnaká kostra ako Deň 2 — zámerne, je to „druhá polovica" tej istej
dovednosti. Dve strany majú navyše obsah pod zoznamom.

### Strana 1/5 — Jak dovednosti — úvod (intro · chat)
- **Cieľ:** Predstaviť tri JAK dovednosti.
- **Obsah (verbatim):**
  - „Jsou to způsoby, *jak vykonávat dříve zmíněné dovednosti.*"
  - „Jak to teda dle DBT dělat? Jednomyslně, bez hodnocení a efektivně. Ale co je tím myšleno?"
  - „**Jednomyslně** - Buď plně přítomný a dělej vždy jen jednu věc najednou, soustřeď se na aktuální moment a úkol, aniž bys byl/a rozptylován/a minulostí nebo budoucností."
  - „**Bez hodnocení** - Sleduj své myšlenky, pocity a prožitky neutrálně, bez snahy je hodnotit jako dobré nebo špatné, správné či nesprávné."
  - „**Efektivně** - Soustřeď se na to, co je potřeba k dosažení cíle v dané situaci, místo aby tě ovládaly emoce nebo tvrdohlavost."
- **Funkčné:** Len čítanie.
- **UX / vizuál:** Chat, 3 × `ChatConceptCard` (badge „1/3 JAK"…). Otázka „Ale co je tím myšleno?" je rečnícka — nechať ako samostatnú bublinu tesne pred kartami, funguje ako cliffhanger.
- **Používateľ / emočné:** Nadväznosť na včera („dříve zmíněné") — pripomenúť, že to nie je nová záťaž, ale nadstavba.
- **Reuse vs nové:** `ChatDayPage`, `ChatConceptCard`. Dnes: `SkillsIntroPage`.
- **Otvorené otázky:** Zdroj má „(Infografika)" aj tu — rovnaká otázka ako Deň 2.

### Strana 2/5 — Jednomyslně (skill · prax)
- **Obsah (verbatim):** Pokyn: „Podobně jako včera si v praxi vyzkoušíme všechny „jak" dovednosti. Vyber si z následující nabídky tréninku dovednosti vnímat jednomyslně:" Zoznam **6**: příprava čaje/kávy · mytí nádobí · umývání rukou · úklid · koupel · meditace („jedna" na každý nádech).
- **Funkčné:** `section 'jednomyslne'`. Pozn.: zdroj tu neuvádza „minimálně dvě" — pokyn je „vyber si z nabídky". Počítadlo preto ukazuje minimum 2 kvôli konzistencii s ostatnými stranami; ak to autor chce inak, viď OQ-3.
- **UX / vizuál:** Ako Deň 2. Všetkých 6 cvičení sú bežné domáce činnosti — ikony domácnosti (konvica, vodovod, vana) robia zo zoznamu „môj deň", nie „cvičebný plán".
- **Používateľ / emočné:** Silná správa: všímavost sa dá robiť pri umývaní nádobia. Nič naviac netreba dodávať.
- **Reuse vs nové:** `SkillPracticePage`.
- **Otvorené otázky:** OQ-3 (minimum 2 vs. „vyber si").

### Strana 3/5 — Bez hodnocení (skill · prax + príkladové páry)
- **Obsah (verbatim):** Pokyn: „Zkus si vybrat minimálně dvě cvičení odsud a dnes je vyzkoušej:" Zoznam **7** (všimni si hodnotící myšlenku · počítej je · popiš jen fakta · emoce bez nálepek · změň tón a postoj · vyprávěj den jako fakta · napiš popis situace). **Pod zoznamom 3 páry** „Bez hodnocení může vypadat třeba takto": „Jsem úplný neschopný idiot, zase jsem to zkazil." → „Udělal jsem v tom úkolu tři chyby, protože jsem byl unavený." · „Je hrozné a trapné, že se takhle bojím mluvit před lidmi." → „Cítím, jak se mi klepou ruce a srdce mi buší rychleji, když mám začít mluvit." · „Můj spolužák je sebecký arogantní kretén." → „Spolužák mi dnes ráno neodpověděl na pozdrav."
- **Funkčné:** `section 'bez_hodnoceni'`; páry sú statické (footer strany), bez interakcie.
- **UX / vizuál:** Zoznam + `NonJudgmentalExamples` — každý pár v jednej karte, hore červený krúžok ✕ „Hodnotící", dole zelený ✓ „Bez hodnocení", text v kurzíve v úvodzovkách. Farba **nikdy nie jediný nosič významu** — preto ikona ✕/✓ aj slovný label.
- **Používateľ / emočné:** Najcitlivejšia strana týždňa: prvý pár je sebaznevažujúca veta, ktorú si používateľ môže povedať dennodenne. Preto páry patria **pod** cvičenia (najprv „čo môžem robiť", až potom „ako to vyzerá"), aby strana nezačínala nadávkou. Zelená veta musí byť vždy vizuálne rovnocenná, nie „správna odpoveď".
- **Reuse vs nové:** `SkillPracticePage` + `footer:` `NonJudgmentalExamples` (hotové).
- **Otvorené otázky:** —

### Strana 4/5 — Efektivně (skill · prax + SMART)
- **Obsah (verbatim):** „Zkus se zaměřit na to, jestli je tvoje chování efektivní vůči SMART cílům, co jsme spolu nastavili na začátku programu." Pokyn: „Nakonec si vyber minimálně dvě aktivity odsud:" Zoznam **4**: „Je to, co chci udělat, opravdu účinné?" · pusť potřebu mít pravdu · „Pomáhá mi to teď?" · zkus, co funguje.
- **Funkčné:** `section 'efektivne'`; `SmartGoalReminder` načíta najnovší cieľ z `BpdSmartGoalsDao` (T1 Deň 1) a zobrazí jeho `specific`; ak cieľ nie je, tlačidlo „Nastavit SMART cíl" → `MyGoalsRoute`. Edge-case: žiadny cieľ = karta sa stále zobrazí (s výzvou), nezmizne.
- **UX / vizuál:** Zoznam + karta „Tvůj SMART cíl" v primary tinte s ikonou terča, vnútri biely box s vlastným textom cieľa. Vlastné slová používateľa v jeho vlastnom cieli sú najsilnejší prvok strany — preto biely box a bold.
- **Používateľ / emočné:** Prvé prepojenie naprieč týždňami — „pamätáme si, čo si si dal za cieľ". Zvyšuje pocit kontinuity programu.
- **Reuse vs nové:** `SkillPracticePage` + `footer:` `SmartGoalReminder` (hotové).
- **Otvorené otázky:** Ak má používateľ viac cieľov, zobraziť najnovší (teraz) alebo všetky?

### Strana 5/5 — Completion (completion · štandard)
- **Obsah (verbatim):** „Včera a dnes jsme se naučili základy pro všímavost. Zkus zítra být všímavý alespoň v jedné situaci (např. při snídani, procházce, poslechu hudby) a snaž uplatnit všechny co i jak dovednosti."
- **Funkčné:** `markDayCompleted(2, 3)`; teaser „Všímavé dýchání".
- **UX / vizuál:** `DayCompletionPage`, zadanie na zajtra v summary texte.
- **Používateľ / emočné:** Zadanie je „alespoň v jedné situaci" — malé a splniteľné.
- **Otvorené otázky:** Zdroj má „snaž uplatnit" (chýba „se") — ponechané verbatim, na rozhodnutie autora.

---

## Deň 4: Všímavé dýchání

Zdroj §4. **Menu, nie walkthrough** — zdroj hovorí „Teď si můžeš vybrat z
několika možností dechových cvičení". Plus notifikácia, ktorú §3 zavádza od 4. dňa.

### Strana 1/3 — Nabídka dechových cvičení (menu)
- **Cieľ:** Vysvetliť, načo je všímavé dýchanie, a nechať vybrať jedno cvičenie.
- **Obsah (verbatim):**
  - „Pojďme se dnes krátce zaměřit na všímavé dýchání. To nám pomáhá zastavit se a ukotvit v přítomném okamžiku. Díky soustředění na dech si můžeme všimnout, co se v nás děje, a lépe zvládat stres nebo silné emoce."
  - „Všímavé dýchání může zklidnit tělo a mysl, snížit impulzivní reakce a podporuje sebeovládání."
  - „Teď si můžeš vybrat z několika možností dechových cvičení:" → **Všímavé dýchání** · **Dýchání do čtverce** · **Dýchání 7-11** (plné popisy v `day4_content.dart`)
  - „Ke zbylým cvičením se můžeš kdykoliv vrátit nebo si je uložit do záchranného balíčku."
- **Funkčné:** Tap na kartu → detail sheet (nižšie). Karty nie sú zaškrtávacie — je to rozcestník, nie zoznam úloh. „Pokračovat" je vždy aktívne (nič nie je povinné).
- **UX / vizuál:** Nadpis + dátumový label „Den 4 · Týden 2", 2 odstavce, pokyn tučne, 3 karty s ikonou + jednoriadkovým popisom + `›`. Záverečná veta o balíčku v `InfoBox` s ikonou lekárničky — je to pozvánka, nie inštrukcia.
- **Používateľ / emočné:** Voľba > povinnosť. Jednoriadkové popisy („Nádech 4 – zádrž 4 – výdech 4 – zádrž 4") umožnia vybrať bez otvárania detailu.
- **Reuse vs nové:** `TechniqueMenuPage` (hotové).
- **Otvorené otázky:** —

### Detail sheet — jedno dechové cvičení (komponenta, zdieľaná s Dňom 6)
- **Cieľ:** Dať plný popis cvičenia a tri možné akcie.
- **Obsah (verbatim):** Plné znenie daného cvičenia zo §4 + „Pro zájemce vedené dýchání skrze video:" / „Pro zájemce proklik na video:".
- **Funkčné:** (1) **Spustit dechové cvičení** → `BreathingGameRoute(shape, preset)` — existujúca hra appky, `circle`/`square` + preset `box`/`7-11`; (2) **video** → `launchUrLink` externe; (3) **Uložit do záchranného balíčku** → `BpdRescuePackageDao.toggle`, tlačidlo prepne na „V záchranném balíčku". Sheet sa pri spustení hry zatvorí (router sa berie pred `pop`).
- **UX / vizuál:** Bottom sheet, max 85 % výšky, drag handle, ikona + názov, odstavce, potom akcie v poradí **hra → video → uložit** (od najviac aktívnej k pasívnej). Hra je plný primary button, video a uložit sú outlined — hierarchia hovorí „najlepšie si to teraz skús".
- **Používateľ / emočné:** Kľúčové, že cvičenie je **hneď spustiteľné** v appke — nie „prečítaj si a niekedy skús". Uloženie do balíčka rieši „teraz nie, ale chcem si to nechať".
- **Reuse vs nové:** `showTechniqueDetailSheet` + `RescueSaveButton` + `ExternalLinkButton` (hotové); reuse existujúcej `BreathingGameScreen`.
- **Otvorené otázky:** Má sa po dokončení dychovej hry používateľ vrátiť do dňa, alebo zostať v hre?

### Strana 2/3 — Čas na všímavost (notifikácia · štandard)
- **Cieľ:** Ponúknuť dennú pripomienku, ktorú §3 zavádza „od 4. dne".
- **Obsah (verbatim):** Notifikácia: „Čas na všímavost - věnuj teď tři minuty všímavosti. Nezapomeň *co* a *jak*" — každý deň do konca modulu.
- **Funkčné:** Switch zap/vyp + výber času (default 17:00). Zapnutie: `requestPermissionIfNeeded()` → ak zamietnuté, snackbar a switch zostane vypnutý; inak `enableMindfulnessReminder(l10n, time)`. Stav sa načíta z `UserSettingsDao`, takže pri návrate ukazuje realitu. Vypnutie kedykoľvek aj v nastaveniach.
- **UX / vizuál:** `SectionHeader` (zvonček), vysvetlenie, **náhľad notifikácie** v primary tinte (titulok „Čas na všímavost" + telo) — používateľ vidí presne to, čo mu príde. Pod tým switch a riadok s časom.
- **Používateľ / emočné:** **Opt-in, nie automat.** Tichý denný push do appky prvej psychickej pomoci by bol prekvapenie; navyše systém aj tak žiada povolenie. Náhľad odstraňuje neistotu „čo mi to bude posielať".
- **Reuse vs nové:** Nový `ReminderPage` (hotový); `NotificationsService`.
- **Otvorené otázky:** OQ-4 — zdroj chce „2× týždenne v ďalších moduloch". Neimplementované (nemá čo spustiť). Kto/čo určí koniec modulu?

### Strana 3/3 — Completion (completion · štandard)
- **Obsah:** Zhrnutie + teaser „Pauza".
- **Reuse:** `DayCompletionPage`.

---

## Deň 5: Pauza — 🔁 reuse

- **Zdroj (verbatim §5):** „Dnešek bude ve znamení pauzy od programu. Už teď máš za sebou spoustu skvělé práce a Tvůj přístup je inspirativní! Využij dnešní den k regeneraci a načerpej síly na další kroky. Pouze notifikace „Čas být mindfull" a Záznam nálady"
- **Funkčné:** `DayPauseScreen(weekNumber, dayNumber)` — jediná akcia je **Zaznamenat náladu** → `MoodPickerRoute`; potom „Označit jako splněné" → `markDayCompleted`.
- **UX / vizuál:** Existujúca šablóna (meditujúca ilustrácia, nadpis, text, tip karta). Doplnené tlačidlo záznamu nálady nad tip kartu.
- **Používateľ / emočné:** Deň bez úlohy musí **naozaj** vyzerať ako pauza — jedno tlačidlo, žiadny obsah na čítanie. Ilustrácia nesie stranu.
- **Otvorené otázky:** Notifikáciu „Čas být mindfull" pokrýva denná pripomienka z Dňa 4 — netreba druhú. Potvrdiť.

---

## Deň 6: Techniky všímavosti

Zdroj §6. **Pick one** — „Můžeš si vybrat jedno cvičení z nabídky, které dnes vyzkoušíš."

### Strana 1/2 — Nabídka technik (menu)
- **Obsah (verbatim):** „Dnes rozšíříme naši znalost všímavých technik." + pokyn + **5 techník**: Skenování těla (+ video) · Všímavá chůze · Všímavé jezení · Všímavé naslouchání · Všech pět pohromadě.
- **Funkčné:** Tap → rovnaký detail sheet ako Deň 4 (bez dychovej hry, len video kde je + uloženie). `sourceLabel` „Techniky všímavosti" pre badge v balíčku.
- **UX / vizuál:** Identický vzor ako Deň 4 strana 1/3 — používateľ pozná gesto z predvčera. Ikony podľa telesnej modality (telo, chôdza, jedlo, sluch, iskra pre 5 zmyslov).
- **Používateľ / emočné:** „Zbytek si můžeš nechat na jindy" je explicitné povolenie neurobiť všetko — kľúčové pri 5 možnostiach.
- **Reuse vs nové:** `TechniqueMenuPage` (hotové).
- **Otvorené otázky:** —

### Strana 2/2 — Completion (completion · štandard)
- **Obsah:** Zhrnutie + teaser „Shrnutí týdne".
- **Reuse:** `DayCompletionPage`.

> **Pozn.:** Stitch mal pre Deň 6 navrhnutých 7 strán (každá technika vlastná
> strana, generované 2026-04-19). Menu ich nahrádza — tie návrhy sú mimo hry.

---

## Deň 7: Shrnutí týdne

Zdroj §7. Recap → 4 otázky → gratulácia.

### Strana 1/3 — Co jsme prošli (recap · chat)
- **Cieľ:** Pripomenúť obsah týždňa pred reflexiou.
- **Obsah (verbatim):** „Máme za sebou druhý týden, který byl zaměřený na všímavost." + prehľad 5 tém týždňa (co je všímavost · Co dovednosti · Jak dovednosti · všímavé dýchání · techniky).
- **Funkčné:** Len čítanie.
- **UX / vizuál:** Chat: bublina + `ChatNumberedList` piatich tém. Pripomenutie pred písaním je funkčné — bez neho si používateľ na otázku „co ses naučil/a?" nemusí spomenúť.
- **Používateľ / emočné:** „Máme za sebou" — spoločné, nie „zvládol si test".
- **Reuse vs nové:** `ChatDayPage`, `ChatNumberedList`. Dnes: `Week2RecapPage` (FeatureCard).
- **Otvorené otázky:** —

### Strana 2/3 — Reflexe týdne (reflection · štandard)
- **Obsah (verbatim), 4 otázky:** „Zkus se zamyslet, co pro tebe bylo nejzajímavější? Co ses naučil/a?" · „Použil/a jsi něco z toho, co ses naučil/a ve Tvém životě? Co a kdy?" · „Kdy Ti technika všímavost pomohla?" · „Kdy konkrétně bys tuto dovednost mohl/a využít v dalším týdnu?"
- **Funkčné:** 4 multiline polia; ukladajú sa pri dokončení dňa cez `BpdReflectionDao(week 2)`; pri návrate sa predvyplnia. Prázdne polia povolené.
- **UX / vizuál:** `SectionHeader` (pero) + veta „odpovědi zůstanou uložené, můžeš se k nim vrátit" + `ReflectionQuestionList` (otázka bold, pod ňou 2–3 riadkové pole).
- **Používateľ / emočné:** Štyri otvorené otázky sú veľa — preto explicitné „nemusíš teď všechno" cez informáciu o uložení. Žiadna validácia, žiadne „povinné".
- **Reuse vs nové:** `ReflectionQuestionList`, `ReflectionField` (hotové).
- **Otvorené otázky:** Ukladať priebežne (onChange) alebo len pri dokončení? Teraz pri dokončení.

### Strana 3/3 — Týden dokončen (completion · štandard)
- **Obsah:** Gratulácia k druhému týždňu + ocenenie vytrvalosti.
- **Funkčné:** Uloží reflexiu, `markDayCompleted(2, 7)`, `pop()`.
- **UX / vizuál:** `WeekCompletionPage` — celebračná ikona so success odznakom, „TÝDEN 2 DOKONČEN", „Gratulujeme!", text. Zhodné s T1 Dňom 7.
- **Používateľ / emočné:** Míľnik, nie len „ďalší deň hotový".
- **Reuse vs nové:** `WeekCompletionPage` (hotové).
- **Otvorené otázky:** —

---

## Súhrnné UX rozhodnutia pre týždeň

- **Dve šablóny podľa funkcie:** edukácia = chat feed, prax = karty/menu. Viď „Hlavný návrh".
- **Verbatim copy** — žiadne cvičenie ani veta zo `source/` nesmie vypadnúť; radšej dlhší scroll (Deň 2 strana 2/5 má 9 cvičení s plnými popismi).
- **Dobrovoľnosť je vizuálna, nie len textová:** minimum výberu sa nikde nevynucuje, „Pokračovat" je vždy aktívne, počítadlo informuje a neblokuje.
- **Jeden vzor výberu na celý týždeň:** `SelectableExerciseTile` (zaškrtávacie, Dni 2–3) vs. karta s `›` (rozcestník, Dni 4, 6) — dva rôzne tvary pre dve rôzne významy, nikdy zamiešané.
- **Perzistencia všade, kde používateľ niečo vloží:** výbery (`BpdChallengesDao` + section), reflexia (`BpdReflectionDao`), balíček (`BpdRescuePackageDao`), notifikácia (`UserSettingsDao`). Žiadny vstup sa nesmie stratiť pri zatvorení dňa.
- **Farba nikdy sama:** ✕/✓ páry na Dni 3 majú ikonu aj slovný label; vybrané dlaždice majú fajku aj rám.
- **Brand fialová vždy z theme** (`Theme.of(context).primaryColor`) — nikde hardcoded.

## Otvorené rozhodnutia pre používateľa

- **OQ-1 (hlavné):** Prerobiť 6 edukačných strán na chat šablónu (Deň 1 strany 1–3, Deň 2 intro, Deň 3 intro, Deň 7 recap)? Je to rework už hotového kódu, ale zjednotí to tón s týždňom 1. **Odporúčam áno** — nekonzistentný tón medzi týždňami je najviditeľnejšia chyba, ktorú týždeň 2 dnes má.
- **OQ-2:** Zdroj má u Dní 2 a 3 „(Infografika)" — dokresliť skutočnú infografiku, alebo sú concept karty v chate dostatočné?
- **OQ-3:** Deň 3 strana 2/5 (Jednomyslně): zdroj nepíše „minimálně dvě", len „vyber si z nabídky". Zjednotiť na 2 (ako teraz), alebo nechať bez minima?
- **OQ-4:** Kto určí „koniec modulu všímavosti" pre zníženie notifikácie na 2×/týždeň? Bez toho sa to nedá implementovať.
- **OQ-5:** Stitch návrhy, ktoré tento plán ruší: Deň 1 strana 4/5 „Reflection", Deň 4 strany 2–5, Deň 6 strany 1–7. Potvrdiť, že sa nebudú implementovať.
- **OQ-6:** `docs/hpo/source/tyzden-2.md` má dva pravdepodobné preklepy: „Zkus to jen pozorovat, abys hned jednal/a" (chýba „aniž") a „snaž uplatnit" (chýba „se"). V kóde je prvý opravený. Potvrdiť alebo vrátiť.
