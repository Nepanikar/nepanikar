// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eating_disorder_contacts_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$eatingDisorderContactsRoute];

RouteBase get $eatingDisorderContactsRoute => GoRouteData.$route(
  path: '/home/eating-disorder/contacts',
  factory: $EatingDisorderContactsRoute._fromState,
);

mixin $EatingDisorderContactsRoute on GoRouteData {
  static EatingDisorderContactsRoute _fromState(GoRouterState state) =>
      const EatingDisorderContactsRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/eating-disorder/contacts');

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
