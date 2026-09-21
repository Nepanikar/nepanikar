import 'package:flutter/material.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/screens/bpd_programme/bpd_access_code.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/utils/registry.dart';

/// Asks for the DBT programme access code.
///
/// Returns `true` once the programme has been unlocked, `null` if the user
/// backed out. The caller does not have to persist anything — this writes the
/// unlocked state itself.
Future<bool?> showBpdUnlockDialog(BuildContext context) {
  return showDialog<bool>(context: context, builder: (_) => const _BpdUnlockDialog());
}

class _BpdUnlockDialog extends StatefulWidget {
  const _BpdUnlockDialog();

  @override
  State<_BpdUnlockDialog> createState() => _BpdUnlockDialogState();
}

class _BpdUnlockDialogState extends State<_BpdUnlockDialog> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _showError = false;

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!isValidBpdAccessCode(_controller.text)) {
      setState(() => _showError = true);
      _focusNode.requestFocus();
      return;
    }
    await registry.get<UserSettingsDao>().unlockBpdProgramme();
    if (mounted) Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;
    // On the dark scaffold the primary colour is the background, so accents lighten.
    final accent = isDarkMode ? Colors.white : primaryColor;
    final textColor = isDarkMode ? Colors.white : NepanikarColors.dark;
    final l10n = context.l10n;

    return AlertDialog(
      backgroundColor: isDarkMode ? NepanikarColors.container(context) : NepanikarColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(l10n.bpd_unlock_title, style: NepanikarFonts.title3.copyWith(color: textColor)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.bpd_unlock_description,
            style: NepanikarFonts.bodySmallMedium.copyWith(
              color: textColor.withOpacity(0.8),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            focusNode: _focusNode,
            autofocus: true,
            textInputAction: TextInputAction.done,
            autocorrect: false,
            textCapitalization: TextCapitalization.characters,
            enableSuggestions: false,
            style: NepanikarFonts.bodyRoman.copyWith(color: textColor),
            decoration: InputDecoration(
              hintText: l10n.bpd_unlock_code_hint,
              errorText: _showError ? l10n.bpd_unlock_code_invalid : null,
              filled: true,
              fillColor: isDarkMode
                  ? Colors.white.withOpacity(0.08)
                  : NepanikarColors.primarySwatch(primaryColor).shade50,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: accent, width: 1.5),
              ),
            ),
            // Typing again is the user disagreeing with the error; drop it.
            onChanged: (_) {
              if (_showError) setState(() => _showError = false);
            },
            onSubmitted: (_) => _submit(),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.cancel, style: TextStyle(color: textColor.withOpacity(0.7))),
        ),
        TextButton(
          onPressed: _submit,
          child: Text(
            l10n.bpd_unlock_confirm,
            style: TextStyle(color: accent, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
