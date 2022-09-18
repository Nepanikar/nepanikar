import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/providers/localization_provider.dart';
import 'package:nepanikar/utils/app_setup.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await setup();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LocalizationProvider>(create: (_) => LocalizationProvider()),
      ],
      child: const Nepanikar(),
    ),
  );
}

class Nepanikar extends StatelessWidget {
  const Nepanikar({super.key});

  GoRouter get _goRouter => registry.get<GoRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Nepanikař',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(40, 4, 70, 1.0),
        colorScheme: const ColorScheme.light().copyWith(
          primary: const Color.fromRGBO(40, 4, 70, 1.0),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: context.watch<LocalizationProvider>().locale,
      routeInformationParser: _goRouter.routeInformationParser,
      routerDelegate: _goRouter.routerDelegate,
      routeInformationProvider: _goRouter.routeInformationProvider,
    );
  }
}
