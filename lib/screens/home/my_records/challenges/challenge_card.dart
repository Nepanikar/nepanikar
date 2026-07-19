import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/services/db/bpd/bpd_challenge_model.dart';

/// A single tracked DBT challenge: source, daily check-off, 7-day history,
/// streak, an expandable month calendar and an optional reminder.
class ChallengeCard extends StatefulWidget {
  const ChallengeCard({
    super.key,
    required this.challenge,
    required this.onToggleToday,
    required this.onEditReminder,
    required this.onRemoveReminder,
    required this.onDelete,
  });

  final BpdChallenge challenge;
  final VoidCallback onToggleToday;
  final VoidCallback onEditReminder;
  final VoidCallback onRemoveReminder;
  final VoidCallback onDelete;

  @override
  State<ChallengeCard> createState() => _ChallengeCardState();
}

class _ChallengeCardState extends State<ChallengeCard> {
  bool _calendarExpanded = false;
  late DateTime _visibleMonth;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _visibleMonth = DateTime(now.year, now.month);
  }

  bool get _canGoNextMonth {
    final now = DateTime.now();
    return _visibleMonth.year < now.year ||
        (_visibleMonth.year == now.year && _visibleMonth.month < now.month);
  }

  void _shiftMonth(int delta) {
    setState(() {
      _visibleMonth = DateTime(_visibleMonth.year, _visibleMonth.month + delta);
    });
  }

  @override
  Widget build(BuildContext context) {
    final challenge = widget.challenge;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;
    final textColor = isDarkMode ? Colors.white : NepanikarColors.dark;
    final mutedColor =
        isDarkMode ? Colors.white54 : NepanikarColors.dark.withOpacity(0.5);
    final doneToday = challenge.isCompletedToday;
    final streak = challenge.currentStreak;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDarkMode
              ? Colors.white.withOpacity(0.1)
              : primaryColor.withOpacity(0.15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${challenge.weekNumber}. týden · ${challenge.area}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              if (streak > 0) ...[
                const Text('🔥', style: TextStyle(fontSize: 14)),
                const SizedBox(width: 3),
                Text(
                  '$streak',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: NepanikarColors.info,
                  ),
                ),
                const SizedBox(width: 8),
              ],
              _CardMenu(
                hasReminder: challenge.hasReminder,
                onEditReminder: widget.onEditReminder,
                onRemoveReminder: widget.onRemoveReminder,
                onDelete: widget.onDelete,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            challenge.text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              height: 1.35,
              color: textColor,
            ),
          ),
          const SizedBox(height: 14),
          _WeekHistory(challenge: challenge, primaryColor: primaryColor),
          const SizedBox(height: 6),
          InkWell(
            onTap: () =>
                setState(() => _calendarExpanded = !_calendarExpanded),
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _calendarExpanded
                        ? Icons.expand_less
                        : Icons.calendar_month_outlined,
                    size: 16,
                    color: mutedColor,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    _calendarExpanded ? 'Skrýt kalendář' : 'Celý kalendář',
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: mutedColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_calendarExpanded) ...[
            const SizedBox(height: 4),
            _MonthCalendar(
              challenge: challenge,
              month: _visibleMonth,
              canGoNext: _canGoNextMonth,
              onPrev: () => _shiftMonth(-1),
              onNext: () => _shiftMonth(1),
            ),
          ],
          const SizedBox(height: 10),
          _TodayButton(
            done: doneToday,
            primaryColor: primaryColor,
            onTap: widget.onToggleToday,
          ),
          const SizedBox(height: 10),
          _ReminderRow(
            challenge: challenge,
            onTap: widget.onEditReminder,
          ),
        ],
      ),
    );
  }
}

class _TodayButton extends StatelessWidget {
  const _TodayButton({
    required this.done,
    required this.primaryColor,
    required this.onTap,
  });

