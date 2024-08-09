import 'package:flutter/material.dart';
import 'package:nepanikar/app/l10n/ext.dart';

import 'package:nepanikar/providers/mood_chart_filter_provider.dart';



enum HeatmapFilter{
  month,
  year;

  static HeatmapFilter initial = HeatmapFilter.month;

  String getLabel(BuildContext context) {
    switch (this) {
      case HeatmapFilter.month:
        return context.l10n.month;
      case HeatmapFilter.year:
        return context.l10n.year;
    }
  }

  DateTimeRange getDateTimeRange({DateRangeSwitch? dateRangeSwitch, DateTimeRange? customDateRange}) {
    final now = DateTime.now();
    DateTime start;
    DateTime end;

    DateTimeRange shiftMonths(DateTime startDate, int months) {
      final adjustedStart = DateTime(startDate.year, startDate.month + months);
      final endOfMonth = DateTime(adjustedStart.year, adjustedStart.month + 1, 0); // Correctly finds the end of the target month

      return DateTimeRange(
        start: adjustedStart,
        end: endOfMonth,
      );
    }

    if (customDateRange == null && dateRangeSwitch == null) {
      // Initialization logic for the current period
      switch (this) {
        case HeatmapFilter.month:
          start = DateTime(now.year, now.month, 1);
          end = DateTime(now.year, now.month + 1, 0);
          break;
        case HeatmapFilter.year:
          start = DateTime(now.year, 1, 1);
          end = DateTime(now.year, 12, 31);
          break;
        default:
          start = now;
          end = now;
      }
    } else if (customDateRange != null) {
      // Use the custom date range if provided
      start = customDateRange.start;
      end = customDateRange.end;
    } else {

      start = now;
      end = now;
    }

    switch (this) {
      case HeatmapFilter.month:
        if ( dateRangeSwitch == DateRangeSwitch.previous) {
          return shiftMonths(start, -1); // Shift 1 month back for previous or initialize
        }
        else if(dateRangeSwitch == null){
          return DateTimeRange(start: start, end: end);
        }
        else {
          return shiftMonths(end, 1); // Shift 1 month forward for next
        }
      case HeatmapFilter.year:
        if (dateRangeSwitch == DateRangeSwitch.previous) {
          return shiftMonths(start, -12); // Shift 12 months back for previous or initialize
        }
        else if(dateRangeSwitch == null){
          return DateTimeRange(start: start, end: end);
        }
        else {
          return shiftMonths(end, 12); // Shift 12 months forward for next
        }
      default:
        return DateTimeRange(start: start, end: end);
    }
  }
}

class MoodHeatmapFilterProvider extends ChangeNotifier{
  MoodHeatmapFilterProvider()
      : _activeFilter = HeatmapFilter.initial,
        _activeDateRange = HeatmapFilter.initial.getDateTimeRange();

  HeatmapFilter _activeFilter;
  HeatmapFilter get activeFilter => _activeFilter;

  DateTimeRange _activeDateRange;
  DateTimeRange get activeDateRange => _activeDateRange;

  void setFilter(HeatmapFilter filter) {
    _activeFilter = filter;
    _activeDateRange = filter.getDateTimeRange();
    notifyListeners();
  }

  void setActiveDateRange(DateTimeRange dateRange) {
    _activeDateRange = dateRange;
    notifyListeners();
  }

  void shiftDateRange(DateRangeSwitch direction) {
    _activeDateRange = _activeFilter.getDateTimeRange(dateRangeSwitch: direction, customDateRange: _activeDateRange);
    notifyListeners();
  }

  bool get canShiftDateRangeNext {
    final now = DateTime.now();
    final nextRange = _activeFilter.getDateTimeRange(dateRangeSwitch: DateRangeSwitch.next, customDateRange: _activeDateRange);
    return nextRange.start.isBefore(now) || nextRange.start.isAtSameMomentAs(now);
  }
}

