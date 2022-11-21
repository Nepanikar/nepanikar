import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/widgets/tips_carousel_body.dart';

class DepressionTipsAppRoute extends GoRouteData {
  const DepressionTipsAppRoute();

  @override
  Widget build(BuildContext context) => const DepressionTipsAppScreen();
}

class DepressionTipsAppScreen extends StatelessWidget {
  const DepressionTipsAppScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final strings = context.l10n.depression_tips.split('\n');

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.depression_help)),
      body: SafeArea(
        child: TipsCarouselBody(
          pages: List.generate(
            (strings.length / 2).floor(),
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    strings.elementAt(index * 2),
                    textAlign: TextAlign.center,
                    style: NepanikarFonts.title2.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    strings.elementAt(index * 2 + 1),
                    textAlign: TextAlign.center,
                    style: NepanikarFonts.bodyRoman,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
