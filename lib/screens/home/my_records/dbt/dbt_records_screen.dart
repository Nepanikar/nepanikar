import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/participant_code_card.dart';
import 'package:nepanikar/screens/home/my_records/challenges/my_challenges_screen.dart';
import 'package:nepanikar/screens/home/my_records/emotion_dictionary/emotion_dictionary_screen.dart';
import 'package:nepanikar/screens/home/my_records/goals/my_goals_screen.dart';
import 'package:nepanikar/screens/home/my_records/rescue_package/rescue_package_screen.dart';
import 'package:nepanikar/services/bpd_study_export_service.dart';
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
    final primaryColor = Theme.of(context).primaryColor;

    return NepanikarScreenWrapper(
      appBarTitle: 'DBT průvodce',
      children: [
        // Also reachable from the last screen of Week 7, but that screen is
        // seen once. Someone who mistyped their number, or who closed the
        // programme before saving the export, needs a way back to both.
        const Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: ParticipantCodeCard(
            caption: 'Číslo z e-mailu, podle kterého se párují tvoje dotazníky '
                've výzkumu.',
          ),
        ),
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
        LongTile(
          text: 'Záchranný balíček',
          image: Icon(Icons.medical_services_outlined, size: 32, color: primaryColor),
          onTap: () => context.push(const RescuePackageRoute().location),
        ),
        LongTile(
          text: 'Slovník emocí',
          image: Icon(Icons.menu_book_outlined, size: 32, color: primaryColor),
          onTap: () => context.push(const EmotionDictionaryRoute().location),
        ),
        LongTile(
          text: 'Přehled postupu pro výzkum',
          image: Icon(Icons.download_outlined, size: 32, color: primaryColor),
          onTap: () => BpdStudyExportService.saveToFile(),
        ),
      ],
    );
  }
}
