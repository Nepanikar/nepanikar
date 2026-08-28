import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/spoko_day/spoko_day_data.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_day_page.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';
import 'package:nepanikar/screens/contacts/eating_disorder_contacts_screen.dart';

/// Page 1/3 of a SPOKO day (Days 3–6) — area education + mapping questions +
/// optional safety contact, taught as a chat.
///
/// Replaces `SpokoEducationPage`, which used `DayPageBase` while Weeks 2–4 all
/// teach in the chat template. The old page's icon + `headerTitle` header is
/// gone: the day flow header above the page already names the day, and a
/// heading is not a chat message. Content is verbatim, supplied via
/// [SpokoDayData].
class SpokoEducationChatPage extends StatelessWidget {
  const SpokoEducationChatPage({super.key, required this.data, required this.onNext});

  final SpokoDayData data;
  final VoidCallback onNext;

  static const _nextLabel = 'Vybrat výzvu';

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
    final contact = data.contact;

    return ChatDayPage(
      onCompleted: onNext,
      steps: [
        for (var i = 0; i < data.educationParagraphs.length; i++)
          ChatStep(
            messages: [ChatBotBubble(text: data.educationParagraphs[i], showAvatar: i == 0)],
          ),
        ChatStep(messages: [ChatBotBubble(text: data.note, showAvatar: true)]),
        ChatStep(
          messages: [ChatNumberedList(caption: 'Zamysli se', items: data.questions)],
          buttonLabel: contact == null ? _nextLabel : null,
        ),
        if (contact != null)
          ChatStep(
            messages: [
              ChatRichMessage(
                child: _ContactCard(contact: contact, onTap: () => _onContact(context)),
              ),
            ],
            buttonLabel: _nextLabel,
          ),
      ],
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
