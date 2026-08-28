import 'package:flutter/material.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day2_what_skills/day2_content.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_lists.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';

/// Page 1/5 — what the "Co" skills are, before the three practice pages.
///
/// The teaching part of the day is a chat; the pick-lists that follow stay
/// forms, because there the user is choosing rather than reading.
class Week2Day2IntroChatPage extends StatelessWidget {
  const Week2Day2IntroChatPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: onNext,
      steps: const [
        ChatStep(messages: [ChatBotBubble(text: week2Day2IntroLead, showAvatar: true)]),
        ChatStep(
          messages: [ChatFeatureList(caption: 'Co dovednosti', items: week2Day2Previews)],
        ),
        ChatStep(
          messages: [
            ChatInfoCard(
              icon: Icons.play_circle_outline,
              title: 'Pojďme si to vyzkoušet',
              text: week2Day2IntroClosing,
            ),
          ],
          buttonLabel: 'Začít s pozorováním',
        ),
      ],
    );
  }
}
