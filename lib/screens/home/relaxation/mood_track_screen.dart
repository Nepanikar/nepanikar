import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/app_constants.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/helpers/date_helpers.dart';
import 'package:nepanikar/l10n/ext.dart';
import 'package:nepanikar/providers/mood_chart_filter_provider.dart';
import 'package:nepanikar/services/db/relaxation/mood_track_dao.dart';
import 'package:nepanikar/services/db/relaxation/mood_track_model.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/mood/mood_chart.dart';
import 'package:nepanikar/widgets/mood_picker.dart';
import 'package:nepanikar/widgets/nepanikar_date_picker.dart';
import 'package:nepanikar/widgets/nepanikar_dropdown.dart';
import 'package:provider/provider.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class MoodTrackRoute extends GoRouteData {
  const MoodTrackRoute();

  @override
  Widget build(BuildContext context) => const MoodTrackScreen();
}

class MoodTrackScreen extends StatelessWidget {
  const MoodTrackScreen({super.key});

  MoodTrackDao get _moodTrackDao => registry.get<MoodTrackDao>();

  DateTime get _now => getNowDateTimeLocal();

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
                      stream: _moodTrackDao.latestMoodTrackStream,
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
                      builder: (_, snapshot) {
                        final allMoodTrackData = snapshot.data ?? [];
                        final firstMoodTrackDate = allMoodTrackData.firstOrNull?.date;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                          child: _buildChartWithFilters(
                            context,
                            allMoodTrackData: allMoodTrackData,
                            firstMoodTrackDate: firstMoodTrackDate,
                          ),
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

  Widget _buildChartWithFilters(
    BuildContext context, {
    required List<MoodTrack> allMoodTrackData,
    required DateTime? firstMoodTrackDate,
  }) {
    return Consumer<MoodChartFilterProvider>(
      builder: (_, moodChartFilterProvider, __) {
        final activeFilter = moodChartFilterProvider.activeFilter;
        final dateRange = moodChartFilterProvider.customDateRange;
        final canShiftNextDateRange = moodChartFilterProvider.canShiftDateRangeNext;
        final currDateRangeStart = moodChartFilterProvider.customDateRange?.start;
        final filteredData = dateRange != null
            ? allMoodTrackData.filterByDateRange(dateRange)
            : <DateTime, MoodTrack?>{};
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: NepanikarDropdown<ChartFilter>(
                items: activeFilter.isCustom
                    ? ChartFilter.values
                    : ChartFilter.values.where((e) => !e.isCustom),
                activeItem: activeFilter,
                labelBuilder: (item) => item.getLabel(context),
                onPick: moodChartFilterProvider.setFilter,
              ),
            ),
            const SizedBox(height: 32),
            MoodChart(moodTrackData: filteredData),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Assets.icons.navigation.arrowLeft.svg(),
                  onPressed: () => moodChartFilterProvider.shiftDateRange(DateRangeSwitch.previous),
                ),
                Expanded(
                  child: NepanikarDatePicker(
                    firstDate: firstMoodTrackDate == null
                        ? currDateRangeStart ?? DateTime(_now.year, _now.month - 1)
                        : currDateRangeStart != null &&
                                firstMoodTrackDate.isBefore(currDateRangeStart)
                            ? firstMoodTrackDate
                            : currDateRangeStart ?? DateTime(_now.year, _now.month - 1),
                    lastDate: getNowDateTimeLocal(),
                    activeRange: moodChartFilterProvider.customDateRange,
                    onPick: moodChartFilterProvider.setCustomDateRange,
                  ),
                ),
                IconButton(
                  icon: Assets.icons.navigation.arrowRight.svg(
                    color: !canShiftNextDateRange ? Colors.grey : null,
                  ),
                  onPressed: !canShiftNextDateRange
                      ? null
                      : () => moodChartFilterProvider.shiftDateRange(DateRangeSwitch.next),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
