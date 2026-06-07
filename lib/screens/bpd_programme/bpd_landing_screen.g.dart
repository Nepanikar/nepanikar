// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bpd_landing_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$bpdLandingScreenRoute];

RouteBase get $bpdLandingScreenRoute => GoRouteData.$route(
  path: '/bpd-programme/landing',
  factory: $BpdLandingScreenRoute._fromState,
);

mixin $BpdLandingScreenRoute on GoRouteData {
  static BpdLandingScreenRoute _fromState(GoRouterState state) =>
      const BpdLandingScreenRoute();

  @override
  String get location => GoRouteData.$location('/bpd-programme/landing');

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
