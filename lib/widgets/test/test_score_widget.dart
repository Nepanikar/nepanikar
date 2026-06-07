import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/main.dart';

class StaticScoreWidget extends StatelessWidget {
  final int score;
  final String label;

  const StaticScoreWidget({
    super.key,
    required this.score,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // OUTER GRADIENT RING
          Container(
            width: 207,
            height: 207,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Colors.purple.withOpacity(0.15),
                  Colors.purple.withOpacity(0.02),
                  Colors.transparent,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              // INNER GRADIENT RING
              child: Container(
                width: 190,
                height: 190,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Colors.purple.withOpacity(0.20),
                      Colors.purple.withOpacity(0.06),
                      Colors.transparent,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  // WHITE INNER CIRCLE
                  child: Container(
                    width: 173,
                    height: 173,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      score.toString(),
                      style: const TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF9D4EDD),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            label,
            style: const TextStyle(
              fontSize: 24,
              color: NepanikarColors.defaultPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
