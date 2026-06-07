// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suicidal_thoughts_plan_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$suicidalThoughtsPlanRoute];

RouteBase get $suicidalThoughtsPlanRoute => GoRouteData.$route(
  path: '/home/suicidal-thoughts/plan',
  factory: $SuicidalThoughtsPlanRoute._fromState,
);

mixin $SuicidalThoughtsPlanRoute on GoRouteData {
  static SuicidalThoughtsPlanRoute _fromState(GoRouterState state) =>
      const SuicidalThoughtsPlanRoute();

  @override
  String get location => GoRouteData.$location('/home/suicidal-thoughts/plan');

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
