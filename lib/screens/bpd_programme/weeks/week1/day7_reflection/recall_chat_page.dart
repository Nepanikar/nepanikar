import 'package:flutter/material.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/spoko_recall.dart';

/// Page 1/3 — week recap + SPOKO recall (reveal-on-tap), taught as a chat.
///
/// Replaces `Day7RecallPage`, matching the recap chats that close Weeks 2 and 4.
/// The recall list stays interactive — it is an exercise, not a message — so it
/// rides along as a rich message. Copy verbatim, source: tyzden-1.md §7.
class Day7RecallChatPage extends StatelessWidget {
  const Day7RecallChatPage({super.key, required this.onNext});

  final VoidCallback onNext;

  static const _intro1 =
      'Máme za sebou první týden, který byl spíše zaměřený na seznamování se s '
      'tím, co se bude dít. Příští týdny už budou více praktičtější!';

  static const _intro2 =
      'Taky jsme se zaměřili na důležité oblasti života, které značně ovlivňují '
      'naši psychickou pohodu. Dokážeš si je vybavit?';

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: onNext,
      steps: const [
        ChatStep(messages: [ChatBotBubble(text: _intro1, showAvatar: true)]),
        ChatStep(messages: [ChatBotBubble(text: _intro2)]),
        ChatStep(
          messages: [ChatRichMessage(child: SpokoRecallList())],
          buttonLabel: 'Pokračovat',
        ),
      ],
    );
  }
}
