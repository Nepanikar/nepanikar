import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/bpd_week_detail_screen.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/skill_tree.dart';
import 'package:nepanikar/screens/main/main_screen.dart';
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
  BpdWeeksDataManager get _bpdWeeksDataManager => registry.get<BpdWeeksDataManager>();

  List<BpdWeekProgress> _weeksProgress = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadWeeksProgress();
  }

  Future<void> _loadWeeksProgress() async {
    var progress = await _bpdWeeksDao.getAllWeeksProgress();
    if (progress.isEmpty) {
      await _bpdWeeksDao.initializeWeeks(DateTime.now());
      progress = await _bpdWeeksDao.getAllWeeksProgress();
    }
    if (!mounted) return;
    setState(() {
      _weeksProgress = progress;
      _isLoading = false;
    });
  }

  /// A week is open when its content is implemented ([kImplementedBpdWeeks]);
  /// weeks without content stay locked no matter what their unlock date says.
  bool _isWeekOpen(BpdWeekProgress weekProgress) =>
      kImplementedBpdWeeks.contains(weekProgress.weekNumber);

  void _handleWeekTap(BpdWeekProgress weekProgress) {
    if (_isWeekOpen(weekProgress)) {
      context
          .push(BpdWeekDetailScreenRoute(weekNumber: weekProgress.weekNumber).location)
          .then((_) => _loadWeeksProgress());
    } else {
      _showLockedWeekSheet(weekProgress);
    }
  }

  void _handleNodeTap(int weekNumber) {
    final progress = _weeksProgress.where((w) => w.weekNumber == weekNumber).firstOrNull;
    if (progress != null) _handleWeekTap(progress);
  }

  /// Leaves the DBT programme back to the app's home screen.
  ///
  /// The weeks screen is a child of [MainRoute], so the [MainScreen] underneath
  /// is preserved on whichever tab launched the programme (the DBT tab). Going
  /// to `/` with an explicit home-tab index makes [MainScreen] switch back to
  /// Home (it reacts to the changed `extra` in `didUpdateWidget`), instead of
  /// returning to the stale DBT tab whose navigator is stuck on a spinner.
  void _exitToMain() {
    context.go(const MainRoute().location, extra: MainPageExtra(initIndex: 0));
  }

  String _weekTitle(int weekNumber) =>
      _bpdWeeksDataManager.getWeekData(weekNumber)?.titleKey ?? 'Týden $weekNumber';

  /// Maps week progress to tree node states: unimplemented weeks are locked,
  /// completed → green, first open-uncompleted → highlighted "current",
  /// remaining open weeks → available.
  List<SkillTreeNodeData> _buildTreeNodes() {
    final firstActiveIndex = _weeksProgress.indexWhere((w) => !w.isCompleted && _isWeekOpen(w));
    return List.generate(_weeksProgress.length, (i) {
      final progress = _weeksProgress[i];
      final SkillTreeNodeState state;
      if (!_isWeekOpen(progress)) {
        state = SkillTreeNodeState.locked;
      } else if (progress.isCompleted) {
        state = SkillTreeNodeState.completed;
      } else if (i == firstActiveIndex) {
        state = SkillTreeNodeState.current;
      } else {
        state = SkillTreeNodeState.available;
      }
      return SkillTreeNodeData(
        id: progress.weekNumber,
        label: 'Týden ${progress.weekNumber} · ${_weekTitle(progress.weekNumber)}',
        state: state,
        isCheckpoint: i == _weeksProgress.length - 1,
      );
    });
  }

  String _formatUnlockDate(DateTime date) {
    const months = [
      'ledna',
      'února',
      'března',
      'dubna',
      'května',
      'června',
      'července',
      'srpna',
      'září',
      'října',
      'listopadu',
      'prosince',
    ];
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final target = DateTime(date.year, date.month, date.day);
    final days = target.difference(today).inDays;

    final String relative;
    if (days <= 0) {
      relative = 'dnes';
    } else if (days == 1) {
      relative = 'zítra';
    } else if (days <= 4) {
      relative = 'za $days dny';
    } else {
      relative = 'za $days dní';
    }
    return '${date.day}. ${months[date.month - 1]} ($relative)';
  }

  void _showLockedWeekSheet(BpdWeekProgress weekProgress) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;
    final textColor = isDarkMode ? Colors.white : NepanikarColors.dark;
    final isImplemented = kImplementedBpdWeeks.contains(weekProgress.weekNumber);
    final subtitle = isImplemented
        ? 'Tento týden je zatím zamčený. Program se odemyká postupně, týden po týdnu.'
        : 'Obsah tohoto týdne pro tebe ještě připravujeme.';
    final unlockIcon = isImplemented ? Icons.calendar_today : Icons.update;
    final unlockText = isImplemented
        ? 'Odemkne se ${_formatUnlockDate(weekProgress.unlockDate)}'
        : 'Odemkne se v některé z příštích aktualizací';

    showModalBottomSheet<void>(
      context: context,
      backgroundColor: isDarkMode ? NepanikarColors.containerColor(primaryColor) : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.white24 : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.white.withOpacity(0.08) : NepanikarColors.purple200,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.lock,
                    size: 30,
                    color: isDarkMode ? Colors.white70 : primaryColor,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'Týden ${weekProgress.weekNumber} · ${_weekTitle(weekProgress.weekNumber)}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, height: 1.5, color: textColor.withOpacity(0.7)),
                ),
                const SizedBox(height: 18),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? Colors.white.withOpacity(0.06)
                        : NepanikarColors.filledContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(unlockIcon, size: 18, color: isDarkMode ? Colors.white70 : primaryColor),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          unlockText,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(sheetContext).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: const Text(
                      'Rozumím',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
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

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) _exitToMain();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: isDarkMode
            ? NepanikarColors.containerColor(primaryColor)
            : const Color(0xFFFBF6FF),
        body: SafeArea(
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
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Centered title
                      const Text(
                        'DBT program',
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
                          icon: const Icon(Icons.close, color: Colors.white, size: 28),
                          onPressed: _exitToMain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Skill tree of programme weeks
              Expanded(
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : _weeksProgress.isEmpty
                    ? const SizedBox.shrink()
                    : SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
                        child: Column(
                          children: [
                            _buildProgrammeBanner(),
                            SkillTreePath(nodes: _buildTreeNodes(), onNodeTap: _handleNodeTap),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgrammeBanner() {
    final currentWeek = _weeksProgress.where((w) => !w.isCompleted && _isWeekOpen(w)).firstOrNull;
    final completedCount = _weeksProgress.where((w) => w.isCompleted).length;
    final bannerWeek = currentWeek ?? _weeksProgress.last;

    return SkillTreeBanner(
      kicker: 'DBT program · Týden ${bannerWeek.weekNumber}',
      title: _weekTitle(bannerWeek.weekNumber),
      progress: _weeksProgress.isEmpty ? 0 : completedCount / _weeksProgress.length,
      progressLabel: '$completedCount ze ${_weeksProgress.length} týdnů hotovo',
    );
  }
}
