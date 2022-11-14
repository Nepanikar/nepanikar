import 'package:flutter/material.dart';
import 'package:nepanikar/helpers/date_helpers.dart';
import 'package:nepanikar/services/db/relaxation/mood_track_model.dart';

enum DateRangeSwitch {
  previous,
  next;
}

enum ChartFilter {
  lastWeek,
  lastMonth,
  last3Months,
  last6Months,
  custom;

  static ChartFilter initial = ChartFilter.lastMonth;

  bool get isCustom => this == ChartFilter.custom;

  String getLabel(BuildContext context) {
    // TODO: l10n
    switch (this) {
      case ChartFilter.lastWeek:
        return 'Poslední týden';
      case ChartFilter.lastMonth:
        return 'Poslední měsíc';
      case ChartFilter.last3Months:
        return 'Poslední 3 měsíce';
      case ChartFilter.last6Months:
        return 'Posledních 6 měsíců';
      case ChartFilter.custom:
        return 'Vlastní';
    }
  }

  DateTimeRange? getDateTimeRange({
    DateRangeSwitch? dateRangeSwitch,
    DateTimeRange? customDateRange,
  }) {
    final now = getNowDateTimeLocal().toDate();
    final start = customDateRange?.start ?? now;
    final end = customDateRange?.end ?? now;

    DateTimeRange getShiftedMonthsRange(int monthsShift) {
      switch (dateRangeSwitch) {
        case null:
        case DateRangeSwitch.previous:
          return DateTimeRange(
            start: DateTime(start.year, start.month - monthsShift, start.day),
            end: DateTime(start.year, start.month, start.day),
          );
        case DateRangeSwitch.next:
          return DateTimeRange(
            start: DateTime(end.year, end.month, end.day),
            end: DateTime(end.year, end.month + monthsShift, end.day),
          );
      }
    }

    DateTimeRange getShiftedDaysRange(int daysShift) {
      switch (dateRangeSwitch) {
        case null:
        case DateRangeSwitch.previous:
          return DateTimeRange(
            start: DateTime(start.year, start.month, start.day - daysShift),
            end: DateTime(start.year, start.month, start.day),
          );
        case DateRangeSwitch.next:
          return DateTimeRange(
            start: DateTime(end.year, end.month, end.day),
            end: DateTime(end.year, end.month, end.day + daysShift),
          );
      }
    }

    switch (this) {
      case ChartFilter.lastWeek:
        return getShiftedDaysRange(7);
      case ChartFilter.lastMonth:
        return getShiftedMonthsRange(1);
      case ChartFilter.last3Months:
        return getShiftedMonthsRange(3);
      case ChartFilter.last6Months:
        return getShiftedMonthsRange(6);
      case ChartFilter.custom:
        if (customDateRange == null) return null;
        final daysShift = end.difference(start).inDays;
        return getShiftedDaysRange(daysShift);
    }
  }
}

class MoodChartFilterProvider extends ChangeNotifier {
  MoodChartFilterProvider()
      : _activeFilter = ChartFilter.initial,
        _customDateRange = ChartFilter.initial.getDateTimeRange();

  ChartFilter _activeFilter;

  ChartFilter get activeFilter => _activeFilter;

  DateTimeRange? _customDateRange;

  DateTimeRange? get customDateRange => _customDateRange;

  void setFilter(ChartFilter filter) {
    // If filter is same as active, except custom, set date range to default.
    if (filter == _activeFilter && filter.isCustom) return;
    _activeFilter = filter;
    _setDefaultDateRangeFromFilter(filter);
    notifyListeners();
  }

  void setCustomDateRange(DateTimeRange dateRange) {
    _customDateRange = dateRange;
    _activeFilter = ChartFilter.custom;
    notifyListeners();
  }

  void shiftDateRange(DateRangeSwitch dateRangeSwitch) {
    _customDateRange = _activeFilter.getDateTimeRange(
      dateRangeSwitch: dateRangeSwitch,
      customDateRange: _customDateRange,
    );
    notifyListeners();
  }

  bool get canShiftDateRangeNext {
    final nextRangeShift = _activeFilter.getDateTimeRange(
      dateRangeSwitch: DateRangeSwitch.next,
      customDateRange: _customDateRange,
    );
    return nextRangeShift != null && nextRangeShift.start.isBefore(getNowDateTimeLocal().toDate());
  }

  void _setDefaultDateRangeFromFilter(ChartFilter filter) {
    _customDateRange = filter.getDateTimeRange();
  }
}

extension MoodChartFilterExt on Iterable<MoodTrack> {
  Map<DateTime, MoodTrack?> filterByDateRange(DateTimeRange dateRange) {
    final allValuesMap = <DateTime, MoodTrack?>{
      for (final moodTrack in this) moodTrack.date: moodTrack,
    };

    final start = dateRange.start.toUtcDate();
    final end = dateRange.end.toUtcDate();
    final dateRangeValues = List.generate(
      end.difference(start).inDays + 1,
      (i) => start.add(Duration(days: i)),
    );

    // We use value found variable to remove empty values from the start of the mood track list.
    // So if user has mood track for 7.1.2021 and chooses last 7 days, we don't want to
    // show empty values for 1.1.2021 - 6.1.2021 cause the empty values in the
    // chart would align the value to the right.
    bool valueFound = false;
    final filteredMap = <DateTime, MoodTrack?>{};
    for (final date in dateRangeValues) {
      final dayMoodTrack = allValuesMap[date];
      if (dayMoodTrack != null) {
        valueFound = true;
      }
      if (valueFound) {
        filteredMap[date] = dayMoodTrack;
      }
    }

    return filteredMap;
  }
}
