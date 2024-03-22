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
import 'package:nepanikar/providers/mood_entry_provider.dart';
import 'package:nepanikar/screens/home/my_records/mood/mood_entry_detail_screen.dart';
import 'package:nepanikar/screens/home/my_records/mood/search_mood_entry.dart';
import 'package:nepanikar/services/db/my_records/mood_track_dao.dart';
import 'package:nepanikar/services/db/my_records/mood_track_model.dart';
import 'package:nepanikar/services/notifications/notifications_service.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/mood/mood_chart.dart';
import 'package:nepanikar/widgets/mood/mood_data_table.dart';
import 'package:nepanikar/widgets/mood/mood_entry_card.dart';
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
  final _showChart = true;

  int _entryCount = 5;

  DateTime get _now => getNowDateTimeLocal();

  T get _trackDao => registry.get<T>();

  NotificationsService get _notificationsService =>
      registry.get<NotificationsService>();

  Future<void> _loadMoreEntries() async {
    setState(() {
      _entryCount += 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    const pageSidePadding = 24.0;
    const pageHorizontalPadding =
    EdgeInsets.symmetric(horizontal: pageSidePadding);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: ExcludeSemantics(
                child: Assets.icons.notificationBell.svg(color: Colors.white)),
            tooltip: context.l10n.notifications,
            onPressed: _notificationsService.checkPermission,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              Card(
                color: NepanikarColors.containerD,
                child: StreamBuilder<List<MoodTrack>>(
                  stream: _trackDao.allMoodTracksStream,
                  builder: (_, snapshot) {
                    final allMoodTrackData = snapshot.data ?? [];
                    final firstMoodTrackDate =
                        allMoodTrackData.firstOrNull?.date;
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "Mood Chart",
                            style: NepanikarFonts.bodyBlack.copyWith(
                                color: NepanikarColors.white, fontSize: 30),
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
              const SizedBox(height: 10),
              Stack(
                children: [
                  // Center the title within the stack
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Mood Entries",
                      style: NepanikarFonts.title2.copyWith(color: NepanikarColors.white),
                    ),
                  ),
                  // Position the search icon on the right end of the AppBar
                  Positioned(
                    right: 20,
                    top: -8,// Adjust this value if you want the icon more to the left
                    child: IconButton(
                      icon: Icon(Icons.search, size: 35,),
                      onPressed: () {
                        context.push(const SearchMoodEntryRoute().location);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              StreamBuilder<List<MoodTrack>>(
                stream: _trackDao.mostRecentMoodsTrackStream(_entryCount),
                builder: (_, snapshot) {
                  final moodEntries = snapshot.data ?? [];
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: moodEntries.length,
                    itemBuilder: (context, index) {
                      final moodEntry = moodEntries[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: MoodEntryCard(
                          dateTime: DateFormat('d. MMM yyyy, HH:mm')
                              .format(moodEntry.date),
                          moodIcon: moodEntry.mood.icon,
                          moodDescription:
                          moodEntry.summary ?? 'No description provided',
                          onTap: () {
                            Provider.of<MoodEntryProvider>(
                                context, listen: false).selectMoodEntry(
                                moodEntry);
                            context.push(const MoodEntryDetailRoute().location);
                          },
                          moodColor: null,
                        ),
                      );
                    },
                  );
                },
              ),
              FutureBuilder<int>(
                future: _trackDao.getCountMoodTracks(),
                // Assuming this method returns the total number of mood tracks
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    final totalMoodCount = snapshot.data!;
                    if (_entryCount < totalMoodCount) {
                      return SizedBox(
                        height: 40,
                        width: 70,
                        child: ElevatedButton(
                          onPressed: _loadMoreEntries,
                          // Your method to load more entries
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                          ),
                          child: Icon(Icons.more_horiz, size: 40),
                        ),
                      );
                    }
                  }
                  return SizedBox
                      .shrink();
                },
              ),
              const SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChartWithFilters(BuildContext context, {
    required List<MoodTrack> allMoodTrackData,
    required DateTime? firstMoodTrackDate,
  }) {
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
            SizedBox(height: _showChart ? 32 : 16),
            if (_showChart)
              MoodChart(
                moodTrackData: filteredData,
                moodLabelBuilder: (m) => m.getSemanticsLabel(context),
              )
            else
              MoodDataTable(
                moodTrackData: filteredData,
                moodLabelBuilder: (m) => m.getSemanticsLabel(context),
              ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: ExcludeSemantics(
                      child: Assets.icons.navigation.arrowLeft
                          .svg(color: svgColor)),
                  tooltip: context.l10n.filter_previous_time_period,
                  onPressed: () =>
                      moodChartFilterProvider
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
                      color: !canShiftNextDateRange ? null : svgColor,
                    ),
                  ),
                  tooltip: context.l10n.filter_next_time_period,
                  onPressed: !canShiftNextDateRange
                      ? null
                      : () =>
                      moodChartFilterProvider
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
}
