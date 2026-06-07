// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_plan_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$mealPlanRoute];

RouteBase get $mealPlanRoute => GoRouteData.$route(
  path: '/home/eating-disorder/meal-plan',
  factory: $MealPlanRoute._fromState,
);

mixin $MealPlanRoute on GoRouteData {
  static MealPlanRoute _fromState(GoRouterState state) => const MealPlanRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/eating-disorder/meal-plan');

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
