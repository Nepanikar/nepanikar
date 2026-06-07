// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balloons_game_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$balloonsGameRoute];

RouteBase get $balloonsGameRoute => GoRouteData.$route(
  path: '/games/balloons/',
  factory: $BalloonsGameRoute._fromState,
);

mixin $BalloonsGameRoute on GoRouteData {
  static BalloonsGameRoute _fromState(GoRouterState state) =>
      const BalloonsGameRoute();

  @override
  String get location => GoRouteData.$location('/games/balloons/');

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
