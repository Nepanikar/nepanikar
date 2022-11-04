import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/games/math/math_game_screen.dart';
import 'package:nepanikar/screens/about_app_screen.dart';
import 'package:nepanikar/screens/contacts/phone_contacts_screen.dart';
import 'package:nepanikar/screens/home/anxiety_screen.dart';
import 'package:nepanikar/screens/home/anxiety_tips_route.dart';
import 'package:nepanikar/screens/home/relaxation/mood_track_screen.dart';
import 'package:nepanikar/screens/home/relaxation/relaxation_screen.dart';
import 'package:nepanikar/screens/home/self_harm/self_harm_screen.dart';
import 'package:nepanikar/screens/home/self_harm/self_harm_timer_screen.dart';
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
@TypedGoRoute<MainRoute>(
  path: '/',
  routes: [
    ..._settingsRoutes,
    ..._gameRoutes,
    ..._contactRoutes,
    ..._homeRoutes,
  ],
)
class MainRoute extends GoRouteData {
  const MainRoute();

  @override
  Widget build(BuildContext context) => const MainScreen();
}

const _settingsRoutes = <TypedGoRoute<GoRouteData>>[
  TypedGoRoute<AboutAppRoute>(path: 'settings/about-app'),
];

const _gameRoutes = <TypedGoRoute<GoRouteData>>[
  TypedGoRoute<MathGameRoute>(path: 'games/math'),
];

const _contactRoutes = <TypedGoRoute<GoRouteData>>[
  TypedGoRoute<PhoneContactsRoute>(path: 'contacts/phones'),
];

const _homeRoutes = <TypedGoRoute<GoRouteData>>[
  TypedGoRoute<AnxietyAppRoute>(path: 'home/anxiety'),
  TypedGoRoute<AnxietyTipsAppRoute>(path: 'home/anxiety/tips'),
  TypedGoRoute<SelfHarmRoute>(path: 'home/self-harm'),
  TypedGoRoute<SelfHarmTimerRoute>(path: 'home/self-harm/timer'),
  TypedGoRoute<RelaxationRoute>(path: 'home/relaxation'),
  TypedGoRoute<MoodTrackRoute>(path: 'home/relaxation/mood-track'),
];
