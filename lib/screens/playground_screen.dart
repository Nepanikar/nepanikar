import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/games/math/math_game_screen.dart';
import 'package:nepanikar/helpers/date_helpers.dart';
import 'package:nepanikar/screens/settings/about_app_screen.dart';
import 'package:nepanikar/services/db/my_records/mood_track_dao.dart';
import 'package:nepanikar/services/db/my_records/mood_track_model.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/utils/extensions.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/nepanikar_button.dart';
import 'package:nepanikar/widgets/nepanikar_dropdown.dart';

class PlaygroundScreen extends StatelessWidget {
  PlaygroundScreen({super.key});

  final _colors = <Color>[
    NepanikarColors.primary,
    NepanikarColors.secondary,
    NepanikarColors.success,
    NepanikarColors.error,
    NepanikarColors.dark,
  ];
  final _fonts = <TextStyle>[
    NepanikarFonts.title1,
    NepanikarFonts.title2,
    NepanikarFonts.title3,
    NepanikarFonts.bodyBlack,
    NepanikarFonts.bodyHeavy,
    NepanikarFonts.bodyRoman,
    NepanikarFonts.bodySmallHeavy,
    NepanikarFonts.bodySmallMedium,
  ];

  UserSettingsDao get _userSettingsDao => registry.get<UserSettingsDao>();

  MoodTrackDao get _moodTrackDao => registry.get<MoodTrackDao>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(context.l10n.language),
                  NepanikarDropdown<Locale>(
                    activeItem: _userSettingsDao.locale,
                    items: AppLocalizations.supportedLocales,
                    labelBuilder: (locale) => locale.toLanguageTag(),
                    onPick: _userSettingsDao.saveLocale,
                  ),
                ],
              ),
              NepanikarButton.secondaryAsync(
                text: 'DEV: Vygenerovat náhodná data sledování nálady (posledních 400 dní)',
                onTapAsync: () async {
                  await _moodTrackDao.clear();
                  final end = getNowDateUtc();
                  final start = end.subtract(const Duration(days: 400));
                  final dateRangeValues = List.generate(
                    end.difference(start).inDays + 1,
                    (i) => start.add(Duration(days: i)),
                  );
                  final r = Random();
                  final moodTracks = dateRangeValues
                      .map(
                        (d) {
                          final randomNum = r.nextInt(4);
                          return randomNum <= 1
                              ? MoodTrack(
                                  date: d,
                                  mood: Mood.values[r.nextInt(Mood.values.length)],
                                )
                              : null;
                        },
                      )
                      .whereType<MoodTrack>()
                      .toList();
                  await _moodTrackDao.saveMoods(moodTracks);
                },
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _fonts
                    .map(
                      (e) => Text(
                        context.l10n.app_name,
                        style: e,
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(
                height: 4,
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'placeholder',
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'placeholder',
                  errorText: 'error',
                ),
                style: TextStyle(color: NepanikarColors.error),
              ),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0),
                      ),
                    ),
                    onChanged: (bool? value) {},
                  ),
                  Checkbox(
                    value: false,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0),
                      ),
                    ),
                    onChanged: (bool? value) {},
                  ),
                  Radio(value: true, groupValue: true, onChanged: (val) {}),
                  Radio(value: false, groupValue: true, onChanged: (val) {})
                ],
              ),
              const SizedBox(height: 20),
              ..._buildButtonsSection(context),
              const SizedBox(height: 25),
              _buildColorsSection(),
              const SizedBox(height: 20),
              _buildSnackbarSection(context),
              Text(context.l10n.depression_tips),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildButtonsSection(BuildContext context) {
    return [
      Row(
        children: [
          Flexible(
            child: NepanikarButton(
              onTap: () => context.push(const MathGameRoute().location),
              text: '${context.l10n.game} ${context.l10n.math}',
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: NepanikarButton.secondary(
              onTap: () => context.push(const AboutAppRoute().location),
              text: context.l10n.about_app,
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
      Row(
        children: [
          Flexible(
            child: NepanikarButton.async(
              onTapAsync: () async => Future.delayed(const Duration(seconds: 2)),
              expandToContentWidth: true,
              trailingIcon: Assets.icons.navigation.chevronRight,
              text: 'Spinner test',
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: NepanikarButton.secondaryAsync(
              onTapAsync: () async => Future.delayed(const Duration(seconds: 2)),
              expandToContentWidth: true,
              text: 'Spinner test secondary',
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
      Row(
        children: [
          Flexible(
            child: NepanikarButton(
              onTap: () => debugPrint('disabled primary'),
              enabled: false,
              text: 'disabled primary',
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: NepanikarButton.secondary(
              onTap: () => debugPrint('disabled secondary'),
              enabled: false,
              text: 'disabled secondary',
            ),
          ),
        ],
      ),
    ];
  }

  Widget _buildColorsSection() {
    return Row(
      children: _colors.map((e) => Flexible(child: Container(color: e, height: 30))).toList(),
    );
  }

  Widget _buildSnackbarSection(BuildContext context) {
    return Row(
      children: [
        const Text('Snackbars: '),
        TextButton(
          onPressed: () => context.showSuccessSnackbar(
            text: 'Succcess',
            leading: const Icon(Icons.info_outline),
            trailing: Text(
              'Zpět'.toUpperCase(),
              style: NepanikarFonts.bodyHeavy,
            ),
          ),
          child: const Text(
            'success',
            style: TextStyle(color: NepanikarColors.success),
          ),
        ),
        TextButton(
          onPressed: () => context.showInfoSnackbar(
            text: 'info snackbar',
          ),
          child: const Text(
            'info',
            style: TextStyle(color: NepanikarColors.info),
          ),
        ),
        TextButton(
          onPressed: () => context.showErrorSnackbar(
            text: 'error',
            leading: const Icon(
              Icons.warning_amber,
              color: Colors.white,
            ),
          ),
          child: const Text(
            'error',
            style: TextStyle(color: NepanikarColors.error),
          ),
        ),
        TextButton(
          onPressed: () => context.showPurpleSnackbar(
            text:
                'The value of the variable_expression is tested against all cases in the switch. If the variable matches one of the cases, the corresponding code block is executed. If no case expression matches the value of the variable_expression, the code within the default block is associated.',
            trailing: Text(
              'Zpět'.toUpperCase(),
              style: NepanikarFonts.bodyHeavy.copyWith(color: Colors.white),
            ),
          ),
          child: const Text(
            'purple',
            style: TextStyle(color: NepanikarColors.primary),
          ),
        ),
      ],
    );
  }
}
