import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/games/breathing/breathing_exercises_screen.dart';
import 'package:nepanikar/games/games_screen.dart';
import 'package:nepanikar/games/relaxation/relaxations_list_screen.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

part 'eating_disorder_distractions_screen.g.dart';

@TypedGoRoute<EatingDisorderDistractionsRoute>(
  path: '/home/eating-disorder/distraction',
)
class EatingDisorderDistractionsRoute extends GoRouteData
    with $EatingDisorderDistractionsRoute {
  const EatingDisorderDistractionsRoute();

  @override
  Widget build(BuildContext context, _) =>
      const EatingDisorderDistractionsScreen();
}

class EatingDisorderDistractionsScreen extends StatelessWidget {
  const EatingDisorderDistractionsScreen({super.key});

  UserSettingsDao get _userSettingsDao => registry.get<UserSettingsDao>();

  @override
  Widget build(BuildContext context) {
    final colorFilter = svgColorFilterBasedOnDarkMode(context);

    final modules = <Widget>[
      LongTile(
        text: context.l10n.games,
        image: Assets.illustrations.modules.games.svg(colorFilter: colorFilter),
        onTap: () => context.push(const GamesRoute().location),
      ),
      LongTile(
        text: context.l10n.breath,
        image: Assets.illustrations.modules.breathing.svg(
          colorFilter: colorFilter,
        ),
        onTap: () => context.push(const BreathingExercisesRoute().location),
      ),
      if (['cs', 'sk'].contains(_userSettingsDao.locale.languageCode))
        LongTile(
          text: context.l10n.relaxation,
          image: Assets.illustrations.modules.relaxation.svg(
            colorFilter: colorFilter,
          ),
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
