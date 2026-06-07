// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_counselling_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$emailCounsellingRoute];

RouteBase get $emailCounsellingRoute => GoRouteData.$route(
  path: '/contacts/email-counselling',
  factory: $EmailCounsellingRoute._fromState,
);

mixin $EmailCounsellingRoute on GoRouteData {
  static EmailCounsellingRoute _fromState(GoRouterState state) =>
      const EmailCounsellingRoute();

  @override
  String get location => GoRouteData.$location('/contacts/email-counselling');

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
