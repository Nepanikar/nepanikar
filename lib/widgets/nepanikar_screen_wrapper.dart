import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/app/theme/sizes.dart';
import 'package:nepanikar/helpers/screen_resolution_helpers.dart';
import 'package:nepanikar/screens/main/main_screen.dart';
import 'package:nepanikar/widgets/bottom_navbar_item.dart';

class NepanikarScreenWrapper extends StatelessWidget {
  const NepanikarScreenWrapper({
    super.key,
    required this.appBarTitle,
    required this.children,
    this.appBarDescription,
    this.appBarActions,
    this.isModuleList = true,
    this.isCardStackLayout = false,
    this.floatingActionButton,
    this.expandToMaxScreenHeight = false,
    this.showBottomNavbar = false,
  });

  final String appBarTitle;

  final String? appBarDescription;

  final List<Widget>? appBarActions;

  /// If `true`, then the children will be wrapped in a [SeparatedColumn] with spacings.
  final bool isModuleList;

  final List<Widget> children;

  /// A layout which has a card which slightly overlaps the app bar.
  final bool isCardStackLayout;

  final Widget? floatingActionButton;

  /// Used only in card stack layout.
  final bool expandToMaxScreenHeight;

  final bool showBottomNavbar;

  @override
  Widget build(BuildContext context) {
    Widget getPageContent() {
      if (isModuleList) {
        return SeparatedColumn(
          separatorBuilder: NepanikarSizes.separatorBuilder(),
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 16.0,
          ),
          children: children,
        );
      } else {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment:
              isCardStackLayout ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: children,
        );
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle), actions: appBarActions),
      resizeToAvoidBottomInset: false,
      floatingActionButton: floatingActionButton == null
          ? null
          : Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: floatingActionButton,
            ),
      bottomNavigationBar: showBottomNavbar
          ? BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                buildBottomNavigationBarItem(
                  svgIconPath: Assets.icons.home.path,
                  label: context.l10n.home,
                  isSelected: true,
                ),
                buildBottomNavigationBarItem(
                  svgIconPath: Assets.icons.calendarEvent.path,
                  // TODO: l10n Matěj
                  label: 'Záznamy',
                ),
                buildBottomNavigationBarItem(
                  svgIconPath: Assets.icons.phone.path,
                  // TODO: l10n Matěj
                  label: 'Kontakty',
                ),
                buildBottomNavigationBarItem(
                  svgIconPath: Assets.icons.settings.path,
                  // TODO: l10n Matěj
                  label: 'Nastavení',
                ),
              ],
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              backgroundColor: const Color(0xAAFAF4FF),
              elevation: 0,
              selectedItemColor: NepanikarColors.primarySwatch.shade800,
              unselectedItemColor: NepanikarColors.primarySwatch.shade700,
              onTap: (index) {
                context
                  ..go(const MainRoute().location)
                  ..pushReplacement(
                    const MainRoute().location,
                    extra: MainPageExtra(initIndex: index),
                  );
              },
            )
          : null,
      body: SafeArea(
        child: isCardStackLayout
            ? Stack(
                children: [
                  AppBarOverflowContent(
                    appBarDescription: appBarDescription,
                    isCardStackLayout: isCardStackLayout,
                  ),
                  LayoutBuilder(
                    builder: (layoutContext, constraints) {
                      return Container(
                        margin: EdgeInsets.only(
                          top: context.screenHeight - constraints.maxHeight - 32,
                          // Padding from the keyboard, if opened.
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: SizedBox(
                          width: layoutContext.screenWidth,
                          height: expandToMaxScreenHeight ? context.screenHeight : null,
                          child: Card(
                            clipBehavior: Clip.hardEdge,
                            margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: SingleChildScrollView(
                                clipBehavior: Clip.none,
                                child: getPageContent(),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )
            : SingleChildScrollView(
                child: appBarDescription == null
                    ? Stack(
                        children: [
                          AppBarOverflowContent(
                            appBarDescription: appBarDescription,
                            isCardStackLayout: isCardStackLayout,
                          ),
                          getPageContent(),
                        ],
                      )
                    : Column(
                        children: [
                          AppBarOverflowContent(
                            appBarDescription: appBarDescription,
                            isCardStackLayout: isCardStackLayout,
                          ),
                          getPageContent(),
                        ],
                      ),
              ),
      ),
    );
  }
}

class AppBarOverflowContent extends StatelessWidget {
  const AppBarOverflowContent({
    super.key,
    required this.appBarDescription,
    required this.isCardStackLayout,
  });

  final String? appBarDescription;
  final bool isCardStackLayout;

  @override
  Widget build(BuildContext context) {
    final pageSidePadding = NepanikarSizes.screenContentPadding.left;
    return Container(
      color: NepanikarColors.primary,
      width: double.infinity,
      height: appBarDescription == null ? 50 : null,
      child: appBarDescription == null
          ? null
          : Padding(
              padding: EdgeInsets.fromLTRB(pageSidePadding, 6, pageSidePadding, pageSidePadding),
              child: Text(
                isCardStackLayout ? '${appBarDescription!}\n\n' : appBarDescription!,
                maxLines: 3,
                textAlign: TextAlign.center,
                style: NepanikarFonts.bodyRoman.copyWith(
                  color: NepanikarColors.primarySwatch.shade400,
                ),
              ),
            ),
    );
  }
}
