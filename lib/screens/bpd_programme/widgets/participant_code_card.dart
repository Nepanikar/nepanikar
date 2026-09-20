import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/utils/registry.dart';

/// Shows the participant their study code, with a one-tap copy.
///
/// It has to be legible at a glance and correct when typed by hand into a
/// questionnaire, so it is spaced out and set large; the copy button exists
/// because the entry form is usually opened on the same phone.
class ParticipantCodeCard extends StatefulWidget {
  const ParticipantCodeCard({super.key, this.caption});

  /// Line under the code. Onboarding explains what to do with it; the records
  /// screen, where it is only being looked up, passes nothing.
  final String? caption;

  @override
  State<ParticipantCodeCard> createState() => _ParticipantCodeCardState();
}

class _ParticipantCodeCardState extends State<ParticipantCodeCard> {
  late final Future<String> _code = registry.get<UserSettingsDao>().getOrCreateBpdParticipantCode();

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

    return FutureBuilder<String>(
      future: _code,
      builder: (context, snapshot) {
        final code = snapshot.data;
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.white.withOpacity(0.07) : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: primaryColor.withOpacity(0.35), width: 1.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tvoje číslo účastníka',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.4,
                  color: isDarkMode ? Colors.white70 : primaryColor,
                ),
              ),
              const SizedBox(height: 10),
              // The code gets the full width and the button sits under it.
              // Sharing a row cost it the second half: spaced-out bold 26pt
              // wrapped, and the row's fixed height ate the wrapped line, so
              // "CP3J-K4M2" showed as "CP3J-". Nothing about a code may depend
              // on there being room for it.
              SizedBox(
                height: 36,
                child: code == null
                    ? const Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      )
                    : FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          code,
                          maxLines: 1,
                          softWrap: false,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 3,
                            color: isDarkMode ? Colors.white : NepanikarColors.dark,
                          ),
                        ),
                      ),
              ),
              if (code != null)
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
              if (widget.caption != null) ...[
                const SizedBox(height: 10),
                Text(
                  widget.caption!,
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.45,
                    color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.7),
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
