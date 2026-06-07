// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_list_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$testListScreenRoute];

RouteBase get $testListScreenRoute => GoRouteData.$route(
  path: '/home/my-records/tests',
  factory: $TestListScreenRoute._fromState,
);

mixin $TestListScreenRoute on GoRouteData {
  static TestListScreenRoute _fromState(GoRouterState state) =>
      const TestListScreenRoute();

  @override
  String get location => GoRouteData.$location('/home/my-records/tests');

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
