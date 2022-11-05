import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:nepanikar/games/breathing/breathing_game_screen.dart';
import 'package:polygon/polygon.dart';

class BorderPainter extends CustomPainter {
  BorderPainter({
    required this.animation,
    required this.shape,
  }) : super(repaint: animation);

  /// Animation of the AnimationController
  final Animation animation;

  final BreathingGameShape shape;

  /// Corner radius of the border
  final double cornerRadius = 12;

  /// Width of the border
  final double borderWidth = 5;

  /// Color of the border
  final Color borderColor = Colors.white;

  @override
  void paint(Canvas canvas, Size size) {
    /// Painting the border
    final rect = Offset.zero & size;
    final paint = Paint()..color = Colors.transparent;
    final progress = animation.value as double;

    var startingPositionDeg = -90;
    if (shape == BreathingGameShape.square) startingPositionDeg = -45;
    if (shape == BreathingGameShape.triangle) startingPositionDeg = -33;

    if (progress > 0) {
      paint.color = borderColor;
      paint.shader = SweepGradient(
        colors: [
          Colors.transparent,
          borderColor,
        ],
        stops: const [
          0.0,
          1.0,
        ],
        transform: GradientRotation(
          (math.pi * 2 * progress) + (startingPositionDeg * math.pi / 180),
        ),
      ).createShader(rect);
    }

    if (shape == BreathingGameShape.circle) {
      canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        size.width / 2,
        paint
          ..strokeWidth = borderWidth
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round,
      );
    }
    if (shape == BreathingGameShape.square) {
      final path = const Polygon([
        Offset(-1, -1),
        Offset(1, -1),
        Offset(1, 1),
        Offset(-1, 1),
      ]).computePath(rect: Offset.zero & size, radius: cornerRadius * 2);
      canvas.drawPath(
        path,
        paint
          ..strokeWidth = borderWidth
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round,
      );
    }

    if (shape == BreathingGameShape.triangle) {
      final path = const Polygon([
        Offset(-1, -1),
        Offset(0, 1),
        Offset(1, -1),
      ]).computePath(rect: const Offset(0, 80) & size, radius: cornerRadius * 2);
      canvas.drawPath(
        path,
        paint
          ..strokeWidth = borderWidth
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round,
      );
    }
  }

  @override
  bool shouldRepaint(BorderPainter oldDelegate) => false;
}
