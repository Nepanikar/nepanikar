import 'dart:async';
import 'dart:io';

import 'package:material_ui/material_ui.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/services/notifications/notifications_service.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/nepanikar_horizontal_divider.dart';

/// Explains the two reasons a granted notification permission still does not
/// produce notifications, and offers the one of them the app can act on.
///
/// Both are Android's: exact alarms are a separate permission since Android 14,
/// and most skins force-stop an app swiped out of recents, which cancels every
/// alarm it had set. Neither is visible from inside the app, so without this
/// the switches above look broken.
class NotificationDeliveryHelp extends StatefulWidget {
  const NotificationDeliveryHelp({super.key});

  @override
  State<NotificationDeliveryHelp> createState() => _NotificationDeliveryHelpState();
}

class _NotificationDeliveryHelpState extends State<NotificationDeliveryHelp> {
  NotificationsService get _notificationsService => registry.get<NotificationsService>();

  bool? _hasPreciseAlarms;
  AppLifecycleListener? _lifecycleListener;

  @override
  void initState() {
    super.initState();
    if (!Platform.isAndroid) return;
    unawaited(_refresh());
    // The permission is granted on a system screen, so the only sign that it
    // changed is the app coming back to the foreground.
    _lifecycleListener = AppLifecycleListener(onResume: () => unawaited(_refresh()));
  }

  @override
  void dispose() {
    _lifecycleListener?.dispose();
    super.dispose();
  }

  Future<void> _refresh() async {
    final hasPreciseAlarms = await _notificationsService.hasPreciseAlarms;
    if (!mounted) return;
    setState(() => _hasPreciseAlarms = hasPreciseAlarms);
  }

  @override
  Widget build(BuildContext context) {
    if (!Platform.isAndroid) return const SizedBox.shrink();
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(padding: EdgeInsets.only(top: 8), child: NepanikarHorizontalDivider()),
        if (_hasPreciseAlarms == false) ...[
          ListTile(
            title: Text(l10n.notifications_exact_alarms_title, style: theme.textTheme.titleLarge),
            subtitle: Text(l10n.notifications_exact_alarms_body, style: theme.textTheme.bodyMedium),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: TextButton(
                onPressed: () async => await _notificationsService.openPreciseAlarmsSettings(),
                child: Text(l10n.notifications_exact_alarms_cta),
              ),
            ),
          ),
        ],
        ListTile(
          title: Text(l10n.notifications_troubleshoot_title, style: theme.textTheme.titleLarge),
          subtitle: Text(l10n.notifications_troubleshoot_body, style: theme.textTheme.bodyMedium),
        ),
      ],
    );
  }
}
