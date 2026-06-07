import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

class DbtEducationPage extends StatelessWidget {
  const DbtEducationPage({super.key, required this.onNext});

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

          // Section header
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.lightbulb_outline,
                  color: primaryColor,
                  size: 26,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Čo je DBT?',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : NepanikarColors.dark,
                      ),
                    ),
                    Text(
                      'Dialekticko-behaviorálna terapia',
                      style: TextStyle(fontSize: 14, color: primaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Main description
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  primaryColor.withOpacity(0.15),
                  primaryColor.withOpacity(0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              'DBT je spôsob, ako sa naučiť lepšie zvládať svoje emócie a stres. '
              'Pomáha ľuďom pochopiť, čo cítia, a nájsť spôsoby, ako reagovať '
              'bez impulzívneho správania.',
              style: TextStyle(
                fontSize: 16,
                color: isDarkMode ? Colors.white : NepanikarColors.dark,
                height: 1.5,
              ),
            ),
          ),

          const SizedBox(height: 24),

          Text(
            'DBT ti pomôže:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),

          const SizedBox(height: 16),

          // DBT benefits
          const NumberedBenefit(
            number: '1',
            title: 'Porozumieť emóciám',
            description: 'Naučíš sa rozpoznávať a pomenovať svoje emócie',
          ),
          const SizedBox(height: 12),
          const NumberedBenefit(
            number: '2',
            title: 'Reagovať uvedomele',
            description: 'Získaš zručnosti reagovať na emócie bez impulzov',
          ),
          const SizedBox(height: 12),
          const NumberedBenefit(
            number: '3',
            title: 'Zlepšiť vzťahy',
            description: 'Naučíš sa lepšie komunikovať a budovať vzťahy',
          ),
          const SizedBox(height: 12),
          const NumberedBenefit(
            number: '4',
            title: 'Prijať seba',
            description: 'Podporuje sebaprijatie pri práci na zmenách',
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
