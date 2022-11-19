import 'package:flutter/material.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/widgets/material_wrapper.dart';

typedef LabelBuilder<T> = String Function(T value);

enum NepanikarDropdownType {
  filled(textColor: Color(0xff1F2C37), bgColor: NepanikarColors.filledContainer),
  outlined(textColor: NepanikarColors.dark, bgColor: Colors.white);

  const NepanikarDropdownType({required this.textColor, required this.bgColor});

  final Color textColor;
  final Color bgColor;

  Decoration? get decoration {
    switch (this) {
      case NepanikarDropdownType.filled:
        return null;
      case NepanikarDropdownType.outlined:
        return BoxDecoration(
          border: Border.all(color: NepanikarColors.dark),
          borderRadius: defaultMaterialBorderRadius,
        );
    }
  }
}

class NepanikarDropdown<T> extends StatelessWidget {
  const NepanikarDropdown({
    Key? key,
    required T? activeItem,
    required Iterable<T> items,
    required LabelBuilder<T> labelBuilder,
    required ValueChanged<T> onPick,
    bool expand = false,
  }) : this._(
          key: key,
          activeItem: activeItem,
          items: items,
          labelBuilder: labelBuilder,
          onPick: onPick,
          expand: expand,
          type: NepanikarDropdownType.filled,
        );

  const NepanikarDropdown.outlined({
    Key? key,
    required T? activeItem,
    required Iterable<T> items,
    required LabelBuilder<T> labelBuilder,
    required ValueChanged<T> onPick,
    bool expand = false,
  }) : this._(
          key: key,
          activeItem: activeItem,
          items: items,
          labelBuilder: labelBuilder,
          onPick: onPick,
          expand: expand,
          type: NepanikarDropdownType.outlined,
        );

  const NepanikarDropdown._({
    super.key,
    required this.activeItem,
    required this.items,
    required this.labelBuilder,
    required this.onPick,
    required this.expand,
    required NepanikarDropdownType type,
  }) : _type = type;

  final T? activeItem;
  final Iterable<T> items;
  final LabelBuilder<T> labelBuilder;
  final ValueChanged<T> onPick;
  final bool expand;
  final NepanikarDropdownType _type;

  @override
  Widget build(BuildContext context) {
    const rightPadding = EdgeInsets.only(right: 16);
    final textColor = _type.textColor;
    final dropDownColor = _type.bgColor;

    return MaterialWrapper(
      color: dropDownColor,
      onTap: () {},
      child: Container(
        decoration: _type.decoration,
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<T>(
            value: activeItem,
            isExpanded: expand,
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
      ),
    );
  }
}
