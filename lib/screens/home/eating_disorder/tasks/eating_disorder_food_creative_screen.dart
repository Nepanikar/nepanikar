import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/services/db/eating_disorder/eating_disorder_food_creative_dao.dart';
import 'package:nepanikar/widgets/input_form_contents/checklist_form_content.dart';

class EatingDisorderFoodCreativeRoute extends GoRouteData {
  const EatingDisorderFoodCreativeRoute();

  @override
  Widget build(BuildContext context) => const EatingDisorderFoodCreativeScreen();
}

class EatingDisorderFoodCreativeScreen extends StatelessWidget {
  const EatingDisorderFoodCreativeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChecklistFormContent<EatingDisorderFoodCreativeDao>(
      appBarTitle: context.l10n.food_tasks_creative,
      appBarDescription: '',
    );
  }
}
