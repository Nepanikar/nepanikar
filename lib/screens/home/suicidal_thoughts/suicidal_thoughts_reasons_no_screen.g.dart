// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suicidal_thoughts_reasons_no_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$suicidalThoughtsReasonsNoRoute];

RouteBase get $suicidalThoughtsReasonsNoRoute => GoRouteData.$route(
  path: '/home/suicidal-thoughts/reasons-no',
  factory: $SuicidalThoughtsReasonsNoRoute._fromState,
);

mixin $SuicidalThoughtsReasonsNoRoute on GoRouteData {
  static SuicidalThoughtsReasonsNoRoute _fromState(GoRouterState state) =>
      const SuicidalThoughtsReasonsNoRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/suicidal-thoughts/reasons-no');

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
