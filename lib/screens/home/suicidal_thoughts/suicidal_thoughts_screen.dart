import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/games/breathing/breathing_exercises_screen.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class SuicidalThoughtsRoute extends GoRouteData {
  const SuicidalThoughtsRoute();

  @override
  Widget build(BuildContext context) => const SuicidalThoughtsScreen();
}

class SuicidalThoughtsScreen extends StatelessWidget {
  const SuicidalThoughtsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final modules = <Widget>[
      LongTile(
        text: '${context.l10n.plan} TODO',
        image: Assets.illustrations.modules.suicidalThoughts.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: '${context.l10n.reasons} TODO',
        image: Assets.illustrations.modules.suicidalThoughts.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: context.l10n.breath,
        image: Assets.illustrations.modules.anxietyPanic.svg(),
        onTap: () => context.push(const BreathingExercisesRoute().location),
      ),
    ];
    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.suicidal_thoughts,
      children: modules,
    );
  }
}