# Week 2 (Mindfulness) - Stitch Design Prompts

> **LIGHT MODE ONLY** - Všetky prompty sú pre svetlý režim

## Design System Reference (LIGHT MODE)

### Farby - SPRÁVNE HODNOTY
```
Primary Purple:    #491475  (hlavná fialová)
Primary Dark:      #280446  (tmavšia fialová pre akcenty)
Secondary Teal:    #4EA3AD  (tyrkysová - srdiečka, sekundárne akcie)
Background:        #FBF6FF  (veľmi svetlé ružovo-fialové pozadie)
Container/Card:    #EDE8F3  (svetlofialové pozadie kariet)
Purple 200:        #E2D2EF  (svetlé akcenty)
White:             #FFFFFF  (biela)
Success:           #6FD866  (zelená - dokončené)
Error:             #D86C66  (červená)
Info:              #FEC786  (oranžová - tipy)
```

### Typografia
```
Font:              Inter (v produkcii Satoshi)
Title:             24px bold, #491475 alebo #280446
Section header:    20px semibold
Body:              16px regular, tmavý text
Caption:           14px regular
Button:            16px bold, biely text
```

### Komponenty
```
Card border-radius:   16px
Button border-radius: 12px
Card shadow:          blur 32px, offset (0, 8), primary 8% opacity
Screen padding:       24px horizontal
Card padding:         16px
Spacing:              12-24px
Button height:        48-54px
```

