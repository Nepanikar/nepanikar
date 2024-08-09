import 'package:flutter/material.dart';
import '../util/date_util.dart';

class HeatMapMonth2 extends StatelessWidget {
  /// The month value.
  ///
  /// From 1: January to 12: December.
  final int month;

  /// The double value of font size.
  final double? fontSize;

  /// The color value of font color.
  final Color? fontColor;

  const HeatMapMonth2({
    Key? key,
    required this.month, // Now just a single int representing the month
    this.fontSize,
    this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the `month` to directly index into `DateUtil.SHORT_MONTH_LABEL`
    // Remember to adjust the index if necessary (e.g., if `month` is 1-based but the array is 0-based)
    String monthText = DateUtil.SHORT_MONTH_LABEL[month - 1]; // Assuming month is 1-based and your array is 0-based

    return Text(
      monthText,
      style: TextStyle(
        color: fontColor,
        fontSize: fontSize,
      ),
    );
  }
}