import 'package:flutter/material.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_lists.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';

/// Page 1/3 — what the mindfulness week covered, as a reminder before the
/// reflection questions (source: §7 "Máme za sebou druhý týden…").
class Week2RecapChatPage extends StatelessWidget {
  const Week2RecapChatPage({super.key, required this.onNext});

  final VoidCallback onNext;

  static const _lead = 'Máme za sebou druhý týden, který byl zaměřený na všímavost.';

  static const _learned = <ChatFeatureItem>[
    ChatFeatureItem(
      icon: Icons.self_improvement,
      title: 'Co je všímavost',
      description: 'Vědomě zaměřit pozornost na přítomný okamžik, bez posuzování.',
    ),
    ChatFeatureItem(
      icon: Icons.visibility_outlined,
      title: 'Co dovednosti',
      description: 'Pozorování, popisování a participace — co vlastně dělám.',
    ),
    ChatFeatureItem(
      icon: Icons.tune,
      title: 'Jak dovednosti',
      description: 'Jednomyslně, bez hodnocení a efektivně — jak to dělám.',
    ),
    ChatFeatureItem(
      icon: Icons.air,
      title: 'Všímavé dýchání',
      description: 'Dýchání do čtverce, 7-11 a všímavé sledování dechu.',
    ),
    ChatFeatureItem(
      icon: Icons.auto_awesome,
      title: 'Techniky všímavosti',
      description: 'Skenování těla, všímavá chůze, jedení, naslouchání i pět smyslů.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: onNext,
      steps: const [
        ChatStep(messages: [ChatBotBubble(text: _lead, showAvatar: true)]),
        ChatStep(
          messages: [ChatFeatureList(caption: 'Co jsme prošli', items: _learned)],
          buttonLabel: 'Reflexe týdne',
        ),
      ],
    );
  }
}
