import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/app_constants.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/services/db/suicidal_thoughts/suicidal_thoughts_plan_dao.dart';
import 'package:nepanikar/widgets/input_form_contents/plan_form_content.dart';

class SuicidalThoughtsPlanRoute extends GoRouteData {
  const SuicidalThoughtsPlanRoute();

  @override
  Widget build(BuildContext context) => const SuicidalThoughtsPlanScreen();
}

class SuicidalThoughtsPlanScreen extends StatelessWidget {
  const SuicidalThoughtsPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PlanFormContent<SuicidalThoughtsPlanDao>(
      appBarTitle: context.l10n.plan,
      // TODO: description
      appBarDescription: AppConstants.loremIpsumShort,
      planItems: {
        context.l10n.feeling_bad_write: context.l10n.custom_write,
        context.l10n.feeling_bad_write_body: context.l10n.custom_write_body,
        context.l10n.feeling_bad_do: context.l10n.custom_do,
        context.l10n.feeling_bad_go: context.l10n.custom_go,
        context.l10n.people_to_write: context.l10n.custom_ppl,
      },
    );
  }
}
