// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_detail_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$testDetailScreenRoute];

RouteBase get $testDetailScreenRoute => GoRouteData.$route(
  path: '/home/my-records/tests/test-detail/:testId',
  factory: $TestDetailScreenRoute._fromState,
);

mixin $TestDetailScreenRoute on GoRouteData {
  static TestDetailScreenRoute _fromState(GoRouterState state) =>
      TestDetailScreenRoute(testId: state.pathParameters['testId']!);

  TestDetailScreenRoute get _self => this as TestDetailScreenRoute;

  @override
  String get location => GoRouteData.$location(
    '/home/my-records/tests/test-detail/${Uri.encodeComponent(_self.testId)}',
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
