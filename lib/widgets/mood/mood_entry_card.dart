import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';

class MoodEntryCard extends StatelessWidget {
  const MoodEntryCard({
    super.key,
    required this.dateTime,
    required this.moodIcon,
    required this.moodDescription,
    required this.onTap,
    this.isDarkMode = false,
    this.moodColor,
  });

  final bool isDarkMode;
  final Color? moodColor;
  final String dateTime;
  final SvgGenImage moodIcon;
  final String moodDescription;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const backgroundColor = NepanikarColors.containerD;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: Row(
            children: [
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dateTime,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      moodDescription,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 16
                      ),
                    ),
                  ],
                ),
              ),
              SvgPicture.asset(
                moodIcon.path,
                width: 45,
                height: 45,
              ),
              const SizedBox(width: 10)
            ],
          ),
        ),
      ),
    );
  }
}