import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/screens/home/eating_disorder/meal_plan_screen.dart';
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
        onTap: () => context.push(
          Uri(
            path: const MealPlanRoute().location,
            queryParameters: {
              'id': 'breakfast',
              'title': context.l10n.food_breakfast,
            },
          ).toString(),
        ),
      ),
      LongTile(
        text: '${context.l10n.food_am_snack} ',
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => context.push(
          Uri(
            path: const MealPlanRoute().location,
            queryParameters: {
              'id': 'am_snack',
              'title': context.l10n.food_am_snack,
            },
          ).toString(),
        ),
      ),
      LongTile(
        text: '${context.l10n.food_lunch} ',
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => context.push(
          Uri(
            path: const MealPlanRoute().location,
            queryParameters: {
              'id': 'lunch',
              'title': context.l10n.food_lunch,
            },
          ).toString(),
        ),
      ),
      LongTile(
        text: context.l10n.food_pm_snack,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => context.push(
          Uri(
            path: const MealPlanRoute().location,
            queryParameters: {
              'id': 'pm_snack',
              'title': context.l10n.food_pm_snack,
            },
          ).toString(),
        ),
      ),
      LongTile(
        text: context.l10n.food_dinner,
        image: Assets.illustrations.modules.eatingDisorder.svg(),
        onTap: () => context.push(
          Uri(
            path: const MealPlanRoute().location,
            queryParameters: {
              'id': 'dinner',
              'title': context.l10n.food_dinner,
            },
          ).toString(),
        ),
      ),
    ];
    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.food_dishes,
      children: modules,
    );
  }
}
