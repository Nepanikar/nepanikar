// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eating_disorder_tasks_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$eatingDisorderTasksRoute];

RouteBase get $eatingDisorderTasksRoute => GoRouteData.$route(
  path: '/home/eating-disorder/tasks',
  factory: $EatingDisorderTasksRoute._fromState,
);

mixin $EatingDisorderTasksRoute on GoRouteData {
  static EatingDisorderTasksRoute _fromState(GoRouterState state) =>
      const EatingDisorderTasksRoute();

  @override
  String get location => GoRouteData.$location('/home/eating-disorder/tasks');

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
