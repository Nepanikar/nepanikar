// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_records_diary_add_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$myRecordsDiaryAddRoute];

RouteBase get $myRecordsDiaryAddRoute => GoRouteData.$route(
  path: '/home/my-records/diary/add',
  factory: $MyRecordsDiaryAddRoute._fromState,
);

mixin $MyRecordsDiaryAddRoute on GoRouteData {
  static MyRecordsDiaryAddRoute _fromState(GoRouterState state) =>
      const MyRecordsDiaryAddRoute();

  @override
  String get location => GoRouteData.$location('/home/my-records/diary/add');

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
