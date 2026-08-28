# HPO programme — implementation spec

How the [content](content-reference.md) maps onto the Flutter app. Read together
with `CLAUDE.md → "BPD Programme Development"`, which has the step-by-step
recipe for adding a day screen.

## Where the content lives

**Dart, not JSON.** `assets/bpd/programme_content.json` used to hold a second
copy of the day content, but nothing ever read it at runtime — it was deleted
(2026-08-03). The sources of truth are:

- **[`docs/hpo/source/*.md`](source/)** — the verbatim programme copy (authored
  content). Take wording from here when implementing.
- **Dart page widgets + per-day `dayN_content.dart` data files** — what the app
  actually renders.
- **`_weekDaysContent` in
  [bpd_week_detail_screen.dart](../../lib/screens/bpd_programme/bpd_week_detail_screen.dart)**
  — the day list metadata (title, description, estimatedTime, activityType,
  routeType) that drives the week detail list + preview sheet.

`assets/bpd/bpd_weeks_data.json` *is* read (by `BpdWeeksDataManager`) and holds
the week-level skill-tree data only.

## How a week renders

1. `BpdWeeksScreen` — week selection carousel.
2. `BpdWeekDetailScreen` (`/bpd-programme/week/:weekNumber`) — lists the days for
   the week, shows lock/active/completed state, and on tap opens a **day preview
   sheet** (`showDayPreviewSheet`) with a Start button.
3. Start routes to the per-day screen based on the day's `routeType`.
4. Progress is tracked via `BpdDaysDao` (`lib/services/db/bpd/`); days unlock
   over time (`unlockDate`, `getRemainingTime()`).

## Shared day-screen building blocks

In `lib/screens/bpd_programme/widgets/`:

| Widget | Use |
|--------|-----|
| `DayPageBase` | scrollable content + fixed bottom button (every page) |
| `DayFlowHeader` | close/back + segmented progress + `n/N` counter |
| `SectionHeader`, `FeatureCard`, `NumberedBenefit`, `InfoBox` | content blocks |
| `SkillPracticePage` + `SkillSectionData` / `PracticeExercise` | education + "pick ≥2" exercise menu, picks persisted |
| `TechniqueMenuPage` + `TechniqueData` | "pick one from the menu" + detail sheet (video, breathing exercise, rescue-package save) |
| `SelectableExerciseTile`, `PickCounterHint` | checkable exercise row + "vybráno X z minimálně Y" |
| `ExternalLinkButton`, `ExternalLinkText`, `LinkLeadText` | external links via `launchUrLink` |
| `RescueSaveButton` | záchranný balíček toggle for one exercise |
| `ReflectionField`, `ReflectionQuestionList` | free-text reflection questions |
| `DayCompletionPage` + `NextDayTeaser` | closing page of a regular day |
| `WeekCompletionPage` | closing page of a week's reflection day |

In `widgets/chat/`, for the education pages:

| Widget | Use |
|--------|-----|
| `ChatDayPage` + `ChatStep` | tap-through chat flow with typing indicator; optional per-step `enabled` gate |
| `ChatBotBubble`, `ChatTypingIndicator`, `ChatDayStamp` | the conversation itself |
| `ChatInfoCard`, `ChatConceptCard`, `ChatNumberedList`, `ChatStatsRow`, `ChatAreaChips` | rich messages (`chat_messages.dart`) |
| `ChatFeatureList` + `ChatFeatureItem`, `ChatLinksCard` + `ChatLink` | list-shaped messages (`chat_lists.dart`) — chat forms of a `FeatureCard` stack and of a "Chci vědět víc" link block |

A day screen is therefore mostly a `PageView` over these, plus a
`dayN_content.dart` holding the verbatim copy.

### Which pages are chats

**Pages that teach are chats; pages that collect a choice or an answer are
forms.** All four implemented weeks follow this. So a day's education arrives as
`ChatDayPage` steps, and the pick-lists, worksheets and reflection questions that
follow it stay `DayPageBase` forms. A day with nothing to teach (Week 2 Day 6,
whose whole lead-in is one sentence) gets no chat page at all.

