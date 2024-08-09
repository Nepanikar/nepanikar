import 'package:flutter/material.dart';

import 'package:nepanikar/widgets/heatmap/data/heatmap_color_mode.dart';
import 'package:nepanikar/widgets/heatmap/util/datasets_util.dart';
import 'package:nepanikar/widgets/heatmap/util/date_util.dart';
import 'package:nepanikar/widgets/heatmap/widget/heatmap_container.dart';

class HeatMapColumn extends StatelessWidget {
  HeatMapColumn({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.colorMode,
    required this.numDays,
    this.size,
    this.fontSize,
    this.defaultColor,
    this.datasets,
    this.textColor,
    this.borderRadius,
    this.margin,
    this.colorsets,
    this.onClick,
    this.maxValue,
    this.showText,
  }) :
        // Init list.
        dayContainers = List.generate(
          numDays,
              (i) {
            final currentDate = DateUtil.changeDay(startDate, i);
            final isSelected = datasets?.keys.contains(currentDate) ?? false;

            // Determine selected color based on the color mode and dataset value
            final selectedColor = isSelected
                ? (colorMode == ColorMode.opacity
                ? colorsets?.values.first.withOpacity(
              (datasets?[currentDate]?.toDouble() ?? 0) /
                  (maxValue?.toDouble() ?? 1),
            )
                : DatasetsUtil.getColor(colorsets, datasets?[currentDate]))
                : null;

            return HeatMapContainer(
              date: currentDate,
              backgroundColor: defaultColor,
              size: size,
              fontSize: fontSize,
              textColor: textColor,
              borderRadius: borderRadius,
              margin: margin,
              onClick: onClick,
              showText: showText,
              selectedColor: selectedColor,
            );
          },
        );

  /// The List widgets of [HeatMapContainer].
  ///
  /// It includes every days of the week and
  /// if one week doesn't have 7 days, it will be filled with empty [Container].
  final List<Widget> dayContainers;

  /// The List widgets of empty [Container].
  ///
  /// It only processes when given week's length is not 7.

  /// The date value of first day of given week.
  final DateTime startDate;

  /// The date value of last day of given week.
  final DateTime endDate;

  /// The double value of every [HeatMapContainer]'s width and height.
  final double? size;

  /// The double value of every [HeatMapContainer]'s fontSize.
  final double? fontSize;

  /// The default background color value of [HeatMapContainer].
  final Color? defaultColor;

  /// The datasets which fill blocks based on its value.
  ///
  /// datasets keys have to greater or equal to [startDate] and
  /// smaller or equal to [endDate].
  final Map<DateTime, int>? datasets;

  /// The text color value of [HeatMapContainer].
  final Color? textColor;

  /// The colorsets which give the color value for its thresholds key value.
  ///
  /// Be aware that first Color is the maximum value if [ColorMode] is [ColorMode.opacity].
  final Map<int, Color>? colorsets;

  /// ColorMode changes the color mode of blocks.
  ///
  /// [ColorMode.opacity] requires just one colorsets value and changes color
  /// dynamically based on hightest value of [datasets].
  /// [ColorMode.color] changes colors based on [colorsets] thresholdsc key value.
  final ColorMode colorMode;

  /// The double value of [HeatMapContainer]'s borderRadius.
  final double? borderRadius;

  /// The margin value for every block.
  final EdgeInsets? margin;

  /// Function that will be called when a block is clicked.
  ///
  /// Paratmeter gives clicked [DateTime] value.
  final Function(DateTime)? onClick;

  /// The integer value of the maximum value for the highest value of the month.
  final int? maxValue;

  /// Show day text in every blocks if the value is true.
  final bool? showText;

  // The number of day blocks to draw. This should be seven for all but the
  // current week.
  final int numDays;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[...dayContainers],
    );
  }
}
