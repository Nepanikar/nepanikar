import 'package:flutter/material.dart';
import 'package:nepanikar/l10n/ext.dart';
import 'package:nepanikar/providers/localization_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.appName),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "${context.l10n.hi} 👋",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Center(
              child: OutlinedButton(
                  onPressed: () {
                    context.read<LocalizationProvider>().setLocale(
                          Localizations.localeOf(context).languageCode == 'en' ? 'cs' : 'en',
                        );
                  },
                  child: Text(context.l10n.switchLanguage)),
            )
          ],
        ),
      ),
    );
  }
}
