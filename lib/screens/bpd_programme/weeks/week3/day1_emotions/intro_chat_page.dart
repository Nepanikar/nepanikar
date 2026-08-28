import 'package:flutter/material.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day1_emotions/day1_content.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';

/// Page 1/7 — what emotional regulation is, and that emotions are not facts.
///
/// Education in chat form: the week's framing arrives a message at a time
/// instead of as one wall of text.
class Week3IntroChatPage extends StatelessWidget {
  const Week3IntroChatPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: onNext,
      steps: [
        ChatStep(messages: [ChatBotBubble(text: day1IntroChat[0], showAvatar: true)]),
        ChatStep(messages: [ChatBotBubble(text: day1IntroChat[1], showAvatar: true)]),
        const ChatStep(
          messages: [
            ChatConceptCard(
              badge: 'KLÍČOVÁ MYŠLENKA',
              title: day1FactsTitle,
              body: day1FactsBody,
            ),
          ],
        ),
        const ChatStep(
          messages: [
            ChatInfoCard(
              icon: Icons.flag_outlined,
              title: 'Náš cíl',
              text: day1GoalNote,
            ),
          ],
          buttonLabel: 'Podívat se na emoce',
        ),
      ],
    );
  }
}
