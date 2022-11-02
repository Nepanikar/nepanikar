/// Returns [DateTime] without time (in UTC).
DateTime getNowDateUtc() {
  final datetime = DateTime.now();
  return DateTime.utc(datetime.year, datetime.month, datetime.day);
}
