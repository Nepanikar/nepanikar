// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_records_diary_detail_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$myRecordsDiaryDetailRoute];

RouteBase get $myRecordsDiaryDetailRoute => GoRouteData.$route(
  path: '/home/my-records/diary/detail',
  factory: $MyRecordsDiaryDetailRoute._fromState,
);

mixin $MyRecordsDiaryDetailRoute on GoRouteData {
  static MyRecordsDiaryDetailRoute _fromState(GoRouterState state) =>
      const MyRecordsDiaryDetailRoute();

  @override
  String get location => GoRouteData.$location('/home/my-records/diary/detail');

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
