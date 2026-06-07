// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_contacts_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$myContactsRecordsRoute];

RouteBase get $myContactsRecordsRoute => GoRouteData.$route(
  path: '/contacts/my-contacts-records',
  factory: $MyContactsRecordsRoute._fromState,
);

mixin $MyContactsRecordsRoute on GoRouteData {
  static MyContactsRecordsRoute _fromState(GoRouterState state) =>
      const MyContactsRecordsRoute();

  @override
  String get location => GoRouteData.$location('/contacts/my-contacts-records');

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
