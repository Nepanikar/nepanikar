// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bpd_weeks_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$bpdWeeksScreenRoute];

RouteBase get $bpdWeeksScreenRoute => GoRouteData.$route(
  path: '/bpd-programme/weeks',
  factory: $BpdWeeksScreenRoute._fromState,
);

mixin $BpdWeeksScreenRoute on GoRouteData {
  static BpdWeeksScreenRoute _fromState(GoRouterState state) =>
      const BpdWeeksScreenRoute();

  @override
  String get location => GoRouteData.$location('/bpd-programme/weeks');

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
