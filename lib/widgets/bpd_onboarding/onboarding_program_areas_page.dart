import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';

class OnboardingProgramAreasPage extends StatelessWidget {
  const OnboardingProgramAreasPage({super.key, required this.onNext});

  final VoidCallback onNext;

  static const List<_ProgramArea> _areas = [
    _ProgramArea(
      icon: Icons.self_improvement,
      title: 'Všímavosť',
      description: 'Byť prítomný v momente',
    ),
    _ProgramArea(
      icon: Icons.psychology_alt,
      title: 'Regulácia emócií',
      description: 'Pochopenie a riadenie emócií',
    ),
    _ProgramArea(
      icon: Icons.groups,
      title: 'Interpersonálne zručnosti',
      description: 'Zdravé vzťahy a komunikácia',
    ),
    _ProgramArea(
      icon: Icons.shield,
      title: 'Zvládanie krízy',
      description: 'Stratégie pre ťažké momenty',
    ),
    _ProgramArea(
      icon: Icons.balance,
      title: 'Stredná cesta',
      description: 'Rovnováha v myslení',
    ),
    _ProgramArea(
      icon: Icons.favorite,
      title: 'Sebaprijatie',
      description: 'Láskavosť k sebe samému',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const SizedBox(height: 20),

          // Title
          Text(
            'Oblasti programu',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 12),

          Text(
            'Postupne preskúmate 6 kľúčových oblastí DBT',
            style: TextStyle(
              fontSize: 15,
              color: isDarkMode
                  ? Colors.white70
                  : NepanikarColors.dark.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          // Grid of areas
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 1.1,
                        ),
                    itemCount: _areas.length,
                    itemBuilder: (context, index) {
                      return _buildAreaCard(
                        area: _areas[index],
                        primaryColor: primaryColor,
                        isDarkMode: isDarkMode,
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  // Prevention plan card
                  _buildPreventionPlanCard(primaryColor, isDarkMode),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Next button
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              onPressed: onNext,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 2,
              ),
              child: const Text(
                'Pokračovat',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildAreaCard({
    required _ProgramArea area,
    required Color primaryColor,
    required bool isDarkMode,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDarkMode
              ? Colors.white.withOpacity(0.1)
              : Colors.grey.shade200,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(area.icon, color: primaryColor, size: 26),
          ),
          const SizedBox(height: 10),
          Text(
            area.title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            area.description,
            style: TextStyle(
              fontSize: 11,
              color: isDarkMode
                  ? Colors.white54
                  : NepanikarColors.dark.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildPreventionPlanCard(Color primaryColor, bool isDarkMode) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primaryColor.withOpacity(0.15),
            primaryColor.withOpacity(0.08),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: primaryColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.security, color: primaryColor, size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Plán prevencie',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : NepanikarColors.dark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Na konci programu si vytvoríte osobný plán pre zvládanie '
                  'náročných situácií.',
                  style: TextStyle(
                    fontSize: 12,
                    color: isDarkMode
                        ? Colors.white70
                        : NepanikarColors.dark.withOpacity(0.7),
                    height: 1.3,
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

class _ProgramArea {
  const _ProgramArea({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;
}
