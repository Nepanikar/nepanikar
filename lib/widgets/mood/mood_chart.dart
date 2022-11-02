import 'package:collection/collection.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/services/db/relaxation/mood_track_model.dart';

class MoodChart extends StatelessWidget {
  const MoodChart({
    super.key,
    required this.moodTrackList,
  });

  final List<MoodTrack> moodTrackList;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.70,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 18,
          left: 12,
          top: 24,
          bottom: 12,
        ),
        child: LineChart(
          _buildLineChartData(context),
        ),
      ),
    );
  }

  Widget _leftTitleIcons(double value, TitleMeta meta) {
    SvgGenImage? svgImage;
    switch (value.toInt()) {
      case 0:
        svgImage = Assets.illustrations.moods.sad5;
        break;
      case 1:
        svgImage = Assets.illustrations.moods.bad4;
        break;
      case 2:
        svgImage = Assets.illustrations.moods.okay3;
        break;
      case 3:
        svgImage = Assets.illustrations.moods.good2;
        break;
      case 4:
        svgImage = Assets.illustrations.moods.happy1;
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: svgImage?.svg(width: 32, height: 32) ?? const SizedBox.shrink(),
    );
  }

  LineChartData _buildLineChartData(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    return LineChartData(
      borderData: FlBorderData(show: false),
      minX: 0,
      minY: 0,
      maxY: Mood.knownMoods.length - 1,
      lineBarsData: [
        LineChartBarData(
          spots: moodTrackList
              .mapIndexed((i, e) => FlSpot(i.toDouble(), e.mood.index.toDouble()))
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
        horizontalLines: Mood.knownMoods
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
              final moodTrack = moodTrackList[flSpot.x.toInt()];
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
