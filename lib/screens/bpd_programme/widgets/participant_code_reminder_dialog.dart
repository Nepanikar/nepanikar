import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/participant_code_card.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/utils/registry.dart';

/// Puts the participant's number in front of them on the way to the exit
/// questionnaire.
///
/// The number is typed in seven weeks earlier and then never looked at again,
/// and the questionnaire opens in the browser, away from the app — so by the
/// time the field asking for it appears, there is nothing on screen to read it
/// off. This is the last moment it can be shown, and it is shown as a door
/// rather than a note, because a note further up the page is a note nobody
/// scrolls back to.
///
/// Someone who never entered their number can type it here. The dialog still
/// lets them through without one: a locked door at the end of seven weeks
/// costs a questionnaire, and the researcher can chase a missing number.
Future<bool> showBpdParticipantCodeReminder(BuildContext context) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (context) => const _ParticipantCodeReminderDialog(),
  );
  return result ?? false;
}

class _ParticipantCodeReminderDialog extends StatefulWidget {
  const _ParticipantCodeReminderDialog();

  @override
  State<_ParticipantCodeReminderDialog> createState() => _ParticipantCodeReminderDialogState();
}

class _ParticipantCodeReminderDialogState extends State<_ParticipantCodeReminderDialog> {
  late final Future<String?> _code = registry.get<UserSettingsDao>().getBpdParticipantCode();

  bool _copied = false;

  Future<void> _copy(String code) async {
    await Clipboard.setData(ClipboardData(text: code));
    if (!mounted) return;
    setState(() => _copied = true);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      title: const Text('Tvoje číslo účastníka'),
      content: FutureBuilder<String?>(
        future: _code,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const SizedBox(
              height: 60,
              child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
            );
          }

          final code = snapshot.data;
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (code == null) ...[
                Text(
                  'Ještě ho tu nemáš. Najdeš ho v e-mailu, který ti přišel na '
                  'začátku — a bez něj nejde tvoje odpovědi spárovat.',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.78),
                  ),
                ),
                const SizedBox(height: 14),
                const ParticipantCodeCard(),
              ] else ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(isDarkMode ? 0.2 : 0.08),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      code,
                      maxLines: 1,
                      softWrap: false,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 2,
                        color: isDarkMode ? Colors.white : NepanikarColors.dark,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: () => _copy(code),
                    icon: Icon(_copied ? Icons.check : Icons.copy_outlined, size: 18),
                    label: Text(_copied ? 'Zkopírováno' : 'Kopírovat'),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      foregroundColor: isDarkMode ? Colors.white : primaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Toto číslo prosím zadej do dotazníku — podle něj se tvoje '
                  'odpovědi spárují s těmi na začátku.',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.78),
                  ),
                ),
              ],
            ],
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Zpět'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Pokračovat na dotazník'),
        ),
      ],
    );
  }
}
