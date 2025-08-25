import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';

bool isDarkmode(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}

Color? svgColorBasedOnDarkMode(BuildContext context) {
  return isDarkmode(context) ? NepanikarColors.white : Theme.of(context).primaryColor;
}

List<double> colorMatrixBasedOnColor(Color tintColor) {
  final double r = tintColor.r;
  final double g = tintColor.g;
  final double b = tintColor.b;

  return <double>[
    0.2126 * r,
    0.7152 * r,
    0.0722 * r,
    0,
    0,
    0.2126 * g,
    0.7152 * g,
    0.0722 * g,
    0,
    0,
    0.2126 * b,
    0.7152 * b,
    0.0722 * b,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
  ];
}

List<double> svgColorMatrixBasedOnDarkMode(BuildContext context, {bool lighter = false}) {
  var tintColor = NepanikarColors.primarySwatch(Theme.of(context).primaryColor).shade100;
  if (lighter) {
    tintColor = NepanikarColors.primarySwatch(Theme.of(context).primaryColor).shade50;
  }
  return colorMatrixBasedOnColor(tintColor);
}

ColorFilter svgColorFilterBasedOnDarkMode(BuildContext context) {
  return isDarkmode(context)
      ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
      : ColorFilter.matrix(svgColorMatrixBasedOnDarkMode(context));
}

Color? textColorBasedOnDarkMode(BuildContext context) {
  return customColorsBasedOnDarkMode(context, NepanikarColors.white, NepanikarColors.dark);
}

Color? pdfColorBasedOnDarkMode(BuildContext context) {
  return isDarkmode(context)
      ? NepanikarColors.primarySwatch(Theme.of(context).primaryColor).shade700
      : null;
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
  return customColorsBasedOnDarkMode(
    context,
    NepanikarColors.primary(context),
    NepanikarColors.primary(context),
  );
}
