import 'package:flutter/material.dart';

extension ScreenResolutionHelpers on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  double get screenWidth => screenSize.width;

  double get screenHeight => screenSize.height;

  bool get isSmallScreen => screenHeight < 750;

  /// This value is calculated based on smallest iPad screen width (744px)
  /// and devided by 3 columns of content (248px). Than just rounded down to 245px,
  int get tabletMaxColumnWidth => 245;
}
