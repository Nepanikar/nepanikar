import 'package:material_ui/material_ui.dart';

class NepanikarColors {
  NepanikarColors._();

  static Color primary(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.light) {
      return Theme.of(context).primaryColor;
    } else {
      return Theme.of(context).primaryColor;
    }
  }

  static Color lightness(Color color, double amount) {
    final hsl = HSLColor.fromColor(color);
    return hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0)).toColor();
  }

  static Color container(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.light) {
      return const Color(0xffEDE8F3);
    } else {
      return lightness(Theme.of(context).primaryColor, 0.1);
    }
  }

  static Color containerColor(Color mainColor) {
    return lightness(mainColor, 0.1);
  }

  static Color headerColor(Color mainColor) {
    return lightness(mainColor, -0.1);
  }

  static Color header(BuildContext context) {
    return lightness(Theme.of(context).primaryColor, -0.1);
  }

  static MaterialColor primarySwatch(Color color) {
    final Map<int, Color> swatch = {
      50: lightness(color, 0.55),
      100: lightness(color, 0.40),
      200: lightness(color, 0.25),
      300: lightness(color, 0.15),
      400: lightness(color, 0.05),
      500: color, // base color
      600: lightness(color, -0.05),
      700: lightness(color, -0.15),
      800: lightness(color, -0.25),
      900: lightness(color, -0.35),
    };
    return MaterialColor(color.toARGB32(), swatch);
  }

  /// Background for a filled call-to-action.
  ///
  /// The main colour is picked off a hue wheel at a fixed lightness of 0.27,
  /// and in dark mode the screen behind sits at that same colour lightened by
  /// 0.1 ([containerColor]). A button painted in the main colour therefore
  /// differs from its own background by one tenth of a step and all but
  /// disappears — which is what the programme's screens did by setting
  /// `backgroundColor: primaryColor` and bypassing the theme.
  ///
  /// This is the shade the app's own `elevatedButtonTheme` already uses in the
  /// dark theme, so a button styled with it matches every other button in the
  /// app rather than introducing a third convention.
  static Color ctaBackground(BuildContext context) {
    final primary = Theme.of(context).primaryColor;
    return Theme.of(context).brightness == Brightness.light
        ? primary
        : primarySwatch(primary).shade700;
  }

  /// Text and icons tinted with the main colour, sitting on the screen's own
  /// background rather than on a filled button.
  ///
  /// Same trap as [ctaBackground] and worse for a thin glyph, so dark mode
  /// drops the tint altogether. White is not a guess: it is what these very
  /// screens already use for their headings and body text in dark mode, and
  /// it is the only option that holds up across the whole hue wheel. Contrast
  /// against the dark-mode background, for three main colours:
  ///
  /// |                      | purple | red  | teal |
  /// |----------------------|--------|------|------|
  /// | main colour (before) |   1.35 | 1.42 | 1.72 |
  /// | lighter main colour  |   2.31 | 2.00 | 1.94 |
  /// | white                |   9.49 | 4.59 | 2.94 |
  ///
  /// A lighter shade of the main colour is the obvious choice and what
  /// [NepanikarButton] uses for its secondary label, but that label sits on a
  /// button fill rather than on this background, and here it barely helps.
  ///
  /// Both helpers return the main colour unchanged in light mode, so switching
  /// a call site over cannot alter the light appearance.
  static Color accent(BuildContext context) => Theme.of(context).brightness == Brightness.light
      ? Theme.of(context).primaryColor
      : Colors.white;

  static Color primaryColorShade(BuildContext context, double shade) {
    return Theme.of(context).brightness == Brightness.light
        ? lightness(Theme.of(context).primaryColor, shade)
        : lightness(Theme.of(context).primaryColor, shade - 0.2);
  }

  static const dark = Color(0xff280446);
  static const defaultPrimary = Color(0xff491475);
  static const secondary = Color(0xff4EA3AD);
  static const error = Color(0xffD86C66);
  static const success = Color(0xff6FD866);

  /// Progress green for the programme skill tree (completed weeks/days).
  ///
  /// [success] is a signal colour — as a large filled circle repeated down
  /// the tree it read as garish next to the purple palette. This is a muted
  /// green tuned to sit with [defaultPrimary] and [secondary].
  // TODO: schválit autorem – v brand paletě zelená neexistuje, tento odstín
  // je navržený, ne schválený.
  static const progressGreen = Color(0xff429464);
  static const deleteButton = Color(0xff964A4A);
  static const info = Color(0xffFEC786);
  static const filledContainer = Color(0xffEDE8F3);
  static const white = Color(0xffffffff);
  static const purple200 = Color(0xffe2d2ef);

  static List<BoxShadow> cardShadow(BuildContext context) {
    return [
      BoxShadow(
        color: Theme.of(context).primaryColor.withValues(alpha: 0.08),
        blurRadius: 32,
        offset: const Offset(0, 8),
      ),
      BoxShadow(
        color: Theme.of(context).primaryColor.withValues(alpha: 0.04),
        blurRadius: 4,
        offset: const Offset(0, 2),
      ),
    ];
  }

  static const heatMapColors = <int, Color>{
    1: Color(0xffA72C2C),
    2: Color(0xffC78B31),
    3: Color(0xffDCC678),
    4: Color(0xffA6AC5A),
    5: Color(0xff49A3BF),
  };
}