An interactive *exercise* is not a form in this sense — it rides inside the chat
as a `ChatRichMessage` (Week 1 Day 7's reveal-on-tap `SpokoRecallList`, Week 1
Days 3–6's tappable safety-contact card). The distinction is whether the app
stores an answer, not whether the widget responds to touch.

## Route types

`_DayRouteType` enum in `bpd_week_detail_screen.dart`. Each value maps to a
screen pushed in `_handleDayTap`:

| routeType | Screen |
|-----------|--------|
| `onboarding` | `Day1OnboardingScreen` (week 1, day 1) |
| `week1Day2Spoko` | bespoke Day 2 (SPOKO intro + spánek) |
| `week1Day3Potrava` … `week1Day6Onemocneni` | `SpokoDayScreen` (one parameterised screen) |
| `week1Day7Reflexe` | `Week1Day7ReflectionScreen` |
| `week2Day1MindfulnessIntro` … `week2Day6Techniques` | week 2 day screens |
| `week2Day7Summary` | `Week2Day7SummaryScreen` |
| `pause` | `DayPauseScreen` (shared; mood-record deep-link) |
| `smart` | `SmartEducationScreen` (legacy week-1 screen, not in any day list) |
| `regular` | placeholder (not implemented — shows a snackbar) |

Adding a day = add an enum value, a `case` in the `_handleDayTap` switch, a
typed route in `routes.dart` **(both the annotation on the screen and the entry
in `_bpdProgrammeRoutes` — missing the latter makes the day unroutable)**, and
the screen widget.

## Persistence

| DAO | Store | What |
|-----|-------|------|
| `BpdWeeksDao` / `BpdDaysDao` | `bpd_weeks`, `bpd_days` | progress + unlocking |
| `BpdSmartGoalsDao` | `bpd_smart_goals` | SMART goals (Day 1, resurfaced on W2 Day 3) |
| `BpdExpectationsDao` | `bpd_expectations` | Day 1 expectations + goals |
| `BpdChallengesDao` | `bpd_challenges` | items ticked during a day; optional `section` for days with several pick-lists (W2 Days 2–3) |
| `BpdChallengeTrackerDao` | `bpd_challenge_tracker` | durable challenge list + check-offs + reminders |
| `BpdReflectionDao` | `bpd_reflection` | a week's reflection answers, keyed per week |
| `BpdRescuePackageDao` | `bpd_rescue_package` | záchranný balíček (saved exercises) |

## Notifications

`NotificationsService` (AwesomeNotifications):

- `moodReminder` / `sleepRateReminder` — user-configured in notification settings.
- `challengeReminder` — one per tracked challenge, scheduled by the tracker.
- `mindfulnessReminder` — "Čas na všímavost…", opted into on Week 2 Day 4
  (`enableMindfulnessReminder`). It rides the settings-driven schedule loop, so
  it survives a reschedule. Both programme-scheduled types are hidden from the
  settings list via `NotificationType.isProgrammeManaged`.

`rescheduleNotifications` cancels *all* schedules, then restores per-challenge
reminders (`_restoreChallengeReminders`) — without that, changing any
notification setting silently wiped the user's challenge reminders.

## Week 1 (SPOKO) — implemented

Day 1 combined onboarding (intro + HPO/DBT + mood check-in + SMART), Days 2–6 the
SPOKO letters (Day 2 bespoke because it also introduces the model; Days 3–6 share
`SpokoDayScreen` driven by `SpokoDayData`), Day 7 reflection with persisted
answers.

The legacy screens are gone (deleted 2026-08-19): `day2_education/` and
`day4_please/` were orphaned — nothing imported them, yet each declared a
`@TypedGoRoute` on a path a live screen already owns
(`/bpd-programme/week/1/day/2` and `.../day/4`), so adding either to
`_bpdProgrammeRoutes` would have collided. `day3_smart/` was *wired* but
unreachable: routes.dart registered `/bpd-programme/smart` and
`/bpd-programme/smart/new-goal` and `_handleDayTap` had a `case
_DayRouteType.smart`, but no `_weekDaysContent` entry ever used that route type.
Removing it took the files, both route registrations, both imports, the enum
value and the dead `case`. The SMART the programme actually uses lives in
`day1_onboarding/smart_intro_page.dart` + `smart_worksheet_page.dart` and
`widgets/smart_goal_fields.dart`.

Converted to chat on 2026-08-19 (Day 1 already was; the rest of the week was the
only place still teaching on `DayPageBase`, which the author noticed as an
inconsistency):

| Day | Chat page | Replaced |
|-----|-----------|----------|
| 2 | `education_chat_page.dart` — SPOKO letters card, `ChatConceptCard` for S – spánek | `spoko_intro_page.dart` + `sleep_education_page.dart`, merged, so the day is 3 pages not 4 |
| 3–6 | `spoko_day/spoko_education_chat_page.dart` — paragraphs, note, `ChatNumberedList` questions, optional contact card | `spoko_education_page.dart` |
| 7 | `recall_chat_page.dart` — recap + `SpokoRecallList` as a rich message | `recall_page.dart` |

The old pages' icon + heading blocks are gone: the day flow header already names
the day, and a heading is not a chat message.

## Week 2 (Všímavost) — implemented

Rewritten from the shipped Slovak version to Czech, matching
[source/tyzden-2.md](source/tyzden-2.md):

| Day | Screen | Notes |
|-----|--------|-------|
| 1 | `day1_mindfulness_intro/` | education only, so all of §1 is one chat flow + completion; muni.cz + YouTube links arrive as a `ChatLinksCard` |
| 2 | `day2_what_skills/` | chat intro → 3 × `SkillPracticePage`; 9 / 5 / 6 exercises, pick ≥2, persisted |
| 3 | `day3_how_skills/` | chat intro → 6 / 7 / 4 exercises; non-judgmental example pairs; Week 1 SMART goal surfaced |
| 4 | `day4_breathing/` | chat intro → `TechniqueMenuPage` (3 options → detail sheet with video + breathing exercise + rescue save) → reminder opt-in |
| 5 | `shared/day_pause_screen.dart` | mood-record deep-link only, per source |
| 6 | `day6_techniques/` | `TechniqueMenuPage` (5 techniques, pick one); no chat page — the day teaches nothing |
| 7 | `day7_summary/` | chat recap → 4 questions (persisted via `BpdReflectionDao`) → week completion |

The education was originally built as scrollable `DayPageBase` pages and moved to
chat (2026-08-12) so the week matches Week 3. That retired `SkillsIntroPage` and
Day 1's three page widgets; their copy now lives in `day1_content.dart` and the
`week2DayNIntro*` constants. Day 1's old "CO TĚ DNES ČEKÁ" agenda list is gone on
purpose — in a chat the conversation is the agenda.

Known gap: the source's "2× per week in later modules" downgrade of the
mindfulness reminder is not implemented — no later module exists to trigger it
(see TODO W2-05).

## Week 3 (Emoční regulace) — implemented

Built chat-first for education, matching [source/tyzden-3.md](source/tyzden-3.md):

| Day | Screen | Notes |
|-----|--------|-------|
| 1 | `day1_emotions/` | 7 pages: chat intro → emotion dictionary → 6 obstacles → 20 myths (2 × 10) → busting exercise (5 offered, rest opt-in) → completion |
| 2 | `day2_describe/` | chat intro → 6-step model → `StructuredWorksheet` with the author's worked example → validation → 5 sentence frames → completion |
| 3 | `day3_check_facts/` | chat (event → thought → emotion) → 6 steps → `OVĚŘOVÁNÍ FAKTŮ` worksheet (7 sections, 10 fields) → completion |
| 4 | `day4_opposite_action/` | reading only, one chat flow; the "when *not* to use it" boundary sits on the same step as the technique |
| 5 | `day5_spoko_recall/` | `SpokoRecallList` + deep-link to Moje výzvy |
| 6 | `shared/day_pause_screen.dart` | week 3's own pause copy via `_pauseCopy[3]` |
| 7 | `day7_summary/` | chat recap → 3 questions (`ReflectionAutosave`) → week completion |

New shared pieces this week added: `BpdWorksheetDao` (keyed worksheet store),
`StructuredWorksheet` (autosaving long forms, per-field examples, opt-in tail),
`SpokoRecallList` (extracted from Week 1 so the SPOKO letters exist once),
`EmotionDictionaryScreen` (permanent reference in *Moje záznamy → DBT program*),
and a per-week `DayPauseScreen` text map.

Copy that is **ours, not the author's**, and marked `// TODO: schválit autorem`:
completion lines for Days 1/3/4/5 and the Day 3 worksheet example (see TODO
W3-02).

## Week 4 (Snášení tísně) — implemented

Built from [source/tyzden-4.md](source/tyzden-4.md); planned in
`.claude/design/week4/`. Verified on device 2026-08-12.

| Day | Screen | Notes |
|-----|--------|-------|
| 1 | `day1_stress/` | education only — one chat flow + completion; YouTube link |
| 2 | `day2_crisis_skills/` | 6 pages: chat ×2 (with the crisis-contact row and the "when *not* to" boundary) → STOP → TIPS → PMR video → completion |
| 3 | `shared/day_pause_screen.dart` | **first of two** rest days this week |
| 4 | `day4_mindfulness_stress/` | chat → `TechniqueRandomiser` over Week 2's eight techniques → completion |
| 5 | `day5_uznavam/` | chat → UZNÁVÁM (7 letters) → 22-item checklist over 2 pages → completion |
| 6 | `shared/day_pause_screen.dart` | second rest day, **different text** |
| 7 | `day7_summary/` | chat recap → 3 questions (`ReflectionAutosave`) → week completion |

New/changed shared pieces:

- `AcronymSkillPage` — one page shape for STOP, TIPS and UZNÁVÁM. The letters are
  plain `NumberedBenefit`s: its `number` is a `String`, so an acronym needed no
  card widget of its own. `afterLetter` hangs extra content under a given letter
  (TIPS puts the breathing link under P and the caution under I).
- `TechniqueRandomiser` — draws one `TechniqueData`, never the same twice in a
  row, always re-drawable. Nothing persisted: it is a nudge, not a record.
- `UznavamChecklistPage` — several lettered groups per page, each persisted under
  its own `BpdChallengesDao` section, saving on every tick rather than on
  Pokračovat.
- `DayPauseScreen` — copy now keyed `(week, day)` first (Week 4 rests twice with
  different text), then by week, then Week 2's as the fallback.
- `PickCounterHint` — with `minimum: 0` it drops the target from the wording; the
  UZNÁVÁM checklist records what was already tried, so a grey zero would be wrong.
- `BreathingPhaseConfig.slowExhale` (4 in / 6 out) + the `'slow-exhale'` preset,
  because TIPS promises "nádech na 4, výdech na 6–8" and neither existing preset
  matched.

Copy that is **ours, not the author's**, all marked `// TODO: schválit autorem`:
completion lines for Days 1/2/4/5, the Day 7 recap list, the sentence pointing at
UZNÁVÁM on Day 5, the crisis-link label, and the TIPS contraindication card
(see TODO W4-01).

## When adding the remaining weeks

1. Add `_weekDaysContent[weekNumber]` in `bpd_week_detail_screen.dart` and add
   the week to `kImplementedBpdWeeks`.
2. For each non-shared day: enum value + switch case + typed route (annotation
   **and** `_bpdProgrammeRoutes` entry) + screen.
3. Put the verbatim copy in a `dayN_content.dart` and compose the screen from the
   shared widgets above rather than writing bespoke pages.
4. Run build_runner (max 2 tries, else hand-write `.g.dart` from a sibling).
5. Keep day screens < 300 lines; never hardcode the brand colour (read from
   theme).
