import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/anxiety_tip_item.dart';
import 'package:nepanikar/widgets/nepanikar_button.dart';

class TipsCarouselBody extends StatefulWidget {
  const TipsCarouselBody({super.key, required this.pages});

  final List<Widget> pages;

  @override
  State<TipsCarouselBody> createState() => _TipsCarouselBodyState();
}

class _TipsCarouselBodyState extends State<TipsCarouselBody> {
  final PageController controller = PageController(
    viewportFraction: 0.8,
  );
  double activeIndex = 0;
  final analytics = registry.get<FirebaseAnalytics>();

  @override
  Widget build(BuildContext context) {
    final containerColor = customColorsBasedOnDarkMode(context, NepanikarColors.headerD, NepanikarColors.primary);

    return Stack(
      children: [
        Container(
          height: 150,
          width: double.infinity,
          color: containerColor,
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
                        itemCount: widget.pages.length,
                        onPageChanged: (index) {
                          unawaited(
                            analytics.logEvent(
                              name: 'slide',
                              parameters: {
                                'tip': index + 1,
                              },
                            ),
                          );
                        },
                        itemBuilder: (context, index) {
                          return FractionallySizedBox(
                            widthFactor: 1.01,
                            child: ExcludeSemantics(
                              excluding: activeIndex != index,
                              child: TipItem(
                                scale: 1.0 - (0.15 * (index - activeIndex).abs()),
                                content: widget.pages.elementAt(index),
                              ),
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
                          left: (148 / widget.pages.length) * activeIndex,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: NepanikarColors.primary,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: (148 / (widget.pages.length)) / 2,
                              ),
                              child: const SizedBox(
                                height: 6,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: NepanikarButton.secondary(
                              onTap: () => controller.previousPage(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              ),
                              enabled: activeIndex > 0,
                              text: context.l10n.previous,
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
                              enabled: activeIndex.floor() < widget.pages.length - 1,
                              text: context.l10n.next,
                              trailingIcon: Assets.icons.navigation.chevronRight,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
