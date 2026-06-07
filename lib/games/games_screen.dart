import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/games/balance/balance_game_screen.dart';
import 'package:nepanikar/games/balloons/balloons_game_screen.dart';
import 'package:nepanikar/games/math/math_game_screen.dart';
import 'package:nepanikar/games/plants/plants_game_screen.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

part 'games_screen.g.dart';

@TypedGoRoute<GamesRoute>(path: '/games')
class GamesRoute extends GoRouteData with $GamesRoute {
  const GamesRoute();

  @override
  Widget build(BuildContext context, _) => const GamesScreen();
}

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorFilter = svgColorFilterBasedOnDarkMode(context);

    final modules = <Widget>[
      LongTile(
        text: context.l10n.math,
        image: Assets.illustrations.games.math.math.svg(colorFilter: colorFilter),
        onTap: () => context.push(const MathGameRoute().location),
      ),
      LongTile(
        text: context.l10n.game_balls,
        image: Assets.illustrations.games.balloons.baloons.svg(colorFilter: colorFilter),
        onTap: () => context.push(const BalloonsGameRoute().location),
      ),
      LongTile(
        text: context.l10n.game_balance,
        image: Assets.illustrations.games.swing.swing.svg(colorFilter: colorFilter),
        onTap: () => context.push(const BalanceGameRoute().location),
      ),
      LongTile(
        text: context.l10n.plants,
        image: Assets.illustrations.games.plants.plants.svg(colorFilter: colorFilter),
        onTap: () => context.push(const PlantsGameRoute().location),
      ),
    ];

    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.games,
      showBottomNavbar: true,
      children: modules,
    );
  }
}
