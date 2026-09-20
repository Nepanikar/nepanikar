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
/// Floors *after* adding rather than adding to a floored date: adding a
/// `Duration` crosses a DST boundary as 23 or 25 hours, which would otherwise
/// leave the result an hour either side of midnight.
DateTime unlockDayAfter(DateTime from, int days) => startOfDay(from.add(Duration(days: days)));

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
