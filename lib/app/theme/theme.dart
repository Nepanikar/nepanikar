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
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: NepanikarColors.background,
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
  );
}

final _buttonStyle = ButtonStyle(
  minimumSize: MaterialStateProperty.all<Size>(NepanikarSizes.buttonSize),
  elevation: MaterialStateProperty.all<double>(0),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
);
