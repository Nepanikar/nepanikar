// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bpd_programme_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$bpdProgrammeScreenRoute];

RouteBase get $bpdProgrammeScreenRoute => GoRouteData.$route(
  path: '/bpd-programme',
  factory: $BpdProgrammeScreenRoute._fromState,
);

mixin $BpdProgrammeScreenRoute on GoRouteData {
  static BpdProgrammeScreenRoute _fromState(GoRouterState state) =>
      const BpdProgrammeScreenRoute();

  @override
  String get location => GoRouteData.$location('/bpd-programme');

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
