import 'package:flutter/material.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/theme.dart';

class LongTile extends StatelessWidget {
  const LongTile({
    super.key,
    required this.text,
    this.description,
    required this.image,
    required this.onTap,
  });

  final String text;
  final String? description;
  final Widget image;
  final void Function() onTap;

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
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
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
                        style: NepanikarTheme.bodyHeavy,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (description != null)
                        Text(
                          description!,
                          style: NepanikarTheme.bodySmallMedium,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Assets.icons.navigation.arrowRight.svg(width: 16, height: 16),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
