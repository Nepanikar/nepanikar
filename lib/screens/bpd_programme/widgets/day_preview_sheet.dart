import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';

/// Data model for Day Preview
class DayPreviewData {
  const DayPreviewData({
    required this.dayNumber,
    required this.weekNumber,
    required this.title,
    required this.description,
    required this.estimatedTime,
    required this.activityType,
    this.isCompleted = false,
    this.isFavorite = false,
  });

  final int dayNumber;
  final int weekNumber;
  final String title;
  final String description;
  final String estimatedTime;
  final String activityType;
  final bool isCompleted;
  final bool isFavorite;
}

/// Shows the Day Preview bottom sheet
Future<bool?> showDayPreviewSheet({
  required BuildContext context,
  required DayPreviewData data,
  VoidCallback? onStart,
  VoidCallback? onFavoriteToggle,
}) {
  return showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (context) => DayPreviewSheet(
      data: data,
      onStart: onStart,
      onFavoriteToggle: onFavoriteToggle,
    ),
  );
}

class DayPreviewSheet extends StatelessWidget {
  const DayPreviewSheet({
    super.key,
    required this.data,
    this.onStart,
    this.onFavoriteToggle,
  });

  final DayPreviewData data;
  final VoidCallback? onStart;
  final VoidCallback? onFavoriteToggle;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? NepanikarColors.dark : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drag handle
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.white24 : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Header row: Day badge, Week, Favorite
              _buildHeader(context, isDarkMode, primaryColor),
              const SizedBox(height: 16),

              // Title
              Text(
                data.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : NepanikarColors.dark,
                ),
              ),
              const SizedBox(height: 12),

              // Description
              Text(
                data.description,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: isDarkMode ? Colors.white70 : Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 20),

              // Meta info row
              _buildMetaInfo(context, isDarkMode),
              const SizedBox(height: 24),

              // CTA Button
              _buildCTAButton(context, primaryColor),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    bool isDarkMode,
    Color primaryColor,
  ) {
    return Row(
      children: [
        // Day badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.calendar_today_outlined,
                size: 14,
                color: primaryColor,
              ),
              const SizedBox(width: 6),
              Text(
                'Deň ${data.dayNumber}',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),

        // Week indicator
        Text(
          'Týždeň ${data.weekNumber}',
          style: TextStyle(
            fontSize: 14,
            color: isDarkMode ? Colors.white54 : Colors.grey.shade500,
          ),
        ),

        const Spacer(),

        // Favorite button
        GestureDetector(
          onTap: onFavoriteToggle,
          child: Icon(
            data.isFavorite ? Icons.favorite : Icons.favorite_border,
            size: 24,
            color: data.isFavorite
                ? const Color(0xFF4ECDC4) // Teal/turquoise color from design
                : (isDarkMode ? Colors.white38 : Colors.grey.shade400),
          ),
        ),
      ],
    );
  }

  Widget _buildMetaInfo(BuildContext context, bool isDarkMode) {
    final metaColor = isDarkMode ? Colors.white54 : Colors.grey.shade500;

    return Row(
      children: [
        // Estimated time
        Icon(Icons.access_time, size: 18, color: metaColor),
        const SizedBox(width: 6),
        Text(
          data.estimatedTime,
          style: TextStyle(fontSize: 14, color: metaColor),
        ),
        const SizedBox(width: 24),

        // Activity type
        Icon(Icons.description_outlined, size: 18, color: metaColor),
        const SizedBox(width: 6),
        Text(
          data.activityType,
          style: TextStyle(fontSize: 14, color: metaColor),
        ),
      ],
    );
  }

  Widget _buildCTAButton(BuildContext context, Color primaryColor) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop(true);
          onStart?.call();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data.isCompleted ? 'Zopakovať deň' : 'Začať deň',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward, size: 20),
          ],
        ),
      ),
    );
  }
}
