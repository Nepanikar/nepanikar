import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';

BottomNavigationBarItem buildBottomNavigationBarItem({
  bool isSelected = false,
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
            color: isSelected ? NepanikarColors.primarySwatch.shade800 : Colors.transparent,
          ),
        ),
        SvgPicture.asset(
          svgIconPath,
          color: isSelected
              ? NepanikarColors.primarySwatch.shade800
              : NepanikarColors.primarySwatch.shade700,
        ),
      ],
    ),
    label: label,
  );
}
