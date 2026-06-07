// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eating_disorder_tips_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$eatingDisorderTipsRoute];

RouteBase get $eatingDisorderTipsRoute => GoRouteData.$route(
  path: '/home/eating-disorder/tips',
  factory: $EatingDisorderTipsRoute._fromState,
);

mixin $EatingDisorderTipsRoute on GoRouteData {
  static EatingDisorderTipsRoute _fromState(GoRouterState state) =>
      const EatingDisorderTipsRoute();

  @override
  String get location => GoRouteData.$location('/home/eating-disorder/tips');

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
