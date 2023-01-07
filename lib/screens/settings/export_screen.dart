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

class ExportScreen extends StatelessWidget {
  const ExportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NepanikarScreenWrapper(
      key: const ValueKey('export_screen'),
      appBarTitle: context.l10n.import_export,
      appBarDescription: context.l10n.import_export_text,
      children: const [
        _ImportTile(key: ValueKey('import_tile')),
        _ExportTile(key: ValueKey('export_tile')),
      ],
    );
  }
}

class _Spinner extends StatefulWidget {
  // ignore: unused_element
  const _Spinner({super.key});

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

class _ExportTile extends StatefulWidget {
  const _ExportTile({super.key});

  @override
  State<_ExportTile> createState() => _ExportTileState();
}

class _ExportTileState extends State<_ExportTile> {
  bool exportInProgress = false;

  @override
  Widget build(BuildContext context) {
    return LongTile(
      text: context.l10n.export_button,
      image: Assets.icons.export.svg(),
      trailing: exportInProgress ? const _Spinner(key: ValueKey('export_spinner')) : null,
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
    );
  }
}

class _ImportTile extends StatefulWidget {
  const _ImportTile({super.key});

  @override
  State<_ImportTile> createState() => _ImportTileState();
}

class _ImportTileState extends State<_ImportTile> {
  bool importInProgress = false;

  @override
  Widget build(BuildContext context) {
    return LongTile(
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
    );
  }
}
