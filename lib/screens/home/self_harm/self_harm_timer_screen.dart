import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/helpers/localization_helpers.dart';
import 'package:nepanikar/screens/main/contacts_screen.dart';
import 'package:nepanikar/services/db/self_harm/self_harm_timer_dao.dart';
import 'package:nepanikar/utils/extensions.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/nepanikar_button.dart';
import 'package:nepanikar/widgets/nepanikar_dialog.dart';
import 'package:nepanikar/widgets/nepanikar_horizontal_divider.dart';
import 'package:time_machine/time_machine.dart';
import 'package:timer_builder/timer_builder.dart';

class SelfHarmTimerRoute extends GoRouteData {
  const SelfHarmTimerRoute();

  @override
  Widget build(BuildContext context, _) => const SelfHarmTimerScreen();
}

class SelfHarmTimerScreen extends StatelessWidget {
  const SelfHarmTimerScreen({super.key});

  SelfHarmTimerDao get _selfHarmTimerDao => registry.get<SelfHarmTimerDao>();

  DateTime get _now => DateTime.now();

  String _getMotivationTitle(BuildContext context, Duration diffFromStartDateTime) {
    final l10n = context.l10n;
    if (diffFromStartDateTime.inMinutes < 60) {
      return l10n.self_harm_timer_begin;
    } else if (diffFromStartDateTime.inHours < 24) {
      return l10n.self_harm_timer_hour;
    } else if (diffFromStartDateTime.inDays < 7) {
      return l10n.self_harm_timer_day;
    } else if (diffFromStartDateTime.inDays < 30) {
      return l10n.self_harm_timer_week;
    } else if (diffFromStartDateTime.inDays < 90) {
      return l10n.self_harm_timer_month;
    } else if (diffFromStartDateTime.inDays < 180) {
      return l10n.self_harm_timer_3_months;
    } else if (diffFromStartDateTime.inDays < 365) {
      return l10n.self_harm_timer_half_year;
    } else {
      return l10n.self_harm_timer_year;
    }
  }

