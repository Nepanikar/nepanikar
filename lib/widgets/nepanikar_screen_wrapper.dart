import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/sizes.dart';
import 'package:nepanikar/helpers/screen_resolution_helpers.dart';

class NepanikarScreenWrapper extends StatelessWidget {
  const NepanikarScreenWrapper({
    super.key,
    required this.children,
    required this.appBarTitle,
    this.appBarDescription,
    this.isModuleList = true,
    this.isCardStackLayout = false,
  });

  final String appBarTitle;

  final String? appBarDescription;

  /// If `true`, then the children will be wrapped in a [SeparatedColumn] with spacings.
  final bool isModuleList;

  final List<Widget> children;

  /// A layout which has a card which slightly overlaps the app bar.
  final bool isCardStackLayout;

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
      appBar: AppBar(title: Text(appBarTitle)),
      body: SafeArea(
        child: isCardStackLayout
            ? Stack(
                children: [
                  _buildAppBarContent(context),
                  LayoutBuilder(
                    builder: (layoutContext, constraints) {
                      return Container(
                        margin: EdgeInsets.only(
                          top: context.screenHeight - constraints.maxHeight - 16,
                        ),
                        child: SizedBox(
                          width: layoutContext.screenWidth,
                          child: Card(
                            margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: SingleChildScrollView(
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
                          _buildAppBarContent(context),
                          getPageContent(),
                        ],
                      )
                    : Column(
                        children: [
                          _buildAppBarContent(context),
                          getPageContent(),
                        ],
                      ),
              ),
      ),
    );
  }

  Widget _buildAppBarContent(BuildContext context) {
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
                appBarDescription!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
    );
  }
}
