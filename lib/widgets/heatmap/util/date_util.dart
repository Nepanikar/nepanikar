import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateUtil {
  static const int DAYS_IN_WEEK = 7;

  static String mothLabels(int index, bool short, BuildContext context) {
    final locale = Localizations.localeOf(context).toString();
    if (index == 0 || index > 12) return '';
    final date = DateTime(2000, index);
    final text = DateFormat.MMMM(locale).format(date);
    if (short) {
      return text.substring(0, 3);
    } else {
      return text;
    }
  }

  static String weekDaysLabels(int index, BuildContext context) {
    final locale = Localizations.localeOf(context).toString();
    if (index == 0 || index > 7) return '';
    final date = DateTime(2000, 1, index);
    return DateFormat.E(locale).format(date);
  }

  /// Get start day of month.
  static DateTime startDayOfMonth(DateTime referenceDate) =>
      DateTime(referenceDate.year, referenceDate.month);

  /// Get last day of month.
  static DateTime endDayOfMonth(DateTime referenceDate) =>
      DateTime(referenceDate.year, referenceDate.month + 1, 0);

  /// Get exactly one year before of [referenceDate].
  static DateTime oneYearBefore(DateTime referenceDate) =>
      DateTime(referenceDate.year - 1, referenceDate.month, referenceDate.day);

  /// Separate [referenceDate]'s month to List of every weeks.
  static List<Map<DateTime, DateTime>> separatedMonth(DateTime referenceDate) {
    DateTime startDate = startDayOfMonth(referenceDate);
    DateTime endDate = DateTime(
      startDate.year,
      startDate.month,
      startDate.day + DAYS_IN_WEEK - startDate.weekday % DAYS_IN_WEEK - 1,
    );
    final DateTime finalDate = endDayOfMonth(referenceDate);
    final List<Map<DateTime, DateTime>> savedMonth = [];

    while (startDate.isBefore(finalDate) || startDate == finalDate) {
      savedMonth.add({startDate: endDate});
      startDate = changeDay(endDate, 1);
      endDate = changeDay(
        endDate,
        endDayOfMonth(endDate).day - startDate.day >= DAYS_IN_WEEK
            ? DAYS_IN_WEEK
            : endDayOfMonth(endDate).day - startDate.day + 1,
      );
    }
    return savedMonth;
  }

  /// Change day of [referenceDate].
  static DateTime changeDay(DateTime referenceDate, int dayCount) => DateTime(
    referenceDate.year,
    referenceDate.month,
    referenceDate.day + dayCount,
  );

  /// Change month of [referenceDate].
  static DateTime changeMonth(DateTime referenceDate, int monthCount) =>
      DateTime(
        referenceDate.year,
        referenceDate.month + monthCount,
        referenceDate.day,
      );

  //#region unused methods.

  // static int weekCount(final DateTime referenceDate) {
  //   return ((startDayOfMonth(referenceDate).weekday % DAYS_IN_WEEK +
  //               endDayOfMonth(referenceDate).day) /
  //           DAYS_IN_WEEK)
  //       .ceil();
  // }

  // static int weekPos(final DateTime referenceDate) =>
  //     (referenceDate.day +
  //         startDayOfMonth(referenceDate).weekday % DAYS_IN_WEEK) ~/
  //     DAYS_IN_WEEK;

  // static DateTime startDayOfWeek(final DateTime referenceDate) =>
  //     weekPos(referenceDate) == 0
  //         ? startDayOfMonth(referenceDate)
  //         : DateTime(referenceDate.year, referenceDate.month,
  //             referenceDate.day - referenceDate.weekday % DAYS_IN_WEEK);

  // static DateTime endDayOfWeek(final DateTime referenceDate) {
  //   return weekPos(referenceDate) != (weekCount(referenceDate) - 1)
  //       ? DateTime(referenceDate.year, referenceDate.month,
  //           referenceDate.day - referenceDate.weekday % DAYS_IN_WEEK + 6)
  //       : endDayOfMonth(referenceDate);
  // }

  // static DateTime changeWeek(final DateTime referenceDate, int weekCount) =>
  //     DateTime(referenceDate.year, referenceDate.month,
  //         1 + DAYS_IN_WEEK * weekCount);

  // static bool compareDate(final DateTime first, final DateTime second) =>
  //     first.year == second.year &&
  //     first.month == second.month &&
  //     first.day == second.day;

  // static bool isStartDayOfMonth(final DateTime referenceDate) =>
  //     compareDate(referenceDate, startDayOfMonth(referenceDate));

  //#endregion
}
