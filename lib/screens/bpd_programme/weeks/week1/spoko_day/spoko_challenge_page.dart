import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/spoko_day/spoko_day_data.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/services/db/bpd/bpd_challenge_tracker_dao.dart';
import 'package:nepanikar/services/db/bpd/bpd_challenges_dao.dart';
import 'package:nepanikar/services/notifications/notifications_service.dart';
import 'package:nepanikar/utils/registry.dart';

/// Page 2/3 of a SPOKO day — challenge pick-list. Picked items are persisted
/// (voluntarily) per week + day. "Future challenge" is a placeholder until the
/// dedicated challenge-tracking feature exists.
class SpokoChallengePage extends StatefulWidget {
  const SpokoChallengePage({super.key, required this.data, required this.onNext});

  final SpokoDayData data;
  final VoidCallback onNext;

  @override
  State<SpokoChallengePage> createState() => _SpokoChallengePageState();
}

class _SpokoChallengePageState extends State<SpokoChallengePage> {
  final Set<String> _selected = {};

  BpdChallengesDao get _challengesDao => registry.get<BpdChallengesDao>();

  BpdChallengeTrackerDao get _trackerDao =>
      registry.get<BpdChallengeTrackerDao>();

  @override
  void initState() {
    super.initState();
    _loadSaved();
  }

  Future<void> _loadSaved() async {
    final saved = await _challengesDao.getSelectedChallenges(
      weekNumber: widget.data.weekNumber,
      dayNumber: widget.data.dayNumber,
    );
    if (mounted && saved.isNotEmpty) {
      setState(() => _selected.addAll(saved));
    }
  }

  void _toggle(String item) {
    setState(() {
      if (_selected.contains(item)) {
        _selected.remove(item);
      } else {
        _selected.add(item);
      }
    });
  }

  Future<void> _onContinue() async {
    final selected = _selected.toList();
    await _challengesDao.saveSelectedChallenges(
      weekNumber: widget.data.weekNumber,
      dayNumber: widget.data.dayNumber,
      items: selected,
    );
    final removedReminderIds = await _trackerDao.syncDaySelection(
      weekNumber: widget.data.weekNumber,
      dayNumber: widget.data.dayNumber,
      area: widget.data.areaLabel,
      selectedTexts: selected,
    );
    final notifications = registry.get<NotificationsService>();
    for (final id in removedReminderIds) {
      await notifications.cancelChallengeReminder(id);
    }
    widget.onNext();
  }

  void _onFutureChallenge() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Tato funkce se připravuje.')));
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final secondaryText = isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.7);

    return DayPageBase(
      buttonText: 'Pokračovat',
      onButtonPressed: _onContinue,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text(
            'Dnešní výzva',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.data.challengeLead,
            style: TextStyle(fontSize: 14, height: 1.5, color: secondaryText),
          ),
          const SizedBox(height: 18),
          ...widget.data.challengeItems.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: _ChallengeTile(
                text: item,
                selected: _selected.contains(item),
                onTap: () => _toggle(item),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            widget.data.futureLead,
            style: TextStyle(fontSize: 14, height: 1.5, color: secondaryText),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: _onFutureChallenge,
            style: OutlinedButton.styleFrom(
              foregroundColor: NepanikarColors.secondary,
              minimumSize: const Size(double.infinity, 52),
              side: const BorderSide(color: NepanikarColors.secondary, width: 1.5),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.flag_outlined, size: 20),
                SizedBox(width: 8),
                Flexible(
                  child: Text(
                    'Nastavit výzvu i do budoucna',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward, size: 18),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _ChallengeTile extends StatelessWidget {
  const _ChallengeTile({required this.text, required this.selected, required this.onTap});

  final String text;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: selected
              ? primaryColor.withOpacity(0.12)
              : (isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected
                ? primaryColor
                : (isDarkMode ? Colors.white.withOpacity(0.15) : primaryColor.withOpacity(0.2)),
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: selected ? primaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: selected ? primaryColor : primaryColor.withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: selected ? const Icon(Icons.check, size: 15, color: Colors.white) : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 1.35,
                  color: isDarkMode ? Colors.white : NepanikarColors.dark,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
