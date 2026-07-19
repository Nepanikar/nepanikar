import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';

/// Visual state of a node on the skill tree path.
enum SkillTreeNodeState {
  /// Finished — green with a check.
  completed,

  /// Unlocked and next in line — highlighted with a pulsing ring and badge.
  current,

  /// Unlocked but not the highlighted one — filled, tappable, no badge.
  available,

  /// Not unlocked yet.
  locked,
}

/// Data for one node (a programme week, a day, …).
class SkillTreeNodeData {
  const SkillTreeNodeData({
    required this.id,
    required this.label,
    required this.state,
    this.isCheckpoint = false,
  });

  final int id;
  final String label;
  final SkillTreeNodeState state;

  /// Checkpoint (e.g. the final reflection) is rendered bigger with a trophy.
  final bool isCheckpoint;
}

/// Gradient header above the path (Duolingo-style unit banner).
class SkillTreeBanner extends StatelessWidget {
  const SkillTreeBanner({
    super.key,
    required this.kicker,
    required this.title,
    required this.progress,
    required this.progressLabel,
  });

  final String kicker;
  final String title;

  /// 0–1 fraction shown in the progress bar.
  final double progress;
  final String progressLabel;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            NepanikarColors.lightness(primaryColor, 0.07),
            primaryColor,
            NepanikarColors.lightness(primaryColor, -0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.25),
            blurRadius: 32,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  kicker.toUpperCase(),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1,
                    color: Colors.white.withOpacity(0.75),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 6,
                    backgroundColor: Colors.white.withOpacity(0.25),
                    valueColor: const AlwaysStoppedAnimation<Color>(NepanikarColors.success),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  progressLabel,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Colors.white.withOpacity(0.8),
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

/// Winding path of nodes (Duolingo-style skill tree).
class SkillTreePath extends StatefulWidget {
  const SkillTreePath({super.key, required this.nodes, required this.onNodeTap});

  final List<SkillTreeNodeData> nodes;
  final void Function(int id) onNodeTap;

  @override
  State<SkillTreePath> createState() => _SkillTreePathState();
}

class _SkillTreePathState extends State<SkillTreePath> with SingleTickerProviderStateMixin {
  static const _rowHeight = 104.0;
  static const _topPadding = 40.0;
  static const _bottomPadding = 26.0;

  /// Zigzag pattern of horizontal node positions (fraction of available width).
  static const _xFractions = [0.50, 0.29, 0.22, 0.40, 0.64, 0.73, 0.50];

