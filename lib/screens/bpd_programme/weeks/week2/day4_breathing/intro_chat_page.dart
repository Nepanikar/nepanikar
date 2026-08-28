import 'package:flutter/material.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day4_breathing/day4_content.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';

/// Page 1/4 — why mindful breathing helps, before the exercise menu.
class Week2Day4IntroChatPage extends StatelessWidget {
  const Week2Day4IntroChatPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: onNext,
      steps: [
        for (final message in week2Day4IntroChat)
          ChatStep(messages: [ChatBotBubble(text: message, showAvatar: true)]),
        const ChatStep(
          messages: [
            ChatInfoCard(
              icon: Icons.self_improvement,
              title: 'Co to dělá',
              text: week2Day4IntroNote,
            ),
          ],
          buttonLabel: 'Vybrat cvičení',
        ),
      ],
    );
  }
}
