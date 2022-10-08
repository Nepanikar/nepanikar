import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/sizes.dart';

class NepanikarTheme {
  NepanikarTheme._();

  static final ThemeData themeData = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: const Color(0xffFBF6FF),
    colorScheme: const ColorScheme.light().copyWith(
      primary: primary,
      secondary: secondary,
      onSecondary: Colors.white,
      error: error,
    ),
    errorColor: error,
    primarySwatch: MaterialColor(
      background.value,
      primarySwatch,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: _buttonStyle.copyWith(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(MaterialState.disabled)) return NepanikarTheme.primarySwatch[500]!;
            return NepanikarTheme.background;
          },
        ),
        foregroundColor: MaterialStateProperty.all<Color?>(Colors.white),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: _buttonStyle.copyWith(
        backgroundColor: MaterialStateProperty.all<Color?>(Colors.white),
        foregroundColor: MaterialStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(MaterialState.disabled)) return NepanikarTheme.primarySwatch[500]!;
            return NepanikarTheme.primary;
          },
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(color: primary, fontWeight: FontWeight.w900),
        ),
        side: MaterialStateProperty.resolveWith<BorderSide?>(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return BorderSide(color: NepanikarTheme.primarySwatch[500]!, width: 2.0);
            }
            return const BorderSide(color: NepanikarTheme.background, width: 2.0);
          },
        ),
      ),
    ),
  );

  // TODO: refactor to MaterialColor for safe way of getting shade colors
  static const primarySwatch = <int, Color>{
    50: Color(0xffFAF4FF), //10%
    100: Color(0xffFAF4FF), //20%
    200: Color(0xffE2D2EF), //30%
    300: Color(0xffE2D2EF), //40%
    400: Color(0xffC1AAD4), //50%
    500: Color(0xffAF87C6), //60%
    600: Color(0xffC090FC), //70%
    700: Color(0xff955EB6), //80%
    800: background, //90%
    900: Color(0xff280446), //100%
  };
  static const primary = Color(0xff280446);
  static const background = Color(0xff491475);
  static const secondary = Color(0xff4EA3AD);
  static const error = Color(0xffD86C66);
  static const success = Color(0xff6FD866);
}

final _buttonStyle = ButtonStyle(
  minimumSize: MaterialStateProperty.all<Size>(NepanikarSizes.buttonSize),
  elevation: MaterialStateProperty.all<double>(0),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
);
