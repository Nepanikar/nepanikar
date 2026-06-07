// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bpd_week_detail_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$bpdWeekDetailScreenRoute];

RouteBase get $bpdWeekDetailScreenRoute => GoRouteData.$route(
  path: '/bpd-programme/week/:weekNumber',
  factory: $BpdWeekDetailScreenRoute._fromState,
);

mixin $BpdWeekDetailScreenRoute on GoRouteData {
  static BpdWeekDetailScreenRoute _fromState(GoRouterState state) =>
      BpdWeekDetailScreenRoute(
        weekNumber: int.parse(state.pathParameters['weekNumber']!),
      );

  BpdWeekDetailScreenRoute get _self => this as BpdWeekDetailScreenRoute;

  @override
  String get location => GoRouteData.$location(
    '/bpd-programme/week/${Uri.encodeComponent(_self.weekNumber.toString())}',
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
