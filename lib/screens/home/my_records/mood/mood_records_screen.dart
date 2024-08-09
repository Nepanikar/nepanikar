import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/helpers/date_helpers.dart';
import 'package:nepanikar/providers/mood_chart_filter_provider.dart';
import 'package:nepanikar/providers/mood_heatmap_filter_provider.dart';
import 'package:nepanikar/providers/mood_state_provider.dart';
import 'package:nepanikar/screens/home/my_records/mood/mood_entry_detail_screen.dart';
import 'package:nepanikar/screens/home/my_records/mood/search_mood_entry.dart';
import 'package:nepanikar/screens/home/my_records/my_records_screen.dart';
import 'package:nepanikar/services/db/my_records/mood_track_dao.dart';
import 'package:nepanikar/services/db/my_records/mood_track_model.dart';
import 'package:nepanikar/services/notifications/notifications_service.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/mood/mood_chart.dart';
import 'package:nepanikar/widgets/mood/mood_entry_card.dart';
import 'package:nepanikar/widgets/mood/mood_heatmap.dart';
import 'package:nepanikar/widgets/mood/mood_picker.dart';
import 'package:nepanikar/widgets/nepanikar_date_range_picker.dart';
import 'package:nepanikar/widgets/nepanikar_dropdown.dart';
import 'package:provider/provider.dart';

class MoodRecordsRoute extends GoRouteData {
  const MoodRecordsRoute();

  @override
  Widget build(BuildContext context, _) =>
      const MoodRecordsScreen<MoodTrackDao>();
}

class MoodRecordsScreen<T extends MoodTrackDao> extends StatefulWidget {
  const MoodRecordsScreen({
    super.key,
  });

  @override
  State<MoodRecordsScreen<T>> createState() => _MoodRecordsScreenState<T>();
}

