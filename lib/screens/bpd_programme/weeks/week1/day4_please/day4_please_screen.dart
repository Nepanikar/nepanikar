import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/services/db/bpd/bpd_days_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'day4_please_screen.g.dart';

@TypedGoRoute<Day4PleaseScreenRoute>(path: '/bpd-programme/week/1/day/4')
class Day4PleaseScreenRoute extends GoRouteData with $Day4PleaseScreenRoute {
  const Day4PleaseScreenRoute();

  @override
  Widget build(BuildContext context, _) => const Day4PleaseScreen();
}

class Day4PleaseScreen extends StatefulWidget {
  const Day4PleaseScreen({super.key});

  @override
  State<Day4PleaseScreen> createState() => _Day4PleaseScreenState();
}

class _Day4PleaseScreenState extends State<Day4PleaseScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  static const int _totalPages = 5;

  // Self-reflection answers
  final Map<String, bool?> _selfReflectionAnswers = {};

  // Selected challenge
  int? _selectedChallengeIndex;

  BpdDaysDao get _bpdDaysDao => registry.get<BpdDaysDao>();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _totalPages - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _completeDay() async {
    await _bpdDaysDao.markDayCompleted(1, 4);
    if (mounted) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: isDarkMode
          ? NepanikarColors.containerColor(primaryColor)
          : NepanikarColors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(primaryColor, isDarkMode),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (page) => setState(() => _currentPage = page),
                children: [
                  _IntroPage(onNext: _nextPage),
                  _PleaseOverviewPage(onNext: _nextPage),
                  _SelfReflectionPage(
                    answers: _selfReflectionAnswers,
                    onAnswerChanged: (key, value) {
                      setState(() => _selfReflectionAnswers[key] = value);
                    },
                    onNext: _nextPage,
                  ),
                  _ChallengeSelectionPage(
                    selectedIndex: _selectedChallengeIndex,
                    onChallengeSelected: (index) {
                      setState(() => _selectedChallengeIndex = index);
                    },
                    onNext: _nextPage,
                    onSkip: _nextPage,
                  ),
                  _CompletionPage(
                    selectedChallengeIndex: _selectedChallengeIndex,
                    onComplete: _completeDay,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(Color primaryColor, bool isDarkMode) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              _currentPage == 0 ? Icons.close : Icons.arrow_back,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
              size: 26,
            ),
            onPressed: () {
              if (_currentPage == 0) {
                context.pop();
              } else {
                _previousPage();
              }
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: List.generate(_totalPages, (index) {
                  return Expanded(
                    child: Container(
                      height: 4,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        color: index <= _currentPage
                            ? primaryColor
                            : (isDarkMode
                                  ? Colors.white.withOpacity(0.2)
                                  : Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Text(
              '${_currentPage + 1}/$_totalPages',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isDarkMode
                    ? Colors.white70
                    : NepanikarColors.dark.withOpacity(0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Page 1: Introduction
class _IntroPage extends StatelessWidget {
  const _IntroPage({required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),

                  // Day info
                  Row(
                    children: [
                      Text(
                        'DEN 4, TÝDEN 1',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: primaryColor,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  Row(
                    children: [
                      Text(
                        'Model PLEASE',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? Colors.white
                              : NepanikarColors.dark,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Icon
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.spa_outlined,
                        size: 70,
                        color: primaryColor,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Small icons row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSmallIcon(Icons.favorite, Colors.pink),
                      const SizedBox(width: 12),
                      _buildSmallIcon(Icons.psychology, Colors.amber),
                      const SizedBox(width: 12),
                      _buildSmallIcon(Icons.self_improvement, primaryColor),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Title
                  Text(
                    'Základy emoční odolnosti',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : NepanikarColors.dark,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 16),

                  // Description
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 16,
                        color: isDarkMode
                            ? Colors.white70
                            : NepanikarColors.dark.withOpacity(0.8),
                        height: 1.5,
                      ),
                      children: [
                        const TextSpan(text: 'Sebepéče je základním kamenem '),
                        TextSpan(
                          text: 'emoční stability',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const TextSpan(
                          text:
                              '. Když se cítíme fyzicky dobře, jsme mnohem odolnější vůči stresu a náročným situacím.',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Quote box
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? Colors.white.withOpacity(0.05)
                          : Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isDarkMode
                            ? Colors.white.withOpacity(0.1)
                            : Colors.grey.shade200,
                      ),
                    ),
                    child: Text(
                      '"Model PLEASE je soubor dovedností, které nám pomáhají snižovat zranitelnost vůči negativním emocím."',
                      style: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        color: isDarkMode
                            ? Colors.white70
                            : NepanikarColors.dark.withOpacity(0.8),
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),

          // Next button
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: onNext,
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
                      'Pokračovat',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, size: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallIcon(IconData icon, Color color) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 18, color: color),
    );
  }
}

// Page 2: PLEASE Overview
class _PleaseOverviewPage extends StatelessWidget {
  const _PleaseOverviewPage({required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  // Section label
                  Text(
                    'OSOBNÍ ROZVOJ',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                      letterSpacing: 0.5,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    'Základy odolnosti',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : NepanikarColors.dark,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Description
                  Text(
                    'Model PLEASE vám pomůže snížit emoční zranitelnost tím, že se postaráte o své biologické potřeby.',
                    style: TextStyle(
                      fontSize: 16,
                      color: isDarkMode
                          ? Colors.white70
                          : NepanikarColors.dark.withOpacity(0.8),
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // PLEASE items
                  _buildPleaseItem(
                    letter: 'P/L',
                    icon: Icons.local_hospital_outlined,
                    title: 'Pečuj o tělo',
                    description: 'Léčba tělesných onemocnění',
                    primaryColor: primaryColor,
                    isDarkMode: isDarkMode,
                  ),

                  const SizedBox(height: 12),

                  _buildPleaseItem(
                    letter: 'E',
                    icon: Icons.restaurant_outlined,
                    title: 'Energie z výživy',
                    description: 'Vyvážená a pravidelná strava',
                    primaryColor: primaryColor,
                    isDarkMode: isDarkMode,
                  ),

                  const SizedBox(height: 12),

                  _buildPleaseItem(
                    letter: 'A',
                    icon: Icons.block,
                    title: 'Abstinuj',
                    description: 'Vyhýbání se náykovým látkám',
                    primaryColor: primaryColor,
                    isDarkMode: isDarkMode,
                  ),

                  const SizedBox(height: 12),

                  _buildPleaseItem(
                    letter: 'S',
                    icon: Icons.bedtime_outlined,
                    title: 'Spánek',
                    description: 'Dostatečný a kvalitní odpočinek',
                    primaryColor: primaryColor,
                    isDarkMode: isDarkMode,
                  ),

                  const SizedBox(height: 12),

                  _buildPleaseItem(
                    letter: 'E',
                    icon: Icons.directions_run,
                    title: 'Energie z pohybu',
                    description: 'Pravidelná fyzická aktivita',
                    primaryColor: primaryColor,
                    isDarkMode: isDarkMode,
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),

          // Next button
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: onNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 2,
                ),
                child: const Text(
                  'Pokračovat',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPleaseItem({
    required String letter,
    required IconData icon,
    required String title,
    required String description,
    required Color primaryColor,
    required bool isDarkMode,
  }) {
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
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Row(
        children: [
          // Letter circle
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                letter,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(width: 16),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icon, size: 18, color: primaryColor),
                    const SizedBox(width: 8),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isDarkMode ? Colors.white : NepanikarColors.dark,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
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
}

// Page 3: Self-Reflection
class _SelfReflectionPage extends StatefulWidget {
  const _SelfReflectionPage({
    required this.answers,
    required this.onAnswerChanged,
    required this.onNext,
  });

  final Map<String, bool?> answers;
  final void Function(String key, bool value) onAnswerChanged;
  final VoidCallback onNext;

  @override
  State<_SelfReflectionPage> createState() => _SelfReflectionPageState();
}

class _SelfReflectionPageState extends State<_SelfReflectionPage> {
  final Set<int> _expandedSections = {};

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  // Section label
                  Text(
                    'KROK 3: SEBEPÉČE',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                      letterSpacing: 0.5,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    'Jak se o sebe staráš?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : NepanikarColors.dark,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Description
                  Text(
                    'Zkuste se zamyslet nad kategoriemi PLEASE a upřímně si odpovězte. Tato reflexe je jen pro vás.',
                    style: TextStyle(
                      fontSize: 15,
                      color: isDarkMode
                          ? Colors.white70
                          : NepanikarColors.dark.withOpacity(0.7),
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Expandable sections
                  _buildExpandableSection(
                    index: 0,
                    icon: Icons.local_hospital_outlined,
                    title: 'Fyzické zdraví (P)',
                    subtitle: 'Treat Physical Illness',
                    questions: [
                      _QuestionData(
                        key: 'p_sick',
                        text: 'Starám se o své tělo, když jsem nemocný/á?',
                      ),
                    ],
                    primaryColor: primaryColor,
                    isDarkMode: isDarkMode,
                  ),

                  const SizedBox(height: 12),

                  _buildExpandableSection(
                    index: 1,
                    icon: Icons.restaurant_outlined,
                    title: 'Vyvážená strava (E)',
                    subtitle: 'Eating Balance',
                    questions: [
                      _QuestionData(
                        key: 'e_regular',
                        text: 'Jím pravidelně a vyváženě?',
                      ),
                      _QuestionData(
                        key: 'e_extreme',
                        text: 'Vyhýbám se extrémům v jídle?',
                      ),
                    ],
                    primaryColor: primaryColor,
                    isDarkMode: isDarkMode,
                  ),

                  const SizedBox(height: 12),

                  _buildExpandableSection(
                    index: 2,
                    icon: Icons.block,
                    title: 'Bez návykových látek (A)',
                    subtitle: 'Avoid Mood-Altering Substances',
                    questions: [
                      _QuestionData(
                        key: 'a_substances',
                        text: 'Vyhýbám se návykovým látkám?',
                      ),
                    ],
                    primaryColor: primaryColor,
                    isDarkMode: isDarkMode,
                  ),

                  const SizedBox(height: 12),

                  _buildExpandableSection(
                    index: 3,
                    icon: Icons.bedtime_outlined,
                    title: 'Kvalitní spánek (S)',
                    subtitle: 'Sleep Balance',
                    questions: [
                      _QuestionData(
                        key: 's_sleep',
                        text: 'Spím dostatečně a kvalitně?',
                      ),
                    ],
                    primaryColor: primaryColor,
                    isDarkMode: isDarkMode,
                  ),

                  const SizedBox(height: 12),

                  _buildExpandableSection(
                    index: 4,
                    icon: Icons.directions_run,
                    title: 'Pohyb (E)',
                    subtitle: 'Exercise Daily',
                    questions: [
                      _QuestionData(
                        key: 'e_exercise',
                        text: 'Věnuji se pravidelně fyzické aktivitě?',
                      ),
                    ],
                    primaryColor: primaryColor,
                    isDarkMode: isDarkMode,
                  ),

                  const SizedBox(height: 24),

                  // Note at bottom
                  Text(
                    'Pamatujte, že sebepéče není sobectvím.',
                    style: TextStyle(
                      fontSize: 13,
                      color: isDarkMode
                          ? Colors.white60
                          : NepanikarColors.dark.withOpacity(0.6),
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),

          // Next button
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: widget.onNext,
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
                      'Pokračovat k dalšímu kroku',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, size: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableSection({
    required int index,
    required IconData icon,
    required String title,
    required String subtitle,
    required List<_QuestionData> questions,
    required Color primaryColor,
    required bool isDarkMode,
  }) {
    final isExpanded = _expandedSections.contains(index);

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDarkMode
              ? Colors.white.withOpacity(0.1)
              : Colors.grey.shade200,
        ),
      ),
      child: Column(
        children: [
          // Header
          InkWell(
            onTap: () {
              setState(() {
                if (isExpanded) {
                  _expandedSections.remove(index);
                } else {
                  _expandedSections.add(index);
                }
              });
            },
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(icon, color: primaryColor, size: 22),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: isDarkMode
                                ? Colors.white
                                : NepanikarColors.dark,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 12,
                            color: isDarkMode
                                ? Colors.white60
                                : NepanikarColors.dark.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: isDarkMode ? Colors.white60 : Colors.grey,
                  ),
                ],
              ),
            ),
          ),

          // Questions (expanded)
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                children: questions.map((q) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: _buildQuestion(
                      key: q.key,
                      text: q.text,
                      primaryColor: primaryColor,
                      isDarkMode: isDarkMode,
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildQuestion({
    required String key,
    required String text,
    required Color primaryColor,
    required bool isDarkMode,
  }) {
    final answer = widget.answers[key];

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDarkMode
            ? Colors.white.withOpacity(0.03)
            : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: isDarkMode
                    ? Colors.white70
                    : NepanikarColors.dark.withOpacity(0.8),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Yes/No buttons
          _buildAnswerButton(
            label: 'Ano',
            isSelected: answer == true,
            onTap: () => widget.onAnswerChanged(key, true),
            primaryColor: primaryColor,
            isDarkMode: isDarkMode,
          ),
          const SizedBox(width: 8),
          _buildAnswerButton(
            label: 'Ne',
            isSelected: answer == false,
            onTap: () => widget.onAnswerChanged(key, false),
            primaryColor: primaryColor,
            isDarkMode: isDarkMode,
          ),
        ],
      ),
    );
  }

  Widget _buildAnswerButton({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    required Color primaryColor,
    required bool isDarkMode,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? primaryColor
                : (isDarkMode ? Colors.white30 : Colors.grey.shade300),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isSelected
                ? Colors.white
                : (isDarkMode
                      ? Colors.white70
                      : NepanikarColors.dark.withOpacity(0.7)),
          ),
        ),
      ),
    );
  }
}

class _QuestionData {
  const _QuestionData({required this.key, required this.text});
  final String key;
  final String text;
}

// Page 4: Challenge Selection
class _ChallengeSelectionPage extends StatelessWidget {
  const _ChallengeSelectionPage({
    required this.selectedIndex,
    required this.onChallengeSelected,
    required this.onNext,
    required this.onSkip,
  });

  final int? selectedIndex;
  final void Function(int index) onChallengeSelected;
  final VoidCallback onNext;
  final VoidCallback onSkip;

  static const _challenges = [
    _ChallengeData(
      title: 'Pravidelný spánek',
      description: 'Usínání a vstávání ve stejnou dobu pro lepší energii.',
      icon: Icons.bedtime_outlined,
      isRecommended: true,
    ),
    _ChallengeData(
      title: 'Digitální detox večer',
      description: '30 minut před spaním bez telefonu a obrazovek.',
      icon: Icons.phone_android,
    ),
    _ChallengeData(
      title: 'Ranní protažení',
      description: 'Stačí 5 minut jednoduchého pohybu hned po probuzení.',
      icon: Icons.self_improvement,
    ),
    _ChallengeData(
      title: 'Sklenice vody navíc',
      description: 'Vypijte sklenici vody hned po ránu a ke každé kávě.',
      icon: Icons.water_drop_outlined,
    ),
    _ChallengeData(
      title: 'Vědomé dýchání',
      description: '3x denně se zastavte na 1 minutu a soustřeďte se na dech.',
      icon: Icons.air,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  // Progress info
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Krok 4 z 5',
                        style: TextStyle(
                          fontSize: 14,
                          color: isDarkMode
                              ? Colors.white70
                              : NepanikarColors.dark.withOpacity(0.7),
                        ),
                      ),
                      Text(
                        '80% hotovo',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Title
                  Text(
                    'Malá výzva na příští 3 dny',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : NepanikarColors.dark,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Zkuste si vybrat jednu aktivitu, která vám dává největší smysl. Je to jen na zkoušku.',
                    style: TextStyle(
                      fontSize: 15,
                      color: isDarkMode
                          ? Colors.white70
                          : NepanikarColors.dark.withOpacity(0.7),
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Challenge cards
                  ...List.generate(_challenges.length, (index) {
                    final challenge = _challenges[index];
                    final isSelected = selectedIndex == index;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _buildChallengeCard(
                        challenge: challenge,
                        isSelected: isSelected,
                        onTap: () => onChallengeSelected(index),
                        primaryColor: primaryColor,
                        isDarkMode: isDarkMode,
                      ),
                    );
                  }),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),

          // Buttons
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: selectedIndex != null ? onNext : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: isDarkMode
                      ? Colors.white.withOpacity(0.1)
                      : Colors.grey.shade300,
                  disabledForegroundColor: isDarkMode
                      ? Colors.white30
                      : Colors.grey.shade500,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: selectedIndex != null ? 2 : 0,
                ),
                child: const Text(
                  'Vybrat výzvu',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          // Skip button
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: TextButton(
              onPressed: onSkip,
              child: Text(
                'Zatím přeskočit',
                style: TextStyle(
                  fontSize: 16,
                  color: isDarkMode
                      ? Colors.white60
                      : NepanikarColors.dark.withOpacity(0.6),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChallengeCard({
    required _ChallengeData challenge,
    required bool isSelected,
    required VoidCallback onTap,
    required Color primaryColor,
    required bool isDarkMode,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? primaryColor.withOpacity(0.1)
              : (isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? primaryColor
                : (isDarkMode
                      ? Colors.white.withOpacity(0.1)
                      : Colors.grey.shade200),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isDarkMode
              ? null
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (challenge.isRecommended)
                    Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'DOPORUČENO',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: primaryColor,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  Text(
                    challenge.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isDarkMode ? Colors.white : NepanikarColors.dark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    challenge.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: isDarkMode
                          ? Colors.white60
                          : NepanikarColors.dark.withOpacity(0.6),
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // Icon/image placeholder
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(challenge.icon, size: 32, color: primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChallengeData {
  const _ChallengeData({
    required this.title,
    required this.description,
    required this.icon,
    this.isRecommended = false,
  });

  final String title;
  final String description;
  final IconData icon;
  final bool isRecommended;
}

// Page 5: Completion
class _CompletionPage extends StatelessWidget {
  const _CompletionPage({
    required this.selectedChallengeIndex,
    required this.onComplete,
  });

  final int? selectedChallengeIndex;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;

    final selectedChallenge = selectedChallengeIndex != null
        ? _ChallengeSelectionPage._challenges[selectedChallengeIndex!]
        : null;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),

                  // Progress info
                  Row(
                    children: [
                      Text(
                        'Denní pokrok',
                        style: TextStyle(
                          fontSize: 14,
                          color: isDarkMode
                              ? Colors.white70
                              : NepanikarColors.dark.withOpacity(0.7),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '5/5',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Full progress bar
                  Container(
                    height: 6,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Skvělá práce! Dnešní cíle byly splněny.',
                    style: TextStyle(
                      fontSize: 14,
                      color: isDarkMode
                          ? Colors.white60
                          : NepanikarColors.dark.withOpacity(0.6),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Success illustration placeholder
                  Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.landscape,
                          size: 80,
                          color: primaryColor.withOpacity(0.5),
                        ),
                        const SizedBox(height: 8),
                        Icon(
                          Icons.flutter_dash,
                          size: 24,
                          color: primaryColor.withOpacity(0.7),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Title
                  Text(
                    'Udělali jste velký pokrok',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : NepanikarColors.dark,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 12),

                  Text(
                    'Úspěšně jste prošli všemi cvičeními zaměřenými na zvládání stresu a hluboké dýchání. Vaše tělo i mysl vám poděkují.',
                    style: TextStyle(
                      fontSize: 15,
                      color: isDarkMode
                          ? Colors.white70
                          : NepanikarColors.dark.withOpacity(0.7),
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 24),

                  // Challenge reminder (if selected)
                  if (selectedChallenge != null)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: primaryColor.withOpacity(0.3),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'VAŠE VÝZVA',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: primaryColor,
                                  letterSpacing: 0.5,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Nezapomeňte dnes večer na 15 minut digitálního detoxu před spaním.',
                            style: TextStyle(
                              fontSize: 15,
                              color: isDarkMode
                                  ? Colors.white
                                  : NepanikarColors.dark,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 16),

                  // Tomorrow preview
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? Colors.white.withOpacity(0.05)
                          : Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isDarkMode
                            ? Colors.white.withOpacity(0.1)
                            : Colors.grey.shade200,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ZÍTRA',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: isDarkMode
                                      ? Colors.white60
                                      : NepanikarColors.dark.withOpacity(0.5),
                                  letterSpacing: 0.5,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Den 5: Odpočinek',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: isDarkMode
                                      ? Colors.white
                                      : NepanikarColors.dark,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Čas na regeneraci a integraci naučeného.',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: isDarkMode
                                      ? Colors.white60
                                      : NepanikarColors.dark.withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.nightlight_round,
                          size: 32,
                          color: isDarkMode
                              ? Colors.white30
                              : Colors.grey.shade400,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),

          // Complete button
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: onComplete,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 2,
                ),
                child: const Text(
                  'Dokončit den',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
