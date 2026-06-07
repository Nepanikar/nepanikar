# Code style & conventions

Lint: `package:lint` (`analysis_options.yaml`). Key enforced rules below — match them so the
analyzer stays green.

## Formatting & style

- **100 chars per line.** Format with `dart format --line-length 100 ./`.
- **Single quotes** for strings (`prefer_single_quotes`).
- **Constructor first** in every class (`sort_constructors_first`).
- `unawaited_futures` is on — `await` futures or wrap in `unawaited(...)`.
- `constant_identifier_names` is off, so the `_storeKeyName` / `darkTheme` style is allowed.
- Generated files (`*.g.dart`, `*.gen.dart`, `*.freezed.dart`) are excluded from analysis and
  **must not be hand-edited** (except the documented build_runner fallback).

## Naming

- Classes: `Nepanikar*` prefix for shared/framework widgets and theme holders
  (`NepanikarScreenWrapper`, `NepanikarColors`, `NepanikarFonts`).
- Screens: `<Feature>Screen` widget + `<Feature>Route` typed route in the same file.
- DAOs: `<Feature>Dao`; module DBs: `<Feature>ModuleDb`; store keys: `snake_case` string consts.
- Files: `snake_case.dart`, one feature per file, mirror the folder feature name.

## Static utility classes

Util/theme classes use a private constructor and static members (the lint
`avoid_classes_with_only_static_members` is intentionally disabled):
```dart
class NepanikarSizes {
  NepanikarSizes._();
  static const buttonSize = Size(290, 52);
}
```

## Standard screen skeleton

```dart
@TypedGoRoute<FeatureRoute>(path: '/home/feature')
class FeatureRoute extends GoRouteData with $FeatureRoute {
  const FeatureRoute();
  @override
  Widget build(BuildContext context, _) => const FeatureScreen();
}

class FeatureScreen extends StatelessWidget {
  const FeatureScreen({super.key});

  SomeDao get _dao => registry.get<SomeDao>();   // pull services from registry

  @override
  Widget build(BuildContext context) {
    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.feature_title,    // text from l10n
      children: [ /* tiles / content */ ],
    );
  }
}
```
- Wrap screens in `NepanikarScreenWrapper` (or `NepanikarCleanScreenWrapper`).
- Use existing tiles/widgets from `lib/widgets/` before writing new layout.
- Reactive data → `StreamBuilder` over a DAO stream.

## Theming rules (important)

- The primary color is user-configurable. **Never hardcode the brand purple.** Use
  `Theme.of(context).primaryColor` or `NepanikarColors.*(context)` helpers.
- Pull text styles from `NepanikarFonts`, spacings from `NepanikarSizes`. Don't inline magic
  numbers for padding/radius that already exist there.
- For dark mode + SVG tint, use the helpers in `lib/helpers/color_helpers.dart`, don't branch on
  brightness by hand.

## When to run codegen

Run `flutter packages pub run build_runner build -d` after editing any of:
- routes (`@TypedGoRoute`) — regenerates `routes.g.dart`
- `@freezed` / `@JsonSerializable` models — regenerates `*.freezed.dart` / `*.g.dart`
- adding assets to `assets/` (and registering the folder in `pubspec.yaml`) — `assets.gen.dart`

After ARB changes run `flutter gen-l10n` instead.

**Build runner budget: 2 attempts.** If it fails, hand-write the `.g.dart` by copying a sibling
file's pattern (per `CLAUDE.md`). `test/ensure_build_runner_test.dart` verifies generated output
is committed.

## Assets

Reference assets through generated `Assets` (`lib/app/generated/assets.gen.dart`), never raw paths:
```dart
Assets.icons.home.path
Assets.illustrations.modules.depression.svg(colorFilter: colorFilter)
```
SVGs are tinted for dark mode via `svgColorFilterBasedOnDarkMode(context)`.

## Don'ts (from CLAUDE.md, still apply)

- Don't hardcode content that lives in JSON/ARB/CSV.
- Don't create files over ~300 lines — split screens into page widgets / reusable widgets.
- Don't use `Spacer()` inside scrollables (overflow); use the
  `Expanded(child: SingleChildScrollView(...))` + fixed bottom button pattern.
- Don't re-read large files repeatedly or retry build_runner more than twice.
