import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/services/db/suicidal_thoughts/suicidal_thoughts_reasons_no_dao.dart';
import 'package:nepanikar/widgets/input_form_contents/list_form_content.dart';
part 'suicidal_thoughts_reasons_no_screen.g.dart';

@TypedGoRoute<SuicidalThoughtsReasonsNoRoute>(path: '/home/suicidal-thoughts/reasons-no')
class SuicidalThoughtsReasonsNoRoute extends GoRouteData with _$SuicidalThoughtsReasonsNoRoute {
  const SuicidalThoughtsReasonsNoRoute();

  @override
  Widget build(BuildContext context, _) => const SuicidalThoughtsReasonsNoScreen();
}

class SuicidalThoughtsReasonsNoScreen extends StatelessWidget {
  const SuicidalThoughtsReasonsNoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListFormContent<SuicidalThoughtsReasonsNoDao>(
      appBarTitle: context.l10n.reasons,
      appBarDescription: context.l10n.reasons_text,
    );
  }
}