  late final AnimationController _pulseController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1600),
  )..repeat();

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  Offset _nodeCenter(int index, double width) {
    final fraction = _xFractions[index % _xFractions.length];
    return Offset(width * fraction, _topPadding + index * _rowHeight + 34);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final height = _topPadding + widget.nodes.length * _rowHeight + _bottomPadding;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final centers = List.generate(widget.nodes.length, (i) => _nodeCenter(i, width));

        return SizedBox(
          height: height,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: _SkillTreePathPainter(
                    centers: centers,
                    color: isDarkMode ? Colors.white.withOpacity(0.18) : NepanikarColors.purple200,
                  ),
                ),
              ),
              for (var i = 0; i < widget.nodes.length; i++)
                Positioned(
                  left: centers[i].dx - 60,
                  top: centers[i].dy - 37,
                  width: 120,
                  child: _SkillTreeNode(
                    node: widget.nodes[i],
                    pulse: _pulseController,
                    onTap: () => widget.onNodeTap(widget.nodes[i].id),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class _SkillTreeNode extends StatelessWidget {
  const _SkillTreeNode({required this.node, required this.pulse, required this.onTap});

  final SkillTreeNodeData node;
  final Animation<double> pulse;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    final isCurrent = node.state == SkillTreeNodeState.current;
    final isCompleted = node.state == SkillTreeNodeState.completed;
    final isLocked = node.state == SkillTreeNodeState.locked;
    final size = node.isCheckpoint ? 72.0 : (isCurrent ? 68.0 : 60.0);

    final Color fillColor;
    final Color shadowColor;
    switch (node.state) {
      case SkillTreeNodeState.completed:
        fillColor = NepanikarColors.success;
        shadowColor = NepanikarColors.lightness(NepanikarColors.success, -0.12);
      case SkillTreeNodeState.current:
      case SkillTreeNodeState.available:
        fillColor = primaryColor;
        shadowColor = NepanikarColors.lightness(primaryColor, -0.15);
      case SkillTreeNodeState.locked:
        fillColor = isDarkMode ? Colors.white.withOpacity(0.08) : NepanikarColors.purple200;
        shadowColor = isDarkMode
            ? Colors.black.withOpacity(0.3)
            : NepanikarColors.lightness(NepanikarColors.purple200, -0.06);
    }

    final iconColor = isLocked
        ? (isDarkMode ? Colors.white38 : const Color(0xFFB49CC9))
        : Colors.white;

    final circle = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: fillColor,
        shape: node.isCheckpoint ? BoxShape.rectangle : BoxShape.circle,
        borderRadius: node.isCheckpoint ? BorderRadius.circular(22) : null,
        boxShadow: [BoxShadow(color: shadowColor, offset: const Offset(0, 5))],
      ),
      child: Icon(
        node.isCheckpoint
            ? Icons.emoji_events
            : (isCompleted ? Icons.check : (isLocked ? Icons.lock : Icons.star)),
        color: iconColor,
        size: node.isCheckpoint ? 30 : (isCurrent ? 28 : 24),
      ),
    );

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 96,
            height: 74,
            child: AnimatedBuilder(
              animation: pulse,
              builder: (context, _) {
                final t = pulse.value;
                return Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    if (isCurrent)
                      Container(
                        width: size + 18,
                        height: size + 18,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: primaryColor.withOpacity(0.15 + 0.2 * math.sin(t * math.pi)),
                            width: 4,
                          ),
                        ),
                      ),
                    circle,
                    if (isCurrent)
                      Positioned(
                        top: -26 - 4 * math.sin(t * 2 * math.pi),
                        child: _TodayBadge(primaryColor: primaryColor),
                      ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 4),
          Text(
            node.label,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 11,
              height: 1.25,
              fontWeight: FontWeight.w700,
              color: node.state == SkillTreeNodeState.locked
                  ? (isDarkMode ? Colors.white30 : NepanikarColors.dark.withOpacity(0.35))
                  : (isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.65)),
            ),
          ),
        ],
      ),
    );
  }
}

class _TodayBadge extends StatelessWidget {
  const _TodayBadge({required this.primaryColor});

  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 4),
      decoration: BoxDecoration(
        color: isDarkMode ? NepanikarColors.dark : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: NepanikarColors.purple200.withOpacity(isDarkMode ? 0.4 : 1)),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        'TEĎ',
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.6,
          color: isDarkMode ? Colors.white : primaryColor,
        ),
      ),
    );
  }
}

/// Dotted curve winding through the node centers.
class _SkillTreePathPainter extends CustomPainter {
  const _SkillTreePathPainter({required this.centers, required this.color});

  final List<Offset> centers;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    if (centers.length < 2) return;

    final path = Path()..moveTo(centers.first.dx, centers.first.dy);
    for (var i = 1; i < centers.length; i++) {
      final prev = centers[i - 1];
      final curr = centers[i];
      final midY = (prev.dy + curr.dy) / 2;
      path.cubicTo(prev.dx, midY, curr.dx, midY, curr.dx, curr.dy);
    }

    final paint = Paint()..color = color;
    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final tangent = metric.getTangentForOffset(distance);
        if (tangent != null) {
          canvas.drawCircle(tangent.position, 2, paint);
        }
        distance += 13;
      }
    }
  }

  @override
  bool shouldRepaint(_SkillTreePathPainter oldDelegate) =>
      oldDelegate.centers != centers || oldDelegate.color != color;
}