  final bool done;
  final Color primaryColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: done
          ? ElevatedButton.icon(
              onPressed: onTap,
              icon: const Icon(Icons.check_circle, size: 20),
              label: const Text(
                'Splněno dnes',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: NepanikarColors.success,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            )
          : OutlinedButton.icon(
              onPressed: onTap,
              icon: const Icon(Icons.check_circle_outline, size: 20),
              label: const Text(
                'Označit jako splněno',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: primaryColor,
                side: BorderSide(color: primaryColor, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
    );
  }
}

class _ReminderRow extends StatelessWidget {
  const _ReminderRow({required this.challenge, required this.onTap});

  final BpdChallenge challenge;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final hasReminder = challenge.hasReminder;
    final color = hasReminder
        ? NepanikarColors.secondary
        : (isDarkMode ? Colors.white60 : NepanikarColors.dark.withOpacity(0.55));
    final time = challenge.reminderTime;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Icon(
              hasReminder
                  ? Icons.notifications_active
                  : Icons.notifications_none,
              size: 18,
              color: color,
            ),
            const SizedBox(width: 8),
            Text(
              hasReminder && time != null
                  ? 'Připomínka ${time.format(context)}'
                  : 'Přidat připomínku',
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WeekHistory extends StatelessWidget {
  const _WeekHistory({required this.challenge, required this.primaryColor});

  final BpdChallenge challenge;
  final Color primaryColor;

  static const _weekdayLabels = ['Po', 'Út', 'St', 'Čt', 'Pá', 'So', 'Ne'];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final today = DateTime.now();
    // Last 7 days, oldest → today.
    final days = List.generate(
      7,
      (i) => DateTime(today.year, today.month, today.day)
          .subtract(Duration(days: 6 - i)),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: days.map((d) {
        final done = challenge.isCompletedOn(BpdChallenge.dateKey(d));
        // DateTime.weekday: Mon=1..Sun=7.
        final label = _weekdayLabels[d.weekday - 1];
        return Column(
          children: [
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: done
                    ? primaryColor
                    : (isDarkMode
                          ? Colors.white.withOpacity(0.07)
                          : primaryColor.withOpacity(0.08)),
                shape: BoxShape.circle,
              ),
              child: done
                  ? const Icon(Icons.check, size: 15, color: Colors.white)
                  : null,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: isDarkMode
                    ? Colors.white54
                    : NepanikarColors.dark.withOpacity(0.5),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}

/// Read-only month grid of completed days with prev/next month navigation.
class _MonthCalendar extends StatelessWidget {
  const _MonthCalendar({
    required this.challenge,
    required this.month,
    required this.canGoNext,
    required this.onPrev,
    required this.onNext,
  });

  final BpdChallenge challenge;

  /// First day of the displayed month.
  final DateTime month;
  final bool canGoNext;
  final VoidCallback onPrev;
  final VoidCallback onNext;

  static const _weekdayLabels = ['Po', 'Út', 'St', 'Čt', 'Pá', 'So', 'Ne'];
  static const _monthNames = [
    'Leden',
    'Únor',
    'Březen',
    'Duben',
    'Květen',
    'Červen',
    'Červenec',
    'Srpen',
    'Září',
    'Říjen',
    'Listopad',
    'Prosinec',
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;
    final mutedColor =
        isDarkMode ? Colors.white54 : NepanikarColors.dark.withOpacity(0.5);
    final textColor = isDarkMode ? Colors.white : NepanikarColors.dark;

    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    // Leading blanks so the 1st lands on its weekday column (Mon-first).
    final leadingBlanks = DateTime(month.year, month.month).weekday - 1;
    final cells = <DateTime?>[
      ...List<DateTime?>.filled(leadingBlanks, null),
      ...List.generate(
        daysInMonth,
        (i) => DateTime(month.year, month.month, i + 1),
      ),
    ];
    while (cells.length % 7 != 0) {
      cells.add(null);
    }
    final weeks = [
      for (var i = 0; i < cells.length; i += 7) cells.sublist(i, i + 7),
    ];

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    return Container(
      padding: const EdgeInsets.fromLTRB(8, 6, 8, 10),
      decoration: BoxDecoration(
        color: isDarkMode
            ? Colors.white.withOpacity(0.04)
            : primaryColor.withOpacity(0.04),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              _NavArrow(
                icon: Icons.chevron_left,
                enabled: true,
                onTap: onPrev,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    '${_monthNames[month.month - 1]} ${month.year}',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                  ),
                ),
              ),
              _NavArrow(
                icon: Icons.chevron_right,
                enabled: canGoNext,
                onTap: onNext,
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: _weekdayLabels
                .map(
                  (l) => Expanded(
                    child: Center(
                      child: Text(
                        l,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: mutedColor,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 4),
          ...weeks.map(
            (week) => Row(
              children: week.map((day) {
                if (day == null) {
                  return const Expanded(child: SizedBox(height: 34));
                }
                final done =
                    challenge.isCompletedOn(BpdChallenge.dateKey(day));
                final isToday = day == today;
                final isFuture = day.isAfter(today);
                return Expanded(
                  child: SizedBox(
                    height: 34,
                    child: Center(
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: done ? primaryColor : Colors.transparent,
                          shape: BoxShape.circle,
                          border: isToday && !done
                              ? Border.all(color: primaryColor, width: 1.5)
                              : null,
                        ),
                        child: Center(
                          child: Text(
                            '${day.day}',
                            style: TextStyle(
                              fontSize: 11.5,
                              fontWeight:
                                  done || isToday ? FontWeight.w800 : FontWeight.w500,
                              color: done
                                  ? Colors.white
                                  : (isFuture
                                        ? mutedColor.withOpacity(0.4)
                                        : textColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavArrow extends StatelessWidget {
  const _NavArrow({
    required this.icon,
    required this.enabled,
    required this.onTap,
  });

  final IconData icon;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final color = isDarkMode ? Colors.white70 : NepanikarColors.dark;

    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Icon(
          icon,
          size: 20,
          color: enabled ? color : color.withOpacity(0.25),
        ),
      ),
    );
  }
}

class _CardMenu extends StatelessWidget {
  const _CardMenu({
    required this.hasReminder,
    required this.onEditReminder,
    required this.onRemoveReminder,
    required this.onDelete,
  });

  final bool hasReminder;
  final VoidCallback onEditReminder;
  final VoidCallback onRemoveReminder;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      onSelected: (value) {
        switch (value) {
          case 'reminder':
            onEditReminder();
          case 'remove_reminder':
            onRemoveReminder();
          case 'delete':
            onDelete();
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'reminder',
          child: Text(hasReminder ? 'Změnit připomínku' : 'Přidat připomínku'),
        ),
        if (hasReminder)
          const PopupMenuItem(
            value: 'remove_reminder',
            child: Text('Zrušit připomínku'),
          ),
        const PopupMenuItem(
          value: 'delete',
          child: Text('Odebrat výzvu'),
        ),
      ],
      // A plain child (instead of `icon:`) avoids the built-in 48px IconButton
      // box, so the dots hug the card's right edge.
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
        child: Icon(
          Icons.more_vert,
          size: 20,
          color: isDarkMode
              ? Colors.white60
              : NepanikarColors.dark.withOpacity(0.5),
        ),
      ),
    );
  }
}
