// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eating_disorder_food_i_like_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$eatingDisorderFoodILikeRoute];

RouteBase get $eatingDisorderFoodILikeRoute => GoRouteData.$route(
  path: '/home/eating-disorder/tasks/food-i-like',
  factory: $EatingDisorderFoodILikeRoute._fromState,
);

mixin $EatingDisorderFoodILikeRoute on GoRouteData {
  static EatingDisorderFoodILikeRoute _fromState(GoRouterState state) =>
      const EatingDisorderFoodILikeRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/eating-disorder/tasks/food-i-like');

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
