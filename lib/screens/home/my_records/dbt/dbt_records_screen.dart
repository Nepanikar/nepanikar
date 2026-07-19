import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/screens/home/my_records/challenges/my_challenges_screen.dart';
import 'package:nepanikar/screens/home/my_records/goals/my_goals_screen.dart';
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
/// the user committed to and the SMART goals they set.
class DbtRecordsScreen extends StatelessWidget {
  const DbtRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return NepanikarScreenWrapper(
      appBarTitle: 'DBT program',
      children: [
        LongTile(
          text: 'Moje výzvy',
          image: Icon(Icons.flag_outlined, size: 32, color: primaryColor),
          onTap: () => context.push(const MyChallengesRoute().location),
        ),
        LongTile(
          text: 'Moje cíle',
          image: Icon(Icons.track_changes, size: 32, color: primaryColor),
          onTap: () => context.push(const MyGoalsRoute().location),
        ),
      ],
    );
  }
}
