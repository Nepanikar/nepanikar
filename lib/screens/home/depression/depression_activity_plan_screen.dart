import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/services/db/depression/depression_activity_plan_dao.dart';
import 'package:nepanikar/widgets/input_form_contents/checklist_form_content.dart';

class DepressionActivityPlanRoute extends GoRouteData {
  const DepressionActivityPlanRoute();

  @override
  Widget build(BuildContext context, _) => const DepressionActivityPlanScreen();
}

class DepressionActivityPlanScreen extends StatelessWidget {
  const DepressionActivityPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChecklistFormContent<DepressionActivityPlanDao>(
      appBarTitle: context.l10n.depression_plan,
      appBarDescription: context.l10n.depression_plan_header,
    );
  }
}
