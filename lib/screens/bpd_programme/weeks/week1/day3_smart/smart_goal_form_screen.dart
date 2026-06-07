import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/services/db/bpd/bpd_smart_goals_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'smart_goal_form_screen.g.dart';

@TypedGoRoute<SmartGoalFormScreenRoute>(path: '/bpd-programme/smart/new-goal')
class SmartGoalFormScreenRoute extends GoRouteData
    with $SmartGoalFormScreenRoute {
  const SmartGoalFormScreenRoute();

  @override
  Widget build(BuildContext context, _) => const SmartGoalFormScreen();
}

class SmartGoalFormScreen extends StatefulWidget {
  const SmartGoalFormScreen({super.key});

  @override
  State<SmartGoalFormScreen> createState() => _SmartGoalFormScreenState();
}

class _SmartGoalFormScreenState extends State<SmartGoalFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final _specificController = TextEditingController();
  final _measurableController = TextEditingController();
  final _achievableController = TextEditingController();
  final _relevantController = TextEditingController();
  final _timeBoundController = TextEditingController();

  final List<_SmartFieldData> _fields = const [
    _SmartFieldData(
      letter: 'S',
      title: 'Specifické',
      subtitle: 'Co konkrétně chci dokázat?',
      hint: 'Napiš svůj cíl jasně a konkrétně...',
      example: 'Např.: Chci se naučit meditovat každý den ráno po probuzení.',
    ),
    _SmartFieldData(
      letter: 'M',
      title: 'Měřitelné',
      subtitle: 'Jak poznám, že jsem cíle dosáhl/a?',
      hint: 'Jaké jsou tvé metriky úspěchu?',
      example: 'Např.: Budu meditovat 10 minut denně, 5 dní v týdnu.',
    ),
    _SmartFieldData(
      letter: 'A',
      title: 'Adekvátní',
      subtitle: 'Je cíl v mých silách?',
      hint: 'Zhodnoť své aktuální možnosti...',
      example: 'Např.: Mám čas ráno před prací a klidné místo doma.',
    ),
    _SmartFieldData(
      letter: 'R',
      title: 'Relevantní',
      subtitle: 'Proč je pro mě tento cíl důležitý?',
      hint: 'Jakou má tento cíl pro tebe hodnotu?',
      example: 'Např.: Meditace mi pomůže lépe zvládat stres a úzkost.',
    ),
    _SmartFieldData(
      letter: 'T',
      title: 'Termínované',
      subtitle: 'Do kdy chci cíle dosáhnout?',
      hint: 'Urči si reálný časový rámec...',
      example: 'Např.: Za 30 dní chci mít zavedený ranní rituál meditace.',
    ),
  ];

  @override
  void dispose() {
    _specificController.dispose();
    _measurableController.dispose();
    _achievableController.dispose();
    _relevantController.dispose();
    _timeBoundController.dispose();
    super.dispose();
  }

  TextEditingController _getController(int index) {
    switch (index) {
      case 0:
        return _specificController;
      case 1:
        return _measurableController;
      case 2:
        return _achievableController;
      case 3:
        return _relevantController;
      case 4:
        return _timeBoundController;
      default:
        return _specificController;
    }
  }

  void _showExample(String example) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Příklad'),
        content: Text(example),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Rozumím'),
          ),
        ],
      ),
    );
  }

  Future<void> _saveGoal() async {
    if (_formKey.currentState?.validate() ?? false) {
      final smartGoalsDao = registry.get<BpdSmartGoalsDao>();
      await smartGoalsDao.createGoal(
        specific: _specificController.text.trim(),
        measurable: _measurableController.text.trim(),
        achievable: _achievableController.text.trim(),
        relevant: _relevantController.text.trim(),
        timeBound: _timeBoundController.text.trim(),
      );
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Cíl byl uložen')));
        context.pop();
      }
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
            // Header
            _buildHeader(context, isDarkMode, primaryColor),

            // Form content
            Expanded(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),

                      // Intro text
                      Text(
                        'Tento program ti pomůže dosáhnout tvých záměrů efektivněji. Definuj si svůj cíl pomocí metody SMART.',
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.5,
                          color: isDarkMode
                              ? Colors.white70
                              : Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // SMART fields
                      ...List.generate(_fields.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: _buildSmartField(
                            _fields[index],
                            _getController(index),
                            primaryColor,
                            isDarkMode,
                          ),
                        );
                      }),

                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),

            // Save button
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveGoal,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Uložit cíl',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
              'Můj SMART cíl',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isDarkMode ? Colors.white : NepanikarColors.dark,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.settings_outlined,
              color: isDarkMode ? Colors.white54 : Colors.grey.shade400,
              size: 26,
            ),
            onPressed: () {
              // TODO: Open goal settings/options
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSmartField(
    _SmartFieldData field,
    TextEditingController controller,
    Color primaryColor,
    bool isDarkMode,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header row with letter, title, and example button
        Row(
          children: [
            // Letter circle
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  field.letter,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Title and subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    field.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isDarkMode ? Colors.white : NepanikarColors.dark,
                    ),
                  ),
                  Text(
                    field.subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: isDarkMode ? Colors.white54 : Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),

            // Example button
            GestureDetector(
              onTap: () => _showExample(field.example),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'např.',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Text input field
        Container(
          decoration: BoxDecoration(
            color: isDarkMode
                ? Colors.white.withOpacity(0.05)
                : Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDarkMode
                  ? Colors.white.withOpacity(0.1)
                  : Colors.grey.shade200,
            ),
          ),
          child: TextFormField(
            controller: controller,
            maxLines: 2,
            minLines: 1,
            style: TextStyle(
              fontSize: 15,
              color: isDarkMode ? Colors.white : NepanikarColors.dark,
            ),
            decoration: InputDecoration(
              hintText: field.hint,
              hintStyle: TextStyle(
                fontSize: 14,
                color: isDarkMode ? Colors.white38 : Colors.grey.shade400,
              ),
              contentPadding: const EdgeInsets.all(16),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}

class _SmartFieldData {
  const _SmartFieldData({
    required this.letter,
    required this.title,
    required this.subtitle,
    required this.hint,
    required this.example,
  });

  final String letter;
  final String title;
  final String subtitle;
  final String hint;
  final String example;
}
