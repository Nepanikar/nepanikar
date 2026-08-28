import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day2_describe/day2_content.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/structured_worksheet.dart';

/// Page 1/6 — why naming an emotion is where regulation starts.
class Day2IntroChatPage extends StatelessWidget {
  const Day2IntroChatPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return ChatDayPage(
      onCompleted: onNext,
      steps: [
        for (var i = 0; i < day2IntroChat.length; i++)
          ChatStep(
            messages: [ChatBotBubble(text: day2IntroChat[i], showAvatar: true)],
            buttonLabel: i == day2IntroChat.length - 1 ? 'Ukázat model' : null,
          ),
      ],
    );
  }
}

/// Page 2/6 — the six-step model for describing an emotion.
class Day2ModelPage extends StatelessWidget {
  const Day2ModelPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return DayPageBase(
      buttonText: 'Vyzkoušet na své situaci',
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          const SectionHeader(
            icon: Icons.slow_motion_video_outlined,
            title: 'Model pro popis emocí',
          ),
          const SizedBox(height: 12),
          Text(
            day2ModelLead,
            style: TextStyle(
              fontSize: 15,
              height: 1.55,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.85),
            ),
          ),
          const SizedBox(height: 16),
          ...List.generate(day2Model.length, (i) {
            final (title, description) = day2Model[i];
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: NumberedBenefit(
                number: '${i + 1}',
                title: title,
                description: description,
              ),
            );
          }),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

/// Page 3/6 — the model applied to the user's own recent situation.
class Day2WorksheetPage extends StatelessWidget {
  const Day2WorksheetPage({super.key, required this.onNext});

  final VoidCallback onNext;

  static const worksheetId = 'week3_day2_model';

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
          const SectionHeader(icon: Icons.edit_note_outlined, title: 'Moje situace'),
          const SizedBox(height: 12),
          Text(
            day2WorksheetLead,
            style: TextStyle(
              fontSize: 15,
              height: 1.55,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.85),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Nemusíš to vyplnit celé teď — co napíšeš, zůstane uložené '
            'a můžeš se k tomu vrátit.',
            style: TextStyle(
              fontSize: 13,
              height: 1.45,
              color: isDarkMode ? Colors.white54 : NepanikarColors.dark.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 16),
          StructuredWorksheet(
            worksheetId: worksheetId,
            exampleTitle: 'Zobrazit příklad',
            example: day2WorksheetExample,
            sections: List.generate(day2Model.length, (i) {
              final (title, question) = day2Model[i];
              return WorksheetSection(
                title: title,
                intro: question,
                fields: [WorksheetField(id: 'step_$i', label: title)],
              );
            }),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

/// Page 4/6 — what validation is and what it is good for.
class Day2ValidationPage extends StatelessWidget {
  const Day2ValidationPage({super.key, required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return DayPageBase(
      buttonText: 'Zkusit validaci',
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          const SectionHeader(icon: Icons.verified_outlined, title: day2ValidationTitle),
          const SizedBox(height: 12),
          Text(
            day2ValidationBody,
            style: TextStyle(
              fontSize: 15,
              height: 1.55,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.85),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'K čemu mi validace emocí je?',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),
          const SizedBox(height: 12),
          ...day2ValidationBenefits.map(
            (benefit) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: FeatureCard(
                icon: Icons.check_circle_outline,
                title: benefit.$1,
                description: benefit.$2,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

/// Page 5/6 — the five sentence frames.
class Day2StemsPage extends StatelessWidget {
  const Day2StemsPage({super.key, required this.onNext});

  final VoidCallback onNext;

  static const worksheetId = 'week3_day2_validation';

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
          const SectionHeader(icon: Icons.format_quote_outlined, title: 'Zkusme validaci'),
          const SizedBox(height: 12),
          Text(
            day2StemsLead,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              height: 1.5,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            day2StemsHelp,
            style: TextStyle(
              fontSize: 15,
              height: 1.55,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.85),
            ),
          ),
          const SizedBox(height: 18),
          StructuredWorksheet(
            worksheetId: worksheetId,
            sections: List.generate(day2Stems.length, (i) {
              final (stem, example) = day2Stems[i];
              return WorksheetSection(
                title: stem,
                fields: [
                  WorksheetField(id: 'stem_$i', label: day2StemFieldLabel, example: example),
                ],
              );
            }),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
