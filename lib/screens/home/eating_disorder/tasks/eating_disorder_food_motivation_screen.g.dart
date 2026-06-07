// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eating_disorder_food_motivation_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$eatingDisorderFoodMotivationRoute];

RouteBase get $eatingDisorderFoodMotivationRoute => GoRouteData.$route(
  path: '/home/eating-disorder/tasks/food-motivation',
  factory: $EatingDisorderFoodMotivationRoute._fromState,
);

mixin $EatingDisorderFoodMotivationRoute on GoRouteData {
  static EatingDisorderFoodMotivationRoute _fromState(GoRouterState state) =>
      const EatingDisorderFoodMotivationRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/eating-disorder/tasks/food-motivation');

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
