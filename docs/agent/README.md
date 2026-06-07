# Agent docs — index

Goal: give the agent the *right* context with the *fewest* tokens. These files are
**load-on-demand reference**. Do not read them all up front — open only the one you need.

| You are working on…                                  | Read this file |
|------------------------------------------------------|----------------|
| Colors, fonts, spacing, buttons, screen layout, tiles | [design-system.md](design-system.md) |
| DI, routing, database/DAO, services, app startup      | [architecture.md](architecture.md) |
| User-facing text, translations, plurals, languages    | [localization.md](localization.md) |
| Code style, naming, "how is this normally done here"  | [patterns.md](patterns.md) |
| BPD programme weeks/days feature                       | see `CLAUDE.md` → "BPD Programme Development" |

## 10-second orientation

- Flutter 3.35.x app, 100-char line limit, `package:lint` ruleset, **single quotes**.
- State: Provider + GetIt (`registry`). Routing: GoRouter typed routes (codegen).
- DB: sembast (NoSQL), one DAO per feature, registered in `registry`.
- All UI text via `context.l10n.<key>`. ARB source files in `lib/app/l10n/arb/`.
- Theme is dynamic: primary color is user-chosen, so **never hardcode the brand purple** —
  read it from `Theme.of(context).primaryColor` or `NepanikarColors.*(context)`.
- Codegen everywhere (`*.g.dart`, `*.freezed.dart`, `*.gen.dart`). After touching routes,
  `@freezed`/`@JsonSerializable` models, or assets → run build_runner (max 2 tries, then
  hand-write the `.g.dart` from a sibling — see `CLAUDE.md`).

## Where things live

```
lib/
  app/
    generated/      flutter_gen output (assets.gen.dart, fonts.gen.dart) — never edit
    l10n/           localization (arb/ source + generated AppLocalizations)
    router/         routes.dart (typed routes) + go_router_config.dart (observer/analytics)
    theme/          colors.dart, fonts.dart, sizes.dart, theme.dart (light), dark_theme.dart
  games/            breathing, relaxation, math, balance, balloons
  helpers/          small stateless helper functions (color, date, platform, semantics…)
  providers/        Provider ChangeNotifiers (mood chart/heatmap filters, mood state)
  screens/
    home/           anxiety, depression, self_harm, suicidal_thoughts, eating_disorder, my_records
    contacts/       contact + crisis screens
    settings/       app settings
    main/           main navigation shell
    bpd_programme/  BPD programme (weeks/days) — see CLAUDE.md
  services/
    db/             DatabaseService + per-module ModuleDb + DAOs
    notifications/  AwesomeNotifications integration
    …               export_service, save_directories, contacts/bpd data managers
  utils/            app_setup.dart (setup()), registry.dart, config
  widgets/          reusable UI (NepanikarScreenWrapper, tiles, dialogs, heatmap, mood…)
assets/             svgs, lottie, audio, csv test data, json contact/bpd content
packages/           nepanikar_contacts_gen, nepanikar_data_migration (local pkgs)
```
