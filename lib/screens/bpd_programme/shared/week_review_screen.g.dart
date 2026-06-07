// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week_review_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$weekReviewScreenRoute];

RouteBase get $weekReviewScreenRoute => GoRouteData.$route(
  path: '/bpd-programme/week/:weekNumber/review',
  factory: $WeekReviewScreenRoute._fromState,
);

mixin $WeekReviewScreenRoute on GoRouteData {
  static WeekReviewScreenRoute _fromState(GoRouterState state) =>
      WeekReviewScreenRoute(
        weekNumber: int.parse(state.pathParameters['weekNumber']!),
      );

  WeekReviewScreenRoute get _self => this as WeekReviewScreenRoute;

  @override
  String get location => GoRouteData.$location(
    '/bpd-programme/week/${Uri.encodeComponent(_self.weekNumber.toString())}/review',
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
