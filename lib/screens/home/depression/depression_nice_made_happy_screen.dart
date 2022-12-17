import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/services/db/depression/depression_nice_made_happy_dao.dart';
import 'package:nepanikar/widgets/input_form_contents/list_form_content.dart';

class DepressionNiceMadeHappyRoute extends GoRouteData {
  const DepressionNiceMadeHappyRoute();

  @override
  Widget build(BuildContext context) => const DepressionNiceMadeHappy();
}

class DepressionNiceMadeHappy extends StatelessWidget {
  const DepressionNiceMadeHappy({super.key});

  @override
  Widget build(BuildContext context) {
    return ListFormContent<DepressionNiceMadeHappyDao>(
      appBarTitle: context.l10n.depression_nice,
      appBarDescription: context.l10n.depression_nice_header,
    );
  }
}
