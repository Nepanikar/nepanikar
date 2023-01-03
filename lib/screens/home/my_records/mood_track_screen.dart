import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/helpers/date_helpers.dart';
import 'package:nepanikar/providers/mood_chart_filter_provider.dart';
import 'package:nepanikar/services/db/my_records/mood_track_dao.dart';
import 'package:nepanikar/services/db/my_records/mood_track_model.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/mood/mood_chart.dart';
import 'package:nepanikar/widgets/mood/mood_picker.dart';
import 'package:nepanikar/widgets/nepanikar_date_range_picker.dart';
import 'package:nepanikar/widgets/nepanikar_dropdown.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';
import 'package:provider/provider.dart';

class MoodTrackRoute extends GoRouteData {
  const MoodTrackRoute();

  @override
  Widget build(BuildContext context, _) => const MoodTrackScreen<MoodTrackDao>();
}

class MoodTrackScreen<T extends MoodTrackDao> extends StatelessWidget {
  const MoodTrackScreen({
    super.key,
    this.appBarTitle,
    this.appBarDescription = '',
  });

  final String? appBarTitle;
  final String appBarDescription;

  T get _trackDao => registry.get<T>();

  DateTime get _now => getNowDateTimeLocal();

  @override
  Widget build(BuildContext context) {
    const pageSidePadding = 24.0;
    const pageHorizontalPadding = EdgeInsets.symmetric(horizontal: pageSidePadding);

    return NepanikarScreenWrapper(
      appBarTitle: appBarTitle ?? context.l10n.depression_mood,
      appBarDescription: appBarDescription,
      isModuleList: false,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: pageHorizontalPadding,
          child: StreamBuilder<MoodTrack?>(
            stream: _trackDao.latestMoodTrackStream,
            builder: (_, snapshot) {
              final latestMoodTrack = snapshot.data;
              return MoodPicker(
                activeMood: latestMoodTrack?.mood,
                onPick: _trackDao.saveMood,
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
            stream: _trackDao.allMoodTracksStream,
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
                  child: NepanikarDateRangePicker(
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
