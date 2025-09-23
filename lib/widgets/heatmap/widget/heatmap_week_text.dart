import 'package:flutter/material.dart';
import 'package:nepanikar/widgets/heatmap/util/date_util.dart';

class HeatMapWeekText extends StatelessWidget {
  const HeatMapWeekText({super.key, this.margin, this.fontSize, this.size, this.fontColor});

  /// The margin value for correctly space between labels.
  final EdgeInsets? margin;

  /// The double value of label's font size.
  final double? fontSize;

  /// The double value of every block's size to fit the height.
  final double? size;

  /// The color value of every font's color.
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        for (int i = 1; i <= 7; i++)
          Container(
            height: size ?? 20,
            margin: margin ?? const EdgeInsets.all(2.0),
            child: Text(
              DateUtil.weekDaysLabels(i, context),
              style: TextStyle(fontSize: fontSize ?? 12, color: fontColor),
            ),
          ),
      ],
    );
  }
}
