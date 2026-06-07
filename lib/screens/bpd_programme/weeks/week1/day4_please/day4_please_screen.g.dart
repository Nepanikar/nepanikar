// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day4_please_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$day4PleaseScreenRoute];

RouteBase get $day4PleaseScreenRoute => GoRouteData.$route(
  path: '/bpd-programme/week/1/day/4',
  factory: $Day4PleaseScreenRoute._fromState,
);

mixin $Day4PleaseScreenRoute on GoRouteData {
  static Day4PleaseScreenRoute _fromState(GoRouterState state) =>
      const Day4PleaseScreenRoute();

  @override
  String get location => GoRouteData.$location('/bpd-programme/week/1/day/4');

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
