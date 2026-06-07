// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_result_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$testResultScreenRoute];

RouteBase get $testResultScreenRoute => GoRouteData.$route(
  path: '/home/my-records/test-result/:testId/:completedAt',
  factory: $TestResultScreenRoute._fromState,
);

mixin $TestResultScreenRoute on GoRouteData {
  static TestResultScreenRoute _fromState(GoRouterState state) =>
      TestResultScreenRoute(
        testId: state.pathParameters['testId']!,
        completedAt: int.parse(state.pathParameters['completedAt']!),
      );

  TestResultScreenRoute get _self => this as TestResultScreenRoute;

  @override
  String get location => GoRouteData.$location(
    '/home/my-records/test-result/${Uri.encodeComponent(_self.testId)}/${Uri.encodeComponent(_self.completedAt.toString())}',
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
