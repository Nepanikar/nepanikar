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
