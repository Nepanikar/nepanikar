import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/services/db/eating_disorder/eating_disorder_food_challenges_dao.dart';
import 'package:nepanikar/widgets/input_form_contents/checklist_form_content.dart';

class EatingDisorderFoodChallengesRoute extends GoRouteData {
  const EatingDisorderFoodChallengesRoute();

  @override
  Widget build(BuildContext context) => const EatingDisorderFoodChallengesScreen();
}

class EatingDisorderFoodChallengesScreen extends StatelessWidget {
  const EatingDisorderFoodChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChecklistFormContent<EatingDisorderFoodChallengesDao>(
      appBarTitle: context.l10n.food_tasks_challenge,
      appBarDescription: '',
    );
  }
}
