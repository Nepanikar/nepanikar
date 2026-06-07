// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'depression_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$depressionRoute];

RouteBase get $depressionRoute => GoRouteData.$route(
  path: '/home/depression',
  factory: $DepressionRoute._fromState,
);

mixin $DepressionRoute on GoRouteData {
  static DepressionRoute _fromState(GoRouterState state) =>
      const DepressionRoute();

  @override
  String get location => GoRouteData.$location('/home/depression');

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
