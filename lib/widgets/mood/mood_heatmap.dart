import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/providers/mood_heatmap_filter_provider.dart';
import 'package:nepanikar/widgets/heatmap/heatmap.dart';

import '../heatmap/data/heatmap_color_mode.dart';
import '../heatmap/heatmap_calendar.dart';

class MoodHeatmap extends StatelessWidget{
  const MoodHeatmap({
    super.key,
    required this.heatmapType,
    required this.dateRange,
    required this.moodScores,
  });

  final Map<DateTime, int> moodScores;
  final DateTimeRange dateRange;
  final HeatmapFilter heatmapType;



  @override
  Widget build(BuildContext context) {
    switch (heatmapType){
      case HeatmapFilter.month:
        return monthHeatmap();
      case HeatmapFilter.year:
        return yearHeatmap();
    }
  }

  Widget monthHeatmap(){
    return HeatMapCalendar(
      datasets: moodScores,
      colorsets: _heatMapColors,
      initDate: dateRange.start,
      flexible: true,
      colorMode: ColorMode.color,
      colorTipCount: 5,
      colorTipSize: 13,
      monthFontSize: 18,
    );
  }



  Widget yearHeatmap(){
    return HeatMap(
      datasets: moodScores,
      colorsets: _heatMapColors,
      startDate: dateRange.start,
      endDate: dateRange.end,
      colorMode: ColorMode.color,
      size: 17,
      fontSize: 10,
      scrollable: true,
      showText: true,
      colorTipCount: 5,
      colorTipSize: 13,
    );
  }

  static const _heatMapColors = <int, Color>{
    1: Color(0xffA72C2C),
    2: Color(0xffC78B31),
    3: Color(0xffDCC678),
    4: Color(0xffA6AC5A),
    5: Color(0xff49A3BF)
  };
}
