// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eating_disorder_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$eatingDisorderRoute];

RouteBase get $eatingDisorderRoute => GoRouteData.$route(
  path: '/home/eating-disorder',
  factory: $EatingDisorderRoute._fromState,
);

mixin $EatingDisorderRoute on GoRouteData {
  static EatingDisorderRoute _fromState(GoRouterState state) =>
      const EatingDisorderRoute();

  @override
  String get location => GoRouteData.$location('/home/eating-disorder');

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
