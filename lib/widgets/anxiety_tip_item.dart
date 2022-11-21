import 'package:flutter/material.dart';

class TipItem extends StatelessWidget {
  const TipItem({required this.scale, required this.content});

  final double scale;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 122.0),
      child: SizedBox(
        child: Transform.scale(
          scale: scale,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff2B2D41).withOpacity(0.12),
                  blurRadius: 64,
                  offset: const Offset(32, 32), // changes position of shadow
                ),
              ],
            ),
            child: content,
          ),
        ),
      ),
    );
  }
}
