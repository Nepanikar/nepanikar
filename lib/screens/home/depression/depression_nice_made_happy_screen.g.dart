// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'depression_nice_made_happy_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$depressionNiceMadeHappyRoute];

RouteBase get $depressionNiceMadeHappyRoute => GoRouteData.$route(
  path: '/home/depression/nice-made-happy',
  factory: $DepressionNiceMadeHappyRoute._fromState,
);

mixin $DepressionNiceMadeHappyRoute on GoRouteData {
  static DepressionNiceMadeHappyRoute _fromState(GoRouterState state) =>
      const DepressionNiceMadeHappyRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/depression/nice-made-happy');

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
