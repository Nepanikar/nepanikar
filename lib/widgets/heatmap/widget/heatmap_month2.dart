import 'package:flutter/material.dart';
import 'package:nepanikar/widgets/heatmap/util/date_util.dart';

class HeatMapMonth2 extends StatelessWidget {
  const HeatMapMonth2({
    super.key,
    required this.month, // Now just a single int representing the month
    this.fontSize,
    this.fontColor,
  });

  /// The month value.
  ///
  /// From 1: January to 12: December.
  final int month;

  /// The double value of font size.
  final double? fontSize;

  /// The color value of font color.
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    // Use the `month` to directly index into `DateUtil.SHORT_MONTH_LABEL`
    // Remember to adjust the index if necessary (e.g., if `month` is 1-based but the array is 0-based)
    final String monthText = DateUtil.mothLabels(
      month - 1,
      true,
      context,
    ); // Assuming month is 1-based and your array is 0-based

    return Text(
      monthText,
      style: TextStyle(color: fontColor, fontSize: fontSize),
    );
  }
}
