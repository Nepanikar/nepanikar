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
    final modules = <Widget>[
      LongTile(
        //TODO: l10n
        text: 'Dechové cvičení I',
        image: Assets.illustrations.modules.anxietyPanic.svg(),
        onTap: () => context.push(
          const BreathingGameRoute(shape: BreathingGameShape.circle).location,
        ),
      ),
      LongTile(
        //TODO: l10n
        text: 'Dechové cvičení II',
        image: Assets.illustrations.modules.anxietyPanic.svg(),
        onTap: () => context.push(
          const BreathingGameRoute(shape: BreathingGameShape.triangle).location,
        ),
      ),
      LongTile(
        //TODO: l10n
        text: 'Dechové cvičení III',
        image: Assets.illustrations.modules.anxietyPanic.svg(),
        onTap: () => context.push(
          const BreathingGameRoute(shape: BreathingGameShape.square).location,
        ),
      ),
    ];

    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.breath,
      children: modules,
    );
  }
}