  @override
  Widget build(BuildContext context) {
    final analytics = registry.get<FirebaseAnalytics>();
    return Scaffold(
      backgroundColor: NepanikarColors.primary,
      appBar: AppBar(title: Text(context.l10n.self_harm_timer)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: TimerBuilder.periodic(
                    const Duration(seconds: 30),
                    builder: (_) {
                      return StreamBuilder<DateTime?>(
                        stream: _selfHarmTimerDao.selfHarmTimerStartDateTimeStream,
                        builder: (_, snapshot) {
                          final startDateTime = snapshot.data;
                          final isTimerRunning = startDateTime != null;
                          bool showSecsTimer() {
                            final durationInSec =
                                isTimerRunning ? _now.difference(startDateTime).inSeconds : null;
                            return durationInSec != null && durationInSec < 60;
                          }

                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (isTimerRunning) ...[
                                _buildCardTitle(
                                  _getMotivationTitle(context, _now.difference(startDateTime)),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: NepanikarHorizontalDivider(),
                                ),
                              ],
                              TimerBuilder.periodic(
                                Duration(seconds: showSecsTimer() ? 1 : 60),
                                builder: (_) {
                                  return _buildTimeTextSection(
                                    context,
                                    dateTimeRange: isTimerRunning
                                        ? DateTimeRange(start: startDateTime.toLocal(), end: _now)
                                        : null,
                                    showSeconds: showSecsTimer(),
                                  );
                                },
                              ),
                              const SizedBox(height: 16),
                              if (!isTimerRunning)
                                NepanikarButton(
                                  onTap: () async {
                                    await _selfHarmTimerDao.startSelfHarmTimer();
                                    unawaited(analytics.logEvent(name: 'start_self_harm_timer'));
                                  },
                                  expandToContentWidth: true,
                                  text: context.l10n.start,
                                )
                              else
                                NepanikarButton(
                                  onTap: () {
                                    context.showOkCancelNepanikarDialog(
                                      text: context.l10n.really_stop_timer,
                                      onPrimaryBtnTap: (context) async {
                                        final goRouter = GoRouter.of(context);
                                        final l10n = context.l10n;
                                        await _selfHarmTimerDao.stopSelfHarmTimer();
                                        await _selfHarmTimerDao.startSelfHarmTimer();
                                        unawaited(
                                          analytics.logEvent(name: 'restart_self_harm_timer'),
                                        );
                                        if (context.mounted) {
                                          context.showOkCancelNepanikarDialog(
                                            text: l10n.need_help,
                                            onPrimaryBtnTap: (context) =>
                                                goRouter.push(const ContactsRoute().location),
                                            primaryBtnLabel: l10n.mood_help_yes,
                                            secondaryBtnLabel: l10n.mood_help_no,
                                            defaultAction: DialogDefaultAction.both,
                                          );
                                        }
                                      },
                                      primaryBtnLabel: context.l10n.mood_help_yes,
                                      secondaryBtnLabel: context.l10n.mood_help_no,
                                    );
                                  },
                                  expandToContentWidth: true,
                                  text: context.l10n.stop,
                                ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildCardTitle(context.l10n.self_harm_record),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: NepanikarHorizontalDivider(),
                      ),
                      StreamBuilder<DateTimeRange?>(
                        stream: _selfHarmTimerDao.selfHarmTimerRecordStream,
                        builder: (_, snapshot) {
                          return _buildTimeTextSection(context, dateTimeRange: snapshot.data);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardTitle(String text) {
    return Align(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: NepanikarFonts.title3.copyWith(
          fontWeight: FontWeight.w900,
          color: NepanikarColors.dark,
        ),
      ),
    );
  }

  Widget _buildTimeTextSection(
    BuildContext context, {
    DateTimeRange? dateTimeRange,
    bool showSeconds = false,
  }) {
    final valueTextStyle = NepanikarFonts.title2.copyWith(color: NepanikarColors.primary);
    final labelTextStyle = NepanikarFonts.bodyRoman.copyWith(color: NepanikarColors.primary);

    Widget buildTextSpan({
      required String value,
      required String label,
      bool labelStyleSameAsValueStyle = false,
    }) {
      return Text.rich(
        TextSpan(
          children: [
            TextSpan(text: value, style: valueTextStyle),
            TextSpan(
              text: ' $label',
              style: labelStyleSameAsValueStyle ? valueTextStyle : labelTextStyle,
            ),
          ],
        ),
      );
    }

    if (dateTimeRange == null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTextSpan(
                value: '-',
                label: '${context.l10n.plural_year_other} ',
                labelStyleSameAsValueStyle: true,
              ),
              buildTextSpan(
                value: '-',
                label: context.l10n.months,
                labelStyleSameAsValueStyle: true,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildTextSpan(value: '-', label: context.l10n.days),
              buildTextSpan(value: '-', label: context.l10n.hours),
              buildTextSpan(value: '-', label: context.l10n.minutes),
            ],
          ),
        ],
      );
    }

    final a = LocalDateTime.dateTime(dateTimeRange.start);
    final b = LocalDateTime.dateTime(dateTimeRange.end);

    final period = b.periodSince(a);
    final yearsDiff = period.years;
    final monthsDiff = period.months;
    final daysDiff = period.days;
    final hoursDiff = period.hours;
    final minutesDiff = period.minutes;
    final secondsDiff = period.seconds;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (yearsDiff > 0)
              buildTextSpan(
                value: yearsDiff.toString(),
                label: '${pluralYears(context, value: yearsDiff)} ',
                labelStyleSameAsValueStyle: true,
              ),
            if (yearsDiff > 0 || monthsDiff > 0)
              buildTextSpan(
                value: monthsDiff.toString(),
                label: pluralMonths(context, value: monthsDiff),
                labelStyleSameAsValueStyle: true,
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if ([yearsDiff, monthsDiff, daysDiff].any((e) => e > 0))
              buildTextSpan(
                value: daysDiff.toString(),
                label: pluralDays(context, value: daysDiff),
              ),
            if ([yearsDiff, monthsDiff, daysDiff, hoursDiff].any((e) => e > 0))
              buildTextSpan(
                value: hoursDiff.toString(),
                label: pluralHours(context, value: hoursDiff),
              ),
            buildTextSpan(
              value: minutesDiff.toString(),
              label: pluralMinutes(context, value: minutesDiff),
            ),
            if (showSeconds && secondsDiff < 60)
              buildTextSpan(
                value: secondsDiff.toString(),
                label: pluralSeconds(context, value: secondsDiff),
              ),
          ],
        ),
      ],
    );
  }
}
