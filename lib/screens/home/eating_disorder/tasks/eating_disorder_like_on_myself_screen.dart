import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/services/db/eating_disorder/eating_disorder_like_on_myself_dao.dart';
import 'package:nepanikar/widgets/input_form_contents/list_form_content.dart';

part 'eating_disorder_like_on_myself_screen.g.dart';

@TypedGoRoute<EatingDisorderLikeOnMyselfRoute>(path: '/home/eating-disorder/tasks/like-on-myself')
class EatingDisorderLikeOnMyselfRoute extends GoRouteData with $EatingDisorderLikeOnMyselfRoute {
  const EatingDisorderLikeOnMyselfRoute();

  @override
  Widget build(BuildContext context, _) => const EatingDisorderLikeOnMyselfScreen();
}

class EatingDisorderLikeOnMyselfScreen extends StatelessWidget {
  const EatingDisorderLikeOnMyselfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListFormContent<EatingDisorderLikeOnMyselfDao>(
      appBarTitle: context.l10n.food_tasks_like,
      appBarDescription: context.l10n.food_like_header,
    );
  }
}
