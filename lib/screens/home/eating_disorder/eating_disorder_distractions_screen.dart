import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class EatingDisorderDistractionsRoute extends GoRouteData {
  const EatingDisorderDistractionsRoute();

  @override
  Widget build(BuildContext context) => const EatingDisorderDistractionsScreen();
}

class EatingDisorderDistractionsScreen extends StatelessWidget {
  const EatingDisorderDistractionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final modules = <Widget>[
      LongTile(
        text: context.l10n.math,
        image: Assets.illustrations.games.math.math.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: context.l10n.game_balls,
        image: Assets.illustrations.games.baloons.baloons.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: context.l10n.game_balance,
        image: Assets.illustrations.games.swing.swing.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: context.l10n.breath,
        image: Assets.illustrations.modules.anxietyPanic.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: context.l10n.relaxation,
        image: Assets.illustrations.modules.anxietyPanic.svg(),
        onTap: () => {},
      ),
    ];
    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.distraction,
      children: modules,
    );
  }
}
