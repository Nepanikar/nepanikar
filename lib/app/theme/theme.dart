import 'package:flutter/material.dart';
import 'package:nepanikar/app/generated/fonts.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/app/theme/sizes.dart';

class NepanikarTheme {
  NepanikarTheme._();

  static ThemeData getThemeData({
    required String? fontFamily,
  }) =>
      ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        primaryColor: NepanikarColors.primary,
        scaffoldBackgroundColor: const Color(0xffFBF6FF),
        fontFamily: fontFamily,
        colorScheme: const ColorScheme.light().copyWith(
          primary: NepanikarColors.primary,
          secondary: NepanikarColors.secondary,
          onSecondary: Colors.white,
          error: NepanikarColors.error,
        ),
        errorColor: NepanikarColors.error,
        primarySwatch: NepanikarColors.primarySwatch,
        appBarTheme: AppBarTheme(
          backgroundColor: NepanikarColors.primary,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: NepanikarFonts.title3.copyWith(color: Colors.white),
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
        snackBarTheme: const SnackBarThemeData(
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          elevation: 20,
        ),
        listTileTheme: const ListTileThemeData(
          horizontalTitleGap: 16,
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
