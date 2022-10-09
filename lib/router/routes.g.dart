// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $mainRoute,
      $aboutAppRoute,
      $mathGameRoute,
    ];

GoRoute get $mainRoute => GoRouteData.$route(
      path: '/',
      factory: $MainRouteExtension._fromState,
    );

extension $MainRouteExtension on MainRoute {
  static MainRoute _fromState(GoRouterState state) => const MainRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

GoRoute get $aboutAppRoute => GoRouteData.$route(
      path: '/about-app',
      factory: $AboutAppRouteExtension._fromState,
    );

extension $AboutAppRouteExtension on AboutAppRoute {
  static AboutAppRoute _fromState(GoRouterState state) => const AboutAppRoute();

  String get location => GoRouteData.$location(
        '/about-app',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

GoRoute get $mathGameRoute => GoRouteData.$route(
      path: '/games/math',
      factory: $MathGameRouteExtension._fromState,
    );

extension $MathGameRouteExtension on MathGameRoute {
  static MathGameRoute _fromState(GoRouterState state) => const MathGameRoute();

  String get location => GoRouteData.$location(
        '/games/math',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}
