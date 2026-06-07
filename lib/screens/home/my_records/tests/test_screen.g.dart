// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$testScreenRoute];

RouteBase get $testScreenRoute => GoRouteData.$route(
  path: '/home/my-records/tests/:testId',
  factory: $TestScreenRoute._fromState,
);

mixin $TestScreenRoute on GoRouteData {
  static TestScreenRoute _fromState(GoRouterState state) =>
      TestScreenRoute(testId: state.pathParameters['testId']!);

  TestScreenRoute get _self => this as TestScreenRoute;

  @override
  String get location => GoRouteData.$location(
    '/home/my-records/tests/${Uri.encodeComponent(_self.testId)}',
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
