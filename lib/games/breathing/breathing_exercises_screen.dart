import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/sizes.dart';
import 'package:nepanikar/games/breathing/breathing_game_screen.dart';
import 'package:nepanikar/l10n/ext.dart';
import 'package:nepanikar/router/routes.dart';
import 'package:nepanikar/widgets/long_tile.dart';

class BreathingExercisesRoute extends GoRouteData {
  const BreathingExercisesRoute();

  @override
  Widget build(BuildContext context) => const BreathingExercisesScreen();
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

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.breath)),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 55,
              color: NepanikarColors.primary,
            ),
            SeparatedColumn(
              separatorBuilder: NepanikarSizes.separatorBuilder(),
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              children: modules,
            )
          ],
        ),
      ),
    );
  }
}
