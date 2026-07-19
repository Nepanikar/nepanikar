import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/spoko_day/spoko_day_data.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/day_page_base.dart';
import 'package:nepanikar/screens/contacts/eating_disorder_contacts_screen.dart';

/// Page 1/3 of a SPOKO day — area education + mapping questions + optional
/// safety contact. Content is verbatim, supplied via [SpokoDayData].
class SpokoEducationPage extends StatelessWidget {
  const SpokoEducationPage({super.key, required this.data, required this.onNext});

  final SpokoDayData data;
  final VoidCallback onNext;

  void _onContact(BuildContext context) {
    switch (data.contact!.action) {
      case SpokoContactAction.eatingDisorderContacts:
        const EatingDisorderContactsRoute().push(context);
      case SpokoContactAction.comingSoon:
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Tato funkce se připravuje.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;
    final secondaryText = isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.8);

    return DayPageBase(
      buttonText: 'Pokračovat',
      onButtonPressed: onNext,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(data.headerIcon, color: primaryColor, size: 26),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  data.headerTitle,
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : NepanikarColors.dark,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...data.educationParagraphs.map(
            (p) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Text(p, style: TextStyle(fontSize: 15, height: 1.5, color: secondaryText)),
            ),
          ),
          Text(
            data.note,
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              fontStyle: FontStyle.italic,
              color: isDarkMode ? Colors.white60 : NepanikarColors.dark.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Zamysli se',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),
          const SizedBox(height: 10),
          ...data.questions.map(
            (q) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _QuestionCard(text: q),
            ),
          ),
          if (data.contact != null) ...[
            const SizedBox(height: 6),
            _ContactCard(contact: data.contact!, onTap: () => _onContact(context)),
          ],
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class _QuestionCard extends StatelessWidget {
  const _QuestionCard({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            width: 26,
            height: 26,
            decoration: const BoxDecoration(
              color: NepanikarColors.secondary,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                '?',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 1.35,
                color: isDarkMode ? Colors.white : NepanikarColors.dark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  const _ContactCard({required this.contact, required this.onTap});

  final SpokoContact contact;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: NepanikarColors.secondary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: NepanikarColors.secondary, width: 1.5),
        ),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: NepanikarColors.secondary,
                borderRadius: BorderRadius.circular(9),
              ),
              child: const Icon(Icons.call, color: Colors.white, size: 18),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contact.text,
                    style: TextStyle(
                      fontSize: 12.5,
                      height: 1.45,
                      color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    contact.label,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: NepanikarColors.secondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward, size: 18, color: NepanikarColors.secondary),
          ],
        ),
      ),
    );
  }
}
