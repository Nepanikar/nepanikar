// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'depression_activity_plan_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$depressionActivityPlanRoute];

RouteBase get $depressionActivityPlanRoute => GoRouteData.$route(
  path: '/home/depression/activity-plan',
  factory: $DepressionActivityPlanRoute._fromState,
);

mixin $DepressionActivityPlanRoute on GoRouteData {
  static DepressionActivityPlanRoute _fromState(GoRouterState state) =>
      const DepressionActivityPlanRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/depression/activity-plan');

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
