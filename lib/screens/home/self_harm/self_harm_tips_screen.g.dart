// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self_harm_tips_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$selfHarmTipsRoute];

RouteBase get $selfHarmTipsRoute => GoRouteData.$route(
  path: '/home/self-harm/tips',
  factory: $SelfHarmTipsRoute._fromState,
);

mixin $SelfHarmTipsRoute on GoRouteData {
  static SelfHarmTipsRoute _fromState(GoRouterState state) =>
      const SelfHarmTipsRoute();

  @override
  String get location => GoRouteData.$location('/home/self-harm/tips');

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
