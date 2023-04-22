import 'package:collection/collection.dart';
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

class NepanikarScreenWrapper extends StatefulWidget {
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

  /// If `true`, then the children will be separated with spacings.
  final bool isModuleList;

  final List<Widget> children;

  /// A layout which has a card which slightly overlaps the app bar.
  final bool isCardStackLayout;

  final Widget? floatingActionButton;

  /// Used only in card stack layout.
  final bool expandToMaxScreenHeight;

  final bool showBottomNavbar;

  @override
  State<NepanikarScreenWrapper> createState() => _NepanikarScreenWrapperState();
}

class _NepanikarScreenWrapperState extends State<NepanikarScreenWrapper> {
  final GlobalKey _appBarOverflowSizeKey = GlobalKey();

  var _appBarOverflowSize = 0.0;

  @override
  void initState() {
    super.initState();
    if (widget.isCardStackLayout &&
        widget.appBarDescription != null &&
        widget.appBarDescription!.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final appBarOverflowSize = _appBarOverflowSizeKey.currentContext?.size;
        if (appBarOverflowSize != null) {
          setState(() {
            _appBarOverflowSize = appBarOverflowSize.height;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget getPageContent() {
      if (widget.isModuleList) {
        return ListView(
          primary: false,
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
          children: widget.children.mapIndexed(
            (i, e) {
              final isFirst = i == 0;
              return Padding(
                padding: EdgeInsets.fromLTRB(0, isFirst ? 0 : 6, 0, 6),
                child: e,
              );
            },
          ).toList(),
        );
      } else {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment:
              widget.isCardStackLayout ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: widget.children,
        );
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(widget.appBarTitle), actions: widget.appBarActions),
      resizeToAvoidBottomInset: false,
      floatingActionButton: widget.floatingActionButton == null
          ? null
          : Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: widget.floatingActionButton,
            ),
      bottomNavigationBar: widget.showBottomNavbar
          ? BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                buildBottomNavigationBarItem(
                  svgIconPath: Assets.icons.home.path,
                  label: context.l10n.home,
                  isSelected: true,
                ),
                buildBottomNavigationBarItem(
                  svgIconPath: Assets.icons.calendarEvent.path,
                  label: context.l10n.records,
                ),
                buildBottomNavigationBarItem(
                  svgIconPath: Assets.icons.phone.path,
                  label: context.l10n.contacts_module,
                ),
                buildBottomNavigationBarItem(
                  svgIconPath: Assets.icons.settings.path,
                  label: context.l10n.settings,
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
        child: widget.isCardStackLayout
            ? Stack(
                children: [
                  AppBarOverflowContent(
                    key: _appBarOverflowSizeKey,
                    appBarDescription: widget.appBarDescription,
                    isCardStackLayout: widget.isCardStackLayout,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: (_appBarOverflowSize > 32 ? _appBarOverflowSize : 50) - 32,
                      // Padding from the keyboard, if opened.
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: widget.expandToMaxScreenHeight ? context.screenHeight : null,
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
                  ),
                ],
              )
            : SingleChildScrollView(
                child: widget.appBarDescription == null
                    ? Stack(
                        children: [
                          AppBarOverflowContent(
                            appBarDescription: widget.appBarDescription,
                            isCardStackLayout: widget.isCardStackLayout,
                          ),
                          getPageContent(),
                        ],
                      )
                    : Column(
                        children: [
                          AppBarOverflowContent(
                            appBarDescription: widget.appBarDescription,
                            isCardStackLayout: widget.isCardStackLayout,
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
              child: ExcludeSemantics(
                excluding: appBarDescription!.isEmpty,
                child: Text(
                  isCardStackLayout ? '${appBarDescription!}\n' : appBarDescription!,
                  textAlign: TextAlign.center,
                  style: NepanikarFonts.bodyRoman.copyWith(
                    color: NepanikarColors.primarySwatch.shade400,
                  ),
                ),
              ),
            ),
    );
  }
}
