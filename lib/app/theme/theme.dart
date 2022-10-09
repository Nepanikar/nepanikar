import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/sizes.dart';

class NepanikarTheme {
  NepanikarTheme._();

  static final ThemeData themeData = ThemeData(
    primaryColor: NepanikarColors.primary,
    scaffoldBackgroundColor: const Color(0xffFBF6FF),
    fontFamily: 'Satoshi',
    colorScheme: const ColorScheme.light().copyWith(
      primary: NepanikarColors.primary,
      secondary: NepanikarColors.secondary,
      onSecondary: Colors.white,
      error: NepanikarColors.error,
    ),
    errorColor: NepanikarColors.error,
    primarySwatch: NepanikarColors.primarySwatch,
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: NepanikarColors.primary,
      elevation: 0,
      centerTitle: true,
    ),
    cardTheme: const CardTheme().copyWith(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: _buttonStyle.copyWith(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return NepanikarColors.primarySwatch.shade500;
            }
            return NepanikarColors.primary;
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
            return const BorderSide(color: NepanikarColors.primary, width: 2.0);
          },
        ),
      ),
    ),
    toggleableActiveColor: NepanikarColors.primary,
    unselectedWidgetColor: const Color(0xffA083B8),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      hintStyle: TextStyle(
        color: NepanikarColors.primarySwatch.shade400,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      labelStyle: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      errorStyle: const TextStyle(
        color: NepanikarColors.error,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: NepanikarColors.primary,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: NepanikarColors.error,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: NepanikarColors.primarySwatch.shade500,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: NepanikarColors.primarySwatch.shade500,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: NepanikarColors.primary,
        ),
      ),
    ),
  );

  static const title1 = TextStyle(
    fontSize: 32,
    height: 1.125,
    fontWeight: FontWeight.w900,
    color: NepanikarColors.dark,
  );

  static const title2 = TextStyle(
    fontSize: 24,
    height: 1.333,
    fontWeight: FontWeight.w900,
    color: NepanikarColors.dark,
  );

  static const title3 = TextStyle(
    fontSize: 20,
    height: 1.35,
    fontWeight: FontWeight.w900,
    color: NepanikarColors.dark,
  );

  static const bodyBlack = TextStyle(
    fontSize: 15,
    height: 1.333,
    fontWeight: FontWeight.w900,
    color: NepanikarColors.dark,
  );

  static const bodyHeavy = TextStyle(
    fontSize: 15,
    height: 1.333,
    fontWeight: FontWeight.w700,
    color: NepanikarColors.dark,
  );

  static const bodyRoman = TextStyle(
    fontSize: 15,
    height: 1.333,
    fontWeight: FontWeight.w400,
    color: NepanikarColors.dark,
  );

  static const bodySmallHeavy = TextStyle(
    fontSize: 12,
    height: 1.333,
    fontWeight: FontWeight.w900,
    color: NepanikarColors.dark,
  );

  static const bodySmallMedium = TextStyle(
    fontSize: 12,
    height: 1.333,
    fontWeight: FontWeight.w500,
    color: NepanikarColors.dark,
  );
}

final _buttonStyle = ButtonStyle(
  minimumSize: MaterialStateProperty.all<Size>(NepanikarSizes.buttonSize),
  elevation: MaterialStateProperty.all<double>(0),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
);
