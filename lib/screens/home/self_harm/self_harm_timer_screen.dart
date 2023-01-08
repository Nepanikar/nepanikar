import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/helpers/localization_helpers.dart';
import 'package:nepanikar/screens/main/contacts_screen.dart';
import 'package:nepanikar/services/db/self_harm/self_harm_timer_dao.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/adaptive_dialog.dart';
import 'package:nepanikar/widgets/nepanikar_button.dart';
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

  @override
  Widget build(BuildContext context) {
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
                              // TODO: l10n
                              if (isTimerRunning) ...[
                                _buildCardTitle('Vedeš si skvěle.\nJen tak dál!'),
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
                                  onTap: () async => _selfHarmTimerDao.startSelfHarmTimer(),
                                  expandToContentWidth: true,
                                  text: context.l10n.start,
                                )
                              else
                                NepanikarButton(
                                  onTap: () {
                                    showAdaptiveDialog(
                                      context,
                                      description: context.l10n.really_stop_timer,
                                      onOk: () async {
                                        await _selfHarmTimerDao.stopSelfHarmTimer();
                                        await _selfHarmTimerDao.startSelfHarmTimer();
                                        // ignore: use_build_context_synchronously
                                        await showAdaptiveDialog(
                                          context,
                                          description: context.l10n.need_help,
                                          onOk: () => context.push(const ContactsRoute().location),
                                          okLabel: context.l10n.mood_help_yes,
                                          cancelLabel: context.l10n.mood_help_no,
                                        );
                                      },
                                      okLabel: context.l10n.mood_help_yes,
                                      cancelLabel: context.l10n.mood_help_no,
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

  Align _buildCardTitle(String text) {
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

    // TODO: l10n
    if (dateTimeRange == null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTextSpan(
                value: '-',
                label: 'Roků ',
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

    // TODO: l10n
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
