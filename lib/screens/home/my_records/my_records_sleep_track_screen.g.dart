// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_records_sleep_track_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$myRecordsSleepTrackRoute];

RouteBase get $myRecordsSleepTrackRoute => GoRouteData.$route(
  path: '/home/my-records/sleep-track',
  factory: $MyRecordsSleepTrackRoute._fromState,
);

mixin $MyRecordsSleepTrackRoute on GoRouteData {
  static MyRecordsSleepTrackRoute _fromState(GoRouterState state) =>
      const MyRecordsSleepTrackRoute();

  @override
  String get location => GoRouteData.$location('/home/my-records/sleep-track');

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
