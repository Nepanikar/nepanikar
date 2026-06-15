import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day1_onboarding/external_link_button.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

/// Page 4/10 — HPO education (verbatim, source: tyzden-1.md §1, HPO+DBT edukace).
class Day1HpoEducationPage extends StatelessWidget {
  const Day1HpoEducationPage({super.key, required this.onNext});

  final VoidCallback onNext;

  static const _hpoDocUrl =
      'https://docs.google.com/document/d/16dQDRWXkyZiuigJF1CCK1r_7scPzF8Qj1L8uueAJjVM/edit?usp=drivesdk';

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final bodyColor = isDarkMode ? Colors.white : NepanikarColors.dark;

    return DayPageBase(
      buttonText: 'Pokračovat',
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Text(
            'Dnešní den bude ještě trochu informační. Dozvíš se něco málo o '
            'hraniční poruše osobnosti a taky o dialekticko-behaviorální '
            'terapii, kterou je tento program inspirovaný.',
            style: TextStyle(fontSize: 15, height: 1.5, color: bodyColor),
          ),
          const SizedBox(height: 24),
          const SectionHeader(
            icon: Icons.psychology,
            title: 'Co je HPO?',
            subtitle: 'Hraniční porucha osobnosti',
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDarkMode
                  ? Colors.white.withOpacity(0.05)
                  : Colors.grey.shade50,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              'Hraniční porucha osobnosti (zkráceně HPO) je duševní onemocnění '
              'charakterizované výraznými výkyvy nálad, impulzivním chováním a '
              'nestabilními vztahy. Lidé s touto poruchou často zažívají '
              'intenzivní emoce, které se rychle mění, a mohou mít problémy s '
              'tím, jak vnímají sami sebe a ostatní. Tyto výkyvy můžou být '
              'nepříjemné pro každodenní život a vztahy s okolím.',
              style: TextStyle(fontSize: 15, height: 1.5, color: bodyColor),
            ),
          ),
          const SizedBox(height: 16),
          const ExternalLinkButton(label: 'Zjistit víc o HPO', url: _hpoDocUrl),
          const SizedBox(height: 20),
          const InfoBox(
            icon: Icons.favorite_border,
            title: 'Pro koho je program',
            text: 'Tento program je určený nejen lidem s diagnostikovanou '
                'hraniční poruchou osobnosti, ale také těm, kteří jen vnímají '
                'nějaké obtíže v oblasti emocí, impulzivity nebo vztahů. Cílem '
                'není nálepkovat ani stigmatizovat, ale nabídnout nástroje a '
                'strategie, které mohou pomoci každému, kdo chce zlepšit kvalitu '
                'života ve zmíněných oblastech.',
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
