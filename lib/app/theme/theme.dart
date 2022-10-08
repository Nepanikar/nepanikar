import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/sizes.dart';

class NepanikarTheme {
  NepanikarTheme._();

  static final ThemeData themeData = ThemeData(
    primaryColor: NepanikarColors.primary,
    scaffoldBackgroundColor: const Color(0xffFBF6FF),
    colorScheme: const ColorScheme.light().copyWith(
      primary: NepanikarColors.primary,
      secondary: NepanikarColors.secondary,
      onSecondary: Colors.white,
      error: NepanikarColors.error,
    ),
    errorColor: NepanikarColors.error,
    primarySwatch: NepanikarColors.primarySwatch,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: _buttonStyle.copyWith(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return NepanikarColors.primarySwatch.shade500;
            }
            return NepanikarColors.background;
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
            if (states.contains(MaterialState.disabled)) {
              return NepanikarColors.primarySwatch.shade500;
            }
            return NepanikarColors.primary;
          },
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(color: NepanikarColors.primary, fontWeight: FontWeight.w900),
        ),
        side: MaterialStateProperty.resolveWith<BorderSide?>(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return BorderSide(color: NepanikarColors.primarySwatch.shade500, width: 2.0);
            }
            return const BorderSide(color: NepanikarColors.background, width: 2.0);
          },
        ),
      ),
    ),
    toggleableActiveColor: primary,
    unselectedWidgetColor: const Color(0xffA083B8),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      hintStyle: const TextStyle(
        color: Color(0xffC1AAD4),
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      labelStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      errorStyle: const TextStyle(
        color: error,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: primary,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: error,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Color(0xffAF87C6),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Color(0xffAF87C6),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: primary,
        ),
      ),
    ),
  );
  static const primarySwatch = <int, Color>{
    50: Color(0xffFAF4FF), //10%
    100: Color(0xffFAF4FF), //20%
    200: Color(0xffE2D2EF), //30%
    300: Color(0xffE2D2EF), //40%
    400: Color(0xffC1AAD4), //50%
    500: Color(0xffAF87C6), //60%
    600: Color(0xffC090FC), //70%
    700: Color(0xff955EB6), //80%
    800: Color(0xff491475), //90%
    900: Color(0xff280446), //100%
  };
  static const primary = Color(0xff491475);
  static const secondary = Color(0xff4EA3AD);
  static const dark = Color(0xff280446);
  static const error = Color(0xffD86C66);
  static const success = Color(0xff6FD866);

  static const title1 = TextStyle(
    fontSize: 32,
    height: 1.125,
    fontWeight: FontWeight.w800,
    color: dark,
  );

  static const title2 = TextStyle(
    fontSize: 24,
    height: 1.333,
    fontWeight: FontWeight.w800,
    color: dark,
  );

  static const title3 = TextStyle(
    fontSize: 20,
    height: 1.35,
    fontWeight: FontWeight.w800,
    color: dark,
  );

  static const bodyBlack = TextStyle(
    fontSize: 15,
    height: 1.333,
    fontWeight: FontWeight.w900,
    color: dark,
  );

  static const bodyHeavy = TextStyle(
    fontSize: 15,
    height: 1.333,
    fontWeight: FontWeight.w800,
    color: dark,
  );

  static const bodyRoman = TextStyle(
    fontSize: 15,
    height: 1.333,
    fontWeight: FontWeight.w400,
    color: dark,
  );

  static const bodySmallHeavy = TextStyle(
    fontSize: 12,
    height: 1.333,
    fontWeight: FontWeight.w900,
    color: dark,
  );

  static const bodySmallMedium = TextStyle(
    fontSize: 12,
    height: 1.333,
    fontWeight: FontWeight.w500,
    color: dark,
  );
}

final _buttonStyle = ButtonStyle(
  minimumSize: MaterialStateProperty.all<Size>(NepanikarSizes.buttonSize),
  elevation: MaterialStateProperty.all<double>(0),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
);
