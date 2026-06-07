// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_pause_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$dayPauseScreenRoute];

RouteBase get $dayPauseScreenRoute => GoRouteData.$route(
  path: '/bpd-programme/week/:weekNumber/day/:dayNumber/pause',
  factory: $DayPauseScreenRoute._fromState,
);

mixin $DayPauseScreenRoute on GoRouteData {
  static DayPauseScreenRoute _fromState(GoRouterState state) =>
      DayPauseScreenRoute(
        weekNumber: int.parse(state.pathParameters['weekNumber']!),
        dayNumber: int.parse(state.pathParameters['dayNumber']!),
      );

  DayPauseScreenRoute get _self => this as DayPauseScreenRoute;

  @override
  String get location => GoRouteData.$location(
    '/bpd-programme/week/${Uri.encodeComponent(_self.weekNumber.toString())}/day/${Uri.encodeComponent(_self.dayNumber.toString())}/pause',
  );

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
