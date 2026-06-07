import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/app/theme/sizes.dart';

// ignore: camel_case_types
class darkTheme {
  darkTheme._();

  static ThemeData getThemeData({
    required String? fontFamily,
    required Color? mainColor,
  }) => ThemeData(
    brightness: Brightness.dark,
    primaryColor: mainColor,
    scaffoldBackgroundColor: mainColor,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    fontFamily: fontFamily,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: mainColor,
      secondary: NepanikarColors.secondary,
      onSecondary: Colors.white,
      error: NepanikarColors.error,
    ),
    primarySwatch: NepanikarColors.primarySwatch(mainColor!),
    appBarTheme: AppBarTheme(
      backgroundColor: NepanikarColors.headerColor(mainColor),
      elevation: 0,
      centerTitle: true,
      titleTextStyle: NepanikarFonts.title3.copyWith(color: Colors.white),
    ),
    cardTheme: const CardThemeData().copyWith(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: _buttonStyle.copyWith(
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return NepanikarColors.primarySwatch(mainColor).shade700;
          }
          return NepanikarColors.primarySwatch(mainColor).shade700;
        }),
        foregroundColor: WidgetStateProperty.all<Color?>(Colors.white),
        textStyle: WidgetStateProperty.all<TextStyle>(
          const TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: _buttonStyle.copyWith(
        backgroundColor: WidgetStateProperty.all<Color?>(
          NepanikarColors.primarySwatch(mainColor).shade700,
        ),
        foregroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
          if (states.contains(WidgetState.disabled)) {
            return NepanikarColors.primarySwatch(mainColor).shade500;
          }
          return mainColor;
        }),
        textStyle: WidgetStateProperty.all<TextStyle>(
          TextStyle(color: mainColor, fontWeight: FontWeight.w900),
        ),
      ),
    ),
    unselectedWidgetColor: const Color(0xffA083B8),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      hintStyle: TextStyle(
        color: NepanikarColors.primarySwatch(mainColor).shade100,
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
      labelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      errorStyle: const TextStyle(
        color: NepanikarColors.error,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: NepanikarColors.primarySwatch(mainColor).shade200,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: NepanikarColors.error),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: NepanikarColors.primarySwatch(mainColor).shade200,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: NepanikarColors.primarySwatch(mainColor).shade200,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: NepanikarColors.primarySwatch(mainColor).shade100,
        ),
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      elevation: 20,
    ),
    listTileTheme: const ListTileThemeData(horizontalTitleGap: 16),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.all(Colors.black),
      fillColor: WidgetStateProperty.all(
        NepanikarColors.primarySwatch(mainColor).shade50,
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.selected)) {
          return mainColor;
        }
        return null;
      }),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.selected)) {
          return mainColor;
        }
        return null;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.selected)) {
          return mainColor;
        }
        return null;
      }),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: NepanikarColors.containerColor(mainColor),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
    ),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: NepanikarColors.primarySwatch(mainColor).shade200,
      cursorColor: NepanikarColors.primarySwatch(mainColor).shade200,
      selectionHandleColor: NepanikarColors.primarySwatch(mainColor).shade200,
    ),
  );
}

final _buttonStyle = ButtonStyle(
  minimumSize: WidgetStateProperty.all<Size>(NepanikarSizes.buttonSize),
  elevation: WidgetStateProperty.all<double>(0),
  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
);
