import 'package:flutter/material.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

class BenefitsPage extends StatelessWidget {
  const BenefitsPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return DayPageBase(
      buttonText: 'Pokračovať',
      onButtonPressed: onNext,
      content: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24),

          // Section header
          SectionHeader(
            icon: Icons.star_outline,
            title: 'Prečo je mindfulness užitočný?',
          ),

          SizedBox(height: 24),

          // Benefit cards
          FeatureCard(
            icon: Icons.spa,
            title: 'Znižuje úzkosť a napätie',
            description: 'Pomáha upokojiť myseľ a telo',
          ),
          SizedBox(height: 12),
          FeatureCard(
            icon: Icons.center_focus_strong,
            title: 'Posilňuje sústredenie',
            description: 'Zlepšuje schopnosť sústrediť sa na prítomný moment',
          ),
          SizedBox(height: 12),
          FeatureCard(
            icon: Icons.people,
            title: 'Zlepšuje vzťahy',
            description:
                'Podporuje lepšie naslúchanie a prítomnosť v rozhovoroch',
          ),
          SizedBox(height: 12),
          FeatureCard(
            icon: Icons.psychology,
            title: 'Väčšia rozhodnosť',
            description: 'Znižuje riziko jednať čisto pod vplyvom emócií',
          ),

          SizedBox(height: 32),
        ],
      ),
    );
  }
}
