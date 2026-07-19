// ignore_for_file: no_adjacent_strings_in_list

import 'package:flutter/material.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';

/// Page 2/7 — HPO + DBT education in chat form
/// (verbatim, source: tyzden-1.md §1 "HPO+DBT edukace").
class Day1EducationChatPage extends StatelessWidget {
  const Day1EducationChatPage({super.key, required this.onNext});

  final VoidCallback onNext;

  static const _hpoDocUrl =
      'https://docs.google.com/document/d/16dQDRWXkyZiuigJF1CCK1r_7scPzF8Qj1L8uueAJjVM/edit?usp=drivesdk';
  static const _dbtDocUrl =
      'https://docs.google.com/document/d/1g8fMXdRK_mbJ_FdsgqOTh3CJDY0HmzgHqF-EAOfJy6I/edit?usp=drivesdk';

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: onNext,
      steps: const [
        ChatStep(
          messages: [
            ChatBotBubble(
              showAvatar: true,
              text:
                  'Dnešní den bude ještě trochu informační. Dozvíš se něco málo o '
                  'hraniční poruše osobnosti a taky o dialekticko-behaviorální terapii, '
                  'kterou je tento program inspirovaný. 📚',
            ),
          ],
        ),
        ChatStep(
          messages: [
            ChatConceptCard(
              badge: 'HPO',
              title: 'Hraniční porucha osobnosti',
              body:
                  'Hraniční porucha osobnosti (zkráceně HPO) je duševní onemocnění '
                  'charakterizované výraznými výkyvy nálad, impulzivním chováním a '
                  'nestabilními vztahy. Lidé s touto poruchou často zažívají intenzivní '
                  'emoce, které se rychle mění, a mohou mít problémy s tím, jak vnímají '
                  'sami sebe a ostatní. Tyto výkyvy můžou být nepříjemné pro každodenní '
                  'život a vztahy s okolím.',
              linkLabel: 'Zjistit víc o HPO',
              linkUrl: _hpoDocUrl,
            ),
          ],
        ),
        ChatStep(
          messages: [
            ChatInfoCard(
              icon: Icons.favorite_border,
              title: 'Pro koho je program',
              text:
                  'Tento program je určený nejen lidem s diagnostikovanou hraniční '
                  'poruchou osobnosti, ale také těm, kteří jen vnímají nějaké obtíže v '
                  'oblasti emocí, impulzivity nebo vztahů. Cílem není nálepkovat ani '
                  'stigmatizovat, ale nabídnout nástroje a strategie, které mohou pomoci '
                  'každému, kdo chce zlepšit kvalitu života ve zmíněných oblastech.',
            ),
          ],
        ),
        ChatStep(
          messages: [
            ChatBotBubble(
              showAvatar: true,
              text:
                  'A teď se pojďme podívat na DBT, kterou je tento program '
                  'inspirovaný. 👇',
            ),
            ChatConceptCard(
              badge: 'DBT',
              title: 'Dialekticko-behaviorální terapie',
              body:
                  'DBT, neboli dialekticko-behaviorální terapie, je způsob, jak se '
                  'učit lépe zvládat své emoce a stres. Pomáhá lidem porozumět tomu, co '
                  'cítí, a najít způsoby, jak reagovat bez impulzivního chování. DBT '
                  'také podporuje zlepšení vztahů s ostatními a učí, jak se přijmout a '
                  'zároveň pracovat na změnách, které chceme ve svém životě udělat.',
              linkLabel: 'Chci vědět víc o DBT',
              linkUrl: _dbtDocUrl,
            ),
          ],
        ),
        ChatStep(
          messages: [
            ChatNumberedList(
              caption: 'Proč je nácvik dovedností důležitý',
              items: [
                'Nácvik dovedností je důležitý proto, že samotné vědění nestačí – je '
                    'potřeba procvičovat nové způsoby, jak reagovat na emoce, stres nebo '
                    'konflikty, aby se staly přirozenou součástí života.',
                'Když nové strategie pravidelně používáme, snižujeme impulzivní chování '
                    'a snáze zvládáme těžké situace.',
                'Pravidelný nácvik nám také dodává pocit jistoty v situacích, které '
                    'bývaly dříve obtížné.',
              ],
            ),
          ],
        ),
        ChatStep(
          messages: [
            ChatBotBubble(
              showAvatar: true,
              text: 'Pojďme si rovnou na začátek zkusit jednu aktivitu. 🙂',
            ),
          ],
        ),
      ],
    );
  }
}
