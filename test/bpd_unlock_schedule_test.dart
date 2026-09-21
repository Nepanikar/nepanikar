import 'package:flutter_test/flutter_test.dart';
import 'package:nepanikar/services/db/bpd/bpd_unlock_schedule.dart';

/// The pilot's pacing is arithmetic, and arithmetic is where off-by-one lives.
///
/// Everything here is a pure function of the cohort start date, so it can be
/// checked without a database, a device or a seven-week wait — which matters,
/// because the alternative way to find a mistake in this file is for a
/// participant to be shown the wrong lesson on the wrong day.
void main() {
  group('cohort calendar', () {
    test('the programme opens on Monday 21 September 2026', () {
      expect(bpdProgrammeStartDate, DateTime(2026, 9, 21));
      expect(bpdProgrammeStartDate.weekday, DateTime.monday);
      expect(bpdDayUnlockDate(1, 1), DateTime(2026, 9, 21));
    });

    test('every one of the 49 lessons lands on its own consecutive day', () {
      final dates = <DateTime>[
        for (var week = 1; week <= 7; week++)
          for (var day = 1; day <= 7; day++) bpdDayUnlockDate(week, day),
      ];

      expect(dates, hasLength(49));
      expect(dates.toSet(), hasLength(49), reason: 'two lessons share a day');

      for (var i = 1; i < dates.length; i++) {
        expect(dates[i].difference(dates[i - 1]).inDays, 1, reason: 'gap before lesson ${i + 1}');
      }
    });

    test('weeks run straight on from each other, with no seam', () {
      // The bug this guards against is a week restarting its own count: week 2
      // day 1 has to be the day after week 1 day 7, not seven days after
      // week 1 day 1.
      for (var week = 1; week < 7; week++) {
        expect(bpdDayUnlockDate(week + 1, 1).difference(bpdDayUnlockDate(week, 7)).inDays, 1);
      }
      expect(bpdWeekUnlockDate(1), DateTime(2026, 9, 21));
      expect(bpdWeekUnlockDate(7), DateTime(2026, 11, 2));
    });

    test('every week starts on a Monday', () {
      for (var week = 1; week <= 7; week++) {
        expect(bpdWeekUnlockDate(week).weekday, DateTime.monday, reason: 'week $week');
      }
    });

    test('the last lesson is seven weeks in', () {
      expect(bpdDayIndex(7, 7), 48);
      expect(bpdDayUnlockDate(7, 7), DateTime(2026, 11, 8));
    });

    test('unlock dates are midnight, so a lesson opens on the day it says', () {
      for (var week = 1; week <= 7; week++) {
        for (var day = 1; day <= 7; day++) {
          final date = bpdDayUnlockDate(week, day);
          expect(date.hour, 0);
          expect(date.minute, 0);
          expect(date.second, 0);
        }
      }
    });
  });

  group('formatBpdUnlockDate', () {
    test('uses the Czech genitive month, not the nominative or Slovak', () {
      // Regression: the day list used to print "22. September" from a Slovak
      // month table of its own.
      expect(formatBpdUnlockDate(DateTime(2026, 9, 22)), startsWith('22. září'));
      expect(formatBpdUnlockDate(DateTime(2026, 10, 5)), startsWith('5. října'));
      expect(formatBpdUnlockDate(DateTime(2026, 1, 3)), startsWith('3. ledna'));
      expect(formatBpdUnlockDate(DateTime(2026, 5, 9)), startsWith('9. května'));
    });

    test('says how far off the day is', () {
      final today = startOfDay(DateTime.now());
      expect(formatBpdUnlockDate(today), contains('(dnes)'));
      expect(formatBpdUnlockDate(today.add(const Duration(days: 1))), contains('(zítra)'));
      expect(formatBpdUnlockDate(today.add(const Duration(days: 3))), contains('(za 3 dny)'));
      // Czech switches counted nouns after four.
      expect(formatBpdUnlockDate(today.add(const Duration(days: 9))), contains('(za 9 dní)'));
    });

    test('a date already past reads as today rather than going negative', () {
      final yesterday = startOfDay(DateTime.now()).subtract(const Duration(days: 1));
      expect(formatBpdUnlockDate(yesterday), contains('(dnes)'));
    });
  });

  group('unlockDayAfter', () {
    test('floors to midnight whatever time of day it is given', () {
      final lateEvening = DateTime(2026, 9, 21, 23, 50);
      expect(unlockDayAfter(lateEvening, 1), DateTime(2026, 9, 22));
      expect(unlockDayAfter(lateEvening, 0), DateTime(2026, 9, 21));
    });

    test('crossing the October DST change still lands on midnight', () {
      // Adding a Duration across the boundary is 23 or 25 hours, which is what
      // the flooring in this helper exists to absorb.
      final beforeDst = DateTime(2026, 10, 24);
      final after = unlockDayAfter(beforeDst, 3);
      expect(after.hour, 0);
      expect(after.day, 27);
      expect(after.month, 10);
    });
  });
}
