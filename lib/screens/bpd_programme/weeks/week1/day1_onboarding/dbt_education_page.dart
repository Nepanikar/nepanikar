import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day1_onboarding/external_link_button.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

/// Page 5/10 — DBT education (verbatim, source: tyzden-1.md §1, HPO+DBT edukace).
class Day1DbtEducationPage extends StatelessWidget {
  const Day1DbtEducationPage({super.key, required this.onNext});

  final VoidCallback onNext;

  static const _dbtDocUrl =
      'https://docs.google.com/document/d/1g8fMXdRK_mbJ_FdsgqOTh3CJDY0HmzgHqF-EAOfJy6I/edit?usp=drivesdk';

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
          const SectionHeader(
            icon: Icons.self_improvement,
            title: 'Co je DBT?',
            subtitle: 'Dialekticko-behaviorální terapie',
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
              'DBT, neboli dialekticko-behaviorální terapie, je způsob, jak se '
              'učit lépe zvládat své emoce a stres. Pomáhá lidem porozumět tomu, '
              'co cítí, a najít způsoby, jak reagovat bez impulzivního chování. '
              'DBT také podporuje zlepšení vztahů s ostatními a učí, jak se '
              'přijmout a zároveň pracovat na změnách, které chceme ve svém '
              'životě udělat.',
              style: TextStyle(fontSize: 15, height: 1.5, color: bodyColor),
            ),
          ),
          const SizedBox(height: 16),
          const ExternalLinkButton(label: 'Chci vědět víc o DBT', url: _dbtDocUrl),
          const SizedBox(height: 20),
          const InfoBox(
            icon: Icons.fitness_center,
            title: 'Proč je nácvik důležitý',
            text: 'Nácvik dovedností je důležitý proto, že samotné vědění '
                'nestačí – je potřeba procvičovat nové způsoby, jak reagovat na '
                'emoce, stres nebo konflikty, aby se staly přirozenou součástí '
                'života. Když nové strategie pravidelně používáme, snižujeme '
                'impulzivní chování a snáze zvládáme těžké situace. Pravidelný '
                'nácvik nám také dodává pocit jistoty v situacích, které bývaly '
                'dříve obtížné.',
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
