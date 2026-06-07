// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'languages_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$languagesRoute];

RouteBase get $languagesRoute => GoRouteData.$route(
  path: '/settings/language',
  factory: $LanguagesRoute._fromState,
);

mixin $LanguagesRoute on GoRouteData {
  static LanguagesRoute _fromState(GoRouterState state) =>
      const LanguagesRoute();

  @override
  String get location => GoRouteData.$location('/settings/language');

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
