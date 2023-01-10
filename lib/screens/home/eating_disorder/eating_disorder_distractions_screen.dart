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
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class EatingDisorderDistractionsRoute extends GoRouteData {
  const EatingDisorderDistractionsRoute();

  @override
  Widget build(BuildContext context, _) => const EatingDisorderDistractionsScreen();
}

class EatingDisorderDistractionsScreen extends StatelessWidget {
  const EatingDisorderDistractionsScreen({super.key});

  UserSettingsDao get _userSettingsDao => registry.get<UserSettingsDao>();

  @override
  Widget build(BuildContext context) {
    final modules = <Widget>[
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
        text: context.l10n.breath,
        image: Assets.illustrations.modules.breathing.svg(),
        onTap: () => context.push(const BreathingExercisesRoute().location),
      ),
      if (['cs', 'sk'].contains(_userSettingsDao.locale.languageCode))
        LongTile(
          text: context.l10n.relaxation,
          image: Assets.illustrations.modules.relaxation.svg(),
          onTap: () => context.push(const RelaxationsListRoute().location),
        ),
    ];
    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.distraction,
      showBottomNavbar: true,
      children: modules,
    );
  }
}