### Dekoratívne prvky
- Malé tyrkysové (#4EA3AD) srdiečka
- Jemné fialové gradienty v headeroch
- Jednoduché line-art ikony (žiadne fotky)

---

## Quick Reference

| Day | Screen Name | Route Type | Strán |
|-----|-------------|------------|-------|
| 1 | Mindfulness Education | `day1MindfulnessEducation` | 5 |
| 2 | What Skills | `day2WhatSkills` | 5 |
| 3 | How Skills | `day3HowSkills` | 5 |
| 4 | Mindful Breathing | `day4Breathing` | 6 |
| 5 | Pause | `pause` | REUSE šablóna |
| 6 | Mindfulness Techniques | `day6MindfulnessTechniques` | 7 |
| 7 | Week Summary | `summary` | REUSE šablóna |

---

## Prompt 1: Day 1 - Mindfulness Education (5 strán)

### Page 1/5 - Intro
```
Create a mobile app screen for mental health app "Nepanikař" - introduction to mindfulness lesson.

DESIGN SYSTEM (LIGHT MODE):
- Background: #FBF6FF (very light purple-pink)
- Primary: #491475 (deep purple) for headers, buttons
- Secondary: #4EA3AD (teal) for accents, heart icons
- Cards: #EDE8F3 background, 16px radius, soft shadow
- Font: Inter, clean sans-serif
- Buttons: #491475 background, white text, 12px radius

SCREEN LAYOUT:
┌─────────────────────────────────┐
│ [←]     ████░░░░░░░░  1/5       │  Progress bar (purple fill)
├─────────────────────────────────┤
│                                 │
│     🧘 [Meditation icon]        │  Icon in purple circle
│                                 │
│     Čo je mindfulness?          │  Title: 24px bold, #491475
│     Deň 1 • Týždeň 2            │  Subtitle: 14px, gray
│                                 │
│  Mindfulness je schopnosť       │  Body text: 16px
│  vedome zamerať pozornosť       │
│  na prítomný okamih bez         │
│  posudzovania.                  │
│                                 │
│  ┌─────────────────────────┐    │  Learning checklist card
│  │ Dnes sa naučíš:         │    │  (#EDE8F3 background)
│  │ ☐ Čo je mindfulness     │    │
│  │ ☐ Prečo je užitočný     │    │
│  │ ☐ Mindfulness v DBT     │    │
│  └─────────────────────────┘    │
│                                 │
│  ┌─────────────────────────┐    │
│  │      Pokračovať         │    │  Button: #491475, white text
│  └─────────────────────────┘    │
│                                 │
│         💜 (small heart)        │  Teal heart decoration
└─────────────────────────────────┘

STYLE:
- Clean, calming, therapeutic
- Plenty of whitespace
- Soft shadows on cards
- Mobile portrait (390x844px)
```

### Page 2/5 - Benefits
```
Create mobile app screen - "Why is mindfulness useful?" for Nepanikař app.

DESIGN SYSTEM (LIGHT MODE):
- Background: #FBF6FF
- Primary: #491475
- Cards: white (#FFFFFF) with soft shadow, 16px radius
- Accents: #4EA3AD teal

SCREEN LAYOUT:
┌─────────────────────────────────┐
│ [←]     ████████░░░░  2/5       │
├─────────────────────────────────┤
│                                 │
│  Prečo je mindfulness           │  Title: 22px bold, #491475
│  užitočný?                      │
│                                 │
│  ┌─────────────────────────┐    │  Benefit card 1
│  │ 🧘 Znižuje úzkosť       │    │  White card, icon left
│  │ Upokojuje myseľ aj telo │    │  Purple icon, gray text
│  └─────────────────────────┘    │
│                                 │
│  ┌─────────────────────────┐    │  Benefit card 2
│  │ 🎯 Posilňuje sústredenie│    │
│  │ Zlepšuje koncentráciu   │    │
│  └─────────────────────────┘    │
│                                 │
│  ┌─────────────────────────┐    │  Benefit card 3
│  │ 👥 Zlepšuje vzťahy      │    │
│  │ Lepšie počúvanie druhých│    │
│  └─────────────────────────┘    │
│                                 │
│  ┌─────────────────────────┐    │  Benefit card 4
│  │ 🧠 Väčšia rozhodnosť    │    │
│  │ Menej impulzívnych reakcií│  │
│  └─────────────────────────┘    │
│                                 │
│  ┌─────────────────────────┐    │
│  │      Pokračovať         │    │
│  └─────────────────────────┘    │
└─────────────────────────────────┘

STYLE: Cards with subtle shadow, icons in purple tint
```

### Page 3/5 - DBT Context
```
Create mobile app screen - "Mindfulness in DBT" for Nepanikař app.

DESIGN SYSTEM (LIGHT MODE):
- Background: #FBF6FF
- Primary: #491475
- Quote box: #E2D2EF (light purple)
- Cards: #EDE8F3

SCREEN LAYOUT:
┌─────────────────────────────────┐
│ [←]     ████████████░  3/5      │
├─────────────────────────────────┤
│                                 │
│  Mindfulness v DBT              │  Title: 22px bold
│                                 │
│  DBT (Dialektická behaviorálna  │  Body text
│  terapia) považuje mindfulness  │
│  za základnú zručnosť.          │
│                                 │
│  Pomáha nám:                    │
│  • Lepšie zvládať emócie        │  Bullet list
│  • Byť prítomný v momente       │
│  • Reagovať, nie len reagovať   │
│                                 │
│  ┌─────────────────────────┐    │  Quote box (#E2D2EF)
│  │  "                      │    │
│  │  Mindfulness nie je     │    │
│  │  o prázdnej hlave,      │    │
│  │  ale o prítomnosti.     │    │
│  │                    "    │    │
│  └─────────────────────────┘    │
│                                 │
│  ┌─────────────────────────┐    │
│  │      Pokračovať         │    │
│  └─────────────────────────┘    │
└─────────────────────────────────┘
```

### Page 4/5 - Reflection
```
Create mobile app screen - short reflection/check-in for Nepanikař app.

DESIGN SYSTEM (LIGHT MODE):
- Background: #FBF6FF
- Primary: #491475
- Input field: #EDE8F3 background

SCREEN LAYOUT:
┌─────────────────────────────────┐
│ [←]     ████████████░░ 4/5      │
├─────────────────────────────────┤
│                                 │
│  Krátka reflexia                │  Title
│                                 │
│      🌊 [calming wave visual]   │  Calming illustration
│                                 │
│  Ako sa práve teraz cítiš?      │  Question: 18px
│                                 │
│  Zastav sa na chvíľu a          │
│  všimni si, čo sa deje          │
│  v tvojom tele a mysli.         │
│                                 │
│  ┌─────────────────────────┐    │  Optional text input
│  │ Poznámky (voliteľné)    │    │  (#EDE8F3 background)
│  │                         │    │
│  │                         │    │
│  └─────────────────────────┘    │
│                                 │
│  ┌─────────────────────────┐    │
│  │      Pokračovať         │    │
│  └─────────────────────────┘    │
└─────────────────────────────────┘
```

### Page 5/5 - Completion
```
Create mobile app screen - day completion celebration for Nepanikař app.

DESIGN SYSTEM (LIGHT MODE):
- Background: #FBF6FF
- Success green: #6FD866
- Primary: #491475
- Cards: white with shadow

SCREEN LAYOUT:
┌─────────────────────────────────┐
│ [←]     ████████████████  5/5   │
├─────────────────────────────────┤
│                                 │
│         ✓ [green checkmark]     │  Large #6FD866 checkmark
│                                 │
│         Výborne!                │  Title: 28px bold, #491475
│     Deň 1 dokončený             │  Subtitle: 16px gray
│                                 │
│  ┌─────────────────────────┐    │  Summary card
│  │ Dnes si sa naučil/a:    │    │
│  │ ✓ Čo je mindfulness     │    │  Green checkmarks
│  │ ✓ Prečo je užitočný     │    │
│  │ ✓ Mindfulness v DBT     │    │
│  └─────────────────────────┘    │
│                                 │
│  ┌─────────────────────────┐    │  Next day preview
│  │ 📅 Zajtra: What Skills  │    │  (#EDE8F3 background)
│  │ Naučíš sa pozorovať,    │    │
│  │ popisovať a zapojiť sa  │    │
│  └─────────────────────────┘    │
│                                 │
│  ┌─────────────────────────┐    │
│  │      Dokončiť           │    │  Green button #6FD866
│  └─────────────────────────┘    │
└─────────────────────────────────┘
```

---

## Prompt 2: Day 2 - What Skills (5 strán)

### Page 1/5 - Intro
```
Create mobile screen for "What Skills" intro - Nepanikař app.

LIGHT MODE: Background #FBF6FF, Primary #491475, Cards #EDE8F3, Teal #4EA3AD

LAYOUT:
- Title: "What skills" with eye icon
- Subtitle: "Deň 2 • Týždeň 2"
- Description: "Čo zručnosti popisujú, čo robíme pri mindfulness"
- 3 preview cards:
  • 👁️ Pozorovanie - Všímam si bez hodnotenia
  • ✏️ Popis - Dávam slová zážitkom
  • 🧘 Zapojenie sa - Som plne prítomný

Button: "Pokračovať"
```

### Page 2/5 - Observe
```
Create mobile screen for "Observe" skill - Nepanikař app.

LIGHT MODE: Background #FBF6FF, Primary #491475, Cards white with shadow

LAYOUT:
- Header: 👁️ "Pozorovanie"
- Description: "Všímam si, čo sa deje, bez hodnotenia"
- Section: "CVIČENIA" with 5 exercise cards:

Card 1: 👁️ Očami - "Venuj pozornosť tomu, čo vidíš - obloha, stromy, farby"
Card 2: 👂 Ušami - "Sústreď sa na zvuky okolo seba"
Card 3: 🤲 Telom - "Všimni si napätie alebo uvoľnenie"
Card 4: 🌬️ Dychom - "Sleduj nádych a výdych"
Card 5: 💭 Myšlienkami - "Sleduj myšlienky ako mraky na oblohe"

Cards: White background, 16px radius, soft shadow, icon on left
```

### Page 3/5 - Describe
```
Create mobile screen for "Describe" skill - Nepanikař app.

LIGHT MODE colors, exercise cards style

LAYOUT:
- Header: ✏️ "Popis"
- Description: "Dávam slová tomu, čo zažívam"
- 3 exercise cards:
  • Popisuj okolie - Čo vidíš, počuješ?
  • Popisuj emócie - Čo cítiš v tele?
  • Popisuj dych - Aký je tvoj dych?
```

### Page 4/5 - Participate
```
Create mobile screen for "Participate" skill - Nepanikař app.

LAYOUT:
- Header: 🧘 "Zapojenie sa"
- Description: "Som plne prítomný v činnosti"
- 3 exercise cards:
  • Spojenie s okolím - Plne vnímaj prostredie
  • Hudba a pohyb - Nechaj sa uniesť
  • Naslúchanie - Počúvaj bez plánovania odpovede
```

### Page 5/5 - Completion
```
Day 2 completion screen - green checkmark, summary of 3 skills learned.

Tip box: "Vyber si 2 cvičenia z každej kategórie a skús ich dnes"
Next day preview: "How Skills - ako praktizovať mindfulness"
Green "Dokončiť" button
```

---

## Prompt 3: Day 3 - How Skills (5 strán)

### Page 1/5 - Intro
```
"How skills" intro - 3 ways to practice mindfulness.

Preview:
• 1️⃣ Jednomyseľne - jedna vec naraz
• ⚖️ Bez posudzovania - fakty, nie hodnotenia
• 🎯 Efektívne - čo funguje
```

### Page 2/5 - One-mindfully
```
Header: 1️⃣ "Jednomyseľne"
Description: "Buď prítomný a rob vždy len jednu vec naraz"

Exercise cards:
• ☕ Príprava čaju - Sústreď sa na každý krok
• 🍽️ Umývanie riadu - Vnímaj vodu, penu, zvuk
• 🧼 Umývanie rúk - Sleduj každý pohyb
```

### Page 3/5 - Non-judgmentally
```
Header: ⚖️ "Bez posudzovania"
Description: "Popisujem fakty, nie hodnotenia"

Exercise cards:
• Všimni si hodnotenie - Kedy používaš "dobré/zlé"?
• Popisuj fakty - Čo naozaj vidíš?
• Bez nálepiek - Opíš situáciu neutrálne
```

### Page 4/5 - Effectively
```
Header: 🎯 "Efektívne"
Description: "Robím to, čo funguje"

Exercise cards:
• "Je to účinné?" - Pýtaj sa pri rozhodovaní
• Pusť tvrdohlavosť - Niekedy ustúp
• "Pomáha mi to?" - Zameraj sa na výsledky
```

### Page 5/5 - Completion
```
Summary: 3 "how" skills
Tip: "Zajtra skús byť mindful aspoň v jednej situácii"
Next: "Všímavé dýchanie"
```

---

## Prompt 4: Day 4 - Mindful Breathing (6 strán)

### Page 1/6 - Intro
```
"Všímavé dýchanie" intro with wind/air icon.
Preview of 3 techniques: Všímavé dýchanie, Box breathing, 7-11
```

### Page 2/6 - Mindful Breathing
```
🌬️ "Všímavé dýchanie"
Large calming visual (circle or lungs icon)

Description:
"Len pozoruješ svoj dych tak, ako prirodzene plynie.
Keď utečie pozornosť, jemne ju vrátiš späť k dychu."
```

### Page 3/6 - Box Breathing
```
⬜ "Dýchanie do štvorca"

Visual square diagram:
    Nádych 4s
        ↓
   ┌─────────┐
→  │         │  ← Zadržanie 4s
   └─────────┘
        ↑
    Výdych 4s

Button: "🎯 Vyskúšať cvičenie" (links to breathing feature)
```

### Page 4/6 - 7-11 Breathing
```
"Dýchanie 7-11"

Visual bars:
Nádych:  ████████ (7)
Výdych:  ████████████████ (11)

Tip box: "Začni pokojne s 4-6, postupne predlžuj"
Button: "Vyskúšať cvičenie"
```

### Page 5/6 - Reflection
```
"Ktorá technika ti vyhovovala?"

Selection options (radio buttons):
○ Všímavé dýchanie
○ Dýchanie do štvorca
○ Dýchanie 7-11

Optional notes field
```

### Page 6/6 - Completion
```
Summary of 3 techniques learned
Next day preview: "Pauza - odpočinkový deň"
Green completion button
```

---

## Prompt 5: Day 6 - Mindfulness Techniques (7 strán)

### Page 1/7 - Intro
```
Create a mobile app screen for mental health app "Nepanikař" - introduction to advanced mindfulness techniques.

DESIGN SYSTEM (LIGHT MODE):
- Background: #FBF6FF (very light purple-pink)
- Primary: #491475 (deep purple) for headers, buttons
- Secondary: #4EA3AD (teal) for accents
- Cards: white (#FFFFFF) with soft shadow, 16px radius
- Font: Inter, clean sans-serif
- Buttons: #491475 background, white text, 12px radius

SCREEN LAYOUT:
┌─────────────────────────────────┐
│ [←]     ███░░░░░░░░░░░  1/7     │  Progress bar (purple fill)
├─────────────────────────────────┤
│                                 │
│     ✨ [sparkle/star icon]      │  Icon in purple circle
│                                 │
│   Ďalšie mindfulness techniky   │  Title: 24px bold, #491475
│     Deň 6 • Týždeň 2            │  Subtitle: 14px, gray
│                                 │
│  Dnes rozšírime našu znalosť    │  Body text: 16px
│  mindfulness techník. Vyber     │
│  si jedno cvičenie, ktoré       │
│  dnes vyskúšaš.                 │
│                                 │
│  ┌─────────────────────────┐    │  Techniques preview cards
│  │ 🧍 Skenovanie tela      │    │  White card, icon left
│  └─────────────────────────┘    │
│  ┌─────────────────────────┐    │
│  │ 🚶 Všímavá chôdza       │    │
│  └─────────────────────────┘    │
│  ┌─────────────────────────┐    │
│  │ 🍎 Všímavé jedenie      │    │
│  └─────────────────────────┘    │
│  ┌─────────────────────────┐    │
│  │ 👂 Všímavé načúvanie    │    │
│  └─────────────────────────┘    │
│  ┌─────────────────────────┐    │
│  │ ⭐ Všetkých päť pohromade│    │
│  └─────────────────────────┘    │
│                                 │
│  ┌─────────────────────────┐    │
│  │      Pokračovať         │    │  Button: #491475, white text
│  └─────────────────────────┘    │
└─────────────────────────────────┘

STYLE:
- Clean, calming, therapeutic
- Compact card list (5 technique previews)
- Soft shadows on cards
- Mobile portrait (390x844px)
```

### Page 2/7 - Body Scan
```
Create mobile app screen for "Body Scan" mindfulness technique - Nepanikař app.

DESIGN SYSTEM (LIGHT MODE):
- Background: #FBF6FF
- Primary: #491475
- Cards: #EDE8F3 background, 16px radius
- Icon color: #4EA3AD (teal)

SCREEN LAYOUT:
┌─────────────────────────────────┐
│ [←]     ██████░░░░░░░░  2/7     │
├─────────────────────────────────┤
│                                 │
│  🧍 Skenovanie tela             │  Title: 22px bold, #491475
│     Technika 1 z 5              │  Subtitle: 14px gray
│                                 │
│     [Simple body silhouette]    │  Simple line illustration
│         head → feet             │  showing scan direction
│                                 │
│  ┌─────────────────────────┐    │  Description card (#EDE8F3)
│  │ Pri nádychu vnímaj, ako │    │
│  │ vzduch vstupuje do tela.│    │
│  │                         │    │
│  │ Pri výdychu si uvedom,  │    │
│  │ kde v tele cítiš napätie│    │
│  │ a nechaj ho uvoľniť.    │    │
│  └─────────────────────────┘    │
│                                 │
│  ┌─────────────────────────┐    │  Steps card (white)
│  │ Ako na to:              │    │
│  │ 1️⃣ Začni od hlavy       │    │
│  │ 2️⃣ Postupne prejdi telo │    │
│  │ 3️⃣ Všímaj si pocity     │    │
│  │    bez hodnotenia       │    │
│  └─────────────────────────┘    │
│                                 │
│  ┌─────────────────────────┐    │
│  │      Pokračovať         │    │
│  └─────────────────────────┘    │
└─────────────────────────────────┘

STYLE:
- Calming body illustration (simple line art, purple tint)
- Clear numbered steps
- Breathing emphasized in description
```

### Page 3/7 - Mindful Walking
```
Create mobile app screen for "Mindful Walking" technique - Nepanikař app.

DESIGN SYSTEM (LIGHT MODE):
- Background: #FBF6FF
- Primary: #491475
- Cards: white with soft shadow
- Accent: #4EA3AD

SCREEN LAYOUT:
┌─────────────────────────────────┐
│ [←]     █████████░░░░░  3/7     │
├─────────────────────────────────┤
│                                 │
│  🚶 Všímavá chôdza              │  Title: 22px bold
│     Technika 2 z 5              │  Subtitle
│                                 │
│    [Footsteps illustration]     │  Simple footstep path visual
│      ◡  ◡  ◡  ◡                 │  showing walking pattern
│                                 │
│  ┌─────────────────────────┐    │  Main description (#EDE8F3)
│  │ Vnímaj každý krok,      │    │
│  │ kontakt nôh so zemou,   │    │
│  │ pohyb tela.             │    │
│  └─────────────────────────┘    │
│                                 │
│  Sústreď sa na:                 │  Focus points header
│                                 │
│  ┌─────────────────────────┐    │  Focus card 1
│  │ 👣 Každý krok           │    │
│  │ Aký je pocit kontaktu?  │    │
│  └─────────────────────────┘    │
│  ┌─────────────────────────┐    │  Focus card 2
│  │ 🌍 Dotyk zeme           │    │
│  │ Ako ťa drží zem?        │    │
│  └─────────────────────────┘    │
│  ┌─────────────────────────┐    │  Focus card 3
│  │ 🧍 Pohyb tela           │    │
│  │ Ako sa hýbe tvoje telo? │    │
│  └─────────────────────────┘    │
│                                 │
│  ┌─────────────────────────┐    │
│  │      Pokračovať         │    │
│  └─────────────────────────┘    │
└─────────────────────────────────┘

STYLE:
- Walking motion visual (simple, calming)
- 3 focus point cards with icons
```

### Page 4/7 - Mindful Eating
```
Create mobile app screen for "Mindful Eating" technique - Nepanikař app.

DESIGN SYSTEM (LIGHT MODE):
- Background: #FBF6FF
- Primary: #491475
- Cards: white with shadow, 16px radius

SCREEN LAYOUT:
┌─────────────────────────────────┐
│ [←]     ████████████░░  4/7     │
├─────────────────────────────────┤
│                                 │
│  🍎 Všímavé jedenie             │  Title: 22px bold
│     Technika 3 z 5              │
│                                 │
│      [Simple food icon]         │  Apple or simple food visual
│                                 │
│  ┌─────────────────────────┐    │  Description (#EDE8F3)
│  │ Jedz pomaly a všímaj si │    │
│  │ chuti, vône, textúry    │    │
│  │ i toho, ako sa cítiš    │    │
│  │ pri jedle.              │    │
│  └─────────────────────────┘    │
│                                 │
│  Použij všetky zmysly:          │  Header
│                                 │
│  ┌─────────────────────────┐    │  Sense cards
│  │ 👁️ Vzhľad, farba, tvar  │    │
│  └─────────────────────────┘    │
│  ┌─────────────────────────┐    │
│  │ 👃 Vôňa jedla           │    │
│  └─────────────────────────┘    │
│  ┌─────────────────────────┐    │
│  │ ✋ Textúra v ústach      │    │
│  └─────────────────────────┘    │
│  ┌─────────────────────────┐    │
│  │ 👅 Chuť a jej zmeny     │    │
│  └─────────────────────────┘    │
│                                 │
│  ┌─────────────────────────┐    │
│  │      Pokračovať         │    │
│  └─────────────────────────┘    │
└─────────────────────────────────┘

STYLE:
- Food-related visual (simple, appetizing)
- 4 sense cards with emojis/icons
- Emphasis on slow, mindful eating
```

### Page 5/7 - Mindful Listening
```
Create mobile app screen for "Mindful Listening" technique - Nepanikař app.

DESIGN SYSTEM (LIGHT MODE):
- Background: #FBF6FF
- Primary: #491475
- Cards: #EDE8F3 and white
- Icon: #4EA3AD

SCREEN LAYOUT:
┌─────────────────────────────────┐
│ [←]     ███████████████  5/7    │
├─────────────────────────────────┤
│                                 │
│  👂 Všímavé načúvanie           │  Title: 22px bold
│     Technika 4 z 5              │
│                                 │
│    [Ear/sound waves visual]     │  Simple listening visual
│        〰️ 〰️ 〰️                  │  Sound waves
│                                 │
│  ┌─────────────────────────┐    │  Description (#EDE8F3)
│  │ Plne sa sústreď na to,  │    │
│  │ čo hovorí druhý, bez    │    │
│  │ plánovania svojej       │    │
│  │ odpovede.               │    │
│  └─────────────────────────┘    │
│                                 │
│  Ako načúvať všímavo:           │  Tips header
│                                 │
│  ┌─────────────────────────┐    │  Tip cards (white)
│  │ • Plná pozornosť        │    │
│  │   na hovoriaceho        │    │
│  └─────────────────────────┘    │
│  ┌─────────────────────────┐    │
│  │ • Bez plánovania        │    │
│  │   odpovede              │    │
│  └─────────────────────────┘    │
│  ┌─────────────────────────┐    │
│  │ • Všímaj si aj          │    │
│  │   neverbálne signály    │    │
│  └─────────────────────────┘    │
│                                 │
│  ┌─────────────────────────┐    │
│  │      Pokračovať         │    │
│  └─────────────────────────┘    │
└─────────────────────────────────┘

STYLE:
- Listening/sound wave visual
- 3 clear tip cards
- Focus on presence and attention
```

### Page 6/7 - Five Senses (5-4-3-2-1)
```
Create mobile app screen for "5-4-3-2-1 Grounding" technique - Nepanikař app.

DESIGN SYSTEM (LIGHT MODE):
- Background: #FBF6FF
- Primary: #491475
- Cards: white with shadow
- Grid layout for 5 senses

SCREEN LAYOUT:
┌─────────────────────────────────┐
│ [←]     ████████████████░  6/7  │
├─────────────────────────────────┤
│                                 │
│  ⭐ Všetkých päť pohromade       │  Title: 22px bold
│     Technika 5 z 5              │
│     (5-4-3-2-1 ukotvenie)       │  Additional info
│                                 │
│  ┌─────────────────────────┐    │  Description (#EDE8F3)
│  │ Ukotvenie v piatich     │    │
│  │ zmysloch - zameraj sa   │    │
│  │ na to, čo práve teraz   │    │
│  │ vnímaj.                 │    │
│  └─────────────────────────┘    │
│                                 │
│  ┌──────────┬──────────────┐    │  Grid of sense cards
│  │ 👁️        │ 👂           │    │  (white, compact)
│  │ 5 vecí   │ 4 veci       │    │
│  │ vidím    │ počujem      │    │
│  └──────────┴──────────────┘    │
│  ┌──────────┬──────────────┐    │
│  │ 👃        │ 👅           │    │
│  │ 3 veci   │ 2 veci       │    │
│  │ cítim    │ ochutnám     │    │
│  └──────────┴──────────────┘    │
│  ┌─────────────────────────┐    │
│  │ ✋                       │    │
│  │ 1 vec sa dotýkam        │    │
│  └─────────────────────────┘    │
│                                 │
│  ┌─────────────────────────┐    │
│  │      Pokračovať         │    │
│  └─────────────────────────┘    │
└─────────────────────────────────┘

STYLE:
- Grid layout (2x2 + 1 full width)
- Numbered countdown visual (5-4-3-2-1)
- Grounding/stability emphasized
- Icons for each sense
```

### Page 7/7 - Completion
```
Create mobile app screen - day completion for mindfulness techniques - Nepanikař app.

DESIGN SYSTEM (LIGHT MODE):
- Background: #FBF6FF
- Success green: #6FD866
- Primary: #491475
- Cards: white with shadow

SCREEN LAYOUT:
┌─────────────────────────────────┐
│ [←]     ████████████████████ 7/7│
├─────────────────────────────────┤
│                                 │
│         ✓ [green checkmark]     │  Large #6FD866 checkmark
│                                 │
│         Výborne!                │  Title: 28px bold, #491475
│     Deň 6 dokončený             │  Subtitle: 16px gray
│                                 │
│  ┌─────────────────────────┐    │  Summary card
│  │ Dnes si spoznal/a:      │    │
│  │ ✓ Skenovanie tela       │    │  Green checkmarks
│  │ ✓ Všímavá chôdza        │    │
│  │ ✓ Všímavé jedenie       │    │
│  │ ✓ Všímavé načúvanie     │    │
│  │ ✓ 5-4-3-2-1 ukotvenie   │    │
│  └─────────────────────────┘    │
│                                 │
│  ┌─────────────────────────┐    │  Tip card (#FEC786 - orange)
│  │ 💡 Tip                  │    │
│  │ Vráť sa k týmto         │    │
│  │ technikám kedykoľvek,   │    │
│  │ keď potrebuješ ukotvenie│    │
│  └─────────────────────────┘    │
│                                 │
│  ┌─────────────────────────┐    │  Next preview (#EDE8F3)
│  │ 📅 Zajtra: Zhrnutie     │    │
│  │ Zrekapitulujeme si      │    │
│  │ celý týždeň mindfulness │    │
│  └─────────────────────────┘    │
│                                 │
│  ┌─────────────────────────┐    │
│  │      Dokončiť           │    │  Green button #6FD866
│  └─────────────────────────┘    │
└─────────────────────────────────┘

STYLE:
- Celebration feel with checkmark
- Orange tip box for emphasis
- 5 techniques listed with checkmarks
- Green completion button
```

---

## Stitch Project Info

- **Project ID:** `12102936321319572704`
- **Design System:** "Nepanikar Light" (ID: `15593363576889124518`)
- **Model:** `GEMINI_3_1_PRO`
- **Device:** `MOBILE`
