# HPO programme — implementation TODO

Agent-actionable backlog. Each task is **self-contained**: it names the files,
the change, and acceptance criteria, so you can point an AI agent at a single
task ID (e.g. "do W1-04 from docs/hpo/TODO.md") and it can execute without extra
context.

**Before any task, read:** [content-reference.md](content-reference.md) (what the
user sees) and [implementation-spec.md](implementation-spec.md) (how it maps to
code). Honour `CLAUDE.md` rules (100-char lines, single quotes, theme colour
never hardcoded, files < 300 lines, build_runner max 2 tries).

Status legend: `[ ]` todo · `[~]` in progress · `[x]` done · `[?]` needs a
decision from the user before starting.

---

## How to work a task

1. Read the task's **Context** + the two reference docs above.
2. Make the change in the listed **Files**.
3. If you touched routes / `@freezed` / `@JsonSerializable` / assets → run
   `flutter packages pub run build_runner build -d` (max 2 tries, else
   hand-write the `.g.dart` from a sibling).
4. Verify against **Done when**.
5. `dart format --line-length 100 ./` on changed files.
6. Tick the checkbox and note anything surprising under the task.

---

## Decisions needed first (blockers)

These change the shape of several tasks. Resolve with the user before W1-02+.

- [x] **D1 — Day 1 layout.** ✅ **Decided (2026-06-15): (a) one multi-page
  onboarding flow** — single `Day1OnboardingScreen` with a `PageView` (10 pages),
  shared progress bar, mirroring the week-2 day-screen pattern. *Affects
  W1-02..W1-05.*
- [?] **D2 — Drop PLEASE?** SPOKO replaces the DBT PLEASE model in Week 1. OK to
  remove `day4_please/` screen + `day4Please` route from Week 1? *Affects W1-06.*
- [x] **D3 — Content single-source.** ✅ **Re-decided (2026-08-03): Dart is the
  single source.** `assets/bpd/programme_content.json` was never read at runtime,
  so it was deleted rather than wired up. Content = `docs/hpo/source/*.md`
  (authored copy) → Dart page widgets + per-day `dayN_content.dart`. *Supersedes
  the 2026-06-15 "keep duplicating" decision; closes GEN-01.*
- [?] **D4 — Challenge tracker scope.** SPOKO days link to an optional "future
  challenge" the user tracks over time. Build a real tracker now, or stub the
  deep-link and ship challenges as a today-only pick-list first? *Affects W1-07.*

---

## Week 1 — restructure to the new (SPOKO) version

### Data / scaffolding

- [ ] **W1-01 — Rewrite Week 1 in `programme_content.json`.**
  - Context: Current Week 1 JSON (onboarding/HPO+DBT/SMART/PLEASE/pause/summary)
    must become: Day 1 combined intro, Days 2–6 SPOKO (S/P/O/K/O), Day 7
    reflection. See content-reference.md → Week 1.
  - Files: [assets/bpd/programme_content.json](../../assets/bpd/programme_content.json)
  - Steps: replace the `weekNumber: 1` object's `days`. For SPOKO days use a
    consistent content shape: `{ intro, mappingQuestions[], challenges[],
    closing, externalContactKey? }`. Reuse existing page-type vocabulary where
    it fits (see implementation-spec.md → JSON schema).
  - Done when: JSON is valid, Week 1 has 7 days matching content-reference.md,
    `flutter test` (build-runner ensure test) still passes.

- [ ] **W1-02 — Update `_weekDaysContent[1]` Dart map.**
  - Context: The week-detail list reads day title/desc/time/type/routeType from
    this hard-coded map, NOT the JSON (see implementation-spec.md note).
  - Files: [lib/screens/bpd_programme/bpd_week_detail_screen.dart](../../lib/screens/bpd_programme/bpd_week_detail_screen.dart)
  - Steps: replace the `1: [ ... ]` entry with the 7 new days + their new
    `routeType`s. Add any new enum values to `_DayRouteType` and matching
    `case`s in `_handleDayTap`.
  - Depends on: D1, W1-08 (SPOKO screen route exists), W1-04..W1-06.
  - Done when: opening Week 1 lists the 7 new days with correct titles; tapping
    each opens the right screen (no `regular` placeholder snackbar).

### Day 1 — combined intro

- [x] **W1-03 — Name + pronoun input.** ✅ Done (2026-06-15). Page 3 of the merged
  Day 1 flow (`day1_onboarding/personalization_page.dart`); persisted via
  `UserSettingsDao.saveBpdUserProfile` (`BpdUserProfile` + `BpdPronoun`).

