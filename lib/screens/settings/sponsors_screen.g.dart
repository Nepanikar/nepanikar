// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsors_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$sponsorsRoute];

RouteBase get $sponsorsRoute => GoRouteData.$route(
  path: '/settings/sponsors',
  factory: $SponsorsRoute._fromState,
);

mixin $SponsorsRoute on GoRouteData {
  static SponsorsRoute _fromState(GoRouterState state) => const SponsorsRoute();

  @override
  String get location => GoRouteData.$location('/settings/sponsors');

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
