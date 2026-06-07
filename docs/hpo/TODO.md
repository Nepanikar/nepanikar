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

- [?] **D1 — Day 1 layout.** New Week 1 merges intro + HPO/DBT + Moje záznamy +
  SMART into a single "Day 1". Options: (a) one multi-page onboarding flow, or
  (b) keep 3 separate screens chained from one day entry. *Affects W1-02..W1-05.*
- [?] **D2 — Drop PLEASE?** SPOKO replaces the DBT PLEASE model in Week 1. OK to
  remove `day4_please/` screen + `day4Please` route from Week 1? *Affects W1-06.*
- [?] **D3 — Content single-source.** Day lists are duplicated in the Dart
  `_weekDaysContent` map AND `programme_content.json`. Keep duplicating (simple,
  current) or refactor the week-detail screen to read from JSON (one source)?
  *Affects W1-01, GEN-01.*
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

- [ ] **W1-03 — Name + pronoun input.**
  - Context: Day 1 asks for first name + how the app should address the user
    (name + pronoun); reused later for addressing the user.
  - Files: Day 1 screen (per D1); a DAO under `lib/services/db/bpd/` to persist.
  - Done when: value persists across restarts and is retrievable for later
    screens.

- [ ] **W1-04 — Programme intro + HPO/DBT education section.**
  - Context: scrollable cards / bubbles (intro bullets) then HPO + DBT education
    with two external links (Google Docs) and the existing characteristics/
    benefits content already in JSON for the old Day 2.
  - Files: Day 1 flow; reuse `day_page_base.dart` widgets; external links via the
    app's standard URL-launch helper.
  - Done when: content matches content-reference.md §1a/1b; links open.

- [ ] **W1-05 — Mood check-in (Moje záznamy deep-link).**
  - Context: question "Jak se dnes máš?" 1–10 emoji scale → score-banded random
    response (6–10 / 5 / 1–4 branches) → small-action suggestions for 1–4 →
    follow-up "Pomohlo to aspoň trochu?".
  - Files: Day 1 flow; deep-link into `lib/screens/home/my_records/`; reuse
    existing mood widgets in `lib/widgets/` if suitable.
  - Done when: the three score bands show the right copy/options; entry is saved
    where My-records data lives.

- [ ] **W1-06 — SMART goals section.**
  - Context: free-text expectations + goals (persisted, re-shown in final week),
    tappable SMART letters (S/M/A/R/T reveal detail), SMART worksheet with
    example-on-tap fields. The existing `smart_education_screen.dart` /
    `smart_goal_form_screen.dart` already cover parts of this — adapt, don't
    rebuild from scratch.
  - Files: `lib/screens/bpd_programme/weeks/week1/day3_smart/`, plus a persisted
    store for expectations/goals (see W1-09).
  - Depends on: D2.
  - Done when: letters are tappable; worksheet saves; expectations + goals are
    persisted with a key the final-week screen can read.

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

- [ ] **W2-01 — Add external links.** Day 1 (muni.cz + YouTube), Day 4 & Day 6
  per-technique videos. Add a `links[]` field to the relevant pages in
  `programme_content.json` and render them via the app's URL-launch helper.
- [ ] **W2-02 — Expand Day 2 observation exercises.** Add Čichem, Chuť, Tělem,
  Dotek, Napětí (→ 9 items) to the `pozorování` skill page exercises.
- [ ] **W2-03 — Selectable "pick ≥2 from each" on Days 2–3.** Make exercise lists
  checkable instead of display-only (track which the user picked).
- [ ] **W2-04 — SMART tie-in on Day 3 (Efektivně).** Surface the Week 1 SMART
  goals; depends on GEN-02 / W1-06 persistence.
- [ ] **W2-05 — Mindfulness notification.** From Day 4: daily *"Čas na
  všímavost…"* until end of module, then 2×/week in later modules. Implement via
  `NotificationsService` (AwesomeNotifications) with module-aware scheduling.
- [ ] **W2-06 — Záchranný balíček (rescue package) save.** Day 4/6 "save to
  rescue package". Confirm if an existing feature covers it, else design it.
- [ ] **W2-07 — Day 5 pause = notification + mood record only.** Align the pause
  day content with the new spec.

## Cross-cutting / program-wide

- [ ] **GEN-01 — De-duplicate day metadata (optional).**
  - Make `bpd_week_detail_screen.dart` read the day list from
    `programme_content.json` instead of the hard-coded `_weekDaysContent` map, so
    content lives in one place. Depends on: D3.

- [ ] **GEN-02 — Persisted "first vs last week" answers.**
  - A small store so expectations/goals (W1-06) and similar entries written early
    can be re-surfaced in the final week. Reuse for future weeks.

- [ ] **GEN-03 — Localisation pass.**
  - Programme copy is currently inline Czech/Slovak strings. Decide whether HPO
    content goes through `context.l10n` / ARB or stays JSON-driven content (it is
    content, not UI chrome — likely stays in JSON). Document the choice.

- [ ] **GEN-04 — Remove DEV unlock-all hack before release.**
  - `bpd_week_detail_screen.dart` calls `unlockAllDaysInWeek(...)` "for testing".
    Gate behind a debug flag or remove. (See line ~211.)

- [ ] **GEN-05 — Author Weeks 3–7.**
  - Content not yet delivered. For each new week: add to JSON, add
    `_weekDaysContent[n]`, add per-day screens/routes. Add the week to
    content-reference.md as its source doc arrives.

---

## Suggested order

1. Resolve D1–D4.
2. W1-08 + W1-07 (SPOKO screen + challenges) — biggest chunk, unblocks the list.
3. W1-01 → W1-02 (wire data + day list).
4. W1-03 → W1-06 (Day 1 flow).
5. W1-09 (reflection).
6. GEN-04 before any release; GEN-01/02/03 as cleanup; GEN-05 when content lands.
