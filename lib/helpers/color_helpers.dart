import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';

bool isDarkmode(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}

Color? svgColorBasedOnDarkMode(BuildContext context) {
  return isDarkmode(context) ? NepanikarColors.white : null;
}

Color? textColorBasedOnDarkMode(BuildContext context) {
  return customColorsBasedOnDarkMode(context, NepanikarColors.white, null);
}

Color? pdfColorBasedOnDarkMode(BuildContext context) {
  return isDarkmode(context) ? NepanikarColors.primarySwatch(Theme.of(context).primaryColor).shade700 : null;
}

Color? longTileColorBasedOnDarkMode(BuildContext context) {
  return isDarkmode(context) ? NepanikarColors.container(context) : null;
}

Color? customColorsBasedOnDarkMode(
  BuildContext context,
  Color? darkModeColor1,
  Color? lightModeColor2,
) {
  return isDarkmode(context) ? darkModeColor1 : lightModeColor2;
}

Color? backgroundColorsBasedOnDarkMode(BuildContext context) {
  return customColorsBasedOnDarkMode(context, NepanikarColors.primary(context), NepanikarColors.primary(context));
}
