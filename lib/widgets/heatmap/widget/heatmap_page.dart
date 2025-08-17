import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nepanikar/widgets/heatmap/data/heatmap_color_mode.dart';
import 'package:nepanikar/widgets/heatmap/util/datasets_util.dart';
import 'package:nepanikar/widgets/heatmap/util/date_util.dart';
import 'package:nepanikar/widgets/heatmap/widget/heatmap_column.dart';

class HeatMapPage extends StatelessWidget {
  HeatMapPage({
    super.key,
    required this.colorMode,
    required this.startDate,
    required this.endDate,
    this.size,
    this.fontSize,
    this.datasets,
    this.defaultColor,
    this.textColor,
    this.colorsets,
    this.borderRadius,
    this.onClick,
    this.margin,
    this.showText,
  }) // : _dateDifferent = endDate.difference(startDate).inDays,
  : maxValue = DatasetsUtil.getMaxValue(datasets);

  /// List value of every sunday's month information.
  ///
  /// From 1: January to 12: December.
  // final List<int> _firstDayInfos = [];

  /// The number of days between [startDate] and [endDate].
  // final int _dateDifferent;

  /// The Date value of start day of heatmap.
  ///
  /// HeatMap shows the start day of [startDate]'s week.
  ///
  /// Default value is 1 year before the [endDate].
  /// And if [endDate] is null, then set 1 year before the [DateTime.now]
  final DateTime startDate;

  /// The Date value of end day of heatmap.
  ///
  /// Default value is [DateTime.now]
  final DateTime endDate;

  /// The double value of every block's width and height.
  final double? size;

  /// The double value of every block's fontSize.
  final double? fontSize;

  /// The datasets which fill blocks based on its value.
  final Map<DateTime, int>? datasets;

  /// The margin value for every block.
  final EdgeInsets? margin;

  /// The default background color value of every blocks.
  final Color? defaultColor;

  /// The text color value of every blocks.
  final Color? textColor;

  /// ColorMode changes the color mode of blocks.
  ///
  /// [ColorMode.opacity] requires just one colorsets value and changes color
  /// dynamically based on hightest value of [datasets].
  /// [ColorMode.color] changes colors based on [colorsets] thresholds key value.
  final ColorMode colorMode;

  /// The colorsets which give the color value for its thresholds key value.
  ///
  /// Be aware that first Color is the maximum value if [ColorMode] is [ColorMode.opacity].
  final Map<int, Color>? colorsets;

  /// The double value of every block's borderRadius.
  final double? borderRadius;

  /// The integer value of the maximum value for the [datasets].
  ///
  /// Get highest key value of filtered datasets using [DatasetsUtil.getMaxValue].
  final int? maxValue;

  /// Function that will be called when a block is clicked.
  ///
  /// Paratmeter gives clicked [DateTime] value.
  final Function(DateTime)? onClick;

  final bool? showText;

  /*
  /// Get [HeatMapColumn] from [startDate] to [endDate].
  List<Widget> _heatmapColumnList(int specificMonth) {
    final List<Widget> columns = [];
    final int year = startDate.year;
    final dateTime = DateTime(year, specificMonth);
    final lastDay = DateUtil.endDayOfMonth(dateTime);
    final int daysInMonth = lastDay.day;

    // Process each week in the month
    for (int day = 1; day <= daysInMonth; day += 7) {
      final DateTime weekStart = DateTime(year, specificMonth, day);
      final DateTime weekEnd = DateTime(year, specificMonth, min(day + 6, daysInMonth));

      // Filter datasets for the days in this week only
      final Map<DateTime, int> weeklyData = {};
      if (datasets != null) {
        for (final entry in datasets!.entries) {
          if (entry.key.isAfter(weekStart.subtract(const Duration(days: 1))) &&
              (entry.key.isBefore(weekEnd.add(const Duration(days: 1))) ||
                  entry.key.isAtSameMomentAs(weekEnd))) {
            weeklyData[entry.key] = entry.value;
          }
        }
      }

      // Create a HeatMapColumn for the current week
      columns.add(
        HeatMapColumn(
          startDate: weekStart,
          endDate: weekEnd,
          colorMode: colorMode,
          numDays: weekEnd.difference(weekStart).inDays + 1,
          size: size,
          fontSize: fontSize,
          defaultColor: defaultColor,
          colorsets: colorsets,
          textColor: textColor,
          borderRadius: borderRadius,
          margin: margin,
          maxValue: maxValue,
          onClick: onClick,
          datasets: weeklyData,
          showText: showText,
        ),
      );
    }

    return columns;
  }
  */

  Widget _buildYearlyHeatmap() {
    final List<Widget> monthlyColumns = [];
    // Iterate over each month and create a HeatMapColumn for that month
    for (int month = 1; month <= 12; month++) {
      final int year = startDate.year;
      final DateTime firstDayOfMonth = DateUtil.startDayOfMonth(DateTime(year, month));
      final DateTime lastDayOfMonth = DateUtil.endDayOfMonth(DateTime(year, month));

      final Map<DateTime, int> monthlyData = Map<DateTime, int>.fromEntries(
        datasets?.entries.where((entry) => entry.key.month == month && entry.key.year == year) ??
            const Iterable.empty(),
      );

      // Create a HeatMapColumn for the entire month
      final Widget heatmapColumn = HeatMapColumn(
        startDate: firstDayOfMonth,
        endDate: lastDayOfMonth,
        colorMode: colorMode,
        numDays: lastDayOfMonth.day,
        size: size,
        fontSize: fontSize,
        defaultColor: defaultColor,
        colorsets: colorsets,
        textColor: textColor,
        borderRadius: borderRadius,
        margin: margin,
        maxValue: maxValue,
        onClick: onClick,
        datasets: monthlyData,
        showText: showText,
      );

      monthlyColumns.add(
        Padding(
          padding: const EdgeInsets.only(right: 2),
          child: SizedBox(
            width: 21,
            height: 675,
            child: Column(
              children: [
                Text(
                  // You can also use the first letter of the month here as per your requirement
                  DateFormat(
                    'MMM',
                  ).format(firstDayOfMonth), // 'MMM' formats to a three-letter month name
                  style: TextStyle(
                    fontSize: fontSize,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                heatmapColumn,
              ],
            ),
          ),
        ),
      );
    }

    // Return a Row that contains all the monthly columns
    return SingleChildScrollView(child: Row(children: monthlyColumns));
  }

  @override
  Widget build(BuildContext context) {
    final yearlyHeatmap = _buildYearlyHeatmap();
    return yearlyHeatmap;
  }
}
