import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/app_constants.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/l10n/ext.dart';
import 'package:nepanikar/services/db/relaxation/mood_track_dao.dart';
import 'package:nepanikar/services/db/relaxation/mood_track_model.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/mood/mood_chart.dart';
import 'package:nepanikar/widgets/mood_picker.dart';

class MoodTrackRoute extends GoRouteData {
  const MoodTrackRoute();

  @override
  Widget build(BuildContext context) => const MoodTrackScreen();
}

class MoodTrackScreen extends StatelessWidget {
  const MoodTrackScreen({super.key});

  MoodTrackDao get _moodTrackDao => registry.get<MoodTrackDao>();

  @override
  Widget build(BuildContext context) {
    const pageSidePadding = 24.0;
    const pageHorizontalPadding = EdgeInsets.symmetric(horizontal: pageSidePadding);

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.depression_mood)),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    color: NepanikarColors.primary,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(pageSidePadding, 6, pageSidePadding, 24),
                      child: Text(
                        AppConstants.loremIpsumShort,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: pageHorizontalPadding,
                    child: StreamBuilder<MoodTrack?>(
                      stream: _moodTrackDao.lastMoodTrackStream,
                      builder: (_, snapshot) {
                        final latestMoodTrack = snapshot.data;
                        return MoodPicker(
                          activeMood: latestMoodTrack?.mood,
                          onPick: (mood) async => _moodTrackDao.saveMood(mood),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: pageHorizontalPadding,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      // TODO: l10n
                      child: Text(
                        'Statistika',
                        style: NepanikarFonts.title2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: pageHorizontalPadding,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      // TODO: l10n
                      child: Text(
                        'Nastavte si rozmezí data a sledujte vývoj nálady',
                        style: NepanikarFonts.bodyRoman.copyWith(color: NepanikarColors.primary),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    child: StreamBuilder<List<MoodTrack>>(
                      stream: _moodTrackDao.allMoodTracksStream,
                      builder: (context, snapshot) {
                        final data = snapshot.data ?? [];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: MoodChart(moodTrackList: data),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
