import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/bpd_participant_code.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/utils/registry.dart';

/// Where the participant types the study number the researcher e-mailed them.
///
/// The number is the only thing tying someone's two questionnaires to their
/// study export, so this field is deliberately plain: no format rules, no
/// validation, no rejecting anything. The app does not know what the
/// researcher's numbers look like, and a field that refuses a valid number is
/// far worse than one that accepts a typo — she can see a typo in her list, but
/// she cannot see someone who gave up at the form.
class ParticipantCodeCard extends StatefulWidget {
  const ParticipantCodeCard({super.key, this.caption});

  /// Line under the field, explaining what the number is for where that is not
  /// already obvious from the surrounding screen.
  final String? caption;

  @override
  State<ParticipantCodeCard> createState() => _ParticipantCodeCardState();
}

class _ParticipantCodeCardState extends State<ParticipantCodeCard> {
  final TextEditingController _controller = TextEditingController();

  UserSettingsDao get _userSettingsDao => registry.get<UserSettingsDao>();

  /// What is actually in the database, so the card can say "uloženo" about the
  /// stored value rather than about whatever is on screen.
  String? _saved;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final stored = await _userSettingsDao.getBpdParticipantCode();
    if (!mounted) return;
    setState(() {
      _saved = stored;
      _controller.text = stored ?? '';
      _loaded = true;
    });
  }

  Future<void> _save(String value) async {
    await _userSettingsDao.setBpdParticipantCode(value);
    if (!mounted) return;
    setState(() => _saved = normalizeBpdParticipantCode(value).isEmpty
        ? null
        : normalizeBpdParticipantCode(value));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;
    final isStored = _saved != null && _saved == normalizeBpdParticipantCode(_controller.text);

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
          if (!_loaded)
            const SizedBox(
              height: 48,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            )
          else
            TextField(
              controller: _controller,
              onChanged: _save,
              textCapitalization: TextCapitalization.characters,
              maxLength: bpdParticipantCodeMaxLength,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                letterSpacing: 2,
                color: isDarkMode ? Colors.white : NepanikarColors.dark,
              ),
              decoration: InputDecoration(
                hintText: 'Zadej číslo z e-mailu',
                counterText: '',
                hintStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0,
                  color: isDarkMode ? Colors.white38 : NepanikarColors.dark.withOpacity(0.35),
                ),
                suffixIcon: isStored
                    ? const Icon(Icons.check_circle, color: Colors.green, size: 22)
                    : null,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          if (widget.caption != null) ...[
            const SizedBox(height: 6),
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
  }
}
