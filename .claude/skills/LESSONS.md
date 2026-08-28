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
- [applied] (2026-08-04, seen ×1) plan-screens: plán vie vzniknúť aj **po** implementácii (týždeň 2 sa najprv nakódil, plán dorobil). V tom prípade musí plán popisovať realitu kódu a v tracking-u byť poznámka, že mockupy slúžia na review, nie ako zadanie — inak čitateľ predpokladá opačné poradie. Doplnené do `WEEK2_SCREEN_PLAN.md` + `week2/TRACKING.md`.
- [applied] (2026-08-06, seen ×1) plan-screens: zdrojové .md z Google Docs môžu mať **vložený obrázok ako base64** — týždeň 3 mal na jednom riadku 105 kB dát, čo je 107k tokenov a súbor sa nedá prečítať. → Postup: `awk` na dĺžky riadkov nájde blob, `base64 -d` ho vyexportuje do PNG (`.claude/design/week<N>/`), do `source/tyzden-<N>.md` sa uloží len text + HTML komentár s odkazom na obrázok. Zapísané aj v `WEEK3_SCREEN_PLAN.md` → Aktíva.
- [open] (2026-08-06, seen ×1) plan-screens: pri týždni 3 vyšlo, že **obsah nemusí byť kompletný** — Deň 4 bez cvičenia, Deň 5 jedna veta, chýbajúce completion vety, worksheet bez príkladu. Plán to zvládol zapísať ako OQ, ale skill nikde nehovorí, že má existovať výstup „čo treba doplniť od autora". → Pridať do kroku 5 (Informuj používateľa) povinnú sekciu „Chýbajúci obsah pre autora" a do TODO.md task typu `W<N>-01`.
- [applied] (2026-08-04 → 2026-08-06, seen ×2) plan-screens: šablóna plánu nemá pole pre **zdieľané komponenty medzi dňami** (detail sheet Dní 4+6; v týždni 3 worksheet Dní 2+3). → **Aplikované:** `WEEK3_SCREEN_PLAN.md` má sekciu „Zdieľané komponenty týždňa" s tabuľkou komponenta / použitie / reuse?, a `TRACKING.md` zrkadlí zoznam nových komponentov. Doplniť ešte do šablóny v `plan-screens/SKILL.md`.

