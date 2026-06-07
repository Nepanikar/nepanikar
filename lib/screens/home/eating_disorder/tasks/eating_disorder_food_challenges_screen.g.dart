// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eating_disorder_food_challenges_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$eatingDisorderFoodChallengesRoute];

RouteBase get $eatingDisorderFoodChallengesRoute => GoRouteData.$route(
  path: '/home/eating-disorder/tasks/food-challenges',
  factory: $EatingDisorderFoodChallengesRoute._fromState,
);

mixin $EatingDisorderFoodChallengesRoute on GoRouteData {
  static EatingDisorderFoodChallengesRoute _fromState(GoRouterState state) =>
      const EatingDisorderFoodChallengesRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/eating-disorder/tasks/food-challenges');

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
