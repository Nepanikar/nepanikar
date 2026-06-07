// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'export_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$exportRoute];

RouteBase get $exportRoute => GoRouteData.$route(
  path: '/settings/export',
  factory: $ExportRoute._fromState,
);

mixin $ExportRoute on GoRouteData {
  static ExportRoute _fromState(GoRouterState state) => const ExportRoute();

  @override
  String get location => GoRouteData.$location('/settings/export');

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
