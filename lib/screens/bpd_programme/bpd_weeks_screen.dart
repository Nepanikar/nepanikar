import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/bpd_week_detail_screen.dart';
import 'package:nepanikar/services/bpd_weeks_data_manager.dart';
import 'package:nepanikar/services/db/bpd/bpd_week_models.dart';
import 'package:nepanikar/services/db/bpd/bpd_weeks_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'bpd_weeks_screen.g.dart';

@TypedGoRoute<BpdWeeksScreenRoute>(path: '/bpd-programme/weeks')
class BpdWeeksScreenRoute extends GoRouteData with $BpdWeeksScreenRoute {
  const BpdWeeksScreenRoute();

  @override
  Widget build(BuildContext context, _) => const BpdWeeksScreen();
}

class BpdWeeksScreen extends StatefulWidget {
  const BpdWeeksScreen({super.key});

  @override
  State<BpdWeeksScreen> createState() => _BpdWeeksScreenState();
}

class _BpdWeeksScreenState extends State<BpdWeeksScreen> {
  BpdWeeksDao get _bpdWeeksDao => registry.get<BpdWeeksDao>();
  BpdWeeksDataManager get _bpdWeeksDataManager =>
      registry.get<BpdWeeksDataManager>();

  List<BpdWeekProgress> _weeksProgress = [];
  bool _isLoading = true;
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85, initialPage: 0);
    _loadWeeksProgress();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _loadWeeksProgress() async {
    final progress = await _bpdWeeksDao.getAllWeeksProgress();
    setState(() {
      _weeksProgress = progress;
      _isLoading = false;
    });
  }

  void _handleWeekTap(BpdWeekProgress weekProgress, BpdWeekData weekData) {
    if (weekProgress.isUnlocked()) {
      context.push(
        BpdWeekDetailScreenRoute(weekNumber: weekProgress.weekNumber).location,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('This week is still locked')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    // Set status bar color to match the purple header
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: primaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: false,
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 0.3, 0.6, 0.85, 1.0],
            colors: isDarkMode
                ? [
                    primaryColor.withOpacity(0.4),
                    primaryColor.withOpacity(0.25),
                    const Color(0xFF2A1A3D),
                    const Color(0xFF1F1528),
                    NepanikarColors.containerColor(primaryColor),
                  ]
                : [
                    const Color(0xFFE8D5FF), // Soft lavender purple at top
                    const Color(0xFFF5E6FF), // Light purple-pink
                    const Color(0xFFFFF0F8), // Very light pink
                    const Color(0xFFFFF8FA), // Almost white with hint of warmth
                    const Color(0xFFFFFDFE), // Nearly white
                  ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Centered title
                      const Text(
                        'BPD program',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      // Close button on the left
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () => context.pop(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Page indicator dots
              if (!_isLoading && _weeksProgress.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_weeksProgress.length, (index) {
                      final isActive = index == _currentPage;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: isActive ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: isActive
                              ? primaryColor
                              : (isDarkMode ? Colors.white30 : Colors.black26),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }),
                  ),
                ),

              // Week cards carousel
              Expanded(
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : PageView.builder(
                        scrollDirection: Axis.vertical,
                        controller: _pageController,
                        onPageChanged: (page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        itemCount: _weeksProgress.length,
                        itemBuilder: (context, index) {
                          final weekProgress = _weeksProgress[index];
                          final weekData = _bpdWeeksDataManager.getWeekData(
                            weekProgress.weekNumber,
                          );

                          if (weekData == null) return const SizedBox.shrink();

                          return AnimatedBuilder(
                            animation: _pageController,
                            builder: (context, child) {
                              double scale = 1.0;
                              double opacity = 1.0;

                              if (_pageController.position.haveDimensions) {
                                final page = _pageController.page ?? 0.0;
                                final diff = (page - index).abs();

                                // Scale: centered card is 1.0, others are smaller
                                scale = (1.0 - (diff * 0.25)).clamp(0.75, 1.0);

                                // Opacity: make non-centered cards slightly transparent
                                opacity = (1.0 - (diff * 0.3)).clamp(0.7, 1.0);
                              }

                              return Center(
                                child: Transform.scale(
                                  scale: scale,
                                  child: Opacity(
                                    opacity: opacity,
                                    child: child,
                                  ),
                                ),
                              );
                            },
                            child: _buildWeekCard(
                              weekProgress: weekProgress,
                              weekData: weekData,
                              primaryColor: primaryColor,
                              isDarkMode: isDarkMode,
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeekCard({
    required BpdWeekProgress weekProgress,
    required BpdWeekData weekData,
    required Color primaryColor,
    required bool isDarkMode,
  }) {
    final isUnlocked = weekProgress.isUnlocked();

    return GestureDetector(
      onTap: () => _handleWeekTap(weekProgress, weekData),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Week icon/illustration - the main circular element
            _buildWeekIcon(
              weekProgress: weekProgress,
              primaryColor: primaryColor,
              isDarkMode: isDarkMode,
              isUnlocked: isUnlocked,
            ),

            const SizedBox(height: 24),

            // Week level label
            Text(
              'ÚROVEŇ ${weekProgress.weekNumber}',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
                color: isUnlocked
                    ? primaryColor.withOpacity(0.8)
                    : (isDarkMode ? Colors.white38 : Colors.black38),
              ),
            ),

            const SizedBox(height: 8),

            // Week title
            Text(
              weekData.titleKey.toUpperCase(),
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: isUnlocked
                    ? (isDarkMode ? Colors.white : primaryColor)
                    : (isDarkMode ? Colors.white30 : Colors.black26),
                letterSpacing: 0.5,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 16),

            // Status indicator
            if (weekProgress.isCompleted)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.green.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.check_circle, color: Colors.green, size: 18),
                    const SizedBox(width: 6),
                    Text(
                      'Completed',
                      style: TextStyle(
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              )
            else if (!isUnlocked)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: (isDarkMode ? Colors.white10 : Colors.black12),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isDarkMode ? Colors.white24 : Colors.black26,
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.lock,
                      color: isDarkMode ? Colors.white54 : Colors.black54,
                      size: 18,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Unlocks ${_getUnlockDateText(weekProgress.unlockDate)}',
                      style: TextStyle(
                        color: isDarkMode ? Colors.white54 : Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeekIcon({
    required BpdWeekProgress weekProgress,
    required Color primaryColor,
    required bool isDarkMode,
    required bool isUnlocked,
  }) {
    // Make purple dark and saturated like in the reference image
    final darkPurple = HSLColor.fromColor(
      primaryColor,
    ).withSaturation(0.85).withLightness(0.35).toColor();

    return Container(
      width: 240,
      height: 240,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isUnlocked
            ? primaryColor
            : (isDarkMode ? Colors.white10 : Colors.black12),
        boxShadow: isUnlocked
            ? [
                BoxShadow(
                  color: primaryColor.withOpacity(0.5),
                  blurRadius: 70,
                  spreadRadius: 20,
                ),
                BoxShadow(
                  color: primaryColor.withOpacity(0.3),
                  blurRadius: 40,
                  spreadRadius: 10,
                ),
              ]
            : null,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Main icon
          Icon(
            _getWeekIcon(weekProgress.weekNumber),
            size: 120,
            color: isUnlocked
                ? Colors.white
                : (isDarkMode ? Colors.white30 : Colors.black26),
          ),
          // Lock overlay for locked weeks
          if (!isUnlocked)
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: isDarkMode
                    ? NepanikarColors.containerColor(
                        primaryColor,
                      ).withOpacity(0.9)
                    : Colors.white.withOpacity(0.95),
                shape: BoxShape.circle,
                border: Border.all(
                  color: isDarkMode ? Colors.white24 : Colors.black12,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Icon(
                Icons.lock_rounded,
                size: 40,
                color: isDarkMode ? Colors.white54 : Colors.black45,
              ),
            ),
        ],
      ),
    );
  }

  IconData _getWeekIcon(int weekNumber) {
    switch (weekNumber) {
      case 1:
        return Icons.self_improvement;
      case 2:
        return Icons.air;
      case 3:
        return Icons.favorite;
      case 4:
        return Icons.shield;
      case 5:
        return Icons.people;
      case 6:
        return Icons.psychology;
      case 7:
        return Icons.emoji_events;
      default:
        return Icons.circle;
    }
  }

  String _getUnlockDateText(DateTime unlockDate) {
    final now = DateTime.now();
    final difference = unlockDate.difference(now);

    if (difference.inDays > 0) {
      return 'in ${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'}';
    } else if (difference.inHours > 0) {
      return 'in ${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'}';
    } else {
      return 'soon';
    }
  }
}
