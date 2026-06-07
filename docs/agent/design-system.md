# Design system

Source of truth: `lib/app/theme/`. Never hardcode hex values or `TextStyle`s in screens —
pull from `NepanikarColors`, `NepanikarFonts`, `NepanikarSizes`.

## Color palette — `lib/app/theme/colors.dart` (`NepanikarColors`)

The **primary color is dynamic** (user picks it in Theme settings). The default brand color is
purple, but code must treat primary as variable.

| Constant            | Hex        | Use |
|---------------------|------------|-----|
| `defaultPrimary`    | `#491475`  | Default brand purple (the *fallback* primary) |
| `dark`              | `#280446`  | Default text color (used in every `NepanikarFonts` style) |
| `secondary`         | `#4EA3AD`  | Teal accent (`colorScheme.secondary`) |
| `error`             | `#D86C66`  | Errors / error borders |
| `success`           | `#6FD866`  | Success states |
| `deleteButton`      | `#964A4A`  | Destructive actions |
| `info`              | `#FEC786`  | Info / highlight |
| `filledContainer`   | `#EDE8F3`  | Light container fill (light mode) |
| `purple200`         | `#E2D2EF`  | Light purple |
| `white`             | `#FFFFFF`  | — |

Light scaffold background: `#FBF6FF`. Bottom nav background: `#AAFAF4FF`.
Disabled/hint widget grey: `#A083B8` (`unselectedWidgetColor`).

Heatmap scale (`heatMapColors`, 1→5): `#A72C2C`, `#C78B31`, `#DCC678`, `#A6AC5A`, `#49A3BF`.

### Helper API (prefer these over raw constants)

```dart
NepanikarColors.primary(context)              // theme primary
NepanikarColors.container(context)            // container bg, light/dark aware
NepanikarColors.header(context)               // primary darkened 10% (app-bar overflow band)
NepanikarColors.primaryColorShade(context, x) // lighten/darken primary, dark-mode aware
NepanikarColors.lightness(color, amount)      // shift HSL lightness, clamped
NepanikarColors.primarySwatch(color)          // MaterialColor swatch 50..900 from any color
NepanikarColors.cardShadow(context)           // standard soft card shadow (List<BoxShadow>)
```

Dark mode: many widgets branch on `Theme.of(context).brightness == Brightness.dark`. There are
ready-made helpers in `lib/helpers/color_helpers.dart` (e.g. `svgColorFilterBasedOnDarkMode`,
`longTileColorBasedOnDarkMode`, `customColorsBasedOnDarkMode`) — use those for SVG tinting and
container colors instead of re-implementing the brightness check.

## Typography — `lib/app/theme/fonts.dart` (`NepanikarFonts`)

Font family **Satoshi** (weights 300/400/500/700/900; Ukrainian has a fallback). All styles
default to `color: NepanikarColors.dark`.

| Style            | size / weight        | Use |
|------------------|----------------------|-----|
| `title1`         | 32 / w800            | Page hero title |
| `title2`         | 24 / w800            | Section title |
| `title3`         | 20 / w800            | App-bar title, sub-section |
| `dialogTitle`    | 20 / w700            | Dialog heading |
| `bodyBlack`      | 15 / w900            | Strong body |
| `bodyHeavy`      | 15 / w800            | Semi-strong body |
| `bodyRoman`      | 15 / w400            | Normal body text |
| `bodySmallHeavy` | 12 / w900            | Small emphasis / labels |
| `bodySmallMedium`| 12 / w500            | Small secondary text |

Recolor with `.copyWith(color: …)`. Text scaling is globally disabled (`TextScaler.noScaling`).

## Spacing & sizing — `lib/app/theme/sizes.dart` (`NepanikarSizes`)

```dart
NepanikarSizes.screenContentPadding   // EdgeInsets.all(24)
NepanikarSizes.separatorHeight        // 12.0
NepanikarSizes.separatorBuilder()     // () => SizedBox(height: 12) for ListView.separated
NepanikarSizes.buttonSize             // Size(290, 52) — min button size
NepanikarSizes.fabBottomPadding       // 56.0
```

Radii in theme: buttons 12, cards 16, inputs/snackbars 8. App bar elevation 0 everywhere.

## Theme assembly

- Light: `NepanikarTheme.getThemeData({fontFamily, mainColor})` — `lib/app/theme/theme.dart`
- Dark: `darkTheme.getThemeData({fontFamily, mainColor})` — `lib/app/theme/dark_theme.dart`
- Both take `mainColor` from `UserSettingsDao` so the whole app retints when the user changes
  the primary color. Buttons are filled (elevated) or outlined, both w900 text, no elevation.

## Reusable widgets — `lib/widgets/`

Reach for these before building UI from scratch:

- **`NepanikarScreenWrapper`** — the standard screen scaffold. Props: `appBarTitle`,
  `children`, optional `appBarDescription`, `appBarActions`, `floatingActionButton`,
  `showBottomNavbar`, `isModuleList` (auto-spaces children as a list), `isCardStackLayout`
  (card overlapping the app bar). Use it for almost every screen.
- `NepanikarCleanScreenWrapper` — minimal wrapper without the module-list styling.
- Tiles: `LongTile`, `HomeTile`, `NepanikarTile` (module/menu rows with icon + text + tap).
- Buttons/inputs: `NepanikarButton`, `NepanikarDropdown`, `NepanikarDatePicker`,
  `NepanikarDateRangePicker`, `NepanikarDialog`.
- Forms: `lib/widgets/input_form_contents/` (`checklist_form_content`, `list_form_content`,
  `plan_form_content`) pair with the matching common DAOs.
- Feature widgets: `widgets/mood/` (chart, heatmap, picker, cards), `widgets/contacts/`
  (phone/chat/my-contact tiles), `widgets/test/` (`TestCard`, `TestScoreWidget`),
  `widgets/heatmap/`, `widgets/diary/`, `widgets/food_records/`.
- `snackbars.dart` for toasts/snackbars; `NepanikarHorizontalDivider` for dividers.
