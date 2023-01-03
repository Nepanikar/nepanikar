import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/screens/home/eating_disorder/tasks/eating_disorder_food_afraid_of_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/tasks/eating_disorder_food_challenges_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/tasks/eating_disorder_food_creative_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/tasks/eating_disorder_food_i_like_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/tasks/eating_disorder_food_motivation_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/tasks/eating_disorder_like_on_myself_screen.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class EatingDisorderTasksRoute extends GoRouteData {
  const EatingDisorderTasksRoute();

  @override
  Widget build(BuildContext context, _) => const EatingDisorderTasksScreen();
}

class EatingDisorderTasksScreen extends StatelessWidget {
  const EatingDisorderTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final modules = <Widget>[
      LongTile(
        text: context.l10n.food_tasks_creative,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => context.push(const EatingDisorderFoodCreativeRoute().location),
      ),
      LongTile(
        text: context.l10n.food_tasks_motivation,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => context.push(const EatingDisorderFoodMotivationRoute().location),
      ),
      LongTile(
        text: context.l10n.food_tasks_challenge,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => context.push(const EatingDisorderFoodChallengesRoute().location),
      ),
      LongTile(
        text: context.l10n.food_tasks_like,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => context.push(const EatingDisorderLikeOnMyselfRoute().location),
      ),
      LongTile(
        text: context.l10n.food_tasks_food_like,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => context.push(const EatingDisorderFoodILikeRoute().location),
      ),
      LongTile(
        text: context.l10n.food_tasks_afraid,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => context.push(const EatingDisorderFoodAfraidOfRoute().location),
      ),
    ];
    return NepanikarScreenWrapper(appBarTitle: context.l10n.food_tasks, children: modules);
  }
}
