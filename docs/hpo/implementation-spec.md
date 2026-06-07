# HPO programme — implementation spec

How the [content](content-reference.md) maps onto the Flutter app. Read together
with `CLAUDE.md → "BPD Programme Development"`, which has the step-by-step
recipe for adding a day screen.

## How a week renders

1. `BpdWeeksScreen` — week selection carousel.
2. `BpdWeekDetailScreen` (`/bpd-programme/week/:weekNumber`,
   [bpd_week_detail_screen.dart](../../lib/screens/bpd_programme/bpd_week_detail_screen.dart))
   — lists the days for the week, shows lock/active/completed state, and on tap
   opens a **day preview sheet** (`showDayPreviewSheet`) with a Start button.
3. Start routes to the per-day screen based on the day's `routeType`.
4. Per-day screens use the reusable widgets in
   [day_page_base.dart](../../lib/screens/bpd_programme/widgets/day_page_base.dart)
   (`DayPageBase`, `SectionHeader`, `FeatureCard`, `NumberedBenefit`, `InfoBox`).
5. Progress is tracked via `BpdDaysDao` (`lib/services/db/bpd/`); days unlock
   over time (`unlockDate`, `getRemainingTime()`).

> Note: day metadata currently lives in **two** places that must agree:
> - the `_weekDaysContent` map inside `bpd_week_detail_screen.dart` (title,
>   description, estimatedTime, activityType, routeType — drives the list + sheet)
> - `assets/bpd/programme_content.json` (richer page-level content for education
>   days)
>
> The week-detail screen reads its day list from the hard-coded Dart map, **not**
> from the JSON. Keep both in sync when changing a week.

## Route types

`_DayRouteType` enum in `bpd_week_detail_screen.dart`. Each value maps to either
a shared screen or a dedicated per-day screen pushed in `_handleDayTap`:

| routeType | Screen |
|-----------|--------|
| `onboarding` | `Day1OnboardingScreen` (week 1) |
| `day2Education` | `Day2EducationScreen` (week 1, HPO+DBT) |
| `smart` | `SmartEducationScreen` (week 1) |
| `day4Please` | `Day4PleaseScreen` (week 1) |
| `pause` | `DayPauseScreen` (shared) |
| `summary` | `WeekReviewScreen` (shared) |
| `week2Day1MindfulnessIntro` … `week2Day6Techniques` | week 2 day screens |
| `regular` | placeholder (not implemented — shows a snackbar) |

Adding a day = add an enum value, a `case` in the `_handleDayTap` switch, a
typed route in `routes.dart`, and the screen widget.

## JSON content schema

`assets/bpd/programme_content.json` → `{ "weeks": [ { week } ] }`.

```jsonc
week = {
  "weekNumber": int,
  "titleKey": string,
  "shortDescription"?: string,
  "keySkill"?: string,
  "days": [ day ]
}

day = {
  "dayNumber": int,
  "title": string,
  "description": string,
  "estimatedTime": string,      // e.g. "10-15 min"
  "activityType": string,       // e.g. "Edukace", "Cvičení", "Reflexe"
  "routeType": string,          // matches _DayRouteType
  "content"?: { ... }           // shape depends on the day
}
```

`content` page types seen in week 2 (a day = `{ "pages": [ page ] }`):

| `type` | Key fields |
|--------|-----------|
| `intro` | title, subtitle, description, `learningPoints[]` |
| `education` | id, title, subtitle?, description, one of `characteristics[]` / `benefits[]` / `practicePoints[]`, note?, quote? |
| `skill` | id, title, icon, description, `exercises[{title,text}]` |
| `technique` | id, title, icon, description, steps[]?, tip? |
| `reflection` | title, question |
| `completion` | title, subtitle, summary, tip?, `nextDay{title,description}` |

`pause` / `summary` days use flat content instead of `pages`:
- pause → `{ message, tip }`
- summary → `{ weekSummary[], reflectionQuestions[], quote }`

Icons are Material icon names as strings (e.g. `"trending_up"`, `"spa"`).

## Gap analysis: new Week 1 vs current implementation

The new Week 1 content (SPOKO model) is **not** what the app ships today.
Current Week 1 (in both the Dart map and JSON):

