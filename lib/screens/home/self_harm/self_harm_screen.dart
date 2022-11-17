import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/games/breathing/breathing_exercises_screen.dart';
import 'package:nepanikar/screens/home/self_harm/self_harm_timer_screen.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class SelfHarmRoute extends GoRouteData {
  const SelfHarmRoute();

  @override
  Widget build(BuildContext context) => const SelfHarmScreen();
}

class SelfHarmScreen extends StatelessWidget {
  const SelfHarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final modules = <Widget>[
      LongTile(
        text: '${context.l10n.self_harm_tips} TODO',
        image: Assets.illustrations.modules.selfHarm.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: '${context.l10n.self_harm_helped} TODO',
        image: Assets.illustrations.modules.selfHarm.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: '${context.l10n.plan} TODO',
        image: Assets.illustrations.modules.selfHarm.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: context.l10n.self_harm_timer,
        image: Assets.illustrations.modules.selfHarm.svg(),
        onTap: () => context.push(const SelfHarmTimerRoute().location),
      ),
      LongTile(
        text: context.l10n.breath,
        image: Assets.illustrations.modules.anxietyPanic.svg(),
        onTap: () => context.push(const BreathingExercisesRoute().location),
      ),
    ];

    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.self_harm,
      children: modules,
    );
  }
}
