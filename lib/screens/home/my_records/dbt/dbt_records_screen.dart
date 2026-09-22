import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/screens/home/my_records/challenges/my_challenges_screen.dart';
import 'package:nepanikar/screens/home/my_records/emotion_dictionary/emotion_dictionary_screen.dart';
import 'package:nepanikar/screens/home/my_records/goals/my_goals_screen.dart';
import 'package:nepanikar/screens/home/my_records/rescue_package/rescue_package_screen.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

part 'dbt_records_screen.g.dart';

@TypedGoRoute<DbtRecordsRoute>(path: '/home/my-records/dbt')
class DbtRecordsRoute extends GoRouteData with $DbtRecordsRoute {
  const DbtRecordsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const DbtRecordsScreen();
}

/// Records belonging to the DBT programme, grouped in one place: the challenges
/// the user committed to, the SMART goals they set, and the exercises they saved
/// into their rescue package.
class DbtRecordsScreen extends StatelessWidget {
  const DbtRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // White on dark, primary on light — the same rule the SVG tiles use.
    final iconColor = svgColorBasedOnDarkMode(context);

    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.dbt_programme,
      children: [
        LongTile(
          text: context.l10n.dbt_challenges,
          image: Icon(Icons.flag_outlined, size: 32, color: iconColor),
          onTap: () => context.push(const MyChallengesRoute().location),
        ),
        LongTile(
          text: context.l10n.dbt_goals,
          image: Icon(Icons.track_changes, size: 32, color: iconColor),
          onTap: () => context.push(const MyGoalsRoute().location),
        ),
        LongTile(
          text: context.l10n.dbt_rescue_package,
          image: Icon(Icons.medical_services_outlined, size: 32, color: iconColor),
          onTap: () => context.push(const RescuePackageRoute().location),
        ),
        LongTile(
          text: context.l10n.dbt_emotion_dictionary,
          image: Icon(Icons.menu_book_outlined, size: 32, color: iconColor),
          onTap: () => context.push(const EmotionDictionaryRoute().location),
        ),
      ],
    );
  }
}
