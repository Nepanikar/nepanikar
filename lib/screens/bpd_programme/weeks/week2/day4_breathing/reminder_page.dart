import 'package:flutter/material.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/services/notifications/notification_type.dart';
import 'package:nepanikar/services/notifications/notifications_service.dart';
import 'package:nepanikar/utils/registry.dart';

/// Page offering the daily mindfulness reminder the programme introduces on
/// Day 4 ("Čas na všímavost – věnuj teď tři minuty všímavosti. Nezapomeň co a
/// jak.", source: §3).
///
/// Opt-in on purpose: scheduling a daily notification without asking would be a
/// surprise, and notification permission has to be requested anyway.
class ReminderPage extends StatefulWidget {
  const ReminderPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  State<ReminderPage> createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  static const _defaultTime = TimeOfDay(hour: 17, minute: 0);

  bool _isEnabled = false;
  TimeOfDay _time = _defaultTime;
  bool _isLoading = true;

  NotificationsService get _notifications => registry.get<NotificationsService>();

  @override
  void initState() {
    super.initState();
    _loadState();
  }

  Future<void> _loadState() async {
    final time = await _notifications.getMindfulnessReminderTime();
    if (!mounted) return;
    setState(() {
      _isEnabled = time != null;
      _time = time ?? _defaultTime;
      _isLoading = false;
    });
  }

  Future<void> _toggle(bool enabled) async {
    final l10n = context.l10n;
    if (!enabled) {
      await _notifications.disableMindfulnessReminder(l10n);
      if (mounted) setState(() => _isEnabled = false);
      return;
    }

    final allowed = await _notifications.requestPermissionIfNeeded();
    if (!mounted) return;
    if (!allowed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Notifikace jsou vypnuté. Povol je v nastavení.')),
      );
      return;
    }
    await _notifications.enableMindfulnessReminder(l10n, time: _time);
    if (mounted) setState(() => _isEnabled = true);
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(context: context, initialTime: _time);
    if (picked == null || !mounted) return;
    setState(() => _time = picked);
    if (_isEnabled) {
      await _notifications.enableMindfulnessReminder(context.l10n, time: picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return DayPageBase(
      buttonText: 'Pokračovat',
      onButtonPressed: widget.onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          const SectionHeader(icon: Icons.notifications_active_outlined, title: 'Čas na všímavost'),
          const SizedBox(height: 18),
          Text(
            'Od dneška ti můžeme každý den poslat krátkou připomínku, ať na '
            'všímavost nezapomeneš. Kdykoliv ji můžeš vypnout v nastavení.',
            style: TextStyle(
              fontSize: 16,
              height: 1.55,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.85),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: primaryColor.withOpacity(0.3)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.notifications_none, color: primaryColor, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      NotificationType.mindfulnessReminder.customTitle!,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  NotificationType.mindfulnessReminderBody,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.45,
                    color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          if (!_isLoading) ...[
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              // Matches the app's own notification settings screen; a
              // primary-coloured thumb on a primary-coloured track would be
              // invisible in the "on" state.
              activeTrackColor: Theme.of(context).highlightColor,
              value: _isEnabled,
              onChanged: _toggle,
              title: Text(
                'Posílat připomínku každý den',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: isDarkMode ? Colors.white : NepanikarColors.dark,
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: _pickTime,
              leading: Icon(Icons.schedule, color: primaryColor),
              title: Text(
                'Čas připomínky',
                style: TextStyle(
                  fontSize: 15,
                  color: isDarkMode ? Colors.white : NepanikarColors.dark,
                ),
              ),
              trailing: Text(
                _time.format(context),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor),
              ),
            ),
          ],
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
