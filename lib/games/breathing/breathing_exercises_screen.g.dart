// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breathing_exercises_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$breathingExercisesRoute];

RouteBase get $breathingExercisesRoute => GoRouteData.$route(
  path: '/games/breathing-list',
  factory: $BreathingExercisesRoute._fromState,
);

mixin $BreathingExercisesRoute on GoRouteData {
  static BreathingExercisesRoute _fromState(GoRouterState state) =>
      const BreathingExercisesRoute();

  @override
  String get location => GoRouteData.$location('/games/breathing-list');

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
