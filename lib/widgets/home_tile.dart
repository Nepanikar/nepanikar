import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/helpers/screen_resolution_helpers.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({
    super.key,
    required this.text,
    required this.image,
    required this.location,
  });

  final String text;
  final Widget image;
  final String location;



  @override
  Widget build(BuildContext context) {

    bool _isDarkMode = false;
    ThemeMode currentThemeMode = Theme.of(context).brightness == Brightness.dark ?
    ThemeMode.dark : ThemeMode.light;
    _isDarkMode = currentThemeMode == ThemeMode.dark ? true : false;

    return Semantics(
      button: true,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff2C0B4A).withOpacity(0.04),
              blurRadius: 4,
              offset: const Offset(0, 2), // changes position of shadow
            ),
            BoxShadow(
              color: NepanikarColors.dark.withOpacity(0.12),
              blurRadius: 48,
              offset: const Offset(0, 16), // changes position of shadow
            ),
          ],
        ),
        child: Material(
          color: _isDarkMode ? NepanikarColors.containerD : Colors.white,
          borderRadius: BorderRadius.circular(16),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => context.push(location),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ExcludeSemantics(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: context.isSmallScreen ? 30 : 40,
                          child: image,
                        ),
                        Assets.icons.navigation.arrowRight.svg(width: 16, height: 16,
                             color: _isDarkMode ? Colors.white : NepanikarColors.primaryD,)
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          text,
                          style: NepanikarFonts.bodyHeavy.copyWith(
                            fontSize: context.isSmallScreen ? 14 : 15,
                            color: _isDarkMode ? Colors.white : NepanikarColors.primaryD,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
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
