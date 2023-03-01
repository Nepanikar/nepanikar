import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/app_constants.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/services/export_service.dart';
import 'package:nepanikar/services/save_directories.dart';
import 'package:nepanikar/utils/extensions.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

class ExportRoute extends GoRouteData {
  const ExportRoute();

  @override
  Widget build(BuildContext context, _) => const ExportScreen();
}

class ExportScreen extends StatefulWidget {
  const ExportScreen({super.key});

  @override
  State<ExportScreen> createState() => _ExportScreenState();
}

class _ExportScreenState extends State<ExportScreen> {
  bool exportInProgress = false;
  bool importInProgress = false;

  late final Future<bool> _oldAppConfigFileExistsFuture;

  SaveDirectories get _saveDirectories => registry.get<SaveDirectories>();

  @override
  void initState() {
    super.initState();
    _oldAppConfigFileExistsFuture = File(_saveDirectories.oldAppDataConfigFileBackupPath).exists();
  }

  @override
  Widget build(BuildContext context) {
    return NepanikarScreenWrapper(
      key: const ValueKey('export_screen'),
      appBarTitle: context.l10n.import_export,
      appBarDescription: context.l10n.import_export_text,
      children: [
        LongTile(
          text: context.l10n.export_button,
          image: Assets.icons.export.svg(),
          trailing: exportInProgress ? const _Spinner() : null,
          onTap: () async {
            setState(() {
              exportInProgress = true;
            });
            await registry.get<ExportService>().export(
              onSuccess: () {
                context.showSuccessSnackbar(text: context.l10n.export_successful);
              },
              onError: () {
                context.showErrorSnackbar(
                  text: context.l10n.export_failed,
                );
              },
            );
            if (mounted) {
              setState(() {
                exportInProgress = false;
              });
            }
          },
        ),
        LongTile(
          text: context.l10n.import_button,
          image: Assets.icons.import.svg(),
          trailing: importInProgress ? const _Spinner() : null,
          onTap: () async {
            setState(() {
              importInProgress = true;
            });
            await registry.get<ExportService>().import(
              onSuccess: () {
                context.showSuccessSnackbar(text: context.l10n.import_successful);
              },
              onError: () {
                context.showErrorSnackbar(
                  text: context.l10n.import_failed,
                );
              },
            );
            if (mounted) {
              setState(() {
                importInProgress = false;
              });
            }
          },
        ),
        FutureBuilder<bool>(
          future: _oldAppConfigFileExistsFuture,
          builder: (_, snapshot) {
            final oldAppConfigFileExists = snapshot.data ?? false;
            if (!oldAppConfigFileExists) {
              return const SizedBox.shrink();
            }

            return Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: LongTile(
                text: context.l10n.export_old_app_title,
                description: context.l10n.export_old_app_description,
                image: null,
                onTap: () async {
                  final l10n = context.l10n;
                  final fileContent =
                      await File(_saveDirectories.oldAppDataConfigFileBackupPath).readAsString();
                  final uri = Uri(
                    scheme: 'mailto',
                    path: AppConstants.nepanikarContactEmail,
                    query:
                        'subject=${'${l10n.counselling_email_subject}: ${l10n.export_old_app_title}'}'
                        '&body=${Uri.encodeComponent(fileContent)}',
                  );
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  } else {
                    debugPrint('Could not launch $uri');
                  }
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

class _Spinner extends StatefulWidget {
  const _Spinner();

  @override
  State<_Spinner> createState() => _SpinnerState();
}

class _SpinnerState extends State<_Spinner> with SingleTickerProviderStateMixin {
  late final AnimationController _animController;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_animController),
      child: Assets.icons.spinner.svg(width: 20, color: Colors.black),
    );
  }
}
