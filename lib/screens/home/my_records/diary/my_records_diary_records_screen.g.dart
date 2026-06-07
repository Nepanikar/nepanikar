// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_records_diary_records_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$myRecordsDiaryRecordsRoute];

RouteBase get $myRecordsDiaryRecordsRoute => GoRouteData.$route(
  path: '/home/my-records/diary',
  factory: $MyRecordsDiaryRecordsRoute._fromState,
);

mixin $MyRecordsDiaryRecordsRoute on GoRouteData {
  static MyRecordsDiaryRecordsRoute _fromState(GoRouterState state) =>
      const MyRecordsDiaryRecordsRoute();

  @override
  String get location => GoRouteData.$location('/home/my-records/diary');

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
