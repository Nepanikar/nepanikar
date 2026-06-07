// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anxiety_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$anxietyAppRoute];

RouteBase get $anxietyAppRoute => GoRouteData.$route(
  path: '/home/anxiety',
  factory: $AnxietyAppRoute._fromState,
);

mixin $AnxietyAppRoute on GoRouteData {
  static AnxietyAppRoute _fromState(GoRouterState state) =>
      const AnxietyAppRoute();

  @override
  String get location => GoRouteData.$location('/home/anxiety');

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
