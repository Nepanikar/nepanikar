import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/screens/about_app_screen.dart';
import 'package:nepanikar/screens/main/main_screen.dart';

part 'routes.g.dart';

/// After editing this page, run:
///
/// `flutter packages pub run build_runner build --delete-conflicting-outputs` to regenerate
/// the routes.
///
/// Alternative ways of pushing a route:
/// * context.push(MainRoute().location);
/// * GoRouter.of(context).push(MainRoute().location);
/// * MainRoute().push(context);
/// * registry.get<GoRouter>().push(MainRoute().location); - if you need to push a route from where
/// `context` is not available
///
/// More info in the package docs: https://pub.dev/packages/go_router.
@TypedGoRoute<MainRoute>(path: '/')
class MainRoute extends GoRouteData {
  const MainRoute();

  @override
  Widget build(BuildContext context) => const MainScreen();
}

@TypedGoRoute<AboutAppRoute>(path: '/about-app')
class AboutAppRoute extends GoRouteData {
  const AboutAppRoute();

  @override
  Widget build(BuildContext context) => const AboutAppScreen();
}
