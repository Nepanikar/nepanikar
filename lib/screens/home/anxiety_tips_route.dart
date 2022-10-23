import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/widgets/anxiety_tip_item.dart';
import 'package:nepanikar/widgets/nepanikar_button.dart';

class AnxietyTipsAppRoute extends GoRouteData {
  const AnxietyTipsAppRoute();

  @override
  Widget build(BuildContext context) => const AnxietyTipsAppScreen();
}

class AnxietyTipsAppScreen extends StatefulWidget {
  const AnxietyTipsAppScreen({super.key});

  @override
  State<AnxietyTipsAppScreen> createState() => _AnxietyTipsAppScreenState();
}

class _AnxietyTipsAppScreenState extends State<AnxietyTipsAppScreen> {
  final PageController controller = PageController(
    viewportFraction: 0.8,
  );
  double activeIndex = 0;

  // TODO: Content
  final pages = List.generate(
    10,
    (index) => Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Text('image'),
        Text('title'),
        Text('content'),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          // TODO: l10n
          'Co dělat při úzkosti',
          style: NepanikarFonts.title3.copyWith(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 150,
              width: double.infinity,
              color: NepanikarColors.primary,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 600),
              child: Stack(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 18,
                      ),
                      Flexible(
                        child: NotificationListener<ScrollNotification>(
                          onNotification: (ScrollNotification notification) {
                            if (notification is ScrollUpdateNotification) {
                              setState(() {
                                activeIndex = controller.page!;
                              });
                            }
                            return false;
                          },
                          child: PageView.builder(
                            controller: controller,
                            itemCount: pages.length,
                            itemBuilder: (context, index) {
                              return FractionallySizedBox(
                                widthFactor: 1.01,
                                child: AnxietyTipItem(
                                  scale: 1.0 - (0.15 * (index - activeIndex).abs()),
                                  content: pages.elementAt(index),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 148,
                              height: 6,
                              decoration: BoxDecoration(
                                color: NepanikarColors.primarySwatch.shade300,
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                            Positioned(
                              left: (148 / pages.length) * activeIndex,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: NepanikarColors.primary,
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: (148 / (pages.length)) / 2),
                                  child: const SizedBox(
                                    height: 6,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Row(
                            children: [
                              Flexible(
                                child: NepanikarButton.secondary(
                                  onTap: () => controller.previousPage(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeInOut,
                                  ),
                                  enabled: activeIndex > 0,
                                  // TODO: l10n
                                  text: 'Předchozí',
                                  leadingIcon: Assets.icons.navigation.chevronLeft,
                                ),
                              ),
                              const SizedBox(
                                width: 24,
                              ),
                              Flexible(
                                child: NepanikarButton(
                                  onTap: () => controller.nextPage(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeInOut,
                                  ),
                                  enabled: activeIndex.floor() < pages.length - 1,
                                  // TODO: l10n
                                  text: 'Další',
                                  trailingIcon: Assets.icons.navigation.chevronRight,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
