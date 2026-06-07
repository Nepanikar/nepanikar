// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_goal_form_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$smartGoalFormScreenRoute];

RouteBase get $smartGoalFormScreenRoute => GoRouteData.$route(
  path: '/bpd-programme/smart/new-goal',
  factory: $SmartGoalFormScreenRoute._fromState,
);

mixin $SmartGoalFormScreenRoute on GoRouteData {
  static SmartGoalFormScreenRoute _fromState(GoRouterState state) =>
      const SmartGoalFormScreenRoute();

  @override
  String get location => GoRouteData.$location('/bpd-programme/smart/new-goal');

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
