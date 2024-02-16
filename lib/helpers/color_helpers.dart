import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';

bool isDarkModeFunction(BuildContext context){
  return Theme.of(context).brightness == Brightness.dark;
}

Color? svgColorBasedOnDarkMode(BuildContext context) {
  return isDarkModeFunction(context) ?  NepanikarColors.white : null;
}

Color? pdfColorBasedOnDarkMode(BuildContext context) {
  return isDarkModeFunction(context) ? NepanikarColors.primarySwatch.shade700 : null;
}

Color? longTileColorBasedOnDarkMode(BuildContext context){
  return isDarkModeFunction(context) ? NepanikarColors.containerD : null;
}

Color? customColorsBasedOnDarkMode(BuildContext context, Color? darkModeColor1, Color? lightModeColor2){
  return isDarkModeFunction(context) ? darkModeColor1 : lightModeColor2;
}