| Day | Current | New (target) |
|-----|---------|--------------|
| 1 | onboarding | onboarding **+ HPO/DBT + Moje záznamy + SMART** combined |
| 2 | HPO+DBT education | **SPOKO intro + Spánek** |
| 3 | SMART | **Potrava** |
| 4 | PLEASE | **Ne Omamným látkám** |
| 5 | pause | **Kondice** |
| 6 | pause | **Léčba Onemocnění** |
| 7 | summary | **Reflexe SPOKO + týdne** |

Implications / work needed to reach the new Week 1:
- **Day 1 becomes multi-section** (intro → HPO/DBT → Moje záznamy → SMART). Today
  these are three separate days (onboarding / day2Education / smart). Decide
  whether to merge into one onboarding flow or keep separate screens reachable
  from one day.
- **Days 2–6 = five new SPOKO day screens.** They share one template
  (education → mapping questions → challenge list → optional future challenge →
  closing), so a single reusable `SpokoDayScreen` driven by JSON is the natural
  approach rather than five bespoke screens. New `routeType`s (or one
  parameterised `spoko` type) + cases needed.
- **PLEASE (`day4Please`) is dropped** from Week 1 in the new version (SPOKO is
  its replacement). Confirm before removing the existing screen.
- **No pause days in the new Week 1.**
- Update both `_weekDaysContent[1]` and `programme_content.json` week 1.

### New interactions the SPOKO/Day-1 content needs

These aren't yet expressed in the JSON schema and may need new page types or
widgets:

- **Name + pronoun input** (Day 1) — stored and reused for addressing the user.
- **Mood check-in** with 1–10 emoji scale and **score-banded random responses**
  (6–10 / 5 / 1–4 branches) — deep-links into the *My records* module; reuse the
  existing mood widgets where possible.
- **Free-text inputs persisted and re-surfaced in the final week** (expectations
  + goals).
- **Tappable SMART letters** revealing per-letter detail; **SMART worksheet**
  with example-on-tap fields.
- **Challenge system**: per-day pick-list + an optional **future challenge
  tracker** the user opts into and tracks over time. Deep-links labelled
  "(proklik na challenge)" in the source. This is a new feature surface, not yet
  in the app.
- **Deep-links to existing contacts** (PPP / "Podané ruce") and to *My records*.
- **External links** (Google Docs about HPO and DBT).

## Week 2 additions (new version vs current)

Week 2 already ships (screens + JSON). The new content
([content-reference.md → Week 2](content-reference.md#week-2--všímavost-mindfulness))
mostly matches, but adds these, which need implementation:

- **External links** — Day 1 (muni.cz article + YouTube), Day 4 & Day 6
  (per-technique guided-video links). Needs a `links[]` field on the relevant
  pages + the app's URL-launch helper.
- **More observation exercises** — Day 2 *Pozorování* now has 9 items (adds
  Čichem, Chuť, Tělem, Dotek, Napětí) vs the 5 currently in JSON. Update the
  `skill` page `exercises[]`.
- **"Pick ≥2 from each"** selection on Days 2–3 — currently the exercises are
  display-only; the new version implies a selectable/checkable list.
- **SMART tie-in** — Day 3 *Efektivně* references the SMART goals set in Week 1
  (needs read access to the persisted goals from GEN-02 / W1-06).
- **Mindfulness notification** — from Day 4: daily *"Čas na všímavost…"* until the
  end of the module, then 2×/week in later modules. Needs a scheduled
  notification via `NotificationsService` (AwesomeNotifications) with module-aware
  frequency.
- **Záchranný balíček (rescue package)** — Day 4/6 let the user save exercises to
  a rescue package. Confirm whether this maps to an existing app feature or is new.
- **Day 5 pause** — new version specifies only the notification + a mood record
  (no other content).

## When adding the remaining weeks

1. Add the week object to `programme_content.json`.
2. Add `_weekDaysContent[weekNumber]` in `bpd_week_detail_screen.dart`.
3. For each non-shared day: enum value + switch case + typed route + screen.
4. Run build_runner (max 2 tries, else hand-write `.g.dart` from a sibling).
5. Keep day screens < 300 lines; split pages out; use `day_page_base.dart`
   widgets; never hardcode the brand colour (read from theme).
