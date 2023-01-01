import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/services/db/eating_disorder/eating_disorder_food_i_like_dao.dart';
import 'package:nepanikar/widgets/input_form_contents/list_form_content.dart';

class EatingDisorderFoodILikeRoute extends GoRouteData {
  const EatingDisorderFoodILikeRoute();

  @override
  Widget build(BuildContext context, _) => const EatingDisorderFoodILikeScreen();
}

class EatingDisorderFoodILikeScreen extends StatelessWidget {
  const EatingDisorderFoodILikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListFormContent<EatingDisorderFoodILikeDao>(
      appBarTitle: context.l10n.food_tasks_food_like,
      appBarDescription: context.l10n.food_food_like_header,
    );
  }
}
