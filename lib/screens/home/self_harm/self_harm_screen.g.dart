// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self_harm_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$selfHarmRoute];

RouteBase get $selfHarmRoute => GoRouteData.$route(
  path: '/home/self-harm',
  factory: $SelfHarmRoute._fromState,
);

mixin $SelfHarmRoute on GoRouteData {
  static SelfHarmRoute _fromState(GoRouterState state) => const SelfHarmRoute();

  @override
  String get location => GoRouteData.$location('/home/self-harm');

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
