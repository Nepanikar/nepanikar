// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eating_disorder_tips_overeat.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$eatingDisorderTipsOvereatAppRoute];

RouteBase get $eatingDisorderTipsOvereatAppRoute => GoRouteData.$route(
  path: '/home/eating-disorder/tips/overeat',
  factory: $EatingDisorderTipsOvereatAppRoute._fromState,
);

mixin $EatingDisorderTipsOvereatAppRoute on GoRouteData {
  static EatingDisorderTipsOvereatAppRoute _fromState(GoRouterState state) =>
      const EatingDisorderTipsOvereatAppRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/eating-disorder/tips/overeat');

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
