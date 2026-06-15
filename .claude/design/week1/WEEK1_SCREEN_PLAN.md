# Week 1 — Úvod do programu — Screen Plan

> Zdroj obsahu (verbatim): docs/hpo/source/tyzden-1.md
> Prehľad: docs/hpo/content-reference.md (Week 1)
> Vytvorené: 2026-06-12
> D1 rozhodnutie: jedna plynulá obrazovka (PageView, 10 strán)

---

## Prehľad

| Deň | Názov | # strán | Reuse | Nové interakcie |
|-----|-------|---------|-------|-----------------|
| 1 | Predstavenie programu (Intro + HPO/DBT + Moje záznamy + SMART) | 10 | — | meno+zámeno, mood check-in 1-10, SMART worksheet |
| 2 | SPOKO + Spánek | ~5 | SpokoDayScreen šablóna | challenge pick-list |
| 3 | Potrava | ~5 | SpokoDayScreen | — |
| 4 | Ne Omamným látkám | ~5 | SpokoDayScreen | PPP kontakty deep-link |
| 5 | Kondice | ~5 | SpokoDayScreen | — |
| 6 | Léčba Onemocnění | ~5 | SpokoDayScreen | — |
| 7 | Reflexe SPOKO a reflexe týdne | — | 🔁 WeekReviewScreen | SPOKO recall (reveal on tap) |

> Tento plán pokrýva len **Deň 1** — ostatné dni (2–7) sa naplánujú neskôr.

---

## Deň 1: Představení programu

Dlhý onboarding deň kombinujúci 4 časti:
- **1a** — Intro programu (kto je to pre, čo ponúka, štruktúra)
- **1b** — HPO + DBT edukácia
- **1c** — Prvá aktivita → Moje záznamy (mood check-in)
- **1d** — Cíle a očekávání (SMART)

Hlavná obrazovka: `PageView` s `NeverScrollableScrollPhysics`, progress bar v headeri, 10 strán.

---

### Strana 1/10 — Uvítání (intro / welcome)

- **Cieľ:** Privítať používateľa, predstaviť app a opýtať sa na meno+zámeno
- **Obsah (verbatim):**
  - „Právě jste otevřeli program, který byl vytvořen pro lidi učící se zvládat projevy hraniční poruchy osobnosti. Je ale i pro ty, kteří mají obecně potíže v oblasti emocí, stresu, impulzivního chování a mezilidských vztahů, včetně toho sami se sebou."
  - „Program může uživateli poskytnout řadu nástrojů a strategií, pro které byly inspirací ověřené metody dialekticko-behaviorální terapie (DBT)."
  - „Přijde nám důležité říct, že program nenahrazuje terapii."
  - Input: meno + zámeno (ako chce byť oslovovaný)
- **Funkčné:** Textový vstup meno + dropdown/chips pre zámeno (on/ona/ono); uloženie do BPD DAO; povinné pred ďalšou stranou (validácia neprázdneho mena)
- **UX / vizuál:** Veľký privítací nadpis (`title1`), mäkký illus/icon navrchu (napr. srdiečko alebo postava), 3 bullet body v kartách (`FeatureCard` alebo jednoduché riadky), input dole nad tlačidlom; teplý tón; `DayPageBase` wrapper
- **Používateľ / emočné:** Prvý dojem — žiadna klinická terminológia hneď, pocit tepla a bezpečia; disclaimer o terapii hneď (no bez strachu); meno = personalizácia = väčší záujem
- **Reuse vs nové:** `DayPageBase`, `NepanikarScreenWrapper` header s progress; nový TextInput widget (meno), nový pronoun picker (chips)
- **Otvorené otázky:** Aké možnosti zámena? (on/ona/ono/nechci uvádět)

---

### Strana 2/10 — Jak program funguje

- **Cieľ:** Vysvetliť štruktúru programu — 7 týždňov, oblasti, koľko času
- **Obsah (verbatim):**
  - „Program trvá 7 týdnů. Je žádoucí, aby byl plněn každodenně, není to však nutnou podmínkou. Program obsahuje zejména praktická cvičení, ale i jednoduchá vysvětlení různých souvisejících jevů, které se mohou v našich životech objevovat. Jeho plnění zabere v průměru 5-20 minut denně."
  - „Během těchto společných sedmi týdnů se budeme věnovat následujícím oblastem: všímavost, emoční regulace, snášení tísně, mezilidské vztahy a sebepojetí."
  - „Týden obvykle začne nějakým poučením o dané oblasti, aby dávalo smysl, na co se daném týdnu budeme zaměřovat a proč. V dalších dnech se postupně budeme učit novým dovednostem, které Vám v programu zůstanou jako opora do každodenních situací. Konec týdne bude vždy věnován shrnutí a zamyšlení nad tím, co jsme se naučili a co je pro Vás užitečné."
  - „Možná to zní teď složitě a náročně, ale není třeba se obávat. Cvičení jsou dávkována tak, aby pro Vás nebyla příliš zahlcující. V každém týdnu bude jedna klíčová dovednost, kterou bude žádoucí si během týdne v rámci programu projít a zkusit si připravená cvičení."
  - „Zároveň program obsahuje v každém týdnu i další cvičení a témata, která si můžete projít dobrovolně. Chtěli bychom Vás v tom však povzbudit. Čím více energie do programu věnujete během následujících společných sedmi týdnu, tím lépe Vám může být do budoucna."
