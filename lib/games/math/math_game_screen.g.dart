// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'math_game_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$mathGameRoute];

RouteBase get $mathGameRoute => GoRouteData.$route(
  path: '/games/math/',
  factory: $MathGameRoute._fromState,
);

mixin $MathGameRoute on GoRouteData {
  static MathGameRoute _fromState(GoRouterState state) => const MathGameRoute();

  @override
  String get location => GoRouteData.$location('/games/math/');

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
