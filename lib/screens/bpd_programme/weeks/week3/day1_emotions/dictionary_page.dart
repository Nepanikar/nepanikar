import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day1_emotions/day1_content.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/emotion_dictionary_data.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/external_link_button.dart';
import 'package:nepanikar/screens/home/my_records/emotion_dictionary/emotion_dictionary_screen.dart';

/// Page 2/7 — the emotion dictionary: ten emotions and what each is for.
///
/// The same content lives permanently in *Moje záznamy → DBT program*, and the
/// page says so — the source asks twice for this to be something the user can
/// return to, which only works if they know where it went.
class Week3DictionaryPage extends StatelessWidget {
  const Week3DictionaryPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return DayPageBase(
      buttonText: 'Pokračovat',
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          const SectionHeader(icon: Icons.menu_book_outlined, title: 'Slovník emocí'),
          const SizedBox(height: 12),
          Text(
            day1DictionaryLead,
            style: TextStyle(
              fontSize: 16,
              height: 1.55,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.85),
            ),
          ),
          const SizedBox(height: 16),
          ...emotionDictionary.map(
            (emotion) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: EmotionCard(emotion: emotion),
            ),
          ),
          const SizedBox(height: 8),
          const EmotionInfographic(),
          const SizedBox(height: 20),
          const InfoBox(
            icon: Icons.bookmark_outline,
            title: 'Najdeš ho i později',
            text:
                '$emotionDictionaryIntro Slovník máš uložený v Mých záznamech '
                'v sekci DBT program.',
          ),
          const SizedBox(height: 18),
          const LinkLeadText('Chci vědět víc:'),
          const SizedBox(height: 8),
          const ExternalLinkButton(
            label: emotionDictionaryLinkLabel,
            url: emotionDictionaryLinkUrl,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
