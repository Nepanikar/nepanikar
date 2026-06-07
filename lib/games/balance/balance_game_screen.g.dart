// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_game_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$balanceGameRoute];

RouteBase get $balanceGameRoute => GoRouteData.$route(
  path: '/games/balance/',
  factory: $BalanceGameRoute._fromState,
);

mixin $BalanceGameRoute on GoRouteData {
  static BalanceGameRoute _fromState(GoRouterState state) =>
      const BalanceGameRoute();

  @override
  String get location => GoRouteData.$location('/games/balance/');

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
