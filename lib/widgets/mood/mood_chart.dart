import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/services/db/my_records/mood_track_model.dart';

class MoodChart extends StatelessWidget {
  const MoodChart({
    super.key,
    required this.moodTrackData,
  });

  final Map<DateTime, MoodTrack?> moodTrackData;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.70,
      child: LineChart(
        _buildLineChartData(context),
      ),
    );
  }

  Widget _leftTitleIcons(double value, TitleMeta meta) {
    final mood = Mood.fromInteger(value.toInt());
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: mood?.icon.svg(width: 32, height: 32) ?? const SizedBox.shrink(),
    );
  }

  LineChartData _buildLineChartData(BuildContext context) {
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
          isCurved: false,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
            getDotPainter: (_, __, ___, ____) => FlDotCirclePainter(
              radius: 2.8,
              color: NepanikarColors.primary,
              strokeColor: NepanikarColors.primary,
            ),
          ),
          color: NepanikarColors.primary,
        ),
      ],
      extraLinesData: ExtraLinesData(
        extraLinesOnTop: false,
        horizontalLines: Mood.values
            .mapIndexed(
              (i, _) => HorizontalLine(
                y: i.toDouble(),
                color: NepanikarColors.primary.withOpacity(0.2),
                strokeWidth: 1,
                dashArray: [5],
              ),
            )
            .toList(),
      ),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        drawHorizontalLine: false,
        verticalInterval: 1,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        leftTitles: AxisTitles(
          drawBehindEverything: true,
          sideTitles: SideTitles(
            interval: 1,
            showTitles: true,
            getTitlesWidget: _leftTitleIcons,
            reservedSize: 40,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      lineTouchData: LineTouchData(
        getTouchLineEnd: (_, __) => double.infinity,
        getTouchedSpotIndicator: (_, spotIndexes) {
          return spotIndexes.map((spotIndex) {
            return TouchedSpotIndicatorData(
              FlLine(color: NepanikarColors.primary, strokeWidth: 3),
              FlDotData(
                getDotPainter: (_, __, ___, ____) =>
                    FlDotCirclePainter(radius: 8, color: NepanikarColors.primary, strokeWidth: 0),
              ),
            );
          }).toList();
        },
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: NepanikarColors.primary,
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((barSpot) {
              final flSpot = barSpot;
              final moodTrack = moodTrackData.entries.elementAt(flSpot.x.toInt()).value;
              if (moodTrack == null) return null;
              final formattedDate =
                  DateFormat(DateFormat.ABBR_MONTH_DAY, locale).format(moodTrack.date);
              return LineTooltipItem(
                '$formattedDate\n${moodTrack.mood.getLabel(context)}',
                const TextStyle(color: Colors.white),
              );
            }).toList();
          },
        ),
      ),
    );
  }
}
