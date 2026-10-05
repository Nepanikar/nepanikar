import 'package:material_ui/material_ui.dart';
import 'package:nepanikar/widgets/heatmap/util/date_util.dart';

class HeatMapMonth2 extends StatelessWidget {
  const HeatMapMonth2({super.key, required this.month, this.fontSize, this.fontColor});

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
    final String monthText = DateUtil.monthLabels(month - 1, true, context);

    return Text(
      monthText,
      style: TextStyle(color: fontColor, fontSize: fontSize),
    );
  }
}
