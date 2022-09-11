import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nepanikar/providers/localization_provider.dart';
import 'package:nepanikar/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const HomePage(),
    );
  }
}
