import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class EatingDisorderTipsRoute extends GoRouteData {
  const EatingDisorderTipsRoute();

  @override
  Widget build(BuildContext context) => const EatingDisorderTipsScreen();
}

class EatingDisorderTipsScreen extends StatelessWidget {
  const EatingDisorderTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final modules = <Widget>[
      LongTile(
        text: context.l10n.food_figure,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: context.l10n.food_remorse,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: context.l10n.food_overeat,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: context.l10n.food_vomit,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: context.l10n.food_fail,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: context.l10n.food_misc,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => {},
      ),
    ];
    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.food_tips,
      children: modules,
    );
  }
}
