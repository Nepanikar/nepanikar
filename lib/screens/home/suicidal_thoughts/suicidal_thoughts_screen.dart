import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/games/breathing/breathing_exercises_screen.dart';
import 'package:nepanikar/screens/home/suicidal_thoughts/suicidal_thoughts_plan_screen.dart';
import 'package:nepanikar/screens/home/suicidal_thoughts/suicidal_thoughts_reasons_no_screen.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class SuicidalThoughtsRoute extends GoRouteData {
  const SuicidalThoughtsRoute();

  @override
  Widget build(BuildContext context, _) => const SuicidalThoughtsScreen();
}

class SuicidalThoughtsScreen extends StatelessWidget {
  const SuicidalThoughtsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    ThemeMode currentThemeMode = Theme.of(context).brightness == Brightness.dark ?
    ThemeMode.dark : ThemeMode.light;
    bool isDarkMode = currentThemeMode == ThemeMode.dark ? true : false;

    final modules = <Widget>[
      LongTile(
        text: context.l10n.plan,
        image: Assets.illustrations.modules.emergencyPlan.svg(),
        onTap: () => context.push(const SuicidalThoughtsPlanRoute().location),
        isDarkMode: isDarkMode,
      ),
      LongTile(
        text: context.l10n.reasons,
        image: Assets.illustrations.modules.reaseonsWhyNot.svg(),
        onTap: () => context.push(const SuicidalThoughtsReasonsNoRoute().location),
        isDarkMode: isDarkMode,
      ),
      LongTile(
        text: context.l10n.breath,
        image: Assets.illustrations.modules.breathing.svg(),
        onTap: () => context.push(const BreathingExercisesRoute().location),
        isDarkMode: isDarkMode,
      ),
    ];

    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.suicidal_thoughts,
      showBottomNavbar: true,
      children: modules,
    );
  }
}
