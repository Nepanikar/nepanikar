import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

class ReflectionPage extends StatelessWidget {
  const ReflectionPage({
    super.key,
    required this.onNext,
    required this.selectedTechnique,
    required this.onTechniqueSelected,
  });

  final VoidCallback onNext;
  final String? selectedTechnique;
  final ValueChanged<String> onTechniqueSelected;

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

          // Title
          Text(
            'Ktorá technika ti vyhovovala?',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            'Vyber si tú, ktorá ti najviac sadla.',
            style: TextStyle(
              fontSize: 16,
              color: isDarkMode
                  ? Colors.white70
                  : NepanikarColors.dark.withOpacity(0.7),
            ),
          ),

          const SizedBox(height: 32),

          // Options
          _buildOption(
            value: 'mindful',
            icon: Icons.self_improvement,
            title: 'Všímavé dýchanie',
            description: 'Pozorovanie dychu',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),

          const SizedBox(height: 16),

          _buildOption(
            value: 'box',
            icon: Icons.crop_square,
            title: 'Dýchanie do štvorca',
            description: '4-4-4-4 rytmus',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),

          const SizedBox(height: 16),

          _buildOption(
            value: '711',
            icon: Icons.trending_down,
            title: 'Dýchanie 7-11',
            description: 'Dlhší výdych',
            isDarkMode: isDarkMode,
            primaryColor: primaryColor,
          ),

          const SizedBox(height: 32),

          // Info box
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: primaryColor, size: 24),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Môžeš používať rôzne techniky podľa situácie.',
                    style: TextStyle(
                      fontSize: 14,
                      color: isDarkMode ? Colors.white : NepanikarColors.dark,
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

  Widget _buildOption({
    required String value,
    required IconData icon,
    required String title,
    required String description,
    required bool isDarkMode,
    required Color primaryColor,
  }) {
    final isSelected = selectedTechnique == value;

    return GestureDetector(
      onTap: () => onTechniqueSelected(value),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? primaryColor.withOpacity(0.15)
              : (isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? primaryColor
                : (isDarkMode
                      ? Colors.white.withOpacity(0.1)
                      : Colors.grey.shade200),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: isSelected
                    ? primaryColor.withOpacity(0.2)
                    : primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: primaryColor,
                size: 26,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: isDarkMode ? Colors.white : NepanikarColors.dark,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: isDarkMode
                          ? Colors.white60
                          : NepanikarColors.dark.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            Radio<String>(
              value: value,
              groupValue: selectedTechnique,
              onChanged: (v) {
                if (v != null) onTechniqueSelected(v);
              },
              activeColor: primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
