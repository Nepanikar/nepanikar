import 'package:flutter/material.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/services/notifications/notifications_service.dart';
import 'package:nepanikar/utils/registry.dart';

/// Offers to turn notifications on, once, on one of the first launches.
///
/// Why an in-app dialog before the system one: the OS shows its permission
/// dialog **once**. Firing it cold, before the person knows what the app would
/// send, spends that single chance on a decision they have no basis for — and a
/// "no" there can only be undone in the system settings. So we ask in our own
/// words first, and only reach for the OS dialog if they say yes.
///
/// Does nothing (and returns `false`) when notifications are already allowed,
/// or when the offer was made on an earlier launch.
Future<bool> maybeOfferNotifications(BuildContext context) async {
  final userSettingsDao = registry.get<UserSettingsDao>();
  final notificationsService = registry.get<NotificationsService>();

  if (await userSettingsDao.hasAskedNotificationPermission()) return false;
  if (await notificationsService.isNotificationAllowed) {
    // Already granted (a reinstall over an allowed app, or the OS defaulting to
    // on): nothing to ask, but do not ask later either.
    await userSettingsDao.markNotificationPermissionAsked();
    return false;
  }
  if (!context.mounted) return false;

  final accepted = await showDialog<bool>(
    context: context,
    builder: (_) => const _NotificationOptInDialog(),
  );

  // Whatever they answered, the offer has been made.
  await userSettingsDao.markNotificationPermissionAsked();

  if (accepted != true) return false;
  return notificationsService.requestPermissionIfNeeded();
}

class _NotificationOptInDialog extends StatelessWidget {
  const _NotificationOptInDialog();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).primaryColor;
    // The dark scaffold is built from the primary colour, so accents lighten.
    final accent = isDarkMode ? Colors.white : primaryColor;
    final textColor = isDarkMode ? Colors.white : NepanikarColors.dark;
    final l10n = context.l10n;

    return AlertDialog(
      backgroundColor: isDarkMode ? NepanikarColors.container(context) : NepanikarColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text(
        l10n.notifications_opt_in_title,
        style: NepanikarFonts.title3.copyWith(color: textColor),
      ),
      content: Text(
        l10n.notifications_opt_in_description,
        style: NepanikarFonts.bodySmallMedium.copyWith(
          color: textColor.withOpacity(0.8),
          height: 1.4,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            l10n.notifications_opt_in_dismiss,
            style: TextStyle(color: textColor.withOpacity(0.7)),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(
            l10n.notifications_opt_in_confirm,
            style: TextStyle(color: accent, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
