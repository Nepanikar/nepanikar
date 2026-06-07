// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relaxations_list_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$relaxationsListRoute];

RouteBase get $relaxationsListRoute => GoRouteData.$route(
  path: '/games/relaxation-list',
  factory: $RelaxationsListRoute._fromState,
);

mixin $RelaxationsListRoute on GoRouteData {
  static RelaxationsListRoute _fromState(GoRouterState state) =>
      const RelaxationsListRoute();

  @override
  String get location => GoRouteData.$location('/games/relaxation-list');

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
