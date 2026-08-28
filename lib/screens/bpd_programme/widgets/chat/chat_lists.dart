import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/chat/chat_messages.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/external_link_button.dart';

/// List-shaped chat messages.
///
/// Kept out of `chat_messages.dart` so that file stays about the bubble and the
/// single-concept cards. Both widgets here are the chat counterparts of pieces
/// the form pages use: [ChatFeatureList] replaces a stack of `FeatureCard`s and
/// [ChatLinksCard] replaces the "CHCI VĚDĚT VÍC" block of `ExternalLinkButton`s.

/// One row of a [ChatFeatureList].
@immutable
class ChatFeatureItem {
  const ChatFeatureItem({required this.icon, required this.title, this.description});

  final IconData icon;
  final String title;

  /// Optional second line. Omit it for a plain labelled list.
  final String? description;
}

/// White card listing icon + title (+ description) rows under a caption.
///
/// Use it where the education names several things at once — the benefits of a
/// skill, the three skills of a day, what a week covered — and a numbered list
/// would imply an order that the source does not have.
class ChatFeatureList extends StatelessWidget {
  const ChatFeatureList({super.key, required this.caption, required this.items});

  final String caption;
  final List<ChatFeatureItem> items;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return ChatRichMessage(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.white.withOpacity(0.07) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: isDarkMode ? null : NepanikarColors.cardShadow(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              caption.toUpperCase(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.6,
                color: isDarkMode ? Colors.white : primaryColor,
              ),
            ),
            const SizedBox(height: 12),
            ...List.generate(items.length, (i) {
              final item = items[i];
              return Padding(
                padding: EdgeInsets.only(bottom: i == items.length - 1 ? 0 : 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Icon(item.icon, size: 17, color: primaryColor),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.w800,
                              height: 1.35,
                              color: isDarkMode ? Colors.white : NepanikarColors.dark,
                            ),
                          ),
                          if (item.description != null) ...[
                            const SizedBox(height: 2),
                            Text(
                              item.description!,
                              style: TextStyle(
                                fontSize: 12.5,
                                height: 1.4,
                                color: isDarkMode
                                    ? Colors.white60
                                    : NepanikarColors.dark.withOpacity(0.65),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

/// One link offered by a [ChatLinksCard].
@immutable
class ChatLink {
  const ChatLink({required this.label, required this.url, this.icon = Icons.open_in_new});

  final String label;
  final String url;
  final IconData icon;
}

/// Card holding the source's supporting links ("Chci vědět víc").
///
/// A [ChatConceptCard] takes a single link; this one is for the places where the
/// source offers several, so they arrive as one message instead of one card per
/// URL.
class ChatLinksCard extends StatelessWidget {
  const ChatLinksCard({super.key, required this.caption, required this.links});

  final String caption;
  final List<ChatLink> links;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return ChatRichMessage(
      child: Container(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 8),
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.white.withOpacity(0.07) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: isDarkMode ? null : NepanikarColors.cardShadow(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              caption.toUpperCase(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.6,
                color: isDarkMode ? Colors.white : primaryColor,
              ),
            ),
            const SizedBox(height: 4),
            ...links.map(
              (link) => ExternalLinkText(label: link.label, url: link.url, icon: link.icon),
            ),
          ],
        ),
      ),
    );
  }
}