- **Funkčné:** Len čítanie, žiadne inputy; tlačidlo "Pokračovat"
- **UX / vizuál:** Sekcia „7 týdnů" s číselnou vizualizáciou (1 ikona týždeň = 7 týždňov rad ikon); 5 oblastí ako čipy/badge; „5–20 min/deň" zvýraznené v `InfoBox`; `SectionHeader` pre každú časť; scrollovateľný obsah v `DayPageBase`
- **Používateľ / emočné:** Odľahčiť — „nie je to náročné", dávkovanie; pocit bezpečia; dobrovoľnosť extra cvičení; povzbudenie k zapojeniu
- **Reuse vs nové:** `DayPageBase`, `SectionHeader`, `InfoBox`, `NumberedBenefit`; nová badge-row pre 5 oblastí (alebo jednoduché `FeatureCard`)
- **Otvorené otázky:** —

---

### Strana 3/10 — HPO edukácia

- **Cieľ:** Stručne vysvetliť hraničnú poruchu osobnosti, bez stigmatizácie
- **Obsah (verbatim):**
  - „Dnešní den bude ještě trochu informační. Dozvíš se něco málo o hraniční poruše osobnosti a taky o dialekticko-behaviorální terapii, kterou je tento program inspirovaný."
  - „Hraniční porucha osobnosti (zkráceně HPO) je duševní onemocnění charakterizované výraznými výkyvy nálad, impulzivním chováním a nestabilními vztahy. Lidé s touto poruchou často zažívají intenzivní emoce, které se rychle mění, a mohou mít problémy s tím, jak vnímají sami sebe a ostatní. Tyto výkyvy můžou být nepříjemné pro každodenní život a vztahy s okolím."
  - Odkaz „zjistit víc" → externý Google Doc
  - „Tento program je určený nejen lidem s diagnostikovanou hraniční poruchou osobnosti, ale také těm, kteří jen vnímají nějaké obtíže v oblasti emocí, impulzivity nebo vztahů. Cílem není nálepkovat ani stigmatizovat, ale nabídnout nástroje a strategie, které mohou pomoci každému, kdo chce zlepšit kvalitu života ve zmíněných oblastech."
- **Funkčné:** Externý link otvára v prehliadači; tlačidlo "Pokračovat"
- **UX / vizuál:** `SectionHeader` „HPO"; definícia v `InfoBox`; charakteristiky (výkyvy nálad / impulzivita / nestabilné vzťahy) ako 3 `NumberedBenefit`; tlačidlo odkazu s ikonou external_link; inkluzívna veta na konci v mäkšej farbe
- **Používateľ / emočné:** Neutrálny, nehodnotiaaci jazyk; zdôrazniť „program nie je len pre diagnostikovaných"; žiadna medicínska ťažkopádnosť
- **Reuse vs nové:** `SectionHeader`, `InfoBox`, `NumberedBenefit`; externý link widget (existuje v app?)
- **Otvorené otázky:** Má app helper na otváranie URL? (`url_launcher` package)

---

### Strana 4/10 — DBT edukácia

- **Cieľ:** Vysvetliť DBT a prečo je nácvik zručností dôležitý
- **Obsah (verbatim):**
  - „DBT, neboli dialekticko-behaviorální terapie, je způsob, jak se učit lépe zvládat své emoce a stres. Pomáhá lidem porozumět tomu, co cítí, a najít způsoby, jak reagovat bez impulzivního chování. DBT také podporuje zlepšení vztahů s ostatními a učí, jak se přijmout a zároveň pracovat na změnách, které chceme ve svém životě udělat."
  - Odkaz „Chci vědět víc" → externý Google Doc
  - „Nácvik dovedností je důležitý proto, že samotné vědění nestačí - je potřeba procvičovat nové způsoby, jak reagovat na emoce, stres nebo konflikty, aby se staly přirozenou součástí života. Když nové strategie pravidelně používáme, snižujeme impulzivní chování a snáze zvládáme těžké situace. Pravidelný nácvik nám také dodává pocit jistoty v situacích, které bývaly dříve obtížné."
