# HPO programme — content reference

This is a **structured overview** of *what the user goes through* in the HPO
programme — structure, flow and interactions described in English.

> ⚠️ **This file is NOT the full copy.** The complete, verbatim programme text
> (every bullet, question, challenge item and example — the must-have content
> that goes into the app) lives in [`source/`](source/):
> - [source/tyzden-1.md](source/tyzden-1.md) — Week 1 (full Czech text)
> - [source/tyzden-2.md](source/tyzden-2.md) — Week 2 (full Czech text)
> - [source/tyzden-3.md](source/tyzden-3.md) — Week 3 (full Czech text)
>
> When implementing or writing copy, take the exact wording from `source/`, not
> from the summaries below.

The programme runs **7 weeks**, one focus area per week, ideally one day at a
time (~5–20 min/day). Week themes:

1. **Introduction** — what the programme is + self-care basics (SPOKO)
2. **Mindfulness** — všímavost (What/How skills, breathing)
3. **Emotion regulation** — emoční regulace (emotions dictionary, describing +
   validating emotions, checking the facts, opposite action)
4. Distress tolerance *(content TBD)*
5. Interpersonal effectiveness *(content TBD)*
6. Self-concept *(content TBD)*
7. *(content TBD)*

Each week generally follows: **education → daily skills → reflection/summary**.

---

## Week 1 — Introduction to the programme

