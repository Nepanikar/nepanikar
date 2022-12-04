import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/services/db/self_harm/self_harm_helped_dao.dart';
import 'package:nepanikar/widgets/input_form_contents/list_form_content.dart';

class SelfHarmHelpedRoute extends GoRouteData {
  const SelfHarmHelpedRoute();

  @override
  Widget build(BuildContext context) => const SelfHarmPlanScreen();
}

class SelfHarmPlanScreen extends StatelessWidget {
  const SelfHarmPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListFormContent<SelfHarmHelpedDao>(
      appBarTitle: context.l10n.self_harm_helped,
      appBarDescription: context.l10n.self_harm_helped_header,
    );
  }
}
