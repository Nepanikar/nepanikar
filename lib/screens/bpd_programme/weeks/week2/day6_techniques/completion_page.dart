import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

class CompletionPage extends StatelessWidget {
  const CompletionPage({super.key, required this.onComplete});

  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return DayPageBase(
      buttonText: 'Dokončiť deň',
      onButtonPressed: onComplete,
      buttonColor: Colors.green,
      buttonIcon: Icons.check,
      content: Column(
        children: [
          const SizedBox(height: 40),

          // Success icon
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_circle,
              size: 70,
              color: Colors.green,
            ),
          ),

          const SizedBox(height: 24),

          // Title
          Text(
            'Výborne!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          // Subtitle
          Text(
            'Deň 6 dokončený',
            style: TextStyle(
              fontSize: 18,
              color: primaryColor,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          // Summary
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.grey.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Text(
                  'Spoznal/a si 5 mindfulness techník:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? Colors.white : NepanikarColors.dark,
                  ),
                ),
                const SizedBox(height: 16),
                _buildCompletedItem('Skenovanie tela', isDarkMode),
                const SizedBox(height: 8),
                _buildCompletedItem('Všímavá chôdza', isDarkMode),
                const SizedBox(height: 8),
                _buildCompletedItem('Všímavé jedenie', isDarkMode),
                const SizedBox(height: 8),
                _buildCompletedItem('Všímavé načúvanie', isDarkMode),
                const SizedBox(height: 8),
                _buildCompletedItem('Technika 5-4-3-2-1', isDarkMode),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Tip box
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF4EA3AD).withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF4EA3AD).withOpacity(0.3)),
            ),
            child: Row(
              children: [
                const Icon(Icons.bookmark_border, color: Color(0xFF4EA3AD), size: 22),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'K týmto cvičeniam sa môžeš kedykoľvek vrátiť '
                    'alebo si ich uložiť do záchranného balíčka.',
                    style: TextStyle(
                      fontSize: 14,
                      color: isDarkMode ? Colors.white70 : NepanikarColors.dark,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // What's next box
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: primaryColor.withOpacity(0.3)),
            ),
            child: Column(
              children: [
                Icon(Icons.celebration, color: primaryColor, size: 28),
                const SizedBox(height: 12),
                Text(
                  'Zajtra',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Zhrnutie týždňa',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : NepanikarColors.dark,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  'Zhodnotíme celý týždeň mindfulness',
                  style: TextStyle(
                    fontSize: 14,
                    color: isDarkMode ? Colors.white70 : NepanikarColors.dark,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildCompletedItem(String text, bool isDarkMode) {
    return Row(
      children: [
        const Icon(Icons.check_circle, color: Colors.green, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),
        ),
      ],
    );
  }
}
