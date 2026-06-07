// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self_harm_plan_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$selfHarmPlanRoute];

RouteBase get $selfHarmPlanRoute => GoRouteData.$route(
  path: '/home/self-harm/plan',
  factory: $SelfHarmPlanRoute._fromState,
);

mixin $SelfHarmPlanRoute on GoRouteData {
  static SelfHarmPlanRoute _fromState(GoRouterState state) =>
      const SelfHarmPlanRoute();

  @override
  String get location => GoRouteData.$location('/home/self-harm/plan');

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