- [x] **W1-04 — Programme intro + HPO/DBT education section.** ✅ Done
  (2026-06-15). Merged Day 1 flow pages 1–2 (intro bullets + how-it-works), 4
  (HPO), 5 (DBT) in `day1_onboarding/`. Verbatim Czech from `source/tyzden-1.md`.
  External Google-Doc links via `launchUrLink` (`external_link_button.dart`).
  Note: built as new Czech pages (not the old Slovak `day2_education` widgets) for
  language consistency — those Slovak widgets are now unused by Day 1.

- [~] **W1-05 — Mood check-in (Moje záznamy deep-link).** Partially done
  (2026-06-15). Page 6 of the Day 1 flow (`mood_checkin_page.dart`) deep-links to
  the **existing** mood feature (`MoodPickerRoute`, 5-mood) — mood recording is
  already built, so we reuse it (decision 2026-06-12). **Deferred:** the
  score-banded reaction + small-action suggestions + "Pomohlo to?" follow-up — the
  existing picker navigates onward to mood-records and doesn't return a score to
  the flow. Needs a mood round-trip to implement the bands (good/okay/sad).

- [x] **W1-06 — SMART goals section.** ✅ Done (2026-06-15). Day 1 flow pages 7
  (expectations + goals free-text), 8 (tappable S/M/A/R/T tiles), 9 (worksheet
  with example-on-tap). Expectations/goals persisted via new `BpdExpectationsDao`
  (key `week1_day1`); SMART worksheet via existing `BpdSmartGoalsDao.createGoal`.
  Built fresh in the Day 1 flow (not the old `day3_smart` screens) for the merged
  single-flow layout. See GEN-02 for re-surfacing in the final week.

### Days 2–6 — SPOKO

- [ ] **W1-07 — Challenge feature (today pick-list + optional tracker).**
  - Context: every SPOKO day shows a challenge pick-list ("choose ≥1 today") and
    an optional "set a future challenge" the user tracks over time. New surface.
  - Files: new feature under `lib/screens/bpd_programme/` (+ DAO in
    `lib/services/db/bpd/` if tracking persists).
  - Depends on: D4.
  - Done when: per D4 scope — at minimum a today pick-list works on a SPOKO day;
    if full tracker, selections persist and progress is viewable.

- [ ] **W1-08 — Reusable `SpokoDayScreen` (JSON-driven).**
  - Context: Days 2–6 share one template: education → mapping questions →
    challenge list → optional future challenge → closing. Build ONE
    parameterised screen, not five bespoke ones.
  - Files: new `lib/screens/bpd_programme/weeks/week1/spoko/spoko_day_screen.dart`;
    typed route in [routes.dart](../../lib/app/router/routes.dart) taking the day
    number; one `spoko` value in `_DayRouteType` + switch case.
  - Depends on: W1-01 (JSON content), W1-07 (challenge widget).
  - Done when: passing dayNumber 2–6 renders that day's SPOKO content from JSON;
    days 3 & 4 surface the right help-contact deep-links (PPP / "Podané ruce").

### Day 7 — reflection

- [ ] **W1-09 — Week 1 reflection + SPOKO recall.**
  - Context: recall the 5 SPOKO areas (reveal on tap) + free-text reflection
    questions. Can extend the shared `WeekReviewScreen` (`summary` routeType).
  - Files: [lib/screens/bpd_programme/shared/week_review_screen.dart](../../lib/screens/bpd_programme/shared/week_review_screen.dart)
  - Done when: reflection answers persist; matches content-reference.md §Day 7.

---

## Week 2 — update shipped version to the new content

