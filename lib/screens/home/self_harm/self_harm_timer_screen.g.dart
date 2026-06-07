// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self_harm_timer_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$selfHarmTimerRoute];

RouteBase get $selfHarmTimerRoute => GoRouteData.$route(
  path: '/home/self-harm/timer',
  factory: $SelfHarmTimerRoute._fromState,
);

mixin $SelfHarmTimerRoute on GoRouteData {
  static SelfHarmTimerRoute _fromState(GoRouterState state) =>
      const SelfHarmTimerRoute();

  @override
  String get location => GoRouteData.$location('/home/self-harm/timer');

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
