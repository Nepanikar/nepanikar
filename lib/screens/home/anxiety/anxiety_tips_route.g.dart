// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anxiety_tips_route.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$anxietyTipsAppRoute];

RouteBase get $anxietyTipsAppRoute => GoRouteData.$route(
  path: '/home/anxiety/tips',
  factory: $AnxietyTipsAppRoute._fromState,
);

mixin $AnxietyTipsAppRoute on GoRouteData {
  static AnxietyTipsAppRoute _fromState(GoRouterState state) =>
      const AnxietyTipsAppRoute();

  @override
  String get location => GoRouteData.$location('/home/anxiety/tips');

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
