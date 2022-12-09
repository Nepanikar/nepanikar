import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/services/db/eating_disorder/eating_disorder_food_afraid_of_dao.dart';
import 'package:nepanikar/widgets/input_form_contents/checklist_form_content.dart';

class EatingDisorderFoodAfraidOfRoute extends GoRouteData {
  const EatingDisorderFoodAfraidOfRoute();

  @override
  Widget build(BuildContext context) => const EatingDisorderFoodAfraidOfScreen();
}

class EatingDisorderFoodAfraidOfScreen extends StatelessWidget {
  const EatingDisorderFoodAfraidOfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChecklistFormContent<EatingDisorderFoodAfraidOfDao>(
      appBarTitle: context.l10n.food_afraid_text,
      appBarDescription: context.l10n.food_afraid_header,
    );
  }
}
