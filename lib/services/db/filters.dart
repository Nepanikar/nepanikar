import 'package:sembast/sembast.dart';

mixin CustomFilters {
  Filter getDateFilter(DateTime date, {String key = 'date'}) =>
      Filter.equals(key, date.toIso8601String());
}
