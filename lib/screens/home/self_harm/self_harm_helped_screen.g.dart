// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self_harm_helped_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$selfHarmHelpedRoute];

RouteBase get $selfHarmHelpedRoute => GoRouteData.$route(
  path: '/home/self-harm/helped',
  factory: $SelfHarmHelpedRoute._fromState,
);

mixin $SelfHarmHelpedRoute on GoRouteData {
  static SelfHarmHelpedRoute _fromState(GoRouterState state) =>
      const SelfHarmHelpedRoute();

  @override
  String get location => GoRouteData.$location('/home/self-harm/helped');

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
