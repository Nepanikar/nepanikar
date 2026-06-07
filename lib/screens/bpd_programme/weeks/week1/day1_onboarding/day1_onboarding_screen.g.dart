// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day1_onboarding_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$day1OnboardingScreenRoute];

RouteBase get $day1OnboardingScreenRoute => GoRouteData.$route(
  path: '/bpd-programme/day-onboarding',
  factory: $Day1OnboardingScreenRoute._fromState,
);

mixin $Day1OnboardingScreenRoute on GoRouteData {
  static Day1OnboardingScreenRoute _fromState(GoRouterState state) =>
      const Day1OnboardingScreenRoute();

  @override
  String get location => GoRouteData.$location('/bpd-programme/day-onboarding');

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
