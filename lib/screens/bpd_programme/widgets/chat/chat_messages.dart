import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/helpers/contact_action_helpers.dart';
import 'package:url_launcher/url_launcher.dart';

/// Left inset of rich chat messages so they align with bubbles (avatar 30 + gap 8).
const double kChatMessageInset = 38;

/// Circular Nepanikař avatar shown next to the last bubble of a group.
class ChatAvatar extends StatelessWidget {
  const ChatAvatar({super.key, this.size = 30, this.visible = true});

  final double size;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(color: NepanikarColors.secondary, shape: BoxShape.circle),
        child: Icon(Icons.favorite, color: Colors.white, size: size * 0.55),
      ),
    );
  }
}

/// Incoming bot bubble. Set [showAvatar] on the last bubble of a group (draws the tail).
class ChatBotBubble extends StatelessWidget {
  const ChatBotBubble({super.key, required this.text, this.showAvatar = false});

  final String text;
  final bool showAvatar;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ChatAvatar(visible: showAvatar),
          const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.white.withOpacity(0.07) : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(18),
                  topRight: const Radius.circular(18),
                  bottomLeft: Radius.circular(showAvatar ? 6 : 18),
                  bottomRight: const Radius.circular(18),
                ),
                boxShadow: isDarkMode ? null : NepanikarColors.cardShadow(context),
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: isDarkMode ? Colors.white : NepanikarColors.dark,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Wrapper aligning a rich message (card, list, form…) with the bubble column.
class ChatRichMessage extends StatelessWidget {
  const ChatRichMessage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kChatMessageInset, bottom: 6),
      child: child,
    );
  }
}

/// Centered day separator pill (e.g. "Dnes").
class ChatDayStamp extends StatelessWidget {
  const ChatDayStamp({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.white.withOpacity(0.08) : NepanikarColors.filledContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: isDarkMode ? Colors.white54 : NepanikarColors.dark.withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}

/// Highlighted info message (chat variant of [InfoBox]).
class ChatInfoCard extends StatelessWidget {
  const ChatInfoCard({super.key, required this.text, this.title, this.icon});

  final String text;
  final String? title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return ChatRichMessage(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.white.withOpacity(0.08) : NepanikarColors.purple200,
          borderRadius: BorderRadius.circular(14),
          border: Border(
            left: BorderSide(color: isDarkMode ? Colors.white38 : primaryColor, width: 4),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[
              Row(
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 16, color: isDarkMode ? Colors.white : primaryColor),
                    const SizedBox(width: 7),
                  ],
                  Text(
                    title!,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
            ],
            Text(
              text,
              style: TextStyle(
                fontSize: 13.5,
                height: 1.5,
                color: isDarkMode ? Colors.white70 : NepanikarColors.dark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Concept card with gradient header (badge + title), body text and optional external link.
class ChatConceptCard extends StatelessWidget {
  const ChatConceptCard({
    super.key,
    required this.badge,
    required this.title,
    required this.body,
    this.linkLabel,
    this.linkUrl,
  });

  final String badge;
  final String title;
  final String body;
  final String? linkLabel;
  final String? linkUrl;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return ChatRichMessage(
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.white.withOpacity(0.07) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: isDarkMode ? null : NepanikarColors.cardShadow(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [NepanikarColors.lightness(primaryColor, 0.06), primaryColor],
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.18),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Text(
                      badge,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Text(
                body,
                style: TextStyle(
                  fontSize: 13.5,
                  height: 1.55,
                  color: isDarkMode ? Colors.white : NepanikarColors.dark,
                ),
              ),
            ),
            if (linkLabel != null && linkUrl != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () =>
                        launchUrLink(linkUrl!, launchMode: LaunchMode.externalApplication),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: isDarkMode ? Colors.white : primaryColor,
                      side: BorderSide(
                        color: isDarkMode ? Colors.white54 : primaryColor,
                        width: 1.5,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            linkLabel!,
                            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.open_in_new, size: 16),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// White card with a caption and numbered items.
class ChatNumberedList extends StatelessWidget {
  const ChatNumberedList({super.key, required this.caption, required this.items});

  final String caption;
  final List<String> items;

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
            const SizedBox(height: 10),
            ...List.generate(items.length, (i) {
              return Padding(
                padding: EdgeInsets.only(bottom: i == items.length - 1 ? 0 : 9),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      margin: const EdgeInsets.only(top: 1),
                      decoration: BoxDecoration(color: primaryColor, shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          '${i + 1}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        items[i],
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.45,
                          color: isDarkMode ? Colors.white : NepanikarColors.dark,
                        ),
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

/// Row of small stat boxes (big value + caption), e.g. "7 týdnů · 5–20 minut denně".
class ChatStatsRow extends StatelessWidget {
  const ChatStatsRow({super.key, required this.stats});

  /// Pairs of (value, caption).
  final List<(String, String)> stats;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return ChatRichMessage(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.white.withOpacity(0.07) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: isDarkMode ? null : NepanikarColors.cardShadow(context),
        ),
        child: Row(
          children: [
            for (var i = 0; i < stats.length; i++) ...[
              if (i > 0) const SizedBox(width: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? Colors.white.withOpacity(0.06)
                        : NepanikarColors.filledContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Text(
                        stats[i].$1,
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w900,
                          color: isDarkMode ? Colors.white : primaryColor,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        stats[i].$2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10.5,
                          height: 1.3,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode
                              ? Colors.white60
                              : NepanikarColors.dark.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Outlined teal chips, e.g. programme areas.
class ChatAreaChips extends StatelessWidget {
  const ChatAreaChips({super.key, required this.labels});

  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return ChatRichMessage(
      child: Wrap(
        spacing: 6,
        runSpacing: 6,
        children: labels.map((label) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.transparent : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: NepanikarColors.secondary, width: 1.5),
            ),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: NepanikarColors.secondary,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

/// Animated "Nepanikař is typing" indicator (three blinking dots).
class ChatTypingIndicator extends StatefulWidget {
  const ChatTypingIndicator({super.key});

  @override
  State<ChatTypingIndicator> createState() => _ChatTypingIndicatorState();
}

class _ChatTypingIndicatorState extends State<ChatTypingIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const ChatAvatar(),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.white.withOpacity(0.07) : Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
                bottomLeft: Radius.circular(6),
                bottomRight: Radius.circular(18),
              ),
              boxShadow: isDarkMode ? null : NepanikarColors.cardShadow(context),
            ),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, _) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(3, (i) {
                    final t = (_controller.value - i * 0.15) % 1.0;
                    final active = t >= 0 && t < 0.4;
                    return Container(
                      width: 7,
                      height: 7,
                      margin: EdgeInsets.only(right: i == 2 ? 0 : 4),
                      transform: Matrix4.translationValues(0, active ? -3 : 0, 0),
                      decoration: BoxDecoration(
                        color: (isDarkMode ? Colors.white : NepanikarColors.purple200).withOpacity(
                          active ? 1 : 0.45,
                        ),
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