class _MoodRecordsScreenState<T extends MoodTrackDao>
    extends State<MoodRecordsScreen<T>> {
  int _entryCount = 5;
  int _currentPageIndex = 0;

  DateTime get _now => getNowDateTimeLocal();

  NotificationsService get _notificationsService =>
      registry.get<NotificationsService>();
  final PageController _pageController = PageController();

  //////////////// Build Method //////////////////////////
  @override
  Widget build(BuildContext context) {
    //Colors
    final containerColor = customColorsBasedOnDarkMode(
      context,
      NepanikarColors.containerD,
      NepanikarColors.white,
    );
    final textColor = customColorsBasedOnDarkMode(
        context, NepanikarColors.white, Colors.black);
    final arrowCanShiftColor = customColorsBasedOnDarkMode(
        context,
        NepanikarColors.white,
        null,
    );


    return Scaffold(
      appBar: _appBarForPageIndex(_currentPageIndex),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        children: [
          /////////////////////////////////////FIRST-VIEW///////////////////////////////////
          ///                         MOOD STATISTICS                        ///////////////
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Card(
                  color: containerColor,
                  child: Consumer<MoodState>(
                    builder: (_, provider, child) {
                      final allMoodTrackData = provider.moodEntries;
                      final firstMoodTrackDate =
                          allMoodTrackData.firstOrNull?.date;
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              context.l10n.mood_chart,
                              style: NepanikarFonts.bodyBlack
                                  .copyWith(color: textColor, fontSize: 30),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 24),
                            child: _buildChartWithFilters(
                              context,
                              allMoodTrackData: allMoodTrackData,
                              firstMoodTrackDate: firstMoodTrackDate,
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Card(
                  color: containerColor,
                  child: Consumer<MoodState>(
                    builder: (_, provider, child) {
                      final allMoodTrackData = provider.moodEntries;

                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              context.l10n.mood_heatmap,
                              style: NepanikarFonts.bodyBlack
                                  .copyWith(color: textColor, fontSize: 30),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 24),
                            child: _createHeatMap(context,
                                moodTracks: allMoodTrackData),
                          )
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          /////////////////////////////////////SECOND-VIEW////////////////////////////////
          ////////                         MOOD ENTRIES                        ///////////////
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: MoodPicker(
                    onPick: (mood) async {
                      final l10n = context.l10n;
                      unawaited(_notificationsService.rescheduleNotifications(l10n));
                    },
                  ),
                ),
                Consumer<MoodState>(
                  builder: (_, provider, child) {
                    if (_entryCount > provider.moodEntries.length) {
                      _entryCount = provider.moodEntries.length;
                    }
                    final moodEntries =
                    provider.moodEntries.reversed.take(_entryCount).toList();
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: moodEntries.length,
                      itemBuilder: (context, index) {
                        final moodEntry = moodEntries[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          child: MoodEntryCard(
                            dateTime: DateFormat('d. MMM yyyy, HH:mm')
                                .format(moodEntry.date),
                            moodIcon: moodEntry.mood.icon,
                            moodDescription: moodEntry.summary ?? '',
                            onTap: () {
                              Provider.of<MoodState>(context, listen: false)
                                  .selectMoodEntry(moodEntry);
                              context.push(const MoodEntryDetailRoute().location);
                            },
                            moodColor: null,
                          ),
                        );
                      },
                    );
                  },
                ),
                Consumer<MoodState>(
                  builder: (context, provider, child) {
                    final moodEntriesCount = provider.moodEntries.length;
                    if (_entryCount < moodEntriesCount) {
                      return SizedBox(
                        height: 40,
                        width: 70,
                        child: ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              _entryCount += 5;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                          ),
                          child: const Icon(Icons.more_horiz, size: 40),
                        ),
                      );
                    } else {
                      // You can return an empty Container or SizedBox if there's nothing to show
                      return SizedBox();
                    }
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  //////////////////// App Bar Function   //////////////////////////////

  AppBar _appBarForPageIndex(int index) {
    switch (index) {
      //Mood Chart AppBar
      case 0:
        return AppBar(
          title: Text(
            context.l10n.mood_statistics,
            style: NepanikarFonts.title2.copyWith(color: NepanikarColors.white),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              context.push(const MyRecordsRoute().location);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              tooltip: context.l10n.notifications,
              onPressed: () {
                setState(() {
                  _currentPageIndex += 1;
                  _pageController.jumpToPage(_currentPageIndex);
                });
              },
            ),
            IconButton(
              icon: ExcludeSemantics(
                  child:
                      Assets.icons.notificationBell.svg(color: Colors.white)),
              tooltip: context.l10n.notifications,
              onPressed: _notificationsService.checkPermission,
            ),
          ],
        );
      //Mood Entries AppBar
      case 1:
        return AppBar(
          title: Text(
            context.l10n.mood_entries,
            style: NepanikarFonts.title2.copyWith(color: NepanikarColors.white),
          ),
          leading: Container(
            margin: const EdgeInsets.only(left: 40),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                setState(() {
                  _currentPageIndex -= 1;
                  _pageController.jumpToPage(_currentPageIndex);
                });
              },
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                size: 35,
              ),
              onPressed: () {
                context.push(const SearchMoodEntryRoute().location);
              },
            ),
          ],
        );
      default:
        return AppBar(title: Text('Page $index'));
    }
  }

  ///////////////////////     Build Chart Function    //////////////////////////////
  Widget _buildChartWithFilters(
    BuildContext context, {
    required List<MoodTrack> allMoodTrackData,
    required DateTime? firstMoodTrackDate,
  }) {

    final containerColor = customColorsBasedOnDarkMode(
      context,
      NepanikarColors.containerD,
      NepanikarColors.white,
    );

    final arrowCanShiftColor = customColorsBasedOnDarkMode(
      context,
      NepanikarColors.white,
      null,
    );

    return Consumer<MoodChartFilterProvider>(
      builder: (_, moodChartFilterProvider, __) {
        final svgColor = svgColorBasedOnDarkMode(context);
        final activeFilter = moodChartFilterProvider.activeFilter;
        final dateRange = moodChartFilterProvider.customDateRange;
        final canShiftNextDateRange =
            moodChartFilterProvider.canShiftDateRangeNext;
        final currDateRangeStart =
            moodChartFilterProvider.customDateRange?.start;
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
            MoodChart(
              moodTrackData: filteredData,
              moodLabelBuilder: (m) => m.getSemanticsLabel(context),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: ExcludeSemantics(
                    child:
                        Assets.icons.navigation.arrowLeft.svg(color: svgColor),
                  ),
                  tooltip: context.l10n.filter_previous_time_period,
                  onPressed: () => moodChartFilterProvider
                      .shiftDateRange(DateRangeSwitch.previous),
                ),
                Expanded(
                  child: NepanikarDateRangePicker(
                    firstDate: firstMoodTrackDate == null
                        ? currDateRangeStart ??
                            DateTime(_now.year, _now.month - 1)
                        : currDateRangeStart != null &&
                                firstMoodTrackDate.isBefore(currDateRangeStart)
                            ? firstMoodTrackDate
                            : currDateRangeStart ??
                                DateTime(_now.year, _now.month - 1),
                    lastDate: getNowDateTimeLocal(),
                    activeRange: moodChartFilterProvider.customDateRange,
                    onPick: moodChartFilterProvider.setCustomDateRange,
                  ),
                ),
                IconButton(
                  icon: ExcludeSemantics(
                    child: Assets.icons.navigation.arrowRight.svg(
                      // color: !canShiftNextDateRange ? Colors.grey : null,
                      color: !canShiftNextDateRange ? containerColor : arrowCanShiftColor,
                    ),
                  ),
                  tooltip: context.l10n.filter_next_time_period,
                  onPressed: !canShiftNextDateRange
                      ? null
                      : () => moodChartFilterProvider
                          .shiftDateRange(DateRangeSwitch.next),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }

  /////////////////////////////Build Heat Map Function //////////////////////////////
  Widget _createHeatMap(BuildContext context,
      {required List<MoodTrack> moodTracks}) {
    return Consumer<MoodHeatmapFilterProvider>(builder: (_, provider, __) {
      final activeFilter = provider.activeFilter;
      final dateRange = provider.activeDateRange;
      final averageScoreForDay = calculateAverageMoodScores(moodTracks);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: NepanikarDropdown<HeatmapFilter>(
              items: HeatmapFilter.values,
              activeItem: activeFilter,
              labelBuilder: (item) => item.getLabel(context),
              onPick: provider.setFilter,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: MoodHeatmap(
              heatmapType: activeFilter,
              dateRange: dateRange,
              moodScores: averageScoreForDay,
            ),
          )
        ],
      );
    });
  }

  ////////////////////////////////////////////////////////////////////////////////
  //Helper function to calculate average score for each requested day of date range
  Map<DateTime, int> calculateAverageMoodScores(List<MoodTrack> moodTracks) {
    final Map<DateTime, List<int>> dayToScores = {};
    // Group scores by date
    for (final track in moodTracks) {
      final date = DateTime(track.date.year, track.date.month, track.date.day);
      final score = track.mood.getMoodScore(track.mood);
      dayToScores.putIfAbsent(date, () => []).add(score);
    }

    // Calculate average score for each date
    final Map<DateTime, int> dayToAverageScore = {};
    dayToScores.forEach((date, scores) {
      final averageScore = scores.reduce((a, b) => a + b) / scores.length;
      dayToAverageScore[date] = averageScore.round();
    });

    return dayToAverageScore;
  }
}