> **Full verbatim text:** [source/tyzden-1.md](source/tyzden-1.md).
> This structure is **implemented** (see
> [implementation-spec.md → Week 1](implementation-spec.md#week-1-spoko--implemented)).

| Day | Title | Type |
|-----|-------|------|
| 1 | Představení programu (+ HPO/DBT edukace, Moje záznamy, SMART cíle) | Intro / education / exercise |
| 2 | SPOKO + Spánek | Education + challenge |
| 3 | Potrava | Education + challenge |
| 4 | Ne Omamným látkám | Education + challenge |
| 5 | Kondice | Education + challenge |
| 6 | Léčba Onemocnění | Education + challenge |
| 7 | Reflexe SPOKO a reflexe týdne | Reflection |

### Day 1 — Představení programu

A long onboarding day combining four sub-parts. Intro text is shown as
scrollable cards / text bubbles.

**1a. Programme intro** — bullet cards explaining:
- Who the programme is for (people learning to manage BPD; also anyone with
  difficulties around emotions, stress, impulsivity, relationships).
- It is inspired by proven DBT methods.
- **It does not replace therapy** — it is a helper for those who can't/won't go
  to therapy or are waiting for a slot.
- 7 weeks, ideally daily but not required, ~5–20 min/day; practical exercises +
  short explanations.
- Areas covered across the 7 weeks: všímavost, emoční regulace, snášení tísně,
  mezilidské vztahy, sebepojetí.
- Each week: education → new skills → end-of-week reflection. One **key skill**
  per week (required), plus optional extra exercises (user is encouraged to do
  them).
- **Input:** first name + how the app should address the user (name + pronoun).

**1b. HPO + DBT education** — informational cards:
- What BPD (HPO) is: mood swings, impulsive behaviour, unstable relationships,
  unstable self-image.
- Link "zjistit víc" → external Google Doc about HPO.
- Programme is for diagnosed and non-diagnosed alike; goal is not to label.
- What DBT is and how it helps.
- Link "Chci vědět víc" → external Google Doc about DBT.
- Why practising skills matters (knowledge alone isn't enough).

**1c. First activity → Moje záznamy** (deep-link into the existing *My records*
module). Mood check-in:
- Question: *„Jak se dnes máš?"* — scale **1–10** with emoji.
- Reaction by score band:
  - **6–10** → one random encouraging line (e.g. *„Dnes to docela jde."*,
    *„Tohle se počítá."*) + follow-up *„Co dnes pomohlo?"*
  - **5** → one neutral line (e.g. *„Dnes je to někde uprostřed."*,
    *„Střed je taky ok."*)
  - **1–4** → *„Zkus jednu malou věc:"* + show 3–4 options from: napij se vody /
    dej si malé jídlo / lehni si / krátká procházka / protáhni se / napiš
    někomu / dej si sprchu.
- Follow-up: *„Pomohlo to aspoň trochu?"* → ano / trochu / ne (or 0–10 slider).
- Closing: appreciation for starting + "see you tomorrow".

**1d. Cíle a očekávání (SMART)** — light conversation + goal setting:
- Free-text input: expectations entering the programme (shown again in the last
  week).
- Free-text input: goals to achieve (shown again in the last week).
- Reassurance that small goals are fine.
- **SMART explanation** (ideally visualised; each letter tappable to reveal its
  detail):
  - **S** – Specifický
  - **M** – Měřitelný
  - **A** – Adekvátní
  - **R** – Relevantní
  - **T** – Termínovaný
- **SMART worksheet** — fill-in fields with examples revealed on tap:
  - Specifický (S): *Chci…*
  - Měřitelný (M): *Poznám to tak, že…*
  - Adekvátní (A): *Je to dosažitelné, protože…*
  - Relevantní (R): *Je to důležité, protože…*
  - Termínovaný (T): *Chci to zvládnout do…*
- Closing appreciation.

### Days 2–6 — the SPOKO model

`SPOKO` is a self-care model (the Czech counterpart of DBT's **PLEASE**): caring
for the biological foundations of psychological stability. One letter per day.

| Letter | Area | Day |
|--------|------|-----|
| **S** | **S**pánek (sleep) | 2 |
| **P** | **P**otrava (food) | 3 |
| **O** | ne **O**mamným látkám (no intoxicants) | 4 |
| **K** | **K**ondice (fitness/movement) | 5 |
| **O** | léčba **O**nemocnění (treating illness) | 6 |

Every SPOKO day shares the same shape:
1. Short education on why the area affects mood/stress/stability.
2. A few **mapping questions** (no right/wrong answers — just notice the current
   state).
3. A **challenge list** — pick at least one thing to try today; can pick more.
4. Option to **set a future challenge** → deep-link to a *challenge* feature
   where the user selects items to work on and tracks progress (optional).
5. Closing appreciation line.

Day 2 additionally introduces the whole SPOKO model up front (the five letters).
Days 3, 4 link to external help contacts where relevant (eating disorders →
PPP contacts; intoxicants → "Podané ruce" infoline).

**Challenge items (per day)** — see the source doc for the full lists; examples:
- *Spánek:* go to bed 30 min earlier, phone away 1h before sleep, regular sleep
  time, last caffeine ≥6h before bed, 5 min slow breathing before sleep.
- *Potrava:* eat ≥3×/day, don't skip main meals, drink ≥2.5 l, eat without a
  screen, add fruit/veg.
- *Omamné látky:* no intoxicants today, delay first use, notice cravings
  without judgement, replace one "routine dose" with another activity.
- *Kondice:* 10–20 min walk, 5–10 min stretch, take the stairs, 10 min outside,
  consciously release tension.
- *Léčba onemocnění:* book a check-up, take meds as planned, rest when tired,
  list health topics to address, take one small step toward care.

### Day 7 — Reflexe SPOKO a reflexe týdne

- Notes the week was mostly about getting acquainted; future weeks are more
  practical.
- Recall check: the five SPOKO areas (revealed on tap).
- Reflection (free-text): What did SPOKO give me? Which area was most relevant?
  Where is the biggest room for a small change? What do I want to keep doing?
- Closing congratulations on finishing week 1.

---

## Week 2 — Všímavost (mindfulness)

> **Full verbatim text:** [source/tyzden-2.md](source/tyzden-2.md).
> This content is **implemented** (2026-08-03) — external links, the full
> exercise menus, the SMART tie-in, the daily mindfulness **notification** and
> the *záchranný balíček* included. See
> [implementation-spec.md → Week 2](implementation-spec.md#week-2-všímavost--implemented).

Key skill: **Co + Jak dovednosti** (What + How skills).

| Day | Title | routeType |
|-----|-------|-----------|
| 1 | Edukace všímavosti | `day1MindfulnessEducation` |
| 2 | Co dovednosti (What skills) | `day2WhatSkills` |
| 3 | Jak dovednosti (How skills) | `day3HowSkills` |
| 4 | Všímavé dýchání | `day4Breathing` |
| 5 | Pauza | `pause` |
| 6 | Techniky všímavosti | `day6MindfulnessTechniques` |
| 7 | Shrnutí | `summary` |

### Day 1 — Edukace všímavosti

Education-only day.
- What mindfulness is: consciously focusing attention on the present moment —
  what we experience/feel/do right now, without judgement. Not "an empty head".
- Why it helps people with strong emotions / impulsivity / stress: more calm and
  space to choose how to react → less acting purely on emotion.
- Research note: regular practice lowers anxiety/depression/tension, improves
  focus and relationships. In DBT it is the **foundational skill** all others
  rest on — it lets us "stop" and notice what's really happening before the next
  step.
- External links "Chci vědět víc": muni.cz mindfulness article + YouTube video.

### Day 2 — Co dovednosti (What skills)

The three skills that describe *what I do* when practising mindfulness. Intro +
infographic, then practice: **pick at least 2 exercises from each** of the three
(can be done anytime today, not all at once).

- **Pozorování** (observe) — just notice what's happening (breath, body
  sensation, thought, surroundings) without judging, like a photographer.
  Exercise menu (9): *Očima, Ušima, Čichem, Chuť, Tělem, Dotek, Napětí, Dech,
  Myšlenky* (e.g. thoughts = clouds passing).
- **Popisování** (describe) — put words to what you noticed ("Teď cítím napětí v
  ramenou"); creates distance. Exercise menu (5): *Popisuj okolí, Popisuj řeč a
  chování, Popisuj emoce, Popisuj myšlenky, Popisuj dech.*
- **Participace** (participate) — be fully immersed in the activity you're doing.
  Exercise menu (6): *Zapojení se u běžných aktivit, Prožij spojení s okolím,
  Hudba a pohyb, Aktivity s druhými, Tělesné aktivity, Slova a dech.*

### Day 3 — Jak dovednosti (How skills)

The ways *how* to perform the What-skills (per DBT). Intro + infographic, then
practice (pick ≥2 from each).

- **Jednomyslně** (one-mindfully) — be fully present, one thing at a time, not
  pulled into past/future. Menu: tea/coffee prep, washing dishes, washing hands,
  tidying, bathing, meditation ("jedna" on each breath).
- **Bez hodnocení** (non-judgementally) — observe thoughts/feelings neutrally,
  not good/bad. Menu: notice & label "to je hodnotící myšlenka", count them,
  describe facts only, emotions without labels, change tone/posture when judging,
  recount day as facts, write a fact-only description. Includes **judgmental vs
  non-judgmental example pairs** (e.g. "Jsem neschopný idiot" → "Udělal jsem v
  úkolu tři chyby, protože jsem byl unavený").
- **Efektivně** (effectively) — focus on what reaches the goal, not emotions or
  stubbornness. **Ties back to the SMART goals set in Week 1** (is my behaviour
  effective toward them?). Menu (≥2): "Je to, co chci udělat, opravdu účinné?",
  drop the need to be right, "Pomáhá mi to teď?", let go of self-will and try
  what works.
- Closing: tomorrow be mindful in at least one situation, applying all Co + Jak
  skills.
- **Notification (from Day 4 onward):** *"Čas na všímavost – věnuj teď tři minuty
  všímavosti. Nezapomeň co a jak."* — daily until the end of the mindfulness
  module; in later modules the same notification **2× per week**.

### Day 4 — Všímavé dýchání

Short focus on mindful breathing — helps stop and anchor in the present, calm
body and mind, reduce impulsive reactions. Pick from breathing options; each has
an optional guided **video link**:
- **Všímavé dýchání** — just observe natural breath; gently return when attention
  drifts. (video)
- **Dýchání do čtverce** (box) — inhale 4 / hold 4 / exhale 4 / hold 4, repeat. (video)
- **Dýchání 7-11** — inhale 7, exhale 11; calms the nervous system. Start with
  4–6 if 7/11 is too much. (video)
- Remaining exercises can be revisited or **saved to the *záchranný balíček***
  (rescue package).

### Day 5 — Pauza

Rest day. No work — only the mindfulness **notification** ("Čas být mindful") and
the **mood record** (záznam nálady).

### Day 6 — Techniky všímavosti

Extends the toolkit. **Pick one** exercise to try today; the rest for later:
- **Skenování těla** (body scan) — notice tension on the exhale and let it
  release. (video)
- **Všímavá chůze** (mindful walking) — each step, foot–ground contact, body
  movement.
- **Všímavé jezení** (mindful eating) — eat slowly, notice taste/smell/texture.
- **Všímavé naslouchání** (mindful listening) — fully focus on the other, no
  planning your reply.
- **Všech pět pohromadě** (5 senses / 5-4-3-2-1) — anchor in what you now see,
  hear, smell, taste, touch.

### Day 7 — Shrnutí

Reflection on the mindfulness week (free-text):
- What was most interesting? What did you learn?
- Did you use any of it in your life? What and when?
- When did mindfulness help you?
- When specifically could you use this skill next week?

---

## Week 3 — Emoční regulace (emotion regulation)

> **Full verbatim text:** [source/tyzden-3.md](source/tyzden-3.md).
> Delivered and implemented 2026-08-06. Screen plan:
> `.claude/design/week3/WEEK3_SCREEN_PLAN.md`, state:
> `.claude/design/week3/TRACKING.md`. Runtime verification still outstanding
> (task W3-03).

Key skill: **popis a validace emocí** + the two response-changing techniques
(ověřování faktů, opačná akce).

| Day | Title | Type |
|-----|-------|------|
| 1 | Edukace o emocích | Education + exercise |
| 2 | Validace a popis emocí | Education + worksheet |
| 3 | Změna odezvy na emoce — ověřování faktů | Education + worksheet |
| 4 | Změna odezvy na emoce — opačná akce | Education |
| 5 | Když to, co děláte, nefunguje | Recall (SPOKO) |
| 6 | Pauza | Rest |
| 7 | Shrnutí | Reflection |

> Note the week's day order differs from Weeks 1–2: the **pause is Day 6**, not
> Day 5, and Day 5 is a short SPOKO recall.

### Day 1 — Edukace o emocích

The largest education day of the programme so far. Four blocks:

- **What emotion regulation is** — recognising and naming what I feel,
  understanding it, and consciously choosing how to react. Not suppression.
  Mindfulness (Week 2) helps: noticing feelings early → reacting more calmly.
- **Emotions are not facts** — they are signals pointing at what matters to us.
  The goal is not to get rid of emotions but to reduce the suffering around them.
- **Emotions dictionary (10 emotions)** — each with its function: *vztek, strach,
  radost, smutek, znechucení, stud, vina, překvapení, žárlivost, závist.* The
  source explicitly wants this to be a **reference the user can return to
  anytime** ("slovník emocí"), not just a page inside the day. There is an
  authored infographic (`ZÁKLADNÍ EMOCE`, 6 emotions) —
  `.claude/design/week3/emoce_infografika.png`.
  External link: `psychologie.cz/emoce-chteji-ven`.
- **Why regulation is hard (6 reasons)** — biologie · nedostatek dovedností ·
  posilování emočního chování · náladovost · přehlcení emocemi · mýty o emocích.
- **Myths about emotions (22 items)** + a **myth-busting exercise**: each myth is
  shown with space for the user to write their own counter-sentence; tapping
  reveals an authored example. All 22 busted versions are in the source.

### Day 2 — Validace a popis emocí

- Naming emotions lowers their intensity; without naming there is nothing to
  regulate. Emotions have a **structure** — a chain of events with points where
  change is possible.
- **Model pro popis emocí (6 steps)** — Spouštěcí událost · Interpretace ·
  Biologické změny a prožívání (tělesné pocity + nutkání) · Výrazy a činy ·
  Pojmenování emoce · Následky. Worksheet over a recent strong-emotion situation,
  with a full authored example revealed on tap (bad test grade).
- **Validace emocí** — not agreeing with one's behaviour, but acknowledging the
  truth of one's inner experience. Four benefits: lowers intensity · shows the
  inner world makes sense · stops **secondary emotions** · enables change.
- **5 sentence stems** to complete ("To, že cítím …… je oprávněné, protože…"),
  each with an authored example on tap.

### Day 3 — Ověřování faktů (checking the facts)

- Events influence thoughts, and thoughts influence emotions — and emotions
  influence thoughts back. Verifying facts can change what we feel.
- **6-step method** — name the emotion to change · describe the event in observed
  facts · examine thoughts/interpretations and alternatives · identify the assumed
  threat and its probability · imagine the worst case *and coping with it* ·
  judge whether the emotion fits the facts.
- **Worksheet (7 fields)** mirroring those steps, incl. sub-fields for the threat
  and the worst case.

### Day 4 — Opačná akce (opposite action)

- When an emotion pushes toward behaviour that reinforces it (úzkost → vyhýbání,
  hněv → hádka), acting opposite changes the emotion — **when the emotion is
  disproportionate or unhelpful**.
- Works on **three levels**: tělesná (face, posture, breath) · kognitivní
  (what we tell ourselves) · chování (the act itself — walk into the situation).
- Closing caution: it sounds simple but is hard; practise on small, safe
  situations first and build up.
- *Source contains no exercise or worksheet for this day — education only.*

### Day 5 — Když to, co děláte, nefunguje

One line in the source: recall your **SPOKO** skills (link to the SPOKO model
from Week 1). The title implies more content than was authored.

### Day 6 — Pauza

Rest day: "Dnes program vynecháme. Máš za sebou skvělý pokrok a zasloužíš si
chvilku odpočinku."

### Day 7 — Shrnutí

Reflection (free-text): What was key this week? What new insights? Did you put
any of it into practice — what and how? Where do you see the biggest use for this
skill next week?

---

## Week 4 — Snášení tísně (distress tolerance)

> **Full verbatim text:** [source/tyzden-4.md](source/tyzden-4.md).
> Delivered 2026-08-12, **not yet implemented.** Screen plan:
> `.claude/design/week4/WEEK4_SCREEN_PLAN.md`, state:
> `.claude/design/week4/TRACKING.md`. Twelve open questions (OQ-1…OQ-12), eight
> of them needing the author (task W4-01).

Key skills: **STOP**, **TIPS** and **UZNÁVÁM** — surviving a crisis moment without
making it worse. Explicitly *not* for everyday problems or long-term stressors.

| Day | Title | Type |
|-----|-------|------|
| 1 | Edukace o stresu | Education |
| 2 | Dovednosti pro překonání krize | Education + skills (STOP, TIPS) + PMR video |
| 3 | Pauza | Rest |
| 4 | Všímavost u stresu | Education + drawn technique from Week 2 |
| 5 | Techniky pro zvládnutí okamžiku krize | Education + 22-item checklist (UZNÁVÁM) |
| 6 | Pauza | Rest |
| 7 | Shrnutí | Reflection |

> **Two rest days** (3 and 6), each with its own wording — a first for the
> programme, and the reason `DayPauseScreen` must key its copy by *(week, day)*
> rather than by week alone. Only five days carry content.

### Day 1 — Edukace o stresu

Stress is a natural reaction and in small doses useful; too strong or too long and
it becomes **distres**. Finding it unpleasant "neznamená to slabost, ale lidskost".
Long-term stressors need long-term work — **this week is about acute moments**.
External link: a YouTube explainer.

### Day 2 — Dovednosti pro překonání krize

- **What a crisis is** — feelings so strong you lose perspective and feel a huge
  impulse to act immediately. The goal is not to solve the problem but to get
  through it "a neudělat nic, co nejde vzít zpátky".
- **When to use these skills** — intense pain or strong emotions that cannot be
  eased quickly, where acting on the emotion would make things worse.
- **When *not* to use them** — everyday problems, solving all of life's problems,
  or searching for meaning.
- **STOP** — Stop! · Tah zpátky · Obhlédni situaci · Postupuj všímavě.
- **TIPS** — Teplota (cold water, ice) · Intenzivní cvičení · Pravidelné dýchání
  (inhale 4, exhale 6–8; the source asks to link back to Week 2's breathing
  exercises) · Svalová relaxace, followed by a **progressive muscle relaxation
  video** to do together.
- *The text promises "tři klíčové dovednosti" but lists two — the third
  (UZNÁVÁM) arrives on Day 5.*
- *Two body-based techniques carry real contraindications (cold-water immersion
  with breath-holding; intense exercise). See OQ-4.*

### Day 3 — Pauza

"Dnes program vynecháme. Udělal/a jsi velký pokrok a zasloužíš si chvíli klidu
pro načerpání nové energie."

### Day 4 — Všímavost u stresu

Mindfulness from Week 2 applied to stress — helping **in the moment** (stop, calm
the breath, notice, respond instead of react) and **long-term** (resilience). The
day closes by revisiting one Week 2 technique; the source suggests drawing it at
random, "například i formou „kola štěstí"".

### Day 5 — Techniky pro zvládnutí okamžiku krize

- When an emotion cannot be changed, distraction helps **until the storm passes** —
  deliberate and temporary, not avoidance.
- **UZNÁVÁM** (7 letters) — Úsilí (činnosti) · Zapojení (přispívání) · Náhled
  (porovnávání) · Aktivní obrana (odstranění) · Vytvoření jiné emoce · Aktivace
  smyslů · Myšlenky.
- **Checklist of 22 concrete items** across those seven groups, which the user
  ticks to mark what they *tried* — a retrospective record, so no minimum.
- *The short list and the checklist disagree on the letter labels
  ("Ú-silím"/"Ná-hledem" vs "U – Úsilí"/"N – Náhled"); the checklist matches the
  acronym. See OQ-10.*

### Day 6 — Pauza

A second, differently worded rest day: "Dnes si dopřejeme volnější den bez
programu. Máš za sebou opravdu velký kus práce…"

### Day 7 — Shrnutí

Recognition for getting through "tento náročný modul", then three free-text
questions: what brought the most interesting moments and what you take away · have
you already used the new steps in life, what and when · when exactly is the
opportunity to use this skill next week.

---

## Weeks 5–7

Content not yet authored / delivered. Add each week here as its source document
arrives, following the Week 1 format above.
