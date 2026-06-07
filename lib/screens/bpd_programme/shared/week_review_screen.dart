import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'week_review_screen.g.dart';

@TypedGoRoute<WeekReviewScreenRoute>(
  path: '/bpd-programme/week/:weekNumber/review',
)
class WeekReviewScreenRoute extends GoRouteData with $WeekReviewScreenRoute {
  const WeekReviewScreenRoute({required this.weekNumber});

  final int weekNumber;

  @override
  Widget build(BuildContext context, _) =>
      WeekReviewScreen(weekNumber: weekNumber);
}

class WeekReviewScreen extends StatefulWidget {
  const WeekReviewScreen({super.key, required this.weekNumber});

  final int weekNumber;

  @override
  State<WeekReviewScreen> createState() => _WeekReviewScreenState();
}

class _WeekReviewScreenState extends State<WeekReviewScreen> {
  final TextEditingController _benefitController = TextEditingController();
  final TextEditingController _improveController = TextEditingController();

  BpdDaysDao get _bpdDaysDao => registry.get<BpdDaysDao>();

  // Week data - what was learned each week
  static const Map<int, _WeekReviewData> _weekData = {
    1: _WeekReviewData(
      weekTitle: 'Úvod do programu',
      learnedItems: [
        _LearnedItem(
          title: 'HPO + DBT',
          description: 'Dozvěděl/a ses o hraniční poruše a terapii DBT',
        ),
        _LearnedItem(
          title: 'SMART cíle',
          description: 'Naučil/a ses stanovovat jasné a dosažitelné cíle',
        ),
        _LearnedItem(
          title: 'PLEASE',
          description: 'Poznáváš aktivity pro péči o sebe',
        ),
        _LearnedItem(
          title: 'Odpočinek',
          description: 'Víš, že pauza je důležitá součást programu',
        ),
      ],
      nextWeekTitle: 'Mindfulness',
      nextWeekDescription:
          'Ponoříme se do technik všímavosti, které ti pomohou lépe zvládat náročné emoce v přítomném okamžiku.',
    ),
  };

  @override
  void dispose() {
    _benefitController.dispose();
    _improveController.dispose();
    super.dispose();
  }

  Future<void> _completeWeek() async {
    // Mark day 7 (summary day) as completed
    await _bpdDaysDao.markDayCompleted(widget.weekNumber, 7);
    if (mounted) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;
    final weekData = _weekData[widget.weekNumber];

    return Scaffold(
      backgroundColor: isDarkMode
          ? NepanikarColors.containerColor(primaryColor)
          : NepanikarColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(context, isDarkMode),

            // Content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),

                      // Success icon and title
                      Center(
                        child: Column(
                          children: [
                            Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color: primaryColor.withOpacity(0.15),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check,
                                size: 36,
                                color: primaryColor,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Skvělá práce!',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: isDarkMode
                                    ? Colors.white
                                    : NepanikarColors.dark,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Shrnutí týdne',
                              style: TextStyle(
                                fontSize: 16,
                                color: isDarkMode
                                    ? Colors.white70
                                    : NepanikarColors.dark.withOpacity(0.7),
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'Týždeň ${widget.weekNumber} • ${weekData?.weekTitle ?? ''}',
                              style: TextStyle(
                                fontSize: 14,
                                color: isDarkMode
                                    ? Colors.white60
                                    : NepanikarColors.dark.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 32),

                      // What you learned section
                      Text(
                        'Co jsi se naučil/a',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode
                              ? Colors.white
                              : NepanikarColors.dark,
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Learned items
                      if (weekData != null)
                        ...weekData.learnedItems.map(
                          (item) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: _buildLearnedItem(
                              item,
                              primaryColor,
                              isDarkMode,
                            ),
                          ),
                        ),

                      const SizedBox(height: 24),

                      // Reflection questions
                      Text(
                        'Co pro tebe bylo tento týden nejpřínosnější?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode
                              ? Colors.white
                              : NepanikarColors.dark,
                        ),
                      ),

                      const SizedBox(height: 12),

                      _buildTextField(
                        controller: _benefitController,
                        hint: 'Tvoje odpověď...',
                        primaryColor: primaryColor,
                        isDarkMode: isDarkMode,
                      ),

                      const SizedBox(height: 24),

                      Text(
                        'Co chceš příští týden zlepšit?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode
                              ? Colors.white
                              : NepanikarColors.dark,
                        ),
                      ),

                      const SizedBox(height: 12),

                      _buildTextField(
                        controller: _improveController,
                        hint: 'Tvoje odpověď...',
                        primaryColor: primaryColor,
                        isDarkMode: isDarkMode,
                      ),

                      const SizedBox(height: 24),

                      // Next week preview
                      if (weekData != null)
                        _buildNextWeekCard(weekData, primaryColor, isDarkMode),

                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),

            // Complete button
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: _completeWeek,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 2,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dokončit týden',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.check, size: 22),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDarkMode) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.close,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
              size: 26,
            ),
            onPressed: () => context.pop(),
          ),
        ],
      ),
    );
  }

  Widget _buildLearnedItem(
    _LearnedItem item,
    Color primaryColor,
    bool isDarkMode,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDarkMode
              ? Colors.white.withOpacity(0.1)
              : Colors.grey.shade200,
        ),
        boxShadow: isDarkMode
            ? null
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Row(
        children: [
          // Checkmark circle
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check, size: 22, color: primaryColor),
          ),
          const SizedBox(width: 14),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? Colors.white : NepanikarColors.dark,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  item.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: isDarkMode
                        ? Colors.white60
                        : NepanikarColors.dark.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required Color primaryColor,
    required bool isDarkMode,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDarkMode
              ? Colors.white.withOpacity(0.1)
              : Colors.grey.shade300,
        ),
      ),
      child: TextField(
        controller: controller,
        maxLines: 3,
        style: TextStyle(
          fontSize: 15,
          color: isDarkMode ? Colors.white : NepanikarColors.dark,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: isDarkMode ? Colors.white38 : Colors.grey.shade400,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }

  Widget _buildNextWeekCard(
    _WeekReviewData weekData,
    Color primaryColor,
    bool isDarkMode,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primaryColor.withOpacity(0.15),
            primaryColor.withOpacity(0.08),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: primaryColor.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Příští týden: ${weekData.nextWeekTitle}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            weekData.nextWeekDescription,
            style: TextStyle(
              fontSize: 14,
              color: isDarkMode
                  ? Colors.white70
                  : NepanikarColors.dark.withOpacity(0.7),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _WeekReviewData {
  const _WeekReviewData({
    required this.weekTitle,
    required this.learnedItems,
    required this.nextWeekTitle,
    required this.nextWeekDescription,
  });

  final String weekTitle;
  final List<_LearnedItem> learnedItems;
  final String nextWeekTitle;
  final String nextWeekDescription;
}

class _LearnedItem {
  const _LearnedItem({required this.title, required this.description});

  final String title;
  final String description;
}
