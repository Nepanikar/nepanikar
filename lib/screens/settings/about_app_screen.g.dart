// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_app_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$aboutAppRoute];

RouteBase get $aboutAppRoute => GoRouteData.$route(
  path: '/settings/about-app',
  factory: $AboutAppRoute._fromState,
);

mixin $AboutAppRoute on GoRouteData {
  static AboutAppRoute _fromState(GoRouterState state) => const AboutAppRoute();

  @override
  String get location => GoRouteData.$location('/settings/about-app');

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
