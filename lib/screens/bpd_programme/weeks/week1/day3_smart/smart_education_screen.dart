import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day3_smart/smart_goal_form_screen.dart';

part 'smart_education_screen.g.dart';

@TypedGoRoute<SmartEducationScreenRoute>(path: '/bpd-programme/smart')
class SmartEducationScreenRoute extends GoRouteData
    with $SmartEducationScreenRoute {
  const SmartEducationScreenRoute();

  @override
  Widget build(BuildContext context, _) => const SmartEducationScreen();
}

class SmartEducationScreen extends StatefulWidget {
  const SmartEducationScreen({super.key});

  @override
  State<SmartEducationScreen> createState() => _SmartEducationScreenState();
}

class _SmartEducationScreenState extends State<SmartEducationScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  int _currentPage = 0;

  final List<_SmartCardData> _smartCards = const [
    _SmartCardData(
      letter: 'S',
      title: 'Specifické',
      description:
          'Cíl musí být jasně definovaný. Víš přesně, čeho chceš dosáhnout? Buď konkrétní v tom, co chceš změnit.',
    ),
    _SmartCardData(
      letter: 'M',
      title: 'Měřitelné',
      description:
          'Jak poznáš, že jseš cíle dosáhl/a? Urči si konkrétní kritéria, podle kterých můžeš sledovat svůj pokrok.',
    ),
    _SmartCardData(
      letter: 'A',
      title: 'Adekvátní',
      description:
          'Je cíl v tvých silách? Zhodnoť své aktuální možnosti a zdroje. Cíl by měl být dosažitelný, ale zároveň tě motivovat.',
    ),
    _SmartCardData(
      letter: 'R',
      title: 'Relevantní',
      description:
          'Proč je pro tebe tento cíl důležitý? Jakou má tento cíl pro tebe hodnotu? Propoj ho se svými životními hodnotami.',
    ),
    _SmartCardData(
      letter: 'T',
      title: 'Termínované',
      description:
          'Do kdy chceš cíle dosáhnout? Urči si reálný časový rámec. Termín ti pomůže udržet motivaci a sledovat pokrok.',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
            // Header
            _buildHeader(context, isDarkMode, primaryColor),

            // Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),

                    // Title
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Jak si nastavit cíle?',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? Colors.white
                              : NepanikarColors.dark,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Subtitle
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Metoda SMART ti pomůže definovat cíle tak, aby byly dosažitelné a jasné. Posouvej karty do strany.',
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.5,
                          color: isDarkMode
                              ? Colors.white70
                              : Colors.grey.shade600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Card carousel
                    SizedBox(
                      height: 240,
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (index) =>
                            setState(() => _currentPage = index),
                        itemCount: _smartCards.length,
                        itemBuilder: (context, index) {
                          return _buildSmartCard(
                            _smartCards[index],
                            primaryColor,
                            isDarkMode,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Page indicators
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(_smartCards.length, (index) {
                        return Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == _currentPage
                                ? primaryColor
                                : (isDarkMode
                                      ? Colors.white24
                                      : Colors.grey.shade300),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 32),

                    // Tip box
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: _buildTipBox(isDarkMode, primaryColor),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            // Bottom button
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    const SmartGoalFormScreenRoute().push(context);
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
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Vytvořit nový cíl',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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

  Widget _buildHeader(
    BuildContext context,
    bool isDarkMode,
    Color primaryColor,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
              size: 26,
            ),
            onPressed: () => context.pop(),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'MOJE CÍLE JSOU SMART',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                color: primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmartCard(
    _SmartCardData card,
    Color primaryColor,
    bool isDarkMode,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isDarkMode
            ? Colors.white.withOpacity(0.08)
            : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Letter circle
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                card.letter,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Title
          Text(
            card.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
          ),
          const SizedBox(height: 8),

          // Description
          Flexible(
            child: Text(
              card.description,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
              style: TextStyle(
                fontSize: 13,
                height: 1.4,
                color: isDarkMode ? Colors.white70 : Colors.grey.shade600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTipBox(bool isDarkMode, Color primaryColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primaryColor.withOpacity(0.3), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.lightbulb_outline, color: primaryColor, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TIP DNE',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Zapiš si svůj dnešní cíl a projdi si ho podle SMART bodů. Uvidíš, že bude mnohem snazší s ním začít.',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: isDarkMode ? Colors.white70 : Colors.grey.shade700,
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

class _SmartCardData {
  const _SmartCardData({
    required this.letter,
    required this.title,
    required this.description,
  });

  final String letter;
  final String title;
  final String description;
}
