# HPO programme — content reference

This is a **structured overview** of *what the user goes through* in the HPO
programme — structure, flow and interactions described in English.

> ⚠️ **This file is NOT the full copy.** The complete, verbatim programme text
> (every bullet, question, challenge item and example — the must-have content
> that goes into the app) lives in [`source/`](source/):
> - [source/tyzden-1.md](source/tyzden-1.md) — Week 1 (full Czech text)
> - [source/tyzden-2.md](source/tyzden-2.md) — Week 2 (full Czech text)
>
> When implementing or writing copy, take the exact wording from `source/`, not
> from the summaries below.

The programme runs **7 weeks**, one focus area per week, ideally one day at a
time (~5–20 min/day). Week themes:

1. **Introduction** — what the programme is + self-care basics (SPOKO)
2. **Mindfulness** — všímavost (What/How skills, breathing)
3. Emotion regulation *(content TBD)*
4. Distress tolerance *(content TBD)*
5. Interpersonal effectiveness *(content TBD)*
6. Self-concept *(content TBD)*
7. *(content TBD)*

Each week generally follows: **education → daily skills → reflection/summary**.

---

## Week 1 — Introduction to the programme

> **Full verbatim text:** [source/tyzden-1.md](source/tyzden-1.md).
> This is the **updated** structure and replaces the older layout still present
> in the app (see
> [implementation-spec.md → Gap analysis](implementation-spec.md#gap-analysis-new-week-1-vs-current-implementation)).

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
> This is the **updated** content. A core
> version of Week 2 is already implemented in
> [`programme_content.json`](../../assets/bpd/programme_content.json); the new
> version adds external links, more exercises, a SMART tie-in, a daily
> mindfulness **notification**, and saving exercises to the *záchranný balíček*
> (rescue package). See
> [implementation-spec.md → Week 2 additions](implementation-spec.md#week-2-additions-new-version-vs-current).

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

## Weeks 3–7

Content not yet authored / delivered. Add each week here as its source document
arrives, following the Week 1 format above.
