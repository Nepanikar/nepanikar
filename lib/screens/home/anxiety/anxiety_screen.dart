import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/games/balance/balance_game_screen.dart';
import 'package:nepanikar/games/balloons/balloons_game_screen.dart';
import 'package:nepanikar/games/breathing/breathing_exercises_screen.dart';
import 'package:nepanikar/games/math/math_game_screen.dart';
import 'package:nepanikar/games/relaxation/relaxations_list_screen.dart';
import 'package:nepanikar/screens/home/anxiety/anxiety_tips_route.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class AnxietyAppRoute extends GoRouteData {
  const AnxietyAppRoute();

  @override
  Widget build(BuildContext context, _) => const AnxietyAppScreen();
}

class AnxietyAppScreen extends StatelessWidget {
  const AnxietyAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final modules = <Widget>[
      LongTile(
        text: context.l10n.panic_tips_9,
        image: Assets.illustrations.modules.depression.svg(),
        onTap: () => context.push(const AnxietyTipsAppRoute().location),
      ),
      LongTile(
        text: context.l10n.breath,
        image: Assets.illustrations.modules.anxietyPanic.svg(),
        onTap: () => context.push(const BreathingExercisesRoute().location),
      ),
      LongTile(
        text: context.l10n.math,
        image: Assets.illustrations.games.math.math.svg(),
        onTap: () => context.push(const MathGameRoute().location),
      ),
      LongTile(
        text: context.l10n.game_balls,
        image: Assets.illustrations.games.balloons.baloons.svg(),
        onTap: () => context.push(const BalloonsGameRoute().location),
      ),
      LongTile(
        text: context.l10n.game_balance,
        image: Assets.illustrations.games.swing.swing.svg(),
        onTap: () => context.push(const BalanceGameRoute().location),
      ),
      LongTile(
        text: context.l10n.relaxation,
        image: Assets.illustrations.modules.relaxation.svg(),
        onTap: () => context.push(const RelaxationsListRoute().location),
      ),
    ];

    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.anxiety_panic,
      children: modules,
    );
  }
}
