import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/games/breathing/breathing_game_screen.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class BreathingExercisesRoute extends GoRouteData {
  const BreathingExercisesRoute();

  @override
  Widget build(BuildContext context, _) => const BreathingExercisesScreen();
}

class BreathingExercisesScreen extends StatelessWidget {
  const BreathingExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final ThemeMode currentThemeMode = Theme.of(context).brightness == Brightness.dark ?
    ThemeMode.dark : ThemeMode.light;
    final bool isDarkMode = currentThemeMode == ThemeMode.dark ? true : false;

    final modules = <Widget>[
      LongTile(
        text: context.l10n.breathing_exercise_i,
        image: Assets.illustrations.modules.breathingCircle.svg(),
        onTap: () => context.push(
          const BreathingGameRoute(shape: BreathingGameShape.circle).location,
        ),
        isDarkMode: isDarkMode,
      ),
      LongTile(
        text: context.l10n.breathing_exercise_ii,
        image: Assets.illustrations.modules.breathingTriangle.svg(),
        onTap: () => context.push(
          const BreathingGameRoute(shape: BreathingGameShape.triangle).location,
        ),
        isDarkMode: isDarkMode,
      ),
      LongTile(
        text: context.l10n.breathing_exercise_iii,
        image: Assets.illustrations.modules.breathingSquare.svg(),
        onTap: () => context.push(
          const BreathingGameRoute(shape: BreathingGameShape.square).location,
        ),
        isDarkMode: isDarkMode,
      ),
    ];

    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.breath,
      children: modules,
    );
  }
}
