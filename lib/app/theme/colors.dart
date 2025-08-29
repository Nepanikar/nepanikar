import 'package:flutter/material.dart';

class NepanikarColors {
  NepanikarColors._();

  static Color primary(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.light) {
      return Theme.of(context).primaryColor;
    } else {
      //primaryD
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
  static const deleteButton = Color(0xff964A4A);
  static const info = Color(0xffFEC786);
  static const filledContainer = Color(0xffEDE8F3);
  static const white = Color(0xffffffff);
  static const purple200 = Color(0xffe2d2ef);

  static final cardShadow = [
    BoxShadow(
      color: const Color(0xff280446).withValues(alpha: 0.08),
      blurRadius: 32,
      offset: const Offset(0, 8), // changes position of shadow
    ),
    BoxShadow(
      color: const Color(0xff2C0B4A).withValues(alpha: 0.04),
      blurRadius: 4,
      offset: const Offset(0, 2), // changes position of shadow
    ),
  ];

  static const heatMapColors = <int, Color>{
    1: Color(0xffA72C2C),
    2: Color(0xffC78B31),
    3: Color(0xffDCC678),
    4: Color(0xffA6AC5A),
    5: Color(0xff49A3BF),
  };
}
