// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suicidal_thoughts_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$suicidalThoughtsRoute];

RouteBase get $suicidalThoughtsRoute => GoRouteData.$route(
  path: '/home/suicidal-thoughts',
  factory: $SuicidalThoughtsRoute._fromState,
);

mixin $SuicidalThoughtsRoute on GoRouteData {
  static SuicidalThoughtsRoute _fromState(GoRouterState state) =>
      const SuicidalThoughtsRoute();

  @override
  String get location => GoRouteData.$location('/home/suicidal-thoughts');

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
