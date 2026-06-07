// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_records_diary_edit_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$myRecordsDiaryEditRoute];

RouteBase get $myRecordsDiaryEditRoute => GoRouteData.$route(
  path: '/home/my-records/diary/edit',
  factory: $MyRecordsDiaryEditRoute._fromState,
);

mixin $MyRecordsDiaryEditRoute on GoRouteData {
  static MyRecordsDiaryEditRoute _fromState(GoRouterState state) =>
      const MyRecordsDiaryEditRoute();

  @override
  String get location => GoRouteData.$location('/home/my-records/diary/edit');

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
