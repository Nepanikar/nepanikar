import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/fonts.gen.dart';
import 'package:nepanikar/app/theme/theme.dart';
import 'package:nepanikar/helpers/localization_helpers.dart';
import 'package:nepanikar/providers/mood_chart_filter_provider.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/utils/app_setup.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/nepanikar_scroll_behavior.dart';
import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await setup();
  runApp(const Nepanikar());
}

class Nepanikar extends StatelessWidget {
  const Nepanikar({super.key});

  GoRouter get _goRouter => registry.get<GoRouter>();

  UserSettingsDao get _userSettingsDao => registry.get<UserSettingsDao>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MoodChartFilterProvider>(create: (_) => MoodChartFilterProvider()),
      ],
      child: StreamBuilder<Locale>(
        stream: _userSettingsDao.localeStream,
        builder: (_, snapshot) {
          final locale = snapshot.data;
          return MaterialApp.router(
            title: _getAppNameFromLocale(locale),
            theme: NepanikarTheme.getThemeData(
              fontFamily: locale?.languageCode == NepanikarLanguages.uk.languageCode
                  ? null
                  : FontFamily.satoshi,
            ),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: locale,
            routerConfig: _goRouter,
            builder: (context, child) {
              return child != null
                  ? ScrollConfiguration(
                      behavior: NepanikarScrollBehavior(),
                      child: MediaQuery(
                        // To not influence app's font size by the system font size.
                        // TODO: Should be resolved, accessibility is important.
                        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                        child: child,
                      ),
                    )
                  : const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}

String _getAppNameFromLocale(Locale? locale) {
  final appLangCode = locale?.languageCode ?? platformLocale;

  if (appLangCode == NepanikarLanguages.cs.languageCode) {
    return 'Nepanikař';
  } else if (appLangCode == NepanikarLanguages.sk.languageCode) {
    return 'Nepanikár';
  }
  return "Don't panic";
}
