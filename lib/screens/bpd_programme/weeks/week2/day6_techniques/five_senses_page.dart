import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

class FiveSensesPage extends StatelessWidget {
  const FiveSensesPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return DayPageBase(
      buttonText: 'Pokračovať',
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),

          // Header with icon
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.star, color: primaryColor, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Všetkých päť pohromade',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : NepanikarColors.dark,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Text(
            'Technika 5-4-3-2-1 pre ukotvenie',
            style: TextStyle(
              fontSize: 16,
              color: primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 24),

          // Description
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.grey.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              'Táto technika ťa uzemní v prítomnom momente pomocou všetkých '
              'piatich zmyslov. Je skvelá na upokojenie pri úzkosti.',
              style: TextStyle(
                fontSize: 16,
                color: isDarkMode ? Colors.white70 : NepanikarColors.dark,
                height: 1.5,
              ),
            ),
          ),

          const SizedBox(height: 24),

          // 5-4-3-2-1 Steps
          _buildSenseStep(
            number: '5',
            icon: Icons.visibility,
            title: 'vecí VIDÍŠ',
            example: 'stôl, okno, strom, pero, obraz',
            color: const Color(0xFF6366F1),
            isDarkMode: isDarkMode,
          ),
          const SizedBox(height: 10),
          _buildSenseStep(
            number: '4',
            icon: Icons.touch_app,
            title: 'veci CÍTIŠ dotykom',
            example: 'textúra oblečenia, tvrdosť stoličky',
            color: const Color(0xFF8B5CF6),
            isDarkMode: isDarkMode,
          ),
          const SizedBox(height: 10),
          _buildSenseStep(
            number: '3',
            icon: Icons.hearing,
            title: 'zvuky POČUJEŠ',
            example: 'tikanie hodín, vietor, dych',
            color: const Color(0xFFA855F7),
            isDarkMode: isDarkMode,
          ),
          const SizedBox(height: 10),
          _buildSenseStep(
            number: '2',
            icon: Icons.air,
            title: 'veci VONÍŠ',
            example: 'káva, čerstvý vzduch, mydlo',
            color: const Color(0xFFC084FC),
            isDarkMode: isDarkMode,
          ),
          const SizedBox(height: 10),
          _buildSenseStep(
            number: '1',
            icon: Icons.restaurant,
            title: 'vec CHUTNÁŠ',
            example: 'zubná pasta, čaj, žuvačka',
            color: const Color(0xFFD8B4FE),
            isDarkMode: isDarkMode,
          ),

          const SizedBox(height: 24),

          // Tip box
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: primaryColor.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Icon(Icons.lightbulb_outline, color: primaryColor, size: 22),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Použi túto techniku kedykoľvek sa cítiš zahltený/á '
                    'alebo odpojený/á od reality.',
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

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildSenseStep({
    required String number,
    required IconData icon,
    required String title,
    required String example,
    required Color color,
    required bool isDarkMode,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDarkMode ? Colors.white.withOpacity(0.1) : Colors.grey.shade200,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                number,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icon, size: 16, color: color),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode ? Colors.white : NepanikarColors.dark,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  example,
                  style: TextStyle(
                    fontSize: 12,
                    color: isDarkMode ? Colors.white60 : NepanikarColors.dark.withOpacity(0.6),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
