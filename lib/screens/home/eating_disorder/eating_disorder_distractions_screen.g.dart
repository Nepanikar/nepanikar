// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eating_disorder_distractions_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$eatingDisorderDistractionsRoute];

RouteBase get $eatingDisorderDistractionsRoute => GoRouteData.$route(
  path: '/home/eating-disorder/distraction',
  factory: $EatingDisorderDistractionsRoute._fromState,
);

mixin $EatingDisorderDistractionsRoute on GoRouteData {
  static EatingDisorderDistractionsRoute _fromState(GoRouterState state) =>
      const EatingDisorderDistractionsRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/eating-disorder/distraction');

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
