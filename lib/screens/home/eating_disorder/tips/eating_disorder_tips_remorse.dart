import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/widgets/tips_carousel_body.dart';

class EatingDisorderTipsRemorseAppRoute extends GoRouteData {
  const EatingDisorderTipsRemorseAppRoute();

  @override
  Widget build(BuildContext context) => const EatingDisorderTipsRemorseScreen();
}

class EatingDisorderTipsRemorseScreen extends StatelessWidget {
  const EatingDisorderTipsRemorseScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final strings = context.l10n.food_tips_text.split('\n');

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.food_remorse)),
      body: SafeArea(
        child: TipsCarouselBody(
          pages: strings
              .map(
                (value) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Center(
                    child: Text(
                      value,
                      textAlign: TextAlign.center,
                      style: NepanikarFonts.title2.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
