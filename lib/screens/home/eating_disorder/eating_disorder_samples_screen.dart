import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class EatingDisorderSamplesRoute extends GoRouteData {
  const EatingDisorderSamplesRoute();

  @override
  Widget build(BuildContext context) => const EatingDisordersSamplesScreen();
}

class EatingDisordersSamplesScreen extends StatelessWidget {
  const EatingDisordersSamplesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final modules = <Widget>[
      LongTile(
        text: context.l10n.food_breakfast,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: context.l10n.food_am_snack,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: context.l10n.food_lunch,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: context.l10n.food_pm_snack,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: context.l10n.food_dinner,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => {},
      ),
    ];
    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.food_dishes,
      children: modules,
    );
  }
}
