import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/games/breathing/breathing_game_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week4/day2_crisis_skills/day2_content.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/acronym_skill_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/external_link_button.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/rescue_save_button.dart';
import 'package:nepanikar/screens/contacts/region_contacts_screen.dart';
import 'package:nepanikar/services/db/bpd/bpd_rescue_item_model.dart';

/// Page 1/6 — what happens in a crisis and what these skills are for.
class Week4Day2CrisisChatPage extends StatelessWidget {
  const Week4Day2CrisisChatPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: onNext,
      steps: [
        for (final message in day2CrisisChat)
          ChatStep(messages: [ChatBotBubble(text: message, showAvatar: true)]),
      ],
    );
  }
}

/// Page 2/6 — recognising a crisis, when to use these skills and when not to.
///
/// The "when NOT to" boundary stays on this page rather than becoming its own
/// step: a user who taps away after "when to use" would otherwise walk off with
/// a crisis tool and no idea of its limits.
class Week4Day2WhenChatPage extends StatelessWidget {
  const Week4Day2WhenChatPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: onNext,
      steps: const [
        ChatStep(
          messages: [
            ChatBotBubble(text: day2RecogniseCrisis, showAvatar: true),
            // Directly under "neudělat nic, co nejde vzít zpátky" — the moment
            // a reader is closest to acting on it. Quiet on purpose: an alarm
            // here reads as the app deciding they are a risk.
            _CrisisHelpRow(),
          ],
        ),
        ChatStep(messages: [ChatBotBubble(text: day2WhenToUse, showAvatar: true)]),
        // Same shape as Week 3 Day 4's boundary card, so "this is where the
        // technique stops" looks the same everywhere in the programme.
        ChatStep(
          messages: [
            ChatInfoCard(
              icon: Icons.do_not_disturb_on_outlined,
              title: day2NotForTitle,
              text: day2NotFor,
            ),
          ],
        ),
        ChatStep(
          messages: [ChatBotBubble(text: day2ThirdSkillNote, showAvatar: true)],
          buttonLabel: 'Ukázat STOP',
        ),
      ],
    );
  }
}

/// Deep-link into the app's existing crisis contacts.
class _CrisisHelpRow extends StatelessWidget {
  const _CrisisHelpRow();

  @override
  Widget build(BuildContext context) {
    const teal = NepanikarColors.secondary;

    return Padding(
      padding: const EdgeInsets.only(left: 44, top: 4, bottom: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => const CrisisCenterContactsRoute().push<void>(context),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: teal.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: teal.withOpacity(0.35)),
          ),
          child: const Row(
            children: [
              Icon(Icons.support_agent, size: 18, color: teal),
              SizedBox(width: 9),
              Expanded(
                child: Text(
                  day2CrisisLinkLabel,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: teal),
                ),
              ),
              Icon(Icons.chevron_right, size: 18, color: teal),
            ],
          ),
        ),
      ),
    );
  }
}

/// Page 3/6 — STOP.
class Week4Day2StopPage extends StatelessWidget {
  const Week4Day2StopPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return AcronymSkillPage(
      icon: Icons.back_hand_outlined,
      title: 'STOP',
      subtitle: 'Den 2 • Týden 4',
      leadParagraphs: day2StopLead,
      letters: day2StopLetters,
      rescueItem: BpdRescueItem(
        id: 'week4_stop',
        title: 'STOP',
        description: day2StopLetters.map((l) => '${l.$1} – ${l.$2}: ${l.$3}').join('\n'),
        sourceLabel: 'Týden 4 • Den 2',
        savedAt: DateTime.now(),
        iconKey: 'pause',
      ),
      onNext: onNext,
    );
  }
}

/// Page 4/6 — TIPS.
class Week4Day2TipsPage extends StatelessWidget {
  const Week4Day2TipsPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return AcronymSkillPage(
      icon: Icons.ac_unit,
      title: 'TIPS',
      subtitle: 'Den 2 • Týden 4',
      leadParagraphs: const [day2TipsLead],
      letters: day2TipsLetters,
      afterLetter: const {
        // Ours, flagged for the author — the two body-based techniques above
        // are not neutral for every reader (see day2_content.dart).
        'I': InfoBox(
          icon: Icons.health_and_safety_outlined,
          title: day2TipsCautionTitle,
          text: day2TipsCaution,
          color: NepanikarColors.error,
        ),
        // The source asks for this link by name: "(Odkaz na předchozí dechová
        // cvičení)". It belongs to letter P, not to the end of the page.
        'P': _BreathingLinkButton(),
      },
      rescueItem: BpdRescueItem(
        id: 'week4_tips',
        title: 'TIPS',
        description: day2TipsLetters.map((l) => '${l.$1} – ${l.$2}: ${l.$3}').join('\n'),
        sourceLabel: 'Týden 4 • Den 2',
        savedAt: DateTime.now(),
        iconKey: 'air',
      ),
      buttonText: 'Vyzkoušet svalovou relaxaci',
      onNext: onNext,
    );
  }
}

/// Opens the existing breathing exercise with the source's 4 / 6–8 rhythm.
class _BreathingLinkButton extends StatelessWidget {
  const _BreathingLinkButton();

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return OutlinedButton.icon(
      onPressed: () => const BreathingGameRoute(
        shape: BreathingGameShape.circle,
        preset: 'slow-exhale',
      ).push<void>(context),
      icon: const Icon(Icons.air, size: 18),
      label: const Text('Otevřít dechové cvičení'),
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColor,
        alignment: Alignment.centerLeft,
        side: BorderSide(color: primaryColor.withOpacity(0.4), width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      ),
    );
  }
}

/// Page 5/6 — progressive muscle relaxation.
///
/// Its own page because the source invites the user to *do* it now
/// ("Pojďme si teď společně vyzkoušet"), and an invitation buried as one line
/// under letter S would be read past.
class Week4Day2RelaxationPage extends StatelessWidget {
  const Week4Day2RelaxationPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final secondaryText = isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.75);

    return DayPageBase(
      // Never "Splnit cvičení" — someone who does not play the video has not
      // failed the day.
      buttonText: 'Pokračovat',
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          const SectionHeader(
            icon: Icons.spa_outlined,
            title: 'Progresivní svalová relaxace',
            subtitle: 'Den 2 • Týden 4',
          ),
          const SizedBox(height: 18),
          Text(
            day2PmrInvitation,
            style: TextStyle(fontSize: 16, height: 1.55, color: secondaryText),
          ),
          const SizedBox(height: 20),
          const ExternalLinkButton(
            label: 'Pustit video',
            url: day2PmrVideoUrl,
            icon: Icons.play_circle_outline,
          ),
          const SizedBox(height: 20),
          RescueSaveButton(
            item: BpdRescueItem(
              id: 'week4_pmr',
              title: 'Progresivní svalová relaxace',
              description:
                  'Střídavé napínání a uvolňování svalů snižuje fyzické napětí '
                  'a tím i emocionální napětí.',
              sourceLabel: 'Týden 4 • Den 2',
              savedAt: DateTime.now(),
              videoUrl: day2PmrVideoUrl,
              iconKey: 'spa',
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