### plan-screens — dodatok z týždňa 4
- [applied] (2026-08-06 → 2026-08-12, seen ×2) plan-screens: OPEN lekcia o „chýbajúcom obsahu pre autora" sa **potvrdila druhýkrát** — týždeň 4 má 8 vecí, ktoré musí rozhodnúť autorka (chýbajúce completion vety, sľúbené „tři dovednosti" pri dvoch uvedených, nesúlad písmen UZNÁVÁM, preklepy). → Plán má teraz povinnú sekciu „Chýbajúci obsah pre autorku" a tabuľku OQ s odporúčaním pri každej otázke; task `W4-01`. Do `plan-screens/SKILL.md` krok 5 to ešte treba dopísať ako povinný výstup.
- [applied] (2026-08-12, seen ×1) plan-screens: **kontrola „zmestí sa text do existujúcej dátovej štruktúry?" chýbala v skille úplne.** Týždeň 4 má dva pauzové dni s **rôznym** textom, kým `DayPauseScreen._pauseCopy` je `Map<int, String>` kľúčovaný týždňom — Deň 6 by bol potichu zobrazil text Dňa 3 a jeden autorkin odstavec by nikto nikdy nevidel. Nájdené len tým, že som si otvoril widget, nie z plánu. → Pri plánovaní každého 🔁 reuse dňa **otvor cieľový widget a over, že jeho parametrizácia pokryje tento týždeň**; ak nie, zapíš to ako task (tu `W4-02`).
- [applied] (2026-08-12, seen ×1) plan-screens: pri akronymoch (STOP/TIPS/UZNÁVÁM) som skoro navrhol nový `AcronymCard` — `NumberedBenefit.number` je pritom `String`, takže `number: 'S'` funguje bez zmeny. Potvrdzuje lekciu z týždňa 3 („nový komponent len keď sa líši chovaním, nie vzhľadom"), tentoraz zachytenú **pred** napísaním kódu.
- [open] (2026-08-12, seen ×1) plan-screens: skill nemá nič o **bezpečnosti telesných techník**. Týždeň 4 pýta ponorenie tváre do studenej vody so zadržaním dychu a 30 drepov — appka má modul PPP aj sebapoškodzovania, takže časť publika má kontraindikácie. Hľadisko „Používateľ / emočné" hovorí o tóne a krízových kontaktoch, nie o zdravotnom riziku cvičenia. → Doplniť do kroku 2 štvrtého hľadiska otázku „má toto cvičenie kontraindikácie pre publikum appky?" a ak áno, eskalovať autorovi (nikdy neprepisovať odborný text sám).

### design-screen
- [applied] (2026-07-08 → 2026-08-04, seen ×2) design-screen+plan-screens: pribudli schválené šablóny "chat" (jednosmerný feed) a "skill tree" — tokeny v `DESIGN_PROMPTS.md` → "Koncept komponenty", hotové Flutter widgety (`widgets/chat/`, `widgets/skill_tree.dart`). → **Aplikované 2026-08-04:** `WEEK2_SCREEN_PLAN.md` má pole **Typ obrazovky** (chat/prax/menu/štandard) v prehľade aj u každej strany a sekciu „Hlavný návrh" s pravidlom *edukácia = chat, prax = karty/menu*. Zostáva doplniť vetvenie šablón do samotného `design-screen` SKILL.md kroku 3.
- [applied] (2026-08-04, seen ×1) design-screen: skill predpisuje `mcp__Claude_Preview__preview_*`, tie v prostredí nie sú — funguje `mcp__Claude_Browser__preview_start` s konfiguráciou z `.claude/launch.json` (pridaná `week2-mockups`, port 8098). Screenshot navyše zlyhá („Browser pane is not displayed"), keď panel nie je otvorený → na overenie stačí `get_page_text`/`read_page`. Nadväzuje na lekciu z 2026-06-19 o `preview_start`.
- [applied] (2026-08-12, seen ×1) design-screen: skill kreslí **jednu stranu za beh** (prvú ❌), čo pri 19-stranovom týždni znamená 19 behov a hromadu takmer identických súborov. Týždeň 4 sa nakreslil ako **6 reprezentatívnych strán + `index.html`, ktorý pri každej nenakreslenej strane hovorí prečo** (rovnaký vzor ako iná strana / nezmenený widget). → Do TRACKING legendy pridaný stav `➖ zámerne bez mockupu`. Doplniť do SKILL.md kroku 1, že sa vyberá *reprezentatívna* strana, nie mechanicky prvá ❌.
- [applied] (2026-08-12, seen ×1) design-screen: mockupy týždňa 2 majú **chat appbar s avatarom a menom „Nepanikař"**, ktorý appka nikdy nedostala — reálne renderuje `DayFlowHeader` (✕ + segmenty + n/N). Mockup, ktorý sa rozchádza s appkou, posiela autorku hodnotiť neexistujúce UI. → Týždeň 4 kreslí hlavičku a karty podľa **overeného stavu appky** (screenshoty zo zariadenia 2026-08-12) a `_shared.css` to má v komentári.
- [applied] (2026-08-12, seen ×1) design-screen: verbatim vernosť sa dá **overiť skriptom, nie okom** — `scratchpad/verify_w4_verbatim.py` porovná každú vetu z mockupu proti `source/tyzden-<n>.md` znak po znaku a zároveň skontroluje, že vety označené ako „naše" v zdroji **naozaj nie sú**. Zachytilo by to aj tichú opravu preklepu. Odporúčam robiť to pri každom týždni.
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

### Runtime verification (spustenie na zariadení)
- [applied] (2026-08-06 → 2026-08-12, seen ×2) verification: povinný krok „prejdi týždeň na zariadení" sa **osvedčil aj opačne** — týždne 1, 3 a 4 sa prešli celé a nenašiel sa ani jeden defekt. Rozdiel oproti týždňu 2: tam sa autosave, rollup a notifikácie písali prvýkrát, tu sa už len reusoval overený kód. → Prechod má najväčšiu hodnotu tam, kde vzniká **nová infraštruktúra**, nie nový obsah; pri čisto obsahovom týždni stačí prejsť nové komponenty a perzistenciu.
- [applied] (2026-08-12, seen ×1) verification: čítať screenshot po každom kroku je drahé. Pri sweepe „otvorí sa každý deň?" stačí `adb logcat -c`, preklikať dni a potom `grep -iE "E/flutter|exception|RenderFlex|overflowed"` — chytí pády aj overflow bez toho, aby som pozeral päť obrázkov. Screenshoty si nechaj na miesta, kde overuješ **obsah alebo rozloženie**.
- [applied] (2026-08-12, seen ×1) verification: čerstvo nabootovaný emulátor vie appku držať na splash screene aj minútu a Android k tomu hodí „System UI isn't responding". Nie je to defekt appky — over `adb shell ps | grep <pkg>` a `dumpsys activity | grep ResumedActivity` **pred** tým, než to nahlásiš ako zamrznutie.
- [open] (2026-08-06, seen ×1) verification: **audit čítaním kódu nechytil 5 defektov, ktoré vypadli až pri prejdení appky na emulátore** — reflexia Dňa 7 sa ukladala len na poslednej strane (a rovnako v týždni 1), notifikačné povolenie končilo mŕtvym switchom, countdown „Ďalšia lekcia sa odomkne o" bol hardcoded `Duration(18:42:05)`, `activeColor: primaryColor` spravil palec switchu neviditeľným, a `markWeekCompleted` sa nevolalo z nikoho, takže strom týždňov sa nikdy neposunul. → Pipeline potrebuje po `implement-screen` povinný krok „prejdi celý týždeň na zariadení", nie len `dart analyze`. Kritériá: každý deň otvoriť, každé pole vyplniť a odísť **bez** dokončenia, dokončiť **všetky** dni a skontrolovať agregovaný progres.
- [applied] (2026-08-06, seen ×1) verification: „otestované" nesmie znamenať „otestované rizikové body". Pri prvom reporte som mal prejdenú ~1/3 obrazoviek (6 z 22) a Deň 6 — práve ten, ktorého route som opravoval — nebol spustený ani raz. → Vždy vymenovať, čo **nebolo** spustené, ešte pred zoznamom toho, čo prešlo.

### implement-screen — dodatok z týždňa 3
- [applied] (2026-08-06, seen ×1) implement-screen: **plán môže mať vecné chyby v počtoch a v tom, čo v zdroji je** — `WEEK3_SCREEN_PLAN.md` tvrdil 22 mýtov (sú 20), 11 polí worksheetu Dňa 3 (je 10) a že príklad k mýtom treba vymyslieť (autorka ich napísala všetkých 20). → Pred kódovaním dňa **prečítaj zdrojovú sekciu celú a prepočítaj položky**, plán ber ako návrh štruktúry, nie ako inventár obsahu. Doplnené do `week3/TRACKING.md` → „Rozdiely oproti pôvodnému plánu".
- [applied] (2026-08-06, seen ×1) implement-screen: plán navrhol tri nové komponenty (`MythBusterCard`, `SentenceStemFields`, timeline `NumberedBenefit`), z ktorých **ani jeden nebol potrebný** — mýty aj vetné rámce sú štrukturálne „tvrdenie + pole + príklad", teda worksheet s iným vizuálom (`WorksheetSectionStyle`). Tri perzistencie by sa zmenili na jednu. → Pri návrhu komponenty sa najprv spýtaj, či to nie je existujúci komponent s iným štýlom; nový komponent zakladaj len keď sa líši **chovaním**, nie vzhľadom.
- [open] (2026-08-06, seen ×1) implement-screen: reuse vzoru z iného týždňa často znamená, že vzor je **privátny v tom týždni** (SPOKO recall bol `_RevealCard` + `_areas` v `week1/day7_reflection/recall_page.dart`). Vytiahnutie do `widgets/` je správne, ale znamená úpravu už „hotového" týždňa. → Zvážiť, či pri implementácii týždňa N nemá byť samostatný krok „extrahuj vzory, ktoré preberáš z týždňa <N-1", aby to nevyzeralo ako neplánovaný zásah.

### implement-screen — dodatok z prechodu W2 na chat
- [applied] (2026-08-12, seen ×1) implement-screen: pravidlo *edukácia = chat, prax = formulár* z `DESIGN_PROMPTS.md` bolo v pláne, ale v kóde nebolo dotiahnuté — týždeň 2 mal edukáciu ako scrollovacie strany, kým týždeň 3 už chat. → Pri prerábke platí **per-strana, nie per-deň**: Dni 2/3/4 majú chat len na edukačnej strane a pick-list/menu zostal formulárom; Deň 6 nedostal chat vôbec, lebo nič neučí. Pravidlo zapísané do `docs/hpo/implementation-spec.md` → „Which pages are chats", aby ďalší týždeň nemusel hádať.
- [applied] (2026-08-12, seen ×1) implement-screen: pri presune obsahu do chatu chýbali **list-tvarové správy** — chat mal len bublinu a jednopojmové karty, takže stack `FeatureCard`ov a blok „Chci vědět víc" (2 odkazy, `ChatConceptCard` zvládne 1) nemali ekvivalent. → Doplnené `ChatFeatureList` + `ChatLinksCard` do nového `widgets/chat/chat_lists.dart` (nie do `chat_messages.dart`, ten má už 568 riadkov). 4 miesta použitia hneď (W2 D1 ×2, D2, D3, D7).
- [applied] (2026-08-12, seen ×1) implement-screen: keď edukácia odíde z `TechniqueMenuPage` do chatu, jeho `leadParagraphs` je prázdny → parameter treba prehodiť z `required` na `= const []`, inak zostane volanie s prázdnym listom, ktoré vyzerá ako omyl. Overené na zariadení, že prázdny list nenechá dieru v layoute.
- [applied] (2026-08-12, seen ×1) implement-screen: mazanie nahradených strán narazí na `git rm` — súbory s **necommitnutými zmenami** vyžadujú `-f`, a novo pridané (netrackované) `git rm` nepozná vôbec (`pathspec did not match`) → treba `rm`. Pred `-f` over, že celý text z nich je prenesený (tu do `day1_content.dart`).

### implement-screen — dodatok z prechodu W1 na chat
- [applied] (2026-08-19, seen ×1) implement-screen: prerábka na chat sa v týždni 2 považovala za dokončenú, ale **týždeň 1 zostal na starom `DayPageBase`** a všimla si to až autorka. Chat mal len Deň 1, zvyšok týždňa nie. → Keď sa mení šablóna, sprav inventár **všetkých** týždňov naraz (grep na `DayPageBase` v `weeks/`), nielen toho, ktorý je práve v zadaní.
- [applied] (2026-08-19, seen ×1) implement-screen: pri presune copy do nového súboru **nepretypuj text, presuň string literály** — skopírovaním `static const` blokov je copy byte-identická a nehrozí tichý preklep v texte autorky. Kontrola: `git show HEAD:<starý_súbor>` vs nový súbor.
- [applied] (2026-08-19, seen ×1) implement-screen: interaktívny prvok nemusí znamenať formulár — `SpokoRecallList` (odkry klepnutím) a klikacia kontaktná karta idú do chatu ako `ChatRichMessage`. Rozhodujúce je, či sa **ukladá odpoveď**, nie či widget reaguje na dotyk. Zapísané do `implementation-spec.md` → „Which pages are chats".
- [applied] (2026-08-19, seen ×1) implement-screen: zlúčením dvoch edukačných strán do jedného chatu sa **mení `_totalPages`** — bez toho header ukazuje 1/4 a posledná strana je nedosiahnuteľná. Overené na zariadení, že Deň 2 ukazuje 1/3.
- [open] (2026-08-19, seen ×1) design: **„naša zelená" v palete neexistuje** — jediná zelená bola `success #6FD866` (práve tá, ktorú autorka označila za krikľavú) a v SVG assetoch nie je zelená vôbec (brand = fialová + tyrkysová). Navrhnutý `progressGreen #429464` je môj odhad, nie brand. → Pri požiadavke „daj tam našu <barvu>" najprv over, či tá barva v palete/assetoch existuje; ak nie, je to otázka na autora, nie implementačný detail. Vedené ako GEN-08.
- [applied] (2026-08-19, seen ×1) verification: prázdna obrazovka za deep-linkom nemusí byť regresia — `EatingDisorderContactsRoute` z Dňa 3 sa otvorila prázdna, lebo emulátor beží v **angličtine** a `all_contacts.json` má `en: 0` položiek (`cs: 14`). → Pred nahlásením „rozbitý odkaz" over dáta pre aktuálny jazyk, nie len to, čo vidíš.

### Mazanie mŕtveho kódu (2026-08-19)
- [applied] (2026-08-19, seen ×1) cross-cutting: **„mŕtvy kód" v mojom vlastnom TODO bol z tretiny nesprávny.** Zoznam viedol `day2_education`, `day4_please` a `day3_smart` ako mŕtve; prvé dva boli naozaj osirelé (nula referencií), ale `day3_smart` bol **zapojený** — `routes.dart` registroval dve cesty, `bpd_week_detail_screen.dart` ho pushoval v `case _DayRouteType.smart`. Slepé `rm` by rozbilo build. → Pred mazaním vždy grep na **názvy tried aj názvy priečinkov** a pozri `routes.dart` + `routes.g.dart`; „nikto to nereferencuje" over, nepredpokladaj — ani z vlastných starších poznámok.
- [applied] (2026-08-19, seen ×1) cross-cutting: mŕtvy screen môže byť nedosiahnuteľný **dvoma rôznymi spôsobmi**, a každý sa maže inak: *osirelý* (žiadny import → stačí `rm`, `.g.dart` ide s ním) vs. *zapojený ale nevybraný* (`case` existuje, ale žiadna dátová položka ten enum nikdy nezvolí → treba `rm` + imports + route entries + enum value + `case` + build_runner). Druhý typ sa nedá odhaliť grepom na importy, len dohľadaním, či niečo ten enum naozaj priradí.
- [applied] (2026-08-19, seen ×1) cross-cutting: dva osirelé screeny deklarovali `@TypedGoRoute` na cestách, ktoré už vlastnia živé screeny (`/bpd-programme/week/1/day/2` a `/day/4`). Kompilovalo to len preto, že neboli v `_bpdProgrammeRoutes`. → Kolidujúca cesta v nezaregistrovanom screene je tichá mína; pri audite routes hľadaj duplicitné `path:` naprieč **celým** `lib/`, nie len v registrovanom zozname.

### Docs & cross-cutting (docs/hpo, DESIGN_PROMPTS.md, CLAUDE.md)
- [applied] (2026-08-19) (2026-08-06, seen ×1) cross-cutting: `lib/screens/bpd_programme/weeks/week1/day2_education/` bol **mŕtvy kód** (zmazaný 2026-08-19) — nikto ho nereferencuje a jeho `@TypedGoRoute` deklaruje `/bpd-programme/week/1/day/2`, teda kolidujúcu cestu so živým `Week1Day2SpokoScreenRoute`. Preto v ňom zostala slovenčina. → Zmazať celý priečinok (7 súborov); nechať ho znamená mínu pre kohokoľvek, kto ho pridá do `_bpdProgrammeRoutes`.
- [applied] (2026-08-04, seen ×1) **cross-cutting: celý týždeň 2 sa prepracoval bez toho, aby sa otvoril `.claude/`** — pipeline skilly, `design/week2/TRACKING.md`, `data/TYZDEN_2_VYPLNENY.txt` ani tento súbor sa nečítali. Následky: nezávisle sa „objavil" problém `week_review_screen._weekData[<week>]`, ktorý tu už bol zapísaný z týždňa 1; zrušili sa Stitch návrhy (D1 4/5, D4 2–5, D6 1–7) bez vedomia, že existujú; slovenčina týždňa 2 sa označila za nedbalosť, hoci pochádzala z `TYZDEN_2_VYPLNENY.txt`. → **Aplikované 2026-08-04:** root `CLAUDE.md` → „BPD Programme Development" má teraz blok „Before working on a programme week, read `.claude/`" s odkazmi na skilly, LESSONS.md, plán, tracking, mockupy a launch.json.
- [open] (2026-08-04, seen ×1) cross-cutting: **dva paralelné obsahové zdroje** — `docs/hpo/source/tyzden-<n>.md` (česky, verbatim, zdroj pravdy podľa skillov) vs. `.claude/data/TYZDEN_<n>_VYPLNENY.txt` (slovensky, štruktúrované). Týždeň 2 bol nakódený z prvého, čím sa druhý stal zastaralým a jeho opätovné použitie by vrátilo slovenčinu. → Rozhodnúť, ktorý je zdroj pravdy, a druhý označiť ako superseded (návrh: `source/` vyhráva, `TYZDEN_*_VYPLNENY.txt` je pracovný medzikrok autora).
- [applied] (2026-08-04, seen ×1) cross-cutting: `dart format --line-length 100 ./` (odporúčané v root `CLAUDE.md`) preformátuje ~366 nesúvisiacich súborov, pretože repo je formátované starším štýlom než aktuálne SDK. → Formátovať len zmenené súbory.
