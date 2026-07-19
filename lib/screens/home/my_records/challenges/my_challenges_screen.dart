import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/home/my_records/challenges/challenge_card.dart';
import 'package:nepanikar/services/db/bpd/bpd_challenge_model.dart';
import 'package:nepanikar/services/db/bpd/bpd_challenge_tracker_dao.dart';
import 'package:nepanikar/services/notifications/notifications_service.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

part 'my_challenges_screen.g.dart';

@TypedGoRoute<MyChallengesRoute>(path: '/home/my-records/challenges')
class MyChallengesRoute extends GoRouteData with $MyChallengesRoute {
  const MyChallengesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const MyChallengesScreen();
}

/// "Moje výzvy" — daily tracker for the DBT programme challenges the user
/// committed to, across weeks, with per-challenge reminders.
class MyChallengesScreen extends StatefulWidget {
  const MyChallengesScreen({super.key});

  @override
  State<MyChallengesScreen> createState() => _MyChallengesScreenState();
}

class _MyChallengesScreenState extends State<MyChallengesScreen> {
  /// Selected SPOKO area filter; `null` shows all challenges.
  String? _areaFilter;

  BpdChallengeTrackerDao get _dao => registry.get<BpdChallengeTrackerDao>();

  NotificationsService get _notifications =>
      registry.get<NotificationsService>();

  Future<void> _toggleToday(BpdChallenge challenge) async {
    await _dao.toggleToday(challenge.id);
  }

  Future<void> _editReminder(
    BuildContext context,
    BpdChallenge challenge,
  ) async {
    final allowed = await _notifications.requestPermissionIfNeeded();
    if (!context.mounted) return;
    if (!allowed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Notifikace jsou vypnuté. Povol je v nastavení.'),
        ),
      );
      return;
    }
    final picked = await showTimePicker(
      context: context,
      initialTime: challenge.reminderTime ?? const TimeOfDay(hour: 20, minute: 0),
    );
    if (picked == null) return;
    await _dao.setReminder(id: challenge.id, time: picked);
    await _notifications.scheduleChallengeReminder(
      notificationId: challenge.notificationId,
      challengeText: challenge.text,
      hour: picked.hour,
      minute: picked.minute,
    );
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Připomínka nastavena na ${picked.format(context)}')),
    );
  }

  Future<void> _removeReminder(BpdChallenge challenge) async {
    await _dao.setReminder(id: challenge.id);
    await _notifications.cancelChallengeReminder(challenge.notificationId);
  }

  Future<void> _delete(BuildContext context, BpdChallenge challenge) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Odebrat výzvu?'),
        content: const Text('Výzva i její historie plnění se odstraní.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Zrušit'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Odebrat'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    if (challenge.hasReminder) {
      await _notifications.cancelChallengeReminder(challenge.notificationId);
    }
    await _dao.deleteChallenge(challenge.id);
  }

  /// Areas in programme order (week, then day), for the filter chips.
  List<String> _areasOf(List<BpdChallenge> challenges) {
    final sorted = challenges.toList()
      ..sort((a, b) {
        final byWeek = a.weekNumber.compareTo(b.weekNumber);
        return byWeek != 0 ? byWeek : a.dayNumber.compareTo(b.dayNumber);
      });
    final areas = <String>[];
    for (final c in sorted) {
      if (c.area.isNotEmpty && !areas.contains(c.area)) areas.add(c.area);
    }
    return areas;
  }

  @override
  Widget build(BuildContext context) {
    return NepanikarScreenWrapper(
      appBarTitle: 'Moje výzvy',
      children: [
        StreamBuilder<List<BpdChallenge>>(
          stream: _dao.watchAll(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Padding(
                padding: EdgeInsets.only(top: 60),
                child: Center(child: CircularProgressIndicator()),
              );
            }
            final challenges = snapshot.data ?? [];
            if (challenges.isEmpty) return const _EmptyState();

            final areas = _areasOf(challenges);
            // Drop a stale filter if its last challenge was removed.
            final areaFilter = areas.contains(_areaFilter) ? _areaFilter : null;
            final visible = areaFilter == null
                ? challenges
                : challenges.where((c) => c.area == areaFilter).toList();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top padding clears the 50px colored strip the wrapper
                // paints behind the page content.
                Padding(
                  padding: const EdgeInsets.only(top: 44, bottom: 14),
                  child: Text(
                    'Výzvy, které sis vybral/a v programu. Odškrtávej si je '
                    'každý den a nastav si připomínku.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.45,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : NepanikarColors.dark,
                    ),
                  ),
                ),
                if (areas.isNotEmpty) ...[
                  _AreaFilterChips(
                    areas: areas,
                    selected: areaFilter,
                    onSelected: (area) =>
                        setState(() => _areaFilter = area),
                  ),
                  const SizedBox(height: 14),
                ],
                ...visible.map(
                  (c) => ChallengeCard(
                    challenge: c,
                    onToggleToday: () => _toggleToday(c),
                    onEditReminder: () => _editReminder(context, c),
                    onRemoveReminder: () => _removeReminder(c),
                    onDelete: () => _delete(context, c),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _AreaFilterChips extends StatelessWidget {
  const _AreaFilterChips({
    required this.areas,
    required this.selected,
    required this.onSelected,
  });

  final List<String> areas;

  /// Currently selected area, or `null` for "Vše".
  final String? selected;
  final ValueChanged<String?> onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Row(
        children: [
          _FilterChip(
            label: 'Vše',
            isSelected: selected == null,
            onTap: () => onSelected(null),
          ),
          ...areas.map(
            (area) => Padding(
              padding: const EdgeInsets.only(left: 8),
              child: _FilterChip(
                label: area,
                isSelected: selected == area,
                onTap: () => onSelected(area),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? primaryColor
              : (isDarkMode
                    ? Colors.white.withOpacity(0.08)
                    : primaryColor.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: isSelected
                ? Colors.white
                : (isDarkMode ? Colors.white70 : primaryColor),
          ),
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.only(top: 64),
      child: Column(
        children: [
          Container(
            width: 84,
            height: 84,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.flag_outlined, size: 40, color: primaryColor),
          ),
          const SizedBox(height: 20),
          Text(
            'Zatím žádné výzvy',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Až si v programu vybereš nějakou výzvu, objeví se tady a budeš '
            'si ji moct odškrtávat každý den.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              height: 1.45,
              color: isDarkMode
                  ? Colors.white70
                  : NepanikarColors.dark.withOpacity(0.65),
            ),
          ),
        ],
      ),
    );
  }
}
