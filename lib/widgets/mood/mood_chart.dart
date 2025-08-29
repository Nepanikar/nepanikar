import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/services/db/my_records/mood_track_model.dart';

class MoodChart extends StatelessWidget {
  const MoodChart({super.key, required this.moodTrackData, required this.moodLabelBuilder});

  final Map<DateTime, MoodTrack?> moodTrackData;
  final String Function(Mood m) moodLabelBuilder;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: 1.70, child: LineChart(_buildLineChartData(context)));
  }

  Widget _leftTitleIcons(double value, TitleMeta meta, BuildContext context) {
    final mood = Mood.fromInteger(value.toInt());
    return SideTitleWidget(
      meta: meta,
      child:
          mood?.icon.svg(
            width: 32,
            height: 32,
            colorFilter: ColorFilter.matrix(svgColorMatrixBasedOnDarkMode(context, lighter: true)),
          ) ??
          const SizedBox.shrink(),
    );
  }

  LineChartData _buildLineChartData(BuildContext context) {
    final lineColor = customColorsBasedOnDarkMode(
      context,
      NepanikarColors.white,
      NepanikarColors.primary(context),
    );
    final locale = Localizations.localeOf(context).languageCode;
    return LineChartData(
      borderData: FlBorderData(show: false),
      minX: 0,
      minY: 0,
      maxY: Mood.values.length - 1,
      maxX: moodTrackData.length - 1,
      lineBarsData: [
        LineChartBarData(
          spots: moodTrackData.entries
              .mapIndexed((i, e) {
                final moodTrack = e.value;
                return moodTrack == null
                    ? null
                    : FlSpot(i.toDouble(), moodTrack.mood.index.toDouble());
              })
              .whereType<FlSpot>()
              .toList(),
          isStrokeCapRound: true,
          dotData: FlDotData(
            getDotPainter: (_, _, _, _) => FlDotCirclePainter(
              radius: 2.8,
              color: lineColor ?? Colors.black,
              strokeColor: lineColor ?? Colors.black,
            ),
          ),
          color: lineColor,
        ),
      ],
      extraLinesData: ExtraLinesData(
        extraLinesOnTop: false,
        horizontalLines: Mood.values
            .mapIndexed(
              (i, _) => HorizontalLine(
                y: i.toDouble(),
                color: lineColor?.withValues(alpha: 0.2),
                strokeWidth: 1,
                dashArray: [5],
              ),
            )
            .toList(),
      ),
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            interval: 1,
            showTitles: true,
            getTitlesWidget: (value, meta) {
              return _leftTitleIcons(value, meta, context);
            },
            reservedSize: 40,
          ),
        ),
      ),
      lineTouchData: LineTouchData(
        getTouchLineEnd: (_, _) => double.infinity,
        getTouchedSpotIndicator: (_, spotIndexes) {
          return spotIndexes.map((spotIndex) {
            return TouchedSpotIndicatorData(
              FlLine(color: lineColor ?? Colors.black, strokeWidth: 3),
              FlDotData(
                getDotPainter: (_, _, _, _) =>
                    FlDotCirclePainter(radius: 8, color: lineColor ?? Colors.black),
              ),
            );
          }).toList();
        },
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (LineBarSpot touchedSpot) => NepanikarColors.primary(context),
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((barSpot) {
              final flSpot = barSpot;
              final moodTrack = moodTrackData.entries.elementAt(flSpot.x.toInt()).value;
              if (moodTrack == null) return null;
              final formattedDate = DateFormat(
                DateFormat.ABBR_MONTH_DAY,
                locale,
              ).format(moodTrack.date);
              return LineTooltipItem(
                '$formattedDate\n${moodLabelBuilder.call(moodTrack.mood)}',
                const TextStyle(color: Colors.white),
              );
            }).toList();
          },
        ),
      ),
    );
  }
}
