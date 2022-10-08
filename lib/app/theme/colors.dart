import 'package:flutter/material.dart';

class NepanikarColors {
  NepanikarColors._();

  static final MaterialColor primarySwatch = MaterialColor(primary.value, _primarySwatch);
  static const dark = Color(0xff280446);
  static const primary = Color(0xff491475);
  static const secondary = Color(0xff4EA3AD);
  static const error = Color(0xffD86C66);
  static const success = Color(0xff6FD866);

  static const _primarySwatch = <int, Color>{
    50: Color(0xffFAF4FF), //10%
    100: Color(0xffFAF4FF), //20%
    200: Color(0xffE2D2EF), //30%
    300: Color(0xffE2D2EF), //40%
    400: Color(0xffC1AAD4), //50%
    500: Color(0xffAF87C6), //60%
    600: Color(0xffC090FC), //70%
    700: Color(0xff955EB6), //80%
    800: primary, //90%
    900: Color(0xff280446), //100%
  };
}
