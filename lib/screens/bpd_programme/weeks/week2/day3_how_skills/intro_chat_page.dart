import 'package:flutter/material.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day3_how_skills/day3_content.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_lists.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';

/// Page 1/5 — what the "Jak" skills are, before the three practice pages.
class Week2Day3IntroChatPage extends StatelessWidget {
  const Week2Day3IntroChatPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: onNext,
      steps: [
        for (final message in week2Day3IntroChat)
          ChatStep(messages: [ChatBotBubble(text: message, showAvatar: true)]),
        const ChatStep(
          messages: [ChatFeatureList(caption: 'Jak dovednosti', items: week2Day3Previews)],
          buttonLabel: 'Začít s jednomyslností',
        ),
      ],
    );
  }
}
