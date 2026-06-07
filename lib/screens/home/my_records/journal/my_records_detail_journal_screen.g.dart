// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_records_detail_journal_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$myRecordsJournalDetailRoute];

RouteBase get $myRecordsJournalDetailRoute => GoRouteData.$route(
  path: '/home/my-records/journal-detail',
  factory: $MyRecordsJournalDetailRoute._fromState,
);

mixin $MyRecordsJournalDetailRoute on GoRouteData {
  static MyRecordsJournalDetailRoute _fromState(GoRouterState state) =>
      const MyRecordsJournalDetailRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/my-records/journal-detail');

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
