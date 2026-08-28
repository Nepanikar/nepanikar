import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';

/// Page 1/3 — SPOKO model + today's area (spánek), taught as a chat.
///
/// Replaces the former `Day2SpokoIntroPage` + `Day2SleepEducationPage`: both
/// only taught, and Week 1 was the odd week out — Weeks 2–4 teach in the chat
/// template. Copy is verbatim, source: docs/hpo/source/tyzden-1.md §2.
class Week1Day2EducationChatPage extends StatelessWidget {
  const Week1Day2EducationChatPage({super.key, required this.onNext});

  final VoidCallback onNext;

  static const _intro =
      'Model SPOKO je jednoduchý způsob, jak se učit základní oblasti péče o tělo '
      'a psychickou stabilitu. Každý den se zaměříme na jedno písmeno a postupně '
      'si ukážeme, jak malé změny v každé oblasti mohou ovlivnit emoce, stres i '
      'celkovou pohodu. Cílem není dělat všechno dokonale, ale postupně si všímat '
      'a zkoušet malé kroky, které se dají udržet v běžném životě.';

  static const _duringWeek =
      'Během týdne si každou část projdeme zvlášť a zkusíme ji převést do malých '
      'konkrétních kroků.';

  static const _infoText =
      'Na první pohled mohou tyto oblasti působit jednoduše nebo samozřejmě. Ve '
      'skutečnosti ale tvoří základní biologické pilíře psychické stability. Když '
      'některá z nich dlouhodobě nefunguje dobře, tělo i mysl jsou více zranitelné '
      'vůči stresu, emočním výkyvům i impulzivnímu chování. Péče o spánek, jídlo, '
      'pohyb a zdraví proto není „navíc“, ale základ, který výrazně ovlivňuje to, '
      'jak zvládáme každodenní život. I malé změny v těchto oblastech mohou mít '
      'překvapivě velký dopad na celkovou pohodu.';

  static const _sleepBody =
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
    return ChatDayPage(
      onCompleted: onNext,
      steps: const [
        ChatStep(messages: [ChatBotBubble(text: _intro, showAvatar: true)]),
        ChatStep(messages: [ChatRichMessage(child: _SpokoLetterCard())]),
        ChatStep(messages: [ChatBotBubble(text: _duringWeek, showAvatar: true)]),
        ChatStep(messages: [ChatInfoCard(text: _infoText)]),
        ChatStep(
          messages: [ChatConceptCard(badge: 'S', title: 'spánek', body: _sleepBody)],
        ),
        ChatStep(messages: [ChatBotBubble(text: _note1, showAvatar: true)]),
        ChatStep(messages: [ChatBotBubble(text: _note2)]),
        ChatStep(
          messages: [ChatNumberedList(caption: 'Zamysli se', items: _questions)],
          buttonLabel: 'Vybrat výzvu',
        ),
      ],
    );
  }
}

/// The five SPOKO areas, today's one highlighted.
class _SpokoLetterCard extends StatelessWidget {
  const _SpokoLetterCard();

  static const _letters = <List<String>>[
    ['S', 'Spánek'],
    ['P', 'Potrava'],
    ['O', 'ne Omamným látkám'],
    ['K', 'Kondice'],
    ['O', 'léčba Onemocnění'],
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2, bottom: 8),
          child: Text(
            'SPOKO zahrnuje:',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),
        ),
        ...List.generate(_letters.length, (i) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: _SpokoLetterRow(letter: _letters[i][0], word: _letters[i][1], isToday: i == 0),
          );
        }),
      ],
    );
  }
}

class _SpokoLetterRow extends StatelessWidget {
  const _SpokoLetterRow({required this.letter, required this.word, required this.isToday});

  final String letter;
  final String word;
  final bool isToday;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    final rowColor = isToday
        ? primaryColor
        : (isDarkMode ? Colors.white.withOpacity(0.06) : primaryColor.withOpacity(0.08));
    final letterBg = isToday ? Colors.white : primaryColor;
    final letterColor = isToday ? primaryColor : Colors.white;
    final wordColor = isToday ? Colors.white : (isDarkMode ? Colors.white : NepanikarColors.dark);

    return Container(
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(color: rowColor, borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(color: letterBg, borderRadius: BorderRadius.circular(9)),
            child: Center(
              child: Text(
                letter,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900, color: letterColor),
              ),
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Text(
              word,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: wordColor),
            ),
          ),
          if (isToday)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
              decoration: BoxDecoration(
                color: NepanikarColors.info,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'DNES',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  color: NepanikarColors.dark,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
