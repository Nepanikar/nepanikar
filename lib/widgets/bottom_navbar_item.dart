import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';

BottomNavigationBarItem buildBottomNavigationBarItem({
  bool isSelected = false,
  required bool isDarkMode,
  required String svgIconPath,
  required String label,
  required BuildContext context,
}) {
  return BottomNavigationBarItem(
    icon: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: SvgPicture.asset(
            Assets.icons.marker.path,
            colorFilter: isDarkMode
                ? (isSelected
                      ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                      : const ColorFilter.mode(Colors.transparent, BlendMode.srcIn))
                : (isSelected
                      ? ColorFilter.mode(
                          NepanikarColors.primarySwatch(Theme.of(context).primaryColor).shade800,
                          BlendMode.srcIn,
                        )
                      : const ColorFilter.mode(Colors.transparent, BlendMode.srcIn)),
          ),
        ),
        SvgPicture.asset(
          svgIconPath,
          colorFilter: isDarkMode
              ? (isSelected
                    ? const ColorFilter.mode(Colors.white, BlendMode.srcIn)
                    : ColorFilter.mode(
                        NepanikarColors.primarySwatch(Theme.of(context).primaryColor).shade400,
                        BlendMode.srcIn,
                      ))
              : (isSelected
                    ? ColorFilter.mode(
                        NepanikarColors.primarySwatch(Theme.of(context).primaryColor).shade800,
                        BlendMode.srcIn,
                      )
                    : ColorFilter.mode(
                        NepanikarColors.primarySwatch(Theme.of(context).primaryColor).shade700,
                        BlendMode.srcIn,
                      )),
        ),
      ],
    ),
    label: label,
  );
}
