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
(one per week) in [`source/`](source/). Week 1 is transcribed from *"První týden
- nová verze"*. **Those Markdown files are the source of truth for copy** — the
app renders it from Dart page widgets and per-day `dayN_content.dart` files.
There is no runtime content JSON (see
[implementation-spec.md → Where the content lives](implementation-spec.md#where-the-content-lives)).

> **Status (2026-08-03):** Weeks 1 (SPOKO) and 2 (Všímavost) are implemented and
> match `source/`. Weeks 3–7 have no content yet (TODO GEN-05).

## Code locations (quick map)

```
lib/screens/bpd_programme/                     all programme screens
  bpd_weeks_screen.dart                         week selection carousel
  bpd_week_detail_screen.dart                   day list metadata + routing per day
  weeks/weekN/dayX_.../                         per-day screens + dayN_content.dart
  shared/day_pause_screen.dart                  shared rest day
  widgets/                                      shared day-page building blocks
lib/services/db/bpd/                            DAOs (progress, challenges, rescue…)
lib/app/router/routes.dart                     typed routes (codegen)
assets/bpd/bpd_weeks_data.json                 week-level skill-tree data
```

See `CLAUDE.md → "BPD Programme Development"` for the day-screen authoring
workflow (adding a new day, route types, build_runner notes).
