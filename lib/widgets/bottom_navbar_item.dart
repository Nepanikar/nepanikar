import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';

BottomNavigationBarItem buildBottomNavigationBarItem({
  bool isSelected = false,
  required bool isDarkMode,
  required String svgIconPath,
  required String label,

}) {
  return BottomNavigationBarItem(
    icon: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: SvgPicture.asset(
            Assets.icons.marker.path,
            color: isDarkMode ?
                    (isSelected ? Colors.white : Colors.transparent)
                    :
                    (isSelected ? NepanikarColors.primarySwatch.shade800 : Colors.transparent),
          ),
        ),
        SvgPicture.asset(
          svgIconPath,
          color: isDarkMode ?
                    (isSelected ? Colors.white : NepanikarColors.primarySwatch.shade400)
                    :
                    (isSelected ? NepanikarColors.primarySwatch.shade800 : NepanikarColors.primarySwatch.shade700),
        ),
      ],
    ),
    label: label,
  );
}
