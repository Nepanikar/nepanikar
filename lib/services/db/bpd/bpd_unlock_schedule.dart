/// When the programme opens the next day or week.
///
/// Unlocks land at **midnight local time**, not at the clock time the user
/// happened to press "Začít svou cestu". Someone who starts at 23:50 would
/// otherwise wait until 23:50 the following evening for day 2 — the app would
/// be holding a lesson back for almost a whole day the user experiences as
/// "tomorrow".
library;

/// Midnight at the start of [date], in local time.
DateTime startOfDay(DateTime date) => DateTime(date.year, date.month, date.day);

/// Midnight [days] calendar days after [from].
///
/// Counts in calendar days, not in hours. `add(Duration(days: n))` adds exactly
/// 24n hours, and the day the clocks go back is 23 — so on 25 October 2026 that
/// arithmetic slid a day backwards and every lesson after it landed one day
/// early. Weeks 6 and 7 of the pilot would have opened on a Sunday.
///
/// `DateTime` normalises an out-of-range day field, so this stays on the
/// calendar and stays at local midnight through any offset change.
DateTime unlockDayAfter(DateTime from, int days) =>
    DateTime(from.year, from.month, from.day + days);

/// The day the pilot cohort starts: Monday 21 September 2026.
///
/// Fixed for everyone rather than counted from each person's first tap, because
/// this is one cohort in one study — the researcher supports them together, and
/// she needs "everybody is on day 9 today" to be a true sentence.
///
/// The cost is that someone who installs the app late finds several days
/// already open. The sequence rule (see [BpdDaysDao.firstUnfinishedDayBefore])
/// keeps them in order, and the exit questionnaire asks how many lessons they
/// actually went through, so a late start shows up in the adherence figures
/// rather than being hidden by them.
///
/// Not `const`: `DateTime` has no const constructor.
DateTime get bpdProgrammeStartDate => DateTime(2026, 9, 21);

/// Days into the programme that week [weekNumber], day [dayNumber] sits at.
///
/// One lesson per calendar day, straight through the weeks: week 1 day 1 is
/// day 0, week 2 day 1 is day 7.
int bpdDayIndex(int weekNumber, int dayNumber) => (weekNumber - 1) * 7 + (dayNumber - 1);

/// Midnight of the day a given lesson opens.
DateTime bpdDayUnlockDate(int weekNumber, int dayNumber) =>
    unlockDayAfter(bpdProgrammeStartDate, bpdDayIndex(weekNumber, dayNumber));

/// Midnight of the day a week's first lesson opens.
DateTime bpdWeekUnlockDate(int weekNumber) => bpdDayUnlockDate(weekNumber, 1);

/// Czech month names in the genitive, which is the case "21. září" needs.
const _czechMonthsGenitive = <String>[
  'ledna',
  'února',
  'března',
  'dubna',
  'května',
  'června',
  'července',
  'srpna',
  'září',
  'října',
  'listopadu',
  'prosince',
];

/// "21. září (zítra)" — the date plus how far off it is.
///
/// One implementation for the whole programme. There were two, and the one on
/// the day list was written in Slovak ("Odomkne sa 22. September"), which is
/// the kind of thing that survives precisely because it is duplicated.
///
/// The clock time is deliberately left out: lessons open at midnight, so an
/// hour on the label only suggests there is one worth waiting for.
String formatBpdUnlockDate(DateTime date) {
  final now = DateTime.now();
  final days = startOfDay(date).difference(startOfDay(now)).inDays;

  final String relative;
  if (days <= 0) {
    relative = 'dnes';
  } else if (days == 1) {
    relative = 'zítra';
  } else if (days <= 4) {
    relative = 'za $days dny';
  } else {
    relative = 'za $days dní';
  }

  return '${date.day}. ${_czechMonthsGenitive[date.month - 1]} ($relative)';
}
