import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class EatingDisorderTasksRoute extends GoRouteData {
  const EatingDisorderTasksRoute();

  @override
  Widget build(BuildContext context) => const EatingDisorderTasksScreen();
}

class EatingDisorderTasksScreen extends StatelessWidget {
  const EatingDisorderTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final modules = <Widget>[
      LongTile(
        text: context.l10n.food_tasks_creative,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: context.l10n.food_tasks_motivation,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: context.l10n.food_tasks_challenge,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: context.l10n.food_tasks_like,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: context.l10n.food_tasks_food_like,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => {},
      ),
      LongTile(
        text: context.l10n.food_tasks_afraid,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => {},
      ),
    ];
    return NepanikarScreenWrapper(appBarTitle: context.l10n.food_tasks, children: modules);
  }
}
