import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/services/db/bpd/bpd_user_profile_model.dart';

/// Page 3/10 — Name + pronoun (source: tyzden-1.md §1, "Vaše křestní jméno").
class Day1PersonalizationPage extends StatefulWidget {
  const Day1PersonalizationPage({super.key, required this.onNext});

  final void Function(String name, BpdPronoun pronoun) onNext;

  @override
  State<Day1PersonalizationPage> createState() =>
      _Day1PersonalizationPageState();
}

class _Day1PersonalizationPageState extends State<Day1PersonalizationPage> {
  final _nameController = TextEditingController();
  BpdPronoun? _selectedPronoun;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  bool get _isValid =>
      _nameController.text.trim().isNotEmpty && _selectedPronoun != null;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;
    final textColor = isDarkMode ? Colors.white : NepanikarColors.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Text(
                    'Než se do programu pustíme',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Zajímá nás Vaše křestní jméno a jak chcete, aby Vás '
                    'Nepanikař oslovovalo.',
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: isDarkMode
                          ? Colors.white70
                          : NepanikarColors.dark.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Text(
                    'Jak ti máme říkat?',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _nameController,
                    onChanged: (_) => setState(() {}),
                    style: TextStyle(fontSize: 16, color: textColor),
                    decoration: InputDecoration(
                      hintText: 'Tvoje křestní jméno',
                      hintStyle: TextStyle(
                        color: isDarkMode ? Colors.white38 : Colors.grey.shade400,
                      ),
                      filled: true,
                      fillColor: isDarkMode
                          ? Colors.white.withOpacity(0.05)
                          : Colors.grey.shade50,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: isDarkMode
                              ? Colors.white.withOpacity(0.1)
                              : Colors.grey.shade300,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: primaryColor, width: 2),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Text(
                    'Jak chceš, aby tě Nepanikař oslovoval?',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      _PronounOption(
                        label: 'On',
                        selected: _selectedPronoun == BpdPronoun.he,
                        onTap: () =>
                            setState(() => _selectedPronoun = BpdPronoun.he),
                      ),
                      const SizedBox(width: 10),
                      _PronounOption(
                        label: 'Ona',
                        selected: _selectedPronoun == BpdPronoun.she,
                        onTap: () =>
                            setState(() => _selectedPronoun = BpdPronoun.she),
                      ),
                      const SizedBox(width: 10),
                      _PronounOption(
                        label: 'Oni',
                        selected: _selectedPronoun == BpdPronoun.they,
                        onTap: () =>
                            setState(() => _selectedPronoun = BpdPronoun.they),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: _isValid
                    ? () => widget.onNext(
                        _nameController.text.trim(),
                        _selectedPronoun!,
                      )
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: isDarkMode
                      ? Colors.white.withOpacity(0.1)
                      : Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: _isValid ? 2 : 0,
                ),
                child: const Text(
                  'Pokračovat',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PronounOption extends StatelessWidget {
  const _PronounOption({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected
                ? primaryColor.withOpacity(0.15)
                : (isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected
                  ? primaryColor
                  : (isDarkMode
                        ? Colors.white.withOpacity(0.1)
                        : Colors.grey.shade300),
              width: selected ? 2 : 1,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: selected
                  ? primaryColor
                  : (isDarkMode ? Colors.white : NepanikarColors.dark),
            ),
          ),
        ),
      ),
    );
  }
}
