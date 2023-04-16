import 'package:flutter/material.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/widgets/nepanikar_horizontal_divider.dart';

class LongTile extends StatelessWidget {
  const LongTile({
    super.key,
    required this.text,
    this.textTextStyle = NepanikarFonts.bodyHeavy,
    this.description,
    this.descriptionTextStyle = NepanikarFonts.bodySmallMedium,
    this.descriptionSemanticsEnabled = true,
    this.descriptionMaxLines,
    required this.image,
    required this.onTap,
    this.onLongPress,
    this.trailing,
    this.subContent,
    this.backgroundColor,
    this.showSubContentSeparator = true,
  });

  final Color? backgroundColor;
  final String text;
  final TextStyle textTextStyle;
  final String? description;
  final bool descriptionSemanticsEnabled;
  final TextStyle descriptionTextStyle;
  final int? descriptionMaxLines;
  final Widget? image;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool showSubContentSeparator;

  /// Defaults to arrow right icon.
  final Widget? trailing;

  final Widget? subContent;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: NepanikarColors.cardShadow,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        color: backgroundColor,
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: onTap,
              onLongPress: onLongPress,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                child: Row(
                  crossAxisAlignment:
                      image == null ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                  children: [
                    if (image != null) ...[
                      ConstrainedBox(
                        constraints: BoxConstraints.tight(const Size.square(40)),
                        child: image,
                      ),
                      const SizedBox(width: 16),
                    ],
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            text,
                            style: textTextStyle,
                          ),
                          if (description != null)
                            ExcludeSemantics(
                              excluding: !descriptionSemanticsEnabled,
                              child: Text(
                                description!,
                                style: descriptionTextStyle,
                                maxLines: descriptionMaxLines,
                                overflow:
                                    descriptionMaxLines != null ? TextOverflow.ellipsis : null,
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child:
                          trailing ?? Assets.icons.navigation.arrowRight.svg(width: 16, height: 16),
                    ),
                  ],
                ),
              ),
            ),
            if (subContent != null) ...[
              if (showSubContentSeparator)
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Theme.of(context).listTileTheme.horizontalTitleGap ?? 0,
                  ),
                  child: const NepanikarHorizontalDivider(),
                ),
              subContent!,
            ],
          ],
        ),
      ),
    );
  }
}
