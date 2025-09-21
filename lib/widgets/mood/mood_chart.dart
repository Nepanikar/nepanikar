import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/services/db/my_records/mood_track_model.dart';

class MoodChart extends StatelessWidget {
  const MoodChart({super.key, required this.moodTrackData, required this.moodLabelBuilder});

  final Map<DateTime, List<MoodTrack>> moodTrackData;
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
                double averageMood = 0;
                for (final mood in moodTrack) {
                  averageMood += mood.mood.index.toDouble();
                }
                averageMood /= moodTrack.length;
                return FlSpot(i.toDouble(), averageMood);
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
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: (value, meta) {
              if (value % 1 == 0) {
                return Text(value.toInt().toString());
              }
              return const SizedBox.shrink();
            },
          ),
        ),
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
              final formattedDate = DateFormat(
                DateFormat.ABBR_MONTH_DAY,
                locale,
              ).format(moodTrack[0].date);
              double averageMood = 0;
              for (final mood in moodTrack) {
                averageMood += mood.mood.index.toDouble();
              }
              averageMood /= moodTrack.length;
              return LineTooltipItem(
                '$formattedDate\n${averageMood.toStringAsPrecision(2)}',
                const TextStyle(color: Colors.white),
              );
            }).toList();
          },
        ),
      ),
    );
  }
}
