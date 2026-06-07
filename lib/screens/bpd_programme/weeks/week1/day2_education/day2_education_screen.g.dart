// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day2_education_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$day2EducationScreenRoute];

RouteBase get $day2EducationScreenRoute => GoRouteData.$route(
  path: '/bpd-programme/week/1/day/2',
  factory: $Day2EducationScreenRoute._fromState,
);

mixin $Day2EducationScreenRoute on GoRouteData {
  static Day2EducationScreenRoute _fromState(GoRouterState state) =>
      const Day2EducationScreenRoute();

  @override
  String get location => GoRouteData.$location('/bpd-programme/week/1/day/2');

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
