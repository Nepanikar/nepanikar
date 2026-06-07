// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_contacts_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$phoneContactsRoute];

RouteBase get $phoneContactsRoute => GoRouteData.$route(
  path: '/contacts/phones',
  factory: $PhoneContactsRoute._fromState,
);

mixin $PhoneContactsRoute on GoRouteData {
  static PhoneContactsRoute _fromState(GoRouterState state) =>
      const PhoneContactsRoute();

  @override
  String get location => GoRouteData.$location('/contacts/phones');

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
