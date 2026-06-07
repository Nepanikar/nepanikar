// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_education_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$smartEducationScreenRoute];

RouteBase get $smartEducationScreenRoute => GoRouteData.$route(
  path: '/bpd-programme/smart',
  factory: $SmartEducationScreenRoute._fromState,
);

mixin $SmartEducationScreenRoute on GoRouteData {
  static SmartEducationScreenRoute _fromState(GoRouterState state) =>
      const SmartEducationScreenRoute();

  @override
  String get location => GoRouteData.$location('/bpd-programme/smart');

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
