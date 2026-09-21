import 'package:flutter/material.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day1_mindfulness_intro/day1_content.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_lists.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';

/// Page 1/2 — the whole of §1 as one chat flow.
///
/// A reading-only day, so it follows the same shape as Week 3's education days:
/// the lesson arrives a message at a time instead of as three scrollable pages.
class Week2Day1EducationChatPage extends StatelessWidget {
  const Week2Day1EducationChatPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: onNext,
      steps: [
        for (final message in day1IntroChat)
          ChatStep(messages: [ChatBotBubble(text: message, showAvatar: true)]),
        const ChatStep(
          messages: [
            ChatInfoCard(
              icon: Icons.lightbulb_outline,
              title: day1EmptyHeadTitle,
              text: day1EmptyHeadBody,
            ),
          ],
          buttonLabel: 'Proč to pomáhá',
        ),
        const ChatStep(messages: [ChatBotBubble(text: day1WhyUseful, showAvatar: true)]),
        const ChatStep(
          messages: [ChatFeatureList(caption: 'Co to přináší', items: day1Benefits)],
        ),
        const ChatStep(messages: [ChatBotBubble(text: day1Research, showAvatar: true)]),
        const ChatStep(
          messages: [ChatFeatureList(caption: 'Co trénink ovlivňuje', items: day1ResearchEffects)],
        ),
        const ChatStep(
          messages: [ChatConceptCard(badge: 'ZÁKLAD DBT', title: day1DbtTitle, body: day1DbtBody)],
        ),
        const ChatStep(
          messages: [ChatLinksCard(caption: 'Chci vědět víc', links: day1Links)],
          buttonLabel: 'Dokončit čtení',
        ),
      ],
    );
  }
}
