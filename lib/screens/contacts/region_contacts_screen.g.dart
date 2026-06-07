// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region_contacts_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $universityContactsRoute,
  $crisisCenterContactsRoute,
];

RouteBase get $universityContactsRoute => GoRouteData.$route(
  path: '/contacts/universities',
  factory: $UniversityContactsRoute._fromState,
);

mixin $UniversityContactsRoute on GoRouteData {
  static UniversityContactsRoute _fromState(GoRouterState state) =>
      const UniversityContactsRoute();

  @override
  String get location => GoRouteData.$location('/contacts/universities');

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

RouteBase get $crisisCenterContactsRoute => GoRouteData.$route(
  path: '/contacts/crisis-center',
  factory: $CrisisCenterContactsRoute._fromState,
);

mixin $CrisisCenterContactsRoute on GoRouteData {
  static CrisisCenterContactsRoute _fromState(GoRouterState state) =>
      const CrisisCenterContactsRoute();

  @override
  String get location => GoRouteData.$location('/contacts/crisis-center');

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
