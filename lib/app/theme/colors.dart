import 'package:flutter/material.dart';

class NepanikarColors {
  NepanikarColors._();

  static final MaterialColor primarySwatch = MaterialColor(primary.value, _primarySwatch);
  static const dark = Color(0xff280446);
  static const primary = Color(0xff491475);
  static const secondary = Color(0xff4EA3AD);
  static const error = Color(0xffD86C66);
  static const success = Color(0xff6FD866);
  static const info = Color(0xffFEC786);
  static const filledContainer = Color(0xffEDE8F3);
  static const white = Color(0xffffffff);
  static const purple200 = Color(0xffe2d2ef);

  static final cardShadow = [
    BoxShadow(
      color: const Color(0xff280446).withOpacity(0.08),
      blurRadius: 32,
      offset: const Offset(0, 8), // changes position of shadow
    ),
    BoxShadow(
      color: const Color(0xff2C0B4A).withOpacity(0.04),
      blurRadius: 4,
      offset: const Offset(0, 2), // changes position of shadow
    ),
  ];

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


  //Dark mode colors
  static const primaryD = Color(0xff280446);
  static const containerD = Color(0xff491475);
  static const headerD = Color(0xff18002D);

}
