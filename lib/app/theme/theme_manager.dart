import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
/*
class ThemeManager {
  final SharedPreferences sharedPreferences;

  factory ThemeManager({required SharedPreferences sharedPreferences}) {
    if(_instance == Null){
      _instance = ThemeManager._internal(sharedPreferences);
    }
    return _instance!;
  }

  ThemeManager._internal(this.sharedPreferences);


  static ThemeManager? _instance;

  bool isDarkMode = false;

  ThemeMode get currentThemeMode => isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    // Store the theme mode preference in storage.
    saveDarkModePreference();
  }

  void saveDarkModePreference() {
    sharedPreferences.setBool('isDarkMode', isDarkMode);
  }

  void loadDarkModePreference() {
    isDarkMode = sharedPreferences.getBool('isDarkMode') ?? false;
  }
}*/