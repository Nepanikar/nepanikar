import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

class ReflectionPage extends StatelessWidget {
  const ReflectionPage({
    super.key,
    required this.onNext,
    required this.controller,
  });

  final VoidCallback onNext;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return DayPageBase(
      buttonText: 'Pokračovať',
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),

          // Section header
          const SectionHeader(icon: Icons.edit_note, title: 'Krátka reflexia'),

          const SizedBox(height: 24),

          // Question box
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDarkMode
                  ? Colors.white.withOpacity(0.05)
                  : Colors.grey.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Skús sa teraz zastaviť na chvíľu...',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? Colors.white : NepanikarColors.dark,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Ako sa práve teraz cítiš? Skús si to všimnúť bez hodnotenia.',
                  style: TextStyle(
                    fontSize: 16,
                    color: isDarkMode ? Colors.white70 : NepanikarColors.dark,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Optional notes label
          Text(
            'Poznámky (voliteľné)',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isDarkMode
                  ? Colors.white70
                  : NepanikarColors.dark.withOpacity(0.7),
            ),
          ),

          const SizedBox(height: 12),

          // Text input
          Container(
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isDarkMode
                    ? Colors.white.withOpacity(0.1)
                    : Colors.grey.shade300,
              ),
            ),
            child: TextField(
              controller: controller,
              maxLines: 6,
              style: TextStyle(
                fontSize: 16,
                color: isDarkMode ? Colors.white : NepanikarColors.dark,
              ),
              decoration: InputDecoration(
                hintText: 'Napíš sem, čo si všimneš...',
                hintStyle: TextStyle(
                  color: isDarkMode ? Colors.white38 : Colors.grey.shade400,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Tip box
          const InfoBox(
            icon: Icons.lightbulb_outline,
            title: 'Tip',
            text:
                'Neexistuje správna ani nesprávna odpoveď. Ide len o to všimnúť si.',
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
