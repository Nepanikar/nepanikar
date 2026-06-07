import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/services/db/bpd/bpd_user_profile_model.dart';

class OnboardingPersonalizationPage extends StatefulWidget {
  const OnboardingPersonalizationPage({super.key, required this.onComplete});

  final void Function(String name, BpdPronoun pronoun) onComplete;

  @override
  State<OnboardingPersonalizationPage> createState() =>
      _OnboardingPersonalizationPageState();
}

class _OnboardingPersonalizationPageState
    extends State<OnboardingPersonalizationPage> {
  final _nameController = TextEditingController();
  BpdPronoun? _selectedPronoun;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  bool get _isFormValid =>
      _nameController.text.trim().isNotEmpty && _selectedPronoun != null;

  void _handleComplete() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_selectedPronoun != null) {
        widget.onComplete(_nameController.text.trim(), _selectedPronoun!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    // Title
                    Text(
                      'Povedzte nám o sebe',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : NepanikarColors.dark,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 12),

                    Text(
                      'Tieto informácie nám pomôžu prispôsobiť program vašim potrebám.',
                      style: TextStyle(
                        fontSize: 15,
                        color: isDarkMode
                            ? Colors.white70
                            : NepanikarColors.dark.withOpacity(0.7),
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 40),

                    // Name input
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Vaše meno',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode
                              ? Colors.white
                              : NepanikarColors.dark,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: 'Zadajte vaše meno',
                        hintStyle: TextStyle(
                          color: isDarkMode
                              ? Colors.white38
                              : Colors.grey.shade400,
                        ),
                        filled: true,
                        fillColor: isDarkMode
                            ? Colors.white.withOpacity(0.05)
                            : Colors.grey.shade50,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: isDarkMode
                                ? Colors.white.withOpacity(0.1)
                                : Colors.grey.shade300,
                          ),
                        ),
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
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : NepanikarColors.dark,
                        fontSize: 16,
                      ),
                      onChanged: (_) => setState(() {}),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Prosím zadajte vaše meno';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 32),

                    // Pronoun selection
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Ako vás máme oslovovat?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode
                              ? Colors.white
                              : NepanikarColors.dark,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    Row(
                      children: [
                        _buildPronounOption(
                          pronoun: BpdPronoun.he,
                          label: 'On',
                          example: '(urobil si, zvládol si)',
                          primaryColor: primaryColor,
                          isDarkMode: isDarkMode,
                        ),
                        const SizedBox(width: 10),
                        _buildPronounOption(
                          pronoun: BpdPronoun.she,
                          label: 'Ona',
                          example: '(urobila si, zvládla si)',
                          primaryColor: primaryColor,
                          isDarkMode: isDarkMode,
                        ),
                        const SizedBox(width: 10),
                        _buildPronounOption(
                          pronoun: BpdPronoun.they,
                          label: 'Oni',
                          example: '(urobili ste, zvládli ste)',
                          primaryColor: primaryColor,
                          isDarkMode: isDarkMode,
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // Privacy note
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: isDarkMode
                            ? Colors.white.withOpacity(0.05)
                            : Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.lock_outline,
                            color: isDarkMode
                                ? Colors.white54
                                : Colors.grey.shade600,
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Vaše údaje zostávajú iba vo vašom zariadení.',
                              style: TextStyle(
                                fontSize: 13,
                                color: isDarkMode
                                    ? Colors.white54
                                    : Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),

            // Complete button - fixed at bottom
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: _isFormValid ? _handleComplete : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: isDarkMode
                        ? Colors.white.withOpacity(0.1)
                        : Colors.grey.shade300,
                    disabledForegroundColor: isDarkMode
                        ? Colors.white38
                        : Colors.grey.shade500,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: _isFormValid ? 2 : 0,
                  ),
                  child: const Text(
                    'Začít program',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPronounOption({
    required BpdPronoun pronoun,
    required String label,
    required String example,
    required Color primaryColor,
    required bool isDarkMode,
  }) {
    final isSelected = _selectedPronoun == pronoun;

    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedPronoun = pronoun),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? primaryColor.withOpacity(0.15)
                : (isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected
                  ? primaryColor
                  : (isDarkMode
                        ? Colors.white.withOpacity(0.1)
                        : Colors.grey.shade300),
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Column(
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isSelected
                      ? primaryColor
                      : (isDarkMode ? Colors.white : NepanikarColors.dark),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                example,
                style: TextStyle(
                  fontSize: 10,
                  color: isDarkMode ? Colors.white54 : Colors.grey.shade600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
