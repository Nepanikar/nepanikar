import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/screens/about_app_screen.dart';
import 'package:nepanikar/screens/home_screen.dart';

part 'routes.g.dart';

/// After editing this page, run:
///
/// `flutter packages pub run build_runner build --delete-conflicting-outputs` to regenerate
/// the routes.
///
/// Alternative ways of pushing a route:
/// * HomeRoute().push(context);
/// * context.push(HomeRoute().location);
/// * registry.get<GoRouter>().push(HomeRoute().location); - if you need to push a route from where
/// `context` is not available
///
/// More info in the package docs: https://pub.dev/packages/go_router.
@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context) => const HomeScreen();
}

@TypedGoRoute<AboutAppRoute>(path: '/about-app')
class AboutAppRoute extends GoRouteData {
  @override
  Widget build(BuildContext context) => AboutAppScreen();
}