- **Funkčné:** Externý link; tlačidlo "Pokračovat"
- **UX / vizuál:** `SectionHeader` „DBT"; DBT definícia v karte; 3 benefity nácviku ako `NumberedBenefit` (snižujeme impulzivní / snáze zvládáme / pocit jistoty); `InfoBox` zvýrazní kľúčovú myšlienku „samotné vědění nestačí"
- **Používateľ / emočné:** Motivačný tón — pochopenie prečo sa to robí zvyšuje angažovanosť; jednoduché jazyk
- **Reuse vs nové:** `SectionHeader`, `NumberedBenefit`, `InfoBox`
- **Otvorené otázky:** —

---

### Strana 5/10 — Jak se dnes máš? (mood check-in)

- **Cieľ:** Prvá aktivita — zaznamenanie nálady, deep-link do Moje záznamy
- **Obsah (verbatim):**
  - „Pojďme si rovnou na začátek zkusit jednu aktivitu (proklik do Moje záznamy):"
  - „Otázka: ‚Jak se dnes máš?'"
  - Škála 1–10 (emoji)
- **Funkčné:** Emoji škála 1–10 (horizontálna, scrollovateľná alebo pevná); výber uloží hodnotu; disabled "Pokračovat" kým nie je vybraná hodnota; uloženie do existujúceho mood DAO (reuse `MoodState` Provider z `main.dart`)
- **UX / vizuál:** Centrálna otázka (`title2`); veľká emoji škála (dotykovo priateľská, min 44px výška klikateľnej plochy); vybraná emoji animovane zväčšiť; mäkké pozadie, priestranná obrazovka; "Pokračovat" aktivovaný až po výbere
- **Používateľ / emočné:** Prvý mood check-in — hravý a nenáročný; škála bez hodnotenia (žiadne „správne" hodnoty)
- **Reuse vs nové:** Reuse existujúceho mood widgetu z `lib/widgets/mood/` ak je vhodný; inak nový emoji row widget
- **Otvorené otázky:** Uložiť len do denníka nálad, alebo aj do špeciálneho Day-1 záznamu?

---

### Strana 6/10 — Reakce na náladu + follow-up

- **Cieľ:** Zobraziť reakciu podľa skóre, pre 1-4 navrhnúť malé akcie, follow-up otázka
- **Obsah (verbatim):**
  - **6–10:** zobraziť 1 náhodnú vetu z: „Dnes to docela jde." / „Fajn, že je to dnes lepší." / „Tohle se počítá." / „I takové dny jsou důležité." + doplňujúca otázka: „Co dnes pomohlo?"
  - **5:** zobraziť 1 náhodnú vetu z: „Dnes je to někde uprostřed." / „I to je v pořádku." / „Nemusí to být ani dobré, ani špatné." / „Střed je taky ok."
  - **1–4:** zobraziť: „Zkus jednu malou věc:" + možnosti (zobraziť 3-4 z): napij se vody / dej si malé jídlo / na chvíli si lehni / odpočiň / krátká procházka / protáhni se / zpomal dech / napiš někomu / dej si sprchu / změň prostředí
  - **Následně (pre 1-4):** „Pomohlo to aspoň trochu?" → ano / trochu / ne
  - Záver (všetky skóre): „To je pro první seznamovací den vše! Chceme tě ocenit za rozhodnutí začít s tímto programem. Může to být velmi důležitý krok pro Tvoji osobní pohodu. Těšíme se na zítřek."
- **Funkčné:** Podmienené zobrazenie podľa hodnoty z Page 5; pre 6-10 a 5 zobrazí random vetu (seed by dayNumber); pre 1-4 checklisty (vyber jednu); follow-up "Pomohlo?" → výber uloží; záver vždy viditeľný; tlačidlo "Pokračovat"
- **UX / vizuál:** Animovaný prechod z Page 5 (výsledok nálady); reaction veta veľkým `bodyHeavy`; akcie pre 1-4 ako selectable chips/karty (min 3 viditeľné bez scroll); follow-up 3 tlačidlá (ano/trochu/ne) ako outlined buttons; záverová veta v `InfoBox` s ikonou srdiečka
- **Používateľ / emočné:** Priama emocionálna odozva — používateľ cíti, že app "počuje"; pre nízke skóre: kontext malých akcií, nie zahltenie; pozitívne ukončenie bez ohľadu na skóre; bezpečnosť
- **Reuse vs nové:** Nový podmienený widget; reuse chip/button patternu z app; `InfoBox`
- **Otvorené otázky:** Pre 1-4 ukázať fixne 3-4 alebo randomizovane z celého zoznamu?

---

### Strana 7/10 — Cíle a očekávání

- **Cieľ:** Zaznamenať očakávania a ciele pred programom (zobrazí sa znovu v poslednom týždni)
- **Obsah (verbatim):**
  - „Pojďme si ještě zlehka popovídat… :)"
  - „S jakým očekáváním vstupuješ do programu? (Nechat volný prostor na dopsání, zobrazit v posledním týdnu)"
  - „Jakých cílů chceš během programu dosáhnout? (Volný prostor, zobrazit v posledním týdnu)"
  - „Je naprosto v pořádku začínat i s malými cíli. Každý krok, i ten nejmenší, je důležitý a posouvá nás směrem, kterým chceme jít."
  - „Popravdě - ty jednodušší cíle se nám plní lépe. Pojďme se podívat, jak cíle vlastně nastavovat."
