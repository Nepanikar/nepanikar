// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eating_disorder_food_creative_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$eatingDisorderFoodCreativeRoute];

RouteBase get $eatingDisorderFoodCreativeRoute => GoRouteData.$route(
  path: '/home/eating-disorder/tasks/food-creative',
  factory: $EatingDisorderFoodCreativeRoute._fromState,
);

mixin $EatingDisorderFoodCreativeRoute on GoRouteData {
  static EatingDisorderFoodCreativeRoute _fromState(GoRouterState state) =>
      const EatingDisorderFoodCreativeRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/eating-disorder/tasks/food-creative');

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
