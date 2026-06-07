import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/bpd_weeks_screen.dart';
import 'package:nepanikar/screens/main/main_screen.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/utils/registry.dart';

part 'bpd_landing_screen.g.dart';

@TypedGoRoute<BpdLandingScreenRoute>(path: '/bpd-programme/landing')
class BpdLandingScreenRoute extends GoRouteData with $BpdLandingScreenRoute {
  const BpdLandingScreenRoute();

  @override
  Widget build(BuildContext context, _) => const BpdLandingScreen();
}

class BpdLandingScreen extends StatelessWidget {
  const BpdLandingScreen({super.key});

  UserSettingsDao get _userSettingsDao => registry.get<UserSettingsDao>();

  Future<void> _handleStartJourney(BuildContext context) async {
    await _userSettingsDao.markBpdProgrammeStarted();
    // Navigate to BPD weeks screen
    if (context.mounted) {
      context.go(const BpdWeeksScreenRoute().location);
    }
  }

  void _handleMaybeLater(BuildContext context) {
    context.go(const MainRoute().location, extra: MainPageExtra(initIndex: 0));
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      // Purple gear icon
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.settings,
                          size: 50,
                          color: primaryColor,
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Title
                      Text(
                        'Vaša cesta k stabilite so Stromom Zručností',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? Colors.white
                              : NepanikarColors.dark,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 18),

                      // Description
                      Text(
                        'Vieme, že život s bipolárnou poruchou prináša výzvy. '
                        'Tento 7-dňový program je navrhnutý ako váš sprievodca k budovaniu '
                        'odolnosti a lepšiemu zvládaniu nálad.',
                        style: TextStyle(
                          fontSize: 15,
                          color: isDarkMode
                              ? Colors.white70
                              : NepanikarColors.dark.withOpacity(0.8),
                          height: 1.45,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 28),

                      // Bullet points
                      _buildBulletPoint(
                        'Budovanie copingových mechanizmov',
                        'Naučte sa osvedčené techniky na rozpoznanie a zvládanie '
                            'emocionálnych výziev.',
                        isDarkMode,
                        primaryColor,
                      ),
                      const SizedBox(height: 20),
                      _buildBulletPoint(
                        'Stabilizácia nálady',
                        'Osvojte si každodenné návyky, ktoré podporujú rovnováhu a '
                            'lepšiemu zvládaniu nálad.',
                        isDarkMode,
                        primaryColor,
                      ),

                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),

              // Start button - fixed at bottom
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () => _handleStartJourney(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                  ),
                  child: const Text(
                    'Začať svoju cestu',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              // Maybe later button
              TextButton(
                onPressed: () => _handleMaybeLater(context),
                child: Text(
                  'Možno neskôr',
                  style: TextStyle(
                    fontSize: 16,
                    color: primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(
    String title,
    String description,
    bool isDarkMode,
    Color primaryColor,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 38,
          height: 38,
          margin: const EdgeInsets.only(top: 2),
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check_circle, color: primaryColor, size: 22),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15.5,
                  color: isDarkMode ? Colors.white : NepanikarColors.dark,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontSize: 13.5,
                  color: isDarkMode
                      ? Colors.white70
                      : NepanikarColors.dark.withOpacity(0.7),
                  height: 1.35,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
