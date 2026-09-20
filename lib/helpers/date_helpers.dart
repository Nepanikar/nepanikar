DateTime getNowDateTimeLocal() => DateTime.now();

/// Returns [DateTime] without time (in UTC).
DateTime getNowDateUtc() {
  final datetime = DateTime.now();
  return DateTime.utc(datetime.year, datetime.month, datetime.day);
}

extension DateTimeExt on DateTime {
  DateTime toDate() => isUtc ? DateTime.utc(year, month, day) : DateTime(year, month, day);

  DateTime toUtcDate() => DateTime.utc(year, month, day);
}

class CustomDateFormats {
  static const String datePickerLabel = 'd. MMM';
}
