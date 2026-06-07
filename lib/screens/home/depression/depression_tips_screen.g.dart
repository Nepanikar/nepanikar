// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'depression_tips_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$depressionTipsAppRoute];

RouteBase get $depressionTipsAppRoute => GoRouteData.$route(
  path: '/home/depression/tips',
  factory: $DepressionTipsAppRoute._fromState,
);

mixin $DepressionTipsAppRoute on GoRouteData {
  static DepressionTipsAppRoute _fromState(GoRouterState state) =>
      const DepressionTipsAppRoute();

  @override
  String get location => GoRouteData.$location('/home/depression/tips');

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
