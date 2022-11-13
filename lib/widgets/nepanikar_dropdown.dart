import 'package:flutter/material.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/widgets/material_wrapper.dart';

typedef LabelBuilder<T> = String Function(T value);

class NepanikarDropdown<T> extends StatelessWidget {
  const NepanikarDropdown({
    super.key,
    required this.activeItem,
    required this.items,
    required this.labelBuilder,
    required this.onPick,
  });

  final T? activeItem;
  final Iterable<T> items;
  final LabelBuilder<T> labelBuilder;
  final ValueChanged<T> onPick;

  @override
  Widget build(BuildContext context) {
    const textColor = Color(0xff1f2c37);
    const dropDownColor = NepanikarColors.filledContainer;
    const rightPadding = EdgeInsets.only(right: 16);

    return MaterialWrapper(
      color: dropDownColor,
      onTap: () {},
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton<T>(
          value: activeItem,
          icon: Padding(
            padding: rightPadding,
            child: Assets.icons.navigation.chevronDown.svg(),
          ),
          underline: const SizedBox.shrink(),
          dropdownColor: dropDownColor,
          items: items.map<DropdownMenuItem<T>>(
            (T item) {
              final isSelected = item == activeItem;
              return DropdownMenuItem<T>(
                value: item,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: rightPadding,
                  child: Text(
                    labelBuilder(item),
                    style: isSelected
                        ? NepanikarFonts.bodyBlack.copyWith(color: textColor)
                        : NepanikarFonts.bodyRoman.copyWith(color: textColor),
                  ),
                ),
              );
            },
          ).toList(),
          onChanged: (T? val) {
            if (val != null) {
              onPick.call(val);
            }
          },
        ),
      ),
    );
  }
}
