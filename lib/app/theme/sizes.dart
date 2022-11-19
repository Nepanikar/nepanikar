import 'package:flutter/material.dart';

typedef SeparatorBuilder = Widget Function();

class NepanikarSizes {
  NepanikarSizes._();

  static const buttonSize = Size(290, 52);

  static const screenContentPadding = EdgeInsets.all(24.0);

  static SeparatorBuilder separatorBuilder({double height = 12}) => () => SizedBox(height: height);
}
