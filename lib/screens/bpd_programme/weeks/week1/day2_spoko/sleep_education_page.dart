import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';

/// Page 2/4 — Sleep education + mapping questions (verbatim, source: tyzden-1.md §2).
class Day2SleepEducationPage extends StatelessWidget {
  const Day2SleepEducationPage({super.key, required this.onNext});

  final VoidCallback onNext;

  static const _body =
      'Spánek má velký vliv na emoce, energii i zvládání stresu. Když jsme '
      'nevyspalí, máme méně energie, horší koncentraci a naše emoce bývají '
      'intenzivnější. To, co bychom zvládli s nadhledem, nás může snadněji '
      'rozhodit. Péče o spánek proto není luxus, ale základ emoční odolnosti.';

  static const _note1 =
      'Zkus se na chvíli zamyslet. Následující otázky nemají správné ani špatné '
      'odpovědi. Mohou ti pomoci všimnout si, jak na tom v oblasti spánku aktuálně '
      'jsi. Pokud při odpovědích zjistíš, že se objevuje více obtíží, '
      'nespokojenosti nebo prostoru pro zlepšení, může to být signál, že právě '
      'spánek si zaslouží více pozornosti.';

  static const _note2 =
      'Zkus jen zmapovat současný stav. Možná zjistíš, že spánek funguje dobře. '
      'A možná objevíš drobné změny, které by mohly mít překvapivě velký dopad na '
      'tvou energii, náladu a odolnost.';

  static const _questions = <String>[
    'Kolik hodin spánku průměrně naspíš?',
    'Cítíš se po probuzení obvykle odpočatě?',
    'Co nejčastěji narušuje tvůj spánek?',
    'Co tvému spánku prospívá?',
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return DayPageBase(
      buttonText: 'Pokračovat',
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.bedtime_outlined, color: primaryColor, size: 26),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Dnešní zaměření',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: NepanikarColors.secondary,
                      ),
                    ),
                    Text(
                      'S – spánek',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : NepanikarColors.dark,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            _body,
            style: TextStyle(
              fontSize: 15,
              height: 1.5,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            _note1,
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              fontStyle: FontStyle.italic,
              color: isDarkMode ? Colors.white60 : NepanikarColors.dark.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            _note2,
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              fontStyle: FontStyle.italic,
              color: isDarkMode ? Colors.white60 : NepanikarColors.dark.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Zamysli se',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),
          const SizedBox(height: 10),
          ...List.generate(_questions.length, (i) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _QuestionCard(text: _questions[i]),
            );
          }),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _QuestionCard extends StatelessWidget {
  const _QuestionCard({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            width: 26,
            height: 26,
            decoration: const BoxDecoration(
              color: NepanikarColors.secondary,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                '?',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.35,
                color: isDarkMode ? Colors.white : NepanikarColors.dark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
