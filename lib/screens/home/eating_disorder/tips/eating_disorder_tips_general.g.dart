// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eating_disorder_tips_general.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$eatingDisorderTipsGeneralAppRoute];

RouteBase get $eatingDisorderTipsGeneralAppRoute => GoRouteData.$route(
  path: '/home/eating-disorder/tips/general',
  factory: $EatingDisorderTipsGeneralAppRoute._fromState,
);

mixin $EatingDisorderTipsGeneralAppRoute on GoRouteData {
  static EatingDisorderTipsGeneralAppRoute _fromState(GoRouterState state) =>
      const EatingDisorderTipsGeneralAppRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/eating-disorder/tips/general');

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
