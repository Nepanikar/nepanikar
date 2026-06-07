// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$themeRoute];

RouteBase get $themeRoute => GoRouteData.$route(
  path: '/settings/theme',
  factory: $ThemeRoute._fromState,
);

mixin $ThemeRoute on GoRouteData {
  static ThemeRoute _fromState(GoRouterState state) => const ThemeRoute();

  @override
  String get location => GoRouteData.$location('/settings/theme');

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
