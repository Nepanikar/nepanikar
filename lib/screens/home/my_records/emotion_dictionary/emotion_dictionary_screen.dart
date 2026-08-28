import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/emotion_dictionary_data.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/external_link_button.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

part 'emotion_dictionary_screen.g.dart';

@TypedGoRoute<EmotionDictionaryRoute>(path: '/home/my-records/emotion-dictionary')
class EmotionDictionaryRoute extends GoRouteData with $EmotionDictionaryRoute {
  const EmotionDictionaryRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const EmotionDictionaryScreen();
}

/// "Slovník emocí" — the ten emotions and what each one is for.
///
/// Week 3 Day 1 teaches this, but the source asks twice for it to be something
/// the user can come back to at any time ("když třeba nevíš, jak se zrovna
/// cítíš"), so it is a permanent reference under *Moje záznamy → DBT program*
/// rather than a page buried inside one day.
class EmotionDictionaryScreen extends StatelessWidget {
  const EmotionDictionaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return NepanikarScreenWrapper(
      appBarTitle: 'Slovník emocí',
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 44, bottom: 18),
          child: Text(
            emotionDictionaryIntro,
            style: TextStyle(
              fontSize: 14,
              height: 1.45,
              fontWeight: FontWeight.w700,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.75),
            ),
          ),
        ),
        ...emotionDictionary.map(
          (emotion) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: EmotionCard(emotion: emotion),
          ),
        ),
        const SizedBox(height: 8),
        const EmotionInfographic(),
        const SizedBox(height: 20),
        const LinkLeadText('Chci vědět víc:'),
        const SizedBox(height: 8),
        const ExternalLinkButton(
          label: emotionDictionaryLinkLabel,
          url: emotionDictionaryLinkUrl,
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

/// One emotion and its function. Every emotion gets identical visual weight —
/// no colour split into pleasant and unpleasant, because the whole point of the
/// dictionary is that each one carries useful information.
class EmotionCard extends StatelessWidget {
  const EmotionCard({super.key, required this.emotion});

  final EmotionEntry emotion;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDarkMode ? Colors.white.withOpacity(0.1) : Colors.grey.shade200,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(emotion.icon, size: 20, color: primaryColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  emotion.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: isDarkMode ? Colors.white : NepanikarColors.dark,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  emotion.function,
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.45,
                    color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// The author's `ZÁKLADNÍ EMOCE` picture.
///
/// It covers six of the ten emotions, so it is captioned as an illustration of
/// the basic six instead of being presented as the full list — otherwise the
/// four that are missing (vina, překvapení, žárlivost, závist) read as an
/// oversight.
class EmotionInfographic extends StatelessWidget {
  const EmotionInfographic({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final basicCount = emotionDictionary.where((e) => e.isInInfographic).length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            Assets.bpd.emoceInfografika.path,
            fit: BoxFit.contain,
            width: double.infinity,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Obrázek zachycuje $basicCount základních emocí. Zbývající '
          '${emotionDictionary.length - basicCount} najdeš v seznamu výše.',
          style: TextStyle(
            fontSize: 12,
            fontStyle: FontStyle.italic,
            color: isDarkMode ? Colors.white54 : Colors.grey.shade500,
          ),
        ),
      ],
    );
  }
}
