import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/services/db/eating_disorder/eating_disorder_food_motivation_dao.dart';
import 'package:nepanikar/widgets/input_form_contents/checklist_form_content.dart';
part 'eating_disorder_food_motivation_screen.g.dart';

@TypedGoRoute<EatingDisorderFoodMotivationRoute>(
  path: '/home/eating-disorder/tasks/food-motivation',
)

class EatingDisorderFoodMotivationRoute extends GoRouteData with _$EatingDisorderFoodMotivationRoute {
  const EatingDisorderFoodMotivationRoute();

  @override
  Widget build(BuildContext context, _) => const EatingDisorderFoodMotivationScreen();
}

class EatingDisorderFoodMotivationScreen extends StatelessWidget {
  const EatingDisorderFoodMotivationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChecklistFormContent<EatingDisorderFoodMotivationDao>(
      appBarTitle: context.l10n.food_tasks_motivation,
      appBarDescription: '',
    );
  }
}
