import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/app_constants.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/helpers/localization_helpers.dart';
import 'package:nepanikar/services/db/self_harm/self_harm_plan_dao.dart';
import 'package:nepanikar/widgets/input_form_contents/plan_form_content.dart';

class SelfHarmPlanRoute extends GoRouteData {
  const SelfHarmPlanRoute();

  @override
  Widget build(BuildContext context, _) => const SelfHarmPlanScreen();
}

class SelfHarmPlanScreen extends StatelessWidget {
  const SelfHarmPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlanFormContent<SelfHarmPlanDao>(
      appBarTitle: context.l10n.plan,
      // TODO: description
      appBarDescription: AppConstants.loremIpsumShort,
      planItems: {
        for (final title in context.l10n.self_harm_plan_questions.extractToItems()) title: null,
      },
    );
  }
}
