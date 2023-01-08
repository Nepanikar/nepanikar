import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/services/export_service.dart';
import 'package:nepanikar/utils/extensions.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

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
                // TODO: Add to Localazy
                context.showSuccessSnackbar(text: 'Export byl úspěšný.');
              },
              onError: () {
                // TODO: Add to Localazy
                context.showErrorSnackbar(
                  text: 'Při exportování nastala chyba.',
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
                // TODO: Add to Localazy
                context.showSuccessSnackbar(text: 'Import byl úspěšný.');
              },
              onError: () {
                // TODO: Add to Localazy
                context.showErrorSnackbar(
                  text: 'Při importování nastala chyba.',
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
