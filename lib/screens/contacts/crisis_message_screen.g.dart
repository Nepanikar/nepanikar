// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crisis_message_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$crisisMessageRoute];

RouteBase get $crisisMessageRoute => GoRouteData.$route(
  path: '/contacts/crisis-message',
  factory: $CrisisMessageRoute._fromState,
);

mixin $CrisisMessageRoute on GoRouteData {
  static CrisisMessageRoute _fromState(GoRouterState state) =>
      const CrisisMessageRoute();

  @override
  String get location => GoRouteData.$location('/contacts/crisis-message');

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