Week 2 screens already exist; these tasks bring them to the new version. See
[content-reference.md → Week 2](content-reference.md#week-2--všímavost-mindfulness)
and [implementation-spec.md → Week 2 additions](implementation-spec.md#week-2-additions-new-version-vs-current).

All of Week 2 was reworked on **2026-08-03**. Beyond the tasks below, the audit
found three things not in this list, all fixed in the same pass:

- Week 2 shipped entirely in **Slovak** while Week 1 is Czech → whole week
  rewritten in Czech from `source/tyzden-2.md`.
- **Day 6 was unroutable**: `Week2Day6TechniquesScreenRoute` was annotated and
  pushed, but missing from `_bpdProgrammeRoutes`, so tapping Day 6 threw.
- **Day 7 dropped user input**: it routed to the shared `WeekReviewScreen`, which
  had no `_weekData[2]` (rendered empty) and never persisted its two text fields.
  That screen was deleted; Week 2 got a real Day 7 (see W2-09).

- [x] **W2-01 — Add external links.** ✅ Day 1 (muni.cz article + YouTube) via
  `ExternalLinkButton`; Day 4 (3 breathing videos) and Day 6 (body-scan video)
  inside the technique detail sheets.
- [x] **W2-02 — Expand Day 2 observation exercises.** ✅ Pozorování 5 → 9
  (Čichem, Chuť, Tělem, Dotek, Napětí added). Popisování 3 → 5 and Participace
  3 → 6 were short too; both completed from the source.
- [x] **W2-03 — Selectable "pick ≥2 from each" on Days 2–3.** ✅ Shared
  `SkillPracticePage` + `SelectableExerciseTile` + `PickCounterHint`; picks
  persist via `BpdChallengesDao` with a per-section key.
- [x] **W2-04 — SMART tie-in on Day 3 (Efektivně).** ✅ `SmartGoalReminder` reads
  the newest goal from `BpdSmartGoalsDao` and links to "Moje cíle".
- [~] **W2-05 — Mindfulness notification.** Daily reminder done: opt-in page on
  Day 4, `NotificationType.mindfulnessReminder`, scheduled through the existing
  settings-driven loop. **Remaining:** the "2×/week in later modules" downgrade —
  deliberately deferred, nothing can trigger it until a later module ships
  (GEN-05). Also fixed on the way: `rescheduleNotifications` used to wipe every
  per-challenge reminder; it now restores them.
- [x] **W2-06 — Záchranný balíček.** ✅ No existing feature covered it. New
  `BpdRescuePackageDao` + `BpdRescueItem` + `RescuePackageScreen` (third tile in
  *Moje záznamy → DBT program*), saved from the Day 4/6 detail sheets via
  `RescueSaveButton`.
- [x] **W2-07 — Day 5 pause = notification + mood record only.** ✅ `DayPauseScreen`
  now offers a `MoodPickerRoute` deep-link and uses the source's Czech copy.
- [x] **W2-08 — Day 4 & Day 6 as menus, not walkthroughs.** ✅ The source offers
  the exercises as a choice; the app forced the user through all of them. Both
  days now use `TechniqueMenuPage` + detail sheet (Day 4 also launches the
  existing breathing exercise with the matching shape/preset).
- [x] **W2-09 — Day 7 summary with persisted reflection.** ✅ New
  `weeks/week2/day7_summary/`: recap → the source's 4 questions → week
  completion, answers stored via `BpdReflectionDao(week: 2)`.

## Cross-cutting / program-wide

- [x] **GEN-01 — De-duplicate day metadata.** ✅ Closed (2026-08-03) the other way
  round: `programme_content.json` was never loaded at runtime, so it was deleted
  (with its `pubspec`/`assets.gen` reference) instead of being wired up. The day
  list stays in `_weekDaysContent`; see D3.

- [x] **GEN-02 — Persisted "first vs last week" answers.** ✅ Done 2026-08-29.
  Week 7 Day 1 reads the SMART goals back through the new `SmartGoalsReview`
  widget: each goal from Week 1 comes back with all five of its lines plus a
  field asking how to carry it forward, saved through the existing
  `BpdWorksheetDao` (no new store). Verified on device end to end — a goal
  entered in Week 1 Day 1 reappeared in Week 7 Day 1, and the empty state
  covers anyone who never set one. The S/M/A/R/T labels deliberately match
  Week 1's wording ("Adekvátní", "Termínovaný"), not the textbook ones.
  Still open: `BpdExpectationsDao` (Day 1 expectations) is written but never
  read back anywhere.

- [~] **GEN-03 — Localisation pass.** Programme copy is inline **Czech** strings
  in Dart (Weeks 1–2 are now consistent; the Slovak Week 2 was rewritten
  2026-08-03). Still to decide: whether it eventually goes through
  `context.l10n` / ARB. It is content rather than UI chrome, so the current
  choice is to keep it in Dart alongside `docs/hpo/source/*.md` — revisit if the
  programme has to ship in more than one language.

- [?] **GEN-06 — Unlock policy.** Asked by the author (2026-08-12).
  - ✅ **Midnight (done 2026-08-18).** Unlocks used to land at the clock time the
    user pressed "Začít svou cestu" — start at 23:50 and day 2 arrived at 23:50
    the next evening. `bpd_unlock_schedule.dart` now floors every unlock to local
    midnight (flooring *after* adding the days, so DST cannot shift it off the
    hour). Verified on a clean install: all seven weeks logged at `00:00:00`,
    exactly 7 days apart.
  - [?] **No progress gate.** Skipping days 1–3 still opens day 4 on schedule.
    Should the next day wait until the previous one is completed?
  - [?] **Weeks are not time-gated at all.** `bpd_weeks_screen.dart:60` opens a
    week when `kImplementedBpdWeeks` contains it — the `unlockDate` computed by
    `BpdWeeksDao` is only used for the "Odemkne se …" label on weeks we have not
    built. So on a fresh install *every implemented week is open at once*, and
    once GEN-04 removes the DEV hack a user on Week 1 Day 1 could still jump
    straight into Week 4. Days would gate by time, weeks would not. Decide
    whether weeks should follow their `unlockDate` too, or whether opening the
    next week should depend on completing the previous one.
  - Note the day-level gate is invisible while GEN-04's DEV hack is in.

- [x] **W1-11 — Week 1 education → chat.** ✅ Done 2026-08-19. The author noticed
  Week 1 behaved differently from Weeks 2–4: only Day 1 used the chat template.
  Converted Day 2 (`education_chat_page.dart`, merging the SPOKO-model and sleep
  pages, so the day is 3 pages not 4), Days 3–6 (`spoko_education_chat_page.dart`,
  shared via `SpokoDayData`) and Day 7 (`recall_chat_page.dart`). Verified on
  device: Day 2's letter card + `ChatConceptCard` + questions, Day 3's contact
  card as the last step, Day 7's reveal-on-tap recall inside the chat.
  - Copy is byte-identical to the deleted pages — the string literals were moved,
    not retyped.

- [x] **GEN-09 — Delete the dead Week 1 screens.** ✅ Done 2026-08-19.
  `day2_education/` (7 files) and `day4_please/` (1679 lines) were orphaned and
  each declared a `@TypedGoRoute` on a path a live screen already owns — mines for
  anyone adding them to `_bpdProgrammeRoutes`. `day3_smart/` was a different case:
  **wired but unreachable** (registered routes + a `case _DayRouteType.smart` that
  no `_weekDaysContent` entry selects), so it needed routes.dart, the enum, the
  `case` and a build_runner run, not just `rm`. Analyzer 0/0 after.
  - The two routes `/bpd-programme/smart` and `/bpd-programme/smart/new-goal` no
    longer exist. Nothing in the app navigated to them; only a hand-typed deep
    link could have reached them.

- [ ] **GEN-10 — Test titles and questions are inconsistent.** Now that the tests
  are promoted to a home tile ("Otestuj se", 2026-08-19) this is much more
  visible. In `assets/tests/tests-data.json` the four names are `BRCS Test`,
  `Test Depresie (PHQ-9)` (**Slovak**), `PSS Test`, `GAD-7 Test`; and
  `assets/tests/GAD-7-test.csv` has its questions in **English** while PHQ-9 and
  BRCS are Czech. Not touched — test wording is clinical content and the author's
  call, not a formatting fix.

- [ ] **GEN-11 — Duplicate entry point for the tests.** The tests are now on the
  home grid *and* still a `LongTile` inside Mé záznamy
  ([my_records_screen.dart](../../lib/screens/home/my_records/my_records_screen.dart)),
  where that tile is labelled `'Tests'` (hardcoded English) and reuses
  `foodTracker.svg` — the same artwork as "Meal records" right above it. Ask the
  author whether the records entry should go now that the home tile exists; if it
  stays, it needs its own label and icon.

- [ ] **GEN-08 — Approve the programme green.** The skill tree and every
  completion check used `NepanikarColors.success` (`#6FD866`); the author called it
  "křiklavá" and asked for "naše zelená". There is no brand green — `success` is
  the only green in the palette and none of the SVG assets contain one (the brand
  is purple + teal `#4EA3AD`). So `progressGreen` (`#429464`, a muted green tuned
  to sit with the purple) was added to `colors.dart` and used everywhere the
  programme shows completion. **That hex is proposed, not approved** — it is
  marked `// TODO: schválit autorem` in the palette.
  - Done when: the author confirms the shade (or supplies the real one). It is a
    single constant, so changing it is a one-line edit.
  - If the intent was actually the teal accent rather than a green, `secondary`
    is already in the palette.

- [ ] **GEN-07 — Notification when a new day/week unlocks.** There is none.
  `NotificationType` has `moodReminder`, `sleepRateReminder` (settings-driven),
  `challengeReminder` (per tracked challenge) and `mindfulnessReminder` (opted
  into on W2 D4). Nothing fires when the programme opens the next lesson, so a
  user who does not open the app never learns it is waiting. Needs: a schedule
  hooked to `unlockDate`, a payload routing to the week detail, and **copy from
  the author** — the existing programme notifications use her verbatim wording
  (e.g. `mindfulnessReminderBody`), so this one should too.

- [ ] **GEN-04 — Remove DEV unlock-all hack before release.**
  - `bpd_week_detail_screen.dart` calls `unlockAllDaysInWeek(...)` "for testing".
    Gate behind a debug flag or remove. (See line ~211.)

- [~] **GEN-05 — Author Weeks 3–7.**
  - **Week 3 (Emoční regulace) delivered and implemented 2026-08-06.** Source
    verbatim in [source/tyzden-3.md](source/tyzden-3.md), summarised in
    content-reference.md, planned in `.claude/design/week3/WEEK3_SCREEN_PLAN.md`,
    state in `.claude/design/week3/TRACKING.md`. All 7 days coded (25 pages),
    `kImplementedBpdWeeks = {1, 2, 3}`, analyzer clean. Runtime verification
    still outstanding.
  - **Week 4 (Snášení tísně) delivered 2026-08-12, planned, not implemented.**
    Source verbatim in [source/tyzden-4.md](source/tyzden-4.md), summarised in
    content-reference.md, planned in `.claude/design/week4/WEEK4_SCREEN_PLAN.md`,
    state in `.claude/design/week4/TRACKING.md`. 19 pages, two rest days on reuse.
    Blocked on W4-01 (author decisions) and W4-02 (pause copy keying).
  - **Week 5 (Impulzivní chování) delivered 2026-08-28, planned and designed.**
    Source verbatim in [source/tyzden-5.md](source/tyzden-5.md), planned in
    `.claude/design/week5/WEEK5_SCREEN_PLAN.md`, state in
    `.claude/design/week5/TRACKING.md`, 6 representative mockups. 18 pages, two
    rest days on reuse. Day 2 blocked on W5-01 (OQ-1, OQ-2); the rest is codeable.
  - **Week 6 (Mezilidské vztahy a sebepojetí) delivered 2026-08-29, planned and
    implemented.** Source verbatim in [source/tyzden-6.md](source/tyzden-6.md),
    planned in `.claude/design/week6/WEEK6_SCREEN_PLAN.md`, state in
    `.claude/design/week6/TRACKING.md`. 19 pages, two rest days on reuse, and the
    first week that needed **no new component at all**. Nothing blocks it; nine
    author questions tracked as W6-01.
  - **Week 7 (Závěr programu) delivered 2026-08-29, planned and implemented.**
    Source verbatim in [source/tyzden-7.md](source/tyzden-7.md), planned in
    `.claude/design/week7/WEEK7_SCREEN_PLAN.md`, state in
    `.claude/design/week7/TRACKING.md`. 24 pages, no rest day, and the only
    week that reads back what the user wrote in Week 1. **All seven weeks are
    now implemented** (`kImplementedBpdWeeks = {1..7}`).

- [x] **W3-01 — Content gaps for the author (Week 3).** ✅ Closed 2026-08-06.
  Day 4 stays reading-only (author's decision — implemented as a single chat
  flow), Day 5 reuses the SPOKO recall from Week 1, and the missing Day 3
  worksheet example was drafted by us. The `ZÁKLADNÍ EMOCE` infographic covers
  six of the ten emotions and is now captioned as an illustration of those six
  (OQ-4). Superseded by W3-02.

- [ ] **W3-02 — Author review of invented Week 3 copy.** Everything marked
  `// TODO: schválit autorem` in `weeks/week3/`: completion lines for Days 1, 3,
  4 and 5 (the source has none) and — more importantly — the **worked example
  for the Day 3 `OVĚŘOVÁNÍ FAKTŮ` worksheet**. Day 2's example is the author's;
  Day 3's is ours, and users read a worked example as a model for how to think
  about their own situation, so it should not ship unreviewed.

- [?] **W4-01 — Content decisions for the author (Week 4).** Week 4 landed
  2026-08-12 and is planned (`.claude/design/week4/WEEK4_SCREEN_PLAN.md`); eight of
  its twelve open questions need the author. In rough order of impact:
  1. **Contraindications (OQ-4).** TIPS "Teplota" asks the user to immerse their
     face in cold water *and hold their breath*, and "Intenzivní cvičení" asks for
     30 squats/push-ups. Cold-water immersion with breath-holding deliberately
     slows the heart, and intense exercise can be a compensatory behaviour — the
     app has both an eating-disorder and a self-harm module, so it reaches that
     audience. Proposal: one sentence of caution, repeated on Day 5's "Á – Aktivace
     smyslů". This edits authored clinical copy, so it is her call, not ours.
  2. **"Tři klíčové dovednosti" (OQ-12).** Day 2 promises three and delivers two;
     UZNÁVÁM arrives on Day 5. Reword, or add "třetí si ukážeme ve dni 5".
  3. **UZNÁVÁM letters (OQ-10).** The short list ("Ú-silím", "Ná-hledem",
     "A-ktivní") disagrees with the checklist ("U – Úsilí", "N – Náhled",
     "Á – Aktivní obrana"). The checklist matches U-Z-N-Á-V-Á-M.
  4. **Crisis contact on Day 2 (OQ-5).** Whether the "neudělat nic, co nejde vzít
     zpátky" page carries a quiet deep-link to the crisis contacts, and in what
     words.
  5. **Day 4 draw (OQ-2, OQ-3).** Real spinning wheel or a "Vylosovat" button, and
     which Week 2 techniques are in the pool (the 8 named ones, or all 37 exercises).
  6. **Completion lines (OQ-8)** for Days 1, 2, 4, 5 and the Day 7 recap list — the
     source has none. We will draft them in her tone, marked
     `// TODO: schválit autorem`, as in Week 3.
  7. **Typos (OQ-9)** left verbatim on purpose: "známáé" (Day 4), "zklidňuje
     nervový systému" (TIPS P), "zastav se na chvíli -  nic nedělej" (STOP S).
  - Done when: each decision is recorded in the plan's OQ table and the affected
    pages lose their ⚠️ in `.claude/design/week4/TRACKING.md`.

- [x] **W4-02 — `DayPauseScreen` copy keyed by (week, day).** ✅ Done 2026-08-12.
  `_pauseCopyByDay` (a `Map<(int, int), String>`) is consulted first, then the
  week-level `_pauseCopy`, then Week 2's text. Verified on device: Week 4 Day 3
  and Day 6 each render their own paragraph. Original problem below.
  Week 4 is the
  first week with **two** rest days (3 and 6) and they have different authored
  wording. `_pauseCopy` in
  [day_pause_screen.dart](../../lib/screens/bpd_programme/shared/day_pause_screen.dart)
  is a `Map<int, String>` keyed by week, and `dayNumber` is already a parameter but
  unused for copy — so as it stands Day 6 would silently render Day 3's text and one
  of the author's two paragraphs would never be seen by anyone.
  - Done when: both Week 4 rest days show their own text, Weeks 2–3 are unchanged,
    and the week-level fallback still covers unauthored weeks.

- [x] **GEN-09 — Kontrast v tmavom režime naprieč BPD programom.** ✅ Opravené
  2026-09-07. Prvý poriadny prechod v tmavom režime odhalil **6 defektov**, všetky
  ten istý vzor: `primaryColor` použitá ako *popredie*, hoci v tmavom režime je
  scaffold `containerColor(primaryColor)` — fialová na fialovej. Najhorší:
  **zoznam dní bol úplne prázdny** (biely text na natvrdo `Colors.white` karte),
  čo platilo pre **všetkých sedem týždňov**. Opravené v `bpd_week_detail_screen`,
  `day_completion_page`, `week_completion_page`, `technique_menu_page`,
  `external_link_button`, `rescue_save_button`, `day_page_base`
  (`SectionHeader` + `InfoBox`), `worksheet_parts`, `chat_lists`,
  `day_preview_sheet`, `selectable_exercise_tile`, `technique_randomiser`.
  Pozadia (`BoxDecoration(color: primaryColor)` s bielym textom) sa zámerne
  nemenili. Overené na zariadení na týždni 7; analyzer 0/0.
  **Zostáva:** preklikať **svetlý** režim (vetvy sú `isDarkMode ? ... : ...`,
  takže svetlá vetva je znakovo pôvodná, ale overená nebola) a **týždne 1–6
  v tmavom režime**. Detaily v `.claude/design/week7/TRACKING.md`.

- [?] **GEN-10 — Oslavná obrazovka týždňa sa viaže na Deň 7, nie na dokončenie
  týždňa.** `WeekCompletionPage` je posledná strana Dňa 7. Kto spraví Deň 7 skôr
  než ostatné dni (systém to dovolí), uvidí ju vtedy — a po doplnení posledného
  chýbajúceho dňa sa už nezobrazí, appka len vráti zoznam dní. Overené na
  týždni 7 dňa 2026-09-07. → Otázka pre autorku: má sa oslava viazať na
  **dokončenie všetkých siedmich dní**? Ak áno, presunúť ju zo `dayN` flow do
  `bpd_week_detail_screen`, kde sa už dokončenosť týždňa počíta.

- [?] **W7-01 — Content decisions for the author (Week 7).** The final week
  landed 2026-08-29 and is fully implemented. Nothing blocks it, but it has the
  most content gaps of any week:
  1. **The recaps name three skills the programme never taught (OQ-1).** Checked
     with a grep across `source/tyzden-1..6.md`: **PODPORA** (Day 4) appears
     nowhere else in the programme at all; **coping ahead** (Day 3) and
     **radikální přijetí** (Day 4) appear only as parenthesised examples inside
     Week 5's missing-links exercise. Day 3 also credits emotional regulation
     with "zmírňovat citlivost na stresory", which is SPOKO from Week 1. The
     recap paragraphs ship verbatim, but the practice menus list only skills that
     exist — offering PODPORA would send someone to an empty page. Either drop
     them from the recap or add them to the week that should have taught them.
  2. **Typos left verbatim (OQ-2):** "Věříme, že Ti dovednosti z můžou přinést
     úlevu" (Day 3 — a word is missing, this one changes the meaning),
     "pSANÍČKoa nenásilnou komunikaci" and "JeVýZVa" without a space (Day 6),
     "Za těch sedm týdnu" (Day 7).
  3. **Should the three take-away skills go into the rescue package (OQ-3)?**
     Implemented as yes — it is the single most valuable output of the programme
     and belongs somewhere reachable after it ends.
  4. **One-line skill summaries in the recap menus (OQ-4)** are ours; the source
     names the skills but never describes them in a sentence.
  5. **Empty state of the SMART review (OQ-5)** — what someone sees who never set
     a goal in Week 1. Ours, marked TODO.
  6. **"Program dokončen" on the last screen (OQ-6)** — `WeekCompletionPage` said
     "Týden dokončen", which undersells the end of seven weeks. Ours.
  7. **Day 1 asks for "3–5 věcí" (OQ-7)** — implemented as five optional boxes.
  8. **Week title (OQ-8)** — the data file said "Shrnutí programu", the source
     says "Závěr programu". Fixed to match the source.
  - Done when: each decision is recorded in the plan's OQ table and the affected
    rows lose their ⚠️ in `.claude/design/week7/TRACKING.md`.

- [?] **W6-01 — Content decisions for the author (Week 6).** Week 6 landed
  2026-08-29, is planned (`.claude/design/week6/WEEK6_SCREEN_PLAN.md`) and fully
  implemented. **Nothing here blocks code** — unlike Week 5 — but nine things
  need her eye. In order of impact:
  1. **Twenty-four myths with no counter-statements (OQ-1).** In Week 3 she wrote
     a "busted" version of every myth, which the app reveals when someone is
     stuck. Week 6 says only "(nechat prostor na vepsání pravdivé formulace)", so
     twenty-four fields ship with no help at all and most will stay empty.
     Proposal: counter-statements for at least the first four of each group,
     which are the ones shown before "Chci zpochybnit i další mýty".
  2. **Broken formatting we had to interpret (OQ-2).** Four places, all recorded
     in the Dart doc comments: (a) Day 5's "**O – bez zbytečných Omluv**" is glued
     onto the end of the "Z" instruction with no line break — split at the obvious
     intent; (b) "U – **Upřímnosts**" had a stray trailing "s" — dropped;
     (c) Day 3's "Va – VAlidace" reads "**uznejříkáuznej** pocity a názory" — kept
     as "uznej"; (d) an empty bullet between "Vý" and "Z". Typos left verbatim:
     "časo" (Day 1), "se tyto dovednosti zaměřuje" (Day 1).
  3. **Day 3 has no title (OQ-4).** Every other day has one. Ours: "Je VýZVa
     a všímavost ve vztazích".
  4. **Three "(infografika)" notes (OQ-3)** — PSANÍČKo, Je VýZVa, neZOUFej. We
     have no artwork; the acronym page (letter + word + instruction) stands in.
     If she wants a real graphic, it has to be supplied.
  5. **Day 3 asks the user to *choose* a mindfulness technique (OQ-5)** where
     Week 5 asked to *draw* one. Implemented as a menu here and a draw there,
     matching each source — worth confirming that difference is deliberate.
  6. **Day 7 recap items (OQ-6)** are ours, marked `// TODO: schválit autorem`.
  7. **Day 4's pause text is word for word Week 3's (OQ-8)**, and Day 7's three
     reflection questions are word for word Week 4's (OQ-9). Both are almost
     certainly intentional repetition, but nobody has confirmed it.
  - Done when: each decision is recorded in the plan's OQ table and the affected
    rows lose their ⚠️ in `.claude/design/week6/TRACKING.md`.

- [ ] **W5-02 — Week titles in `bpd_weeks_data.json` may not match the delivered
  content.** Week 5 was titled "Mezilidské vztahy" there — standard DBT ordering —
  while the author's Week 5 is "Impulzivní chování". **Confirmed a second time on
  Week 6 (2026-08-29):** the file said "Sebepojetí", the delivered content is
  "Mezilidské vztahy a sebepojetí". Both fixed. **Week 7 is still a guess**
  ("Shrnutí programu") and nothing checks it, so the tree can still label a module
  something the content is not.
  - Done when: Week 7's `titleKey` is checked against its source on delivery, or
    the tree stops showing a title for weeks that have no source file.

- [?] **W5-01 — Content decisions for the author (Week 5).** Week 5 landed
  2026-08-28 and is planned (`.claude/design/week5/WEEK5_SCREEN_PLAN.md`). Twelve
  open questions; **two block Day 2 and cannot be worked around.** In order of
  impact:
  1. **STOP has two different wordings (OQ-2, blocking).** Week 4 Day 2 already
     teaches it in Czech ("T – Tah zpátky", "O – Obhlédni situaci", "P – Postupuj
     všímavě"); Week 5 Day 2 teaches it in English with a Czech gloss ("T – Take a
     step back (ustup)"). A user who did Week 4 meets the same technique twice,
     worded differently, which reads as an app bug. Both variants are shown side by
     side in `mockups/day2_page3_stop_konflikt.html`. Recommendation: keep Week 4's
     — it already ships and sits in users' rescue packages.
  2. **What "dobrovolná sekce" actually does (OQ-1, blocking).** Day 2 says it is
     voluntary but never says what skipping means. Left as is, a skipped day holds
     the week at 6/7 and Day 3 opens with "Po včerejším dni…", which will not match
     what the user did. Proposal: skipping marks the day done; we need her wording
     for the button and the confirmation.
  3. **Day 1 asks for an exposure with no warning (OQ-3).** The user recalls and
     dissects their own impulsive episode — the six-step list explicitly includes
     "život ohrožující chování" — while Day 2, the *gentler* of the two, is the one
     that carries the trigger warning. Proposal: one sentence before the worksheet,
     and move "Tento worksheet můžete vyplnit pomalu" above the fields.
  4. **Day 4 has no intro at all (OQ-6).** It opens straight into a ten-field
     worksheet with no educational sentence; the field labels would be ours.
     2–3 sentences from her, plus label approval.
  5. **Mixed tykání/vykání (OQ-5).** The Day 1 challenge and both worksheets use
     vykání ("vzpomeňte si", "Napište si"); the rest of the programme uses tykání.
  6. **Day 5 asks for two different interactions (OQ-9)** — "prostor vybrat si"
     (a menu) and "kolo štěstí" (a draw). Proposal: draw primary, pick secondary,
     matching the Week 4 decision.
  7. **Day 7 recap (OQ-10)** and the Day 2/4 completion lines — the source has
     none; we draft them marked `// TODO: schválit autorem`, as in Weeks 3–4.
  8. **Typos left verbatim on purpose (OQ-4):** "zaátek" (Day 1 completion),
     "alepsoň" and "co by Ti mohli" (Day 2), an unpaired quote in "průběh
     událostí“", double spaces in "Jeden z  DBT nástrojů", "apod" without a period.
  - Done when: each decision is recorded in the plan's OQ table and the affected
    pages lose their ⚠️ in `.claude/design/week5/TRACKING.md`.

- [x] **W3-03 — Verify Week 3 on a device.** ✅ Done 2026-08-12. All seven days
  walked; the Day 2 worksheet kept "hadka s kamaradem" across leaving without
  completing; "Chci zbořit i ostatní mýty" reveals the remaining myths and the
  per-myth "Zobrazit příklad" toggles the author's counter-sentence; the tree
  rolled up to **"2 ze 7 týdnů hotovo"**. No defects found — unlike Week 2.

- [x] **W1-10 — Verify Week 1 on a device.** ✅ Done 2026-08-12. Week 1 had never
  been run despite three blind fixes. All seven days open, no Flutter exceptions
  or overflows in logcat during the sweep, day list and SPOKO pages are Czech, and
  the Day 7 reflection survived leaving without completing — so the
  `ReflectionAutosave` fix is confirmed on Week 1 too.

---

## Suggested order

1. Resolve D1–D4.
2. W1-08 + W1-07 (SPOKO screen + challenges) — biggest chunk, unblocks the list.
3. W1-01 → W1-02 (wire data + day list).
4. W1-03 → W1-06 (Day 1 flow).
5. W1-09 (reflection).
6. GEN-04 before any release; GEN-01/02/03 as cleanup; GEN-05 when content lands.
