// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_records_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$myRecordsRoute];

RouteBase get $myRecordsRoute => GoRouteData.$route(
  path: '/home/my-records',
  factory: $MyRecordsRoute._fromState,
);

mixin $MyRecordsRoute on GoRouteData {
  static MyRecordsRoute _fromState(GoRouterState state) =>
      const MyRecordsRoute();

  @override
  String get location => GoRouteData.$location('/home/my-records');

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
