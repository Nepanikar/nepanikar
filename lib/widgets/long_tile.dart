import 'package:flutter/material.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';

class LongTile extends StatelessWidget {
  const LongTile({
    super.key,
    required this.text,
    this.textColor,
    this.description,
    this.descriptionColor,
    required this.image,
    required this.onTap,
    this.onLongPress,
    this.trailing,
    this.subContent,
    this.backgroundColor,
  });

  final Color? backgroundColor;
  final String text;
  final Color? textColor;
  final String? description;
  final Color? descriptionColor;
  final Widget image;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  /// Defaults to arrow right icon.
  final Widget? trailing;

  final Widget? subContent;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff2C0B4A).withOpacity(0.04),
            blurRadius: 4,
            offset: const Offset(0, 2), // changes position of shadow
          ),
          BoxShadow(
            color: const Color(0xff280446).withOpacity(0.12),
            blurRadius: 48,
            offset: const Offset(0, 16), // changes position of shadow
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(16),
        color: backgroundColor,
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
                  children: [
                    SizedBox(
                      height: 40,
                      child: image,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            text,
                            style: NepanikarFonts.bodyHeavy.copyWith(color: textColor),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          if (description != null)
                            Text(
                              description!,
                              style:
                                  NepanikarFonts.bodySmallMedium.copyWith(color: descriptionColor),
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
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
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Theme.of(context).listTileTheme.horizontalTitleGap ?? 0,
                ),
                child: Divider(
                  height: 1,
                  thickness: 1,
                  color: NepanikarColors.primarySwatch.shade200,
                ),
              ),
              subContent!,
            ],
          ],
        ),
      ),
    );
  }
}
