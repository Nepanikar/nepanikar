# HPO programme — documentation

Documentation for the HPO (hraniční porucha osobnosti / Borderline Personality
Disorder) programme that ships inside the Nepanikař app. The programme is a
7-week, day-by-day self-help course inspired by Dialectical Behaviour Therapy
(DBT).

> The programme is referred to as **"BPD programme"** in code/routes/UI and as
> **"HPO programme"** in the source content. They are the same thing.

## Files

| File | What it covers |
|------|----------------|
| [source/](source/) | **Verbatim full programme text** per week (`tyzden-1.md`, `tyzden-2.md`, …). The must-have copy that goes into the app — exact wording, nothing summarised. |
| [content-reference.md](content-reference.md) | Structured **overview** of the content (flow, interactions, week-by-week) in English. Points to `source/` for exact wording. |
| [implementation-spec.md](implementation-spec.md) | How the content maps onto the app — JSON schema, route types, screens, widgets, and the work still needed to implement it. |
| [TODO.md](TODO.md) | Agent-actionable backlog. Point an AI agent at a single task ID (e.g. "do W1-08") — each task is self-contained. |

## Source of content

The canonical content is authored in Czech and delivered as Markdown documents
(one per week). Week 1 in this documentation is transcribed from
*"První týden - nová verze"*. The app's runtime copy of the content lives in
[`assets/bpd/programme_content.json`](../../assets/bpd/programme_content.json).

> ⚠️ **Content is currently out of sync.** The new Week 1 (SPOKO model, single
> intro day) does **not** match what is implemented today (separate
> onboarding / HPO+DBT / SMART / PLEASE days). See
> [content-reference.md → Week 1](content-reference.md#week-1--introduction-to-the-programme)
> and [implementation-spec.md → Gap analysis](implementation-spec.md#gap-analysis-new-week-1-vs-current-implementation).

## Code locations (quick map)

```
assets/bpd/programme_content.json              runtime content data
lib/screens/bpd_programme/                     all programme screens
  bpd_weeks_screen.dart                         week selection carousel
  bpd_week_detail_screen.dart                   day list + routing per day
  weeks/weekN/dayX_.../                         per-day screens
  shared/                                        day_pause, week_review, ...
lib/screens/bpd_programme/widgets/day_page_base.dart   reusable day-page widgets
lib/services/db/bpd/                            BpdDaysDao + progress models
lib/app/router/routes.dart                     typed routes (codegen)
```

See `CLAUDE.md → "BPD Programme Development"` for the day-screen authoring
workflow (adding a new day, route types, build_runner notes).