- **Funkčné:** 2 multiline TextFields (expectations + goals); oboje uložené s kľúčom pre GEN-02 (resurface v poslednom týždni); validácia: povolené prázdne (dobrovoľné); tlačidlo „Pokračovat" vždy aktívne
- **UX / vizuál:** Konverzačný tón — `SectionHeader` s chat/srdce ikonou; 2 TextField boxy s placeholder textom; povzbudzujúca veta pod druhým poľom v mäkšej farbe; `InfoBox` pre záverečnú vetu o malých cieľoch; priestranný layout
- **Používateľ / emočné:** Odľahčiť — „zlehka popovídat", žiadny tlak; inkluzívnosť malých cieľov; predpríprava na SMART (segue)
- **Reuse vs nové:** Nový persistovaný store (GEN-02); `InfoBox`, TextField zo štandardu Flutter
- **Otvorené otázky:** Uložiť aj keď sú prázdne (uloží empty string), alebo len ak niečo napísané?

---

### Strana 8/10 — SMART cíle (vizualizácia)

- **Cieľ:** Vizuálne vysvetliť SMART framework, každé písmeno tapovateľné
- **Obsah (verbatim):**
  - „SMART cíle je konkrétní způsob, jak si nastavit cíle tak, aby byly jasné, reálné a dosažitelné. SMART znamená: (ideálně hezky vizuálně vyjádřit)"
  - **S – Specifický:** „cíl je jasně definovaný, víš přesně, čeho chceš dosáhnout."
  - **M – Měřitelný:** „můžeš sledovat, jestli se ti daří cíl plnit, například počtem pokusů nebo jasným popisem toho, co považuješ za úspěch."
  - **A – Adekvátní:** „cíl je realistický a zvládnutelný vzhledem ke tvým možnostem ve tvojí situaci."
  - **R – Relevantní:** „cíl má pro Tebe význam a souvisí s tím, co je pro Tebe důležité."
  - **T – Termínovaný:** „je jasné, do kdy chceš cíle dosáhnout, což Ti může pomoct udržet motivaci."
  - „Pojďme si teď zkusit definovat jeden tvůj cíl pro průběh programu podle principu SMART."
- **Funkčné:** 5 tapovateľných tiles (S/M/A/R/T); tap expand/collapse detail; všetky môžu byť otvorené naraz; tlačidlo "Pokračovat" vždy aktívne (neprinútiť otvárať všetky)
- **UX / vizuál:** 5 tiles v stĺpci — každý má veľké písmeno (`title2`) v `#491475` kruhu vľavo + krátky label vpravo; po tapi sa expanduje opisný text; `DayPageBase`; tesne pod nimi CTA veta; farebné odlíšenie aktívneho tile (napr. `#EDE8F3` bg)
- **Používateľ / emočné:** Hravé a vizuálne — písmená ako "hádanka" ktorá sa odhalí; nie prednáška; „teraz to skúsime" — plynulý prechod na worksheet
- **Reuse vs nové:** Nový expandable tile widget; `DayPageBase`
- **Otvorené otázky:** Existuje v app expandable tile? (`ExpansionTile` z Flutter)

---

### Strana 9/10 — SMART worksheet

