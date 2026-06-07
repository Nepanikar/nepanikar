// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eating_disorder_samples_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$eatingDisorderSamplesRoute];

RouteBase get $eatingDisorderSamplesRoute => GoRouteData.$route(
  path: '/home/eating-disorder/samples',
  factory: $EatingDisorderSamplesRoute._fromState,
);

mixin $EatingDisorderSamplesRoute on GoRouteData {
  static EatingDisorderSamplesRoute _fromState(GoRouterState state) =>
      const EatingDisorderSamplesRoute();

  @override
  String get location => GoRouteData.$location('/home/eating-disorder/samples');

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
