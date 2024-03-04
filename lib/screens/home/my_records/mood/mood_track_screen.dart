import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/helpers/date_helpers.dart';
import 'package:nepanikar/helpers/semantics_helpers.dart';
import 'package:nepanikar/providers/mood_chart_filter_provider.dart';
import 'package:nepanikar/services/db/my_records/mood_track_dao.dart';
import 'package:nepanikar/services/db/my_records/mood_track_model.dart';
import 'package:nepanikar/services/notifications/notifications_service.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/mood/mood_chart.dart';
import 'package:nepanikar/widgets/mood/mood_data_table.dart';
import 'package:nepanikar/widgets/mood/mood_picker.dart';
import 'package:nepanikar/widgets/nepanikar_date_range_picker.dart';
import 'package:nepanikar/widgets/nepanikar_dropdown.dart';
import 'package:provider/provider.dart';

class MoodTrackRoute extends GoRouteData {
  const MoodTrackRoute();

  @override
  Widget build(BuildContext context, _) => const MoodTrackScreen<MoodTrackDao>();
}

class MoodTrackScreen<T extends MoodTrackDao> extends StatefulWidget {
  const MoodTrackScreen({
    super.key,
    this.appBarTitle,
    this.headerTitle,
    this.chartDescription,
    this.onTrackPickMessage,
    this.showMoodLabels = true,
  });

  final String? appBarTitle;
  final String? headerTitle;
  final String? onTrackPickMessage;
  final String? chartDescription;
  final bool showMoodLabels;

  @override
  State<MoodTrackScreen<T>> createState() => _MoodTrackScreenState<T>();
}

class _MoodTrackScreenState<T extends MoodTrackDao> extends State<MoodTrackScreen<T>> {
  T get _trackDao => registry.get<T>();

  NotificationsService get _notificationsService => registry.get<NotificationsService>();

  DateTime get _now => getNowDateTimeLocal();

  bool _showChart = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (mounted && context.isAccessibilityReaderEnabled) {
      setState(() {
        _showChart = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const pageSidePadding = 24.0;
    const pageHorizontalPadding = EdgeInsets.symmetric(horizontal: pageSidePadding);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle ?? context.l10n.depression_mood),
        actions: [
          IconButton(
            icon: ExcludeSemantics(child: Assets.icons.notificationBell.svg(color: Colors.white)),
            tooltip: context.l10n.notifications,
            onPressed: _notificationsService.checkPermission,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                      header: widget.headerTitle,
                      autoSizeTitle: false,
                      showLabels: widget.showMoodLabels,
                      onPick: (mood) async {
                        final l10n = context.l10n;
                        unawaited(_notificationsService.rescheduleNotifications(l10n));
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: pageHorizontalPadding,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    context.l10n.statistics,
                    style: NepanikarFonts.title2,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: pageHorizontalPadding,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.chartDescription ?? context.l10n.mood_track_chart_guide,
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
          ),
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
            SizedBox(height: _showChart ? 32 : 16),
            if (_showChart)
              MoodChart(
                moodTrackData: filteredData,
                moodLabelBuilder: (m) =>
                    widget.showMoodLabels ? m.getLabel(context) : m.getSemanticsLabel(context),
              )
            else
              MoodDataTable(
                moodTrackData: filteredData,
                moodLabelBuilder: (m) =>
                    widget.showMoodLabels ? m.getLabel(context) : m.getSemanticsLabel(context),
              ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: ExcludeSemantics(child: Assets.icons.navigation.arrowLeft.svg()),
                  tooltip: context.l10n.filter_previous_time_period,
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
                  icon: ExcludeSemantics(
                    child: Assets.icons.navigation.arrowRight.svg(
                      color: !canShiftNextDateRange ? Colors.grey : null,
                    ),
                  ),
                  tooltip: context.l10n.filter_next_time_period,
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