- **Cieľ:** Vyplniť osobný SMART cieľ pre program
- **Obsah (verbatim):**
  - „Pojďme si teď zkusit definovat jeden tvůj cíl pro průběh programu podle principu SMART. Doplň do připraveného listu, čeho přesně chceš dosáhnout, jak poznáš, že máš cíl splněný, proč je pro tebe důležitý, jestli je realistický a do kdy ho chceš stihnout."
  - **Pracovní list: Můj SMART cíl pro tento program**
  - **S:** „Chci…" (príklad: „Namísto křiku na kamarádku říct, že mi vadí, když přijde pozdě.")
  - **M:** „Poznám to tak, že…" (príklad: „Poznám to tak, že když se to stane, řeknu jí klidně, že mi vadí čekání, místo zvyšování hlasu.")
  - **A:** „Je to dosažitelné, protože…" (príklad: „Je to dosažitelné, protože si předem připravím větu, kterou jí chci říct, a když budu cítit vztek, zhluboka se nadechnu.")
  - **R:** „Je to důležité, protože…" (príklad: „Je to důležité, protože si chci s kamarádkou udržet dobrý vztah a nechci, aby křik ničil naše setkání.")
  - **T:** „Chci to zvládnout do…" (príklad: „Chci to vyzkoušet při příštím setkání, pokud dorazí pozdě.")
- **Funkčné:** 5 TextFields s placeholder textom; tap na „príklad" zobrazí príkladovú vetu v overlay/tooltip; uloženie do SMART DAO (reuse existujúceho `smart_goal_form_screen`); tlačidlo "Dokončit den" (posledný krok pred completion)
- **UX / vizuál:** Worksheet tón — `SectionHeader` s goal/target ikonou; každé pole má písmeno v malom `#491475` badge + placeholder; „Příklad" chip vedľa každého poľa (tap = zobrazí hint); scrollovateľné (5 polí + tlačidlo); DayPageBase
- **Používateľ / emočné:** Konkrétne a praktické; príklady znižujú úzkosť z prázdnej obrazovky; dobrovoľnosť (nie všetky polia musia byť vyplnené)
- **Reuse vs nové:** Reuse logiky z `smart_goal_form_screen.dart` (existujúce SMART DAO); nový worksheet UI; Example chip widget
- **Otvorené otázky:** Ukladať postupne (onChange) alebo len pri "Dokončit"?

---

### Strana 10/10 — Completion

- **Cieľ:** Oceniť dokončenie Dňa 1, pripraviť na zajtra
- **Obsah (verbatim):**
  - „Skvělá práce! První den je úspěšně u konce. Nastavit si jasné cíle vyžaduje energii a soustředění, takže ti patří velké uznání za tento důležitý krok. Pro dnešek je to všechno, odpočiň si a pokračovat budeme zítra."
- **Funkčné:** Označí Deň 1 ako completed v `BpdDaysDao`; tlačidlo "Skvělé!" zavrie screen a vráti na WeekDetail; progress bar = 100%
- **UX / vizuál:** Centrovaneý layout; veľká ilustrácia/ikona úspechu (existujúca Lottie animácia alebo SVG); nadpis „Skvělá práce!" v `title1` primary; pochvalná veta `bodyRoman`; výrazné CTA tlačidlo „Skvělé!"; rovnaký vzor ako `completion_page.dart` z week2 dní
- **Používateľ / emočné:** Silný pocit úspechu a ocenenia; žiadny ďalší obsah — čistý záver; anticipácia zajtrajška
- **Reuse vs nové:** Vzor z `lib/screens/bpd_programme/weeks/week2/day1_mindfulness_intro/completion_page.dart`
- **Otvorené otázky:** —

---

## Súhrnné UX rozhodnutia pre Deň 1

- **PageView** s `NeverScrollableScrollPhysics`, shared progress bar v headeri (1/10 … 10/10)
- Vzor navigácie: `_goToNextPage()` / "Pokračovat" dole — rovnaký ako Week 2 dni
- Meno používateľa uložené pri Page 1 → použiť od Page 2+ na oslovovanie (ak implementované)
- **Verbatim copy** — žiadne skrátenie, žiadna parafráza; ak sa text nezmestí → rozdeliť na viac strán
- Page 5+6 spolu tvoria mood check-in sekciu; Page 6 musí vedieť hodnotu z Page 5 (zdieľaný state)
- Page 7, 9 ukladajú do databázy; obe persistent (resurface v poslednom týždni — GEN-02)

## Otvorené rozhodnutia pre používateľa

- **OQ-1:** Aké možnosti zámena na Page 1? Navrhujem: on / ona / ono / nechci uvádět
- **OQ-2:** Page 6 (1-4 skóre): zobraziť náhodné 3-4 akcie, alebo všetky naraz?
- **OQ-3:** Page 7: uložiť aj keď polia prázdne (prázdny string) alebo len ak niečo napísané?
- **OQ-4:** Page 9: ukladať onChange alebo len pri "Dokončit den"?
