import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/services/db/depression/depression_praise_my_achievements_dao.dart';
import 'package:nepanikar/widgets/input_form_contents/list_form_content.dart';

class DepressionPraiseMyAchievementsRoute extends GoRouteData {
  const DepressionPraiseMyAchievementsRoute();

  @override
  Widget build(BuildContext context) => const DepressionPraiseMyAchievementsScreen();
}

class DepressionPraiseMyAchievementsScreen extends StatelessWidget {
  const DepressionPraiseMyAchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListFormContent<DepressionPraiseMyAchievementsDao>(
      appBarTitle: context.l10n.depression_praise,
      appBarDescription: context.l10n.depression_praise_header,
    );
  }
}
