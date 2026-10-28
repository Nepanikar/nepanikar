import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/bpd_programme/bpd_weeks_screen.dart';
import 'package:nepanikar/screens/bpd_programme/widgets/bpd_help_button.dart';
import 'package:nepanikar/screens/main/main_screen.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/services/notifications/notifications_service.dart';
import 'package:nepanikar/utils/crashlytics_utils.dart';
import 'package:nepanikar/utils/registry.dart';

part 'bpd_landing_screen.g.dart';

@TypedGoRoute<BpdLandingScreenRoute>(path: '/bpd-programme/landing')
class BpdLandingScreenRoute extends GoRouteData with $BpdLandingScreenRoute {
  const BpdLandingScreenRoute();

  /// Sends anyone who has already started straight into their weeks, instead of
  /// meeting them with the pitch again in week 4. Here rather than at the two
  /// entry points, so a later notification or deep link is treated the same way.
  @override
  Future<String?> redirect(BuildContext context, GoRouterState state) async {
    final status = await registry.get<UserSettingsDao>().getBpdProgrammeStatus();
    return status.hasStarted ? const BpdWeeksScreenRoute().location : null;
  }

  @override
  Widget build(BuildContext context, _) => const BpdLandingScreen();
}

class BpdLandingScreen extends StatelessWidget {
  const BpdLandingScreen({super.key});

  UserSettingsDao get _userSettingsDao => registry.get<UserSettingsDao>();

  Future<void> _handleStartJourney(BuildContext context) async {
    final l10n = context.l10n;
    await _userSettingsDao.markBpdProgrammeStarted();
    // First moment the day/week reminders can be scheduled — the unlock dates only
    // exist once the programme has started. Never blocks the navigation: scheduling
    // is incidental to what the button promises.
    try {
      await registry.get<NotificationsService>().rescheduleNotifications(l10n);
    } catch (e, s) {
      await logExceptionToCrashlytics(
        e,
        s,
        logMessage: 'BPD_LANDING: Could not schedule reminders on programme start',
      );
    }
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
    // Everything tinted with the main colour that is *not* a filled button:
    // in dark mode the raw main colour is all but invisible on this screen's
    // own background. See NepanikarColors.accent.
    final accent = NepanikarColors.accent(context);

    return Scaffold(
      backgroundColor: isDarkMode
          ? NepanikarColors.containerColor(primaryColor)
          : NepanikarColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            children: [
              // This screen has no app bar, so the help button gets its own
              // row rather than being the one place in the module without it.
              const Align(alignment: Alignment.centerRight, child: BpdHelpButton(size: 36)),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: accent.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.settings, size: 50, color: accent),
                      ),

                      const SizedBox(height: 24),

                      Text(
                        context.l10n.dbt_landing_title,
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : NepanikarColors.dark,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 18),

                      // Said "7denní" until 2026-08-18; the programme is seven *weeks*. Ours, not
                      // the author's copy — it predates the HPO content.
                      Text(
                        context.l10n.dbt_landing_description,
                        style: TextStyle(
                          fontSize: 15,
                          color: isDarkMode
                              ? Colors.white70
                              : NepanikarColors.dark.withValues(alpha: 0.8),
                          height: 1.45,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 28),

                      _buildBulletPoint(
                        context.l10n.dbt_landing_coping_title,
                        context.l10n.dbt_landing_coping_description,
                        isDarkMode,
                        accent,
                      ),
                      const SizedBox(height: 20),
                      _buildBulletPoint(
                        context.l10n.dbt_landing_mood_title,
                        context.l10n.dbt_landing_mood_description,
                        isDarkMode,
                        accent,
                      ),

                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () => _handleStartJourney(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: NepanikarColors.ctaBackground(context),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 4,
                  ),
                  child: Text(
                    context.l10n.dbt_landing_start,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              TextButton(
                onPressed: () => _handleMaybeLater(context),
                child: Text(
                  context.l10n.dbt_landing_later,
                  style: TextStyle(fontSize: 16, color: accent, fontWeight: FontWeight.w600),
                ),
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String title, String description, bool isDarkMode, Color accent) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 38,
          height: 38,
          margin: const EdgeInsets.only(top: 2),
          decoration: BoxDecoration(color: accent.withValues(alpha: 0.2), shape: BoxShape.circle),
          child: Icon(Icons.check_circle, color: accent, size: 22),
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
                  color: isDarkMode ? Colors.white70 : NepanikarColors.dark.withValues(alpha: 0.7),
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
