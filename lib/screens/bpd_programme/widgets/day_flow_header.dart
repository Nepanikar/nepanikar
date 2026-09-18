import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/bpd_help_button.dart';

/// Header of a multi-page day flow: close/back button, segmented progress bar,
/// an `n/N` counter and the help button.
///
/// Every HPO day screen repeated this ~55-line widget; new and reworked day
/// screens use this shared one instead.
class DayFlowHeader extends StatelessWidget {
  const DayFlowHeader({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onBack,
    required this.onClose,
  });

  final int currentPage;
  final int totalPages;

  /// Go to the previous page. Called when [currentPage] > 0.
  final VoidCallback onBack;

  /// Leave the day flow. Called on the first page.
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;
    final isFirstPage = currentPage == 0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              isFirstPage ? Icons.close : Icons.arrow_back,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
              size: 26,
            ),
            onPressed: isFirstPage ? onClose : onBack,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: List.generate(totalPages, (index) {
                  return Expanded(
                    child: Container(
                      height: 4,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: index <= currentPage
                            ? primaryColor
                            : (isDarkMode ? Colors.white.withOpacity(0.2) : Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Text(
            '${currentPage + 1}/$totalPages',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withOpacity(0.7),
            ),
          ),
          // Help is one tap away on every page of every day — see
          // [BpdHelpButton] for why it is not limited to the hard topics.
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 6),
            child: BpdHelpButton(size: 34),
          ),
        ],
      ),
    );
  }
}
