// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_records_journal_records_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$myRecordsJournalRecordsRoute];

RouteBase get $myRecordsJournalRecordsRoute => GoRouteData.$route(
  path: '/home/my-records/journal',
  factory: $MyRecordsJournalRecordsRoute._fromState,
);

mixin $MyRecordsJournalRecordsRoute on GoRouteData {
  static MyRecordsJournalRecordsRoute _fromState(GoRouterState state) =>
      const MyRecordsJournalRecordsRoute();

  @override
  String get location => GoRouteData.$location('/home/my-records/journal');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
