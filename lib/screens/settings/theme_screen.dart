import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

part 'theme_screen.g.dart';

@TypedGoRoute<ThemeRoute>(path: '/settings/theme')
class ThemeRoute extends GoRouteData with $ThemeRoute {
  const ThemeRoute();

  @override
  Widget build(BuildContext context, _) => ThemeScreen();
}

class ThemeScreen extends StatefulWidget {
  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  final userSettingsDao = registry.get<UserSettingsDao>();

  static Future<void> updateColor(
    BuildContext innerContext,
    Offset position,
    UserSettingsDao userSettingsDao,
  ) async {
    final box = innerContext.findRenderObject()! as RenderBox;
    final x = (position.dx / box.size.width).clamp(0.0, 1.0);
    final y = (position.dy / box.size.height).clamp(0.0, 1.0);
    final angle = atan2(x - 0.5, y - 0.5);
    final angleDeg = angle * 180 / pi + 180;
    final color = HSLColor.fromAHSL(1.0, angleDeg, 0.708, 0.2686).toColor();
    await userSettingsDao.saveMainColor(color);
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    bool isDarkMode = currentTheme.brightness == Brightness.dark;
    final WidgetStateProperty<Color?> trackColor =
        WidgetStateProperty<Color?>.fromMap(<WidgetStatesConstraint, Color>{
          WidgetState.selected: NepanikarColors.primaryColorShade(context, 0.6),
        });
    final textColor = textColorBasedOnDarkMode(context);
    const List<Color> colors = [
      Color.fromARGB(255, 255, 0, 0),
      Color.fromARGB(255, 255, 0, 255),
      Color.fromARGB(255, 0, 0, 255),
      Color.fromARGB(255, 0, 255, 255),
      Color.fromARGB(255, 0, 255, 0),
      Color.fromARGB(255, 255, 255, 0),
      Color.fromARGB(255, 255, 0, 0),
    ];

    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.color_scheme,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: NepanikarColors.cardShadow(context),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    context.l10n.dark_mode,
                    style: NepanikarFonts.bodySmallMedium.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: textColor,
                    ),
                  ),
                  const Spacer(),
                  Switch(
                    value: isDarkMode,
                    activeThumbColor: Colors.black,
                    trackColor: trackColor,
                    onChanged: (bool value) async {
                      final newThemeMode = isDarkMode
                          ? ThemeMode.light
                          : ThemeMode.dark;
                      await userSettingsDao.saveThemeMode(newThemeMode);
                      setState(() {
                        isDarkMode = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                context.l10n.choose_a_color,
                style: NepanikarFonts.bodySmallMedium.copyWith(
                  fontWeight: FontWeight.w700,
                  color: textColor,
                  fontSize: 20,
                ),
              ),
              Builder(
                builder: (innerContext) {
                  return GestureDetector(
                    onTapDown: (details) async {
                      await updateColor(
                        innerContext,
                        details.localPosition,
                        userSettingsDao,
                      );
                    },
                    onHorizontalDragUpdate: (details) async {
                      await updateColor(
                        innerContext,
                        details.localPosition,
                        userSettingsDao,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Transform.rotate(
                          angle: -pi / 2,
                          child: Container(
                            width: 300,
                            height: 300,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(150),
                              ),
                              gradient: SweepGradient(colors: colors),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 30,
                                  spreadRadius: 5,
                                  offset: Offset(-15, 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  await userSettingsDao.saveMainColor(
                    NepanikarColors.defaultPrimary,
                  );
                  final brightness = WidgetsBinding
                      .instance
                      .platformDispatcher
                      .platformBrightness;
                  isDarkMode = (brightness == Brightness.dark);
                  await userSettingsDao.saveThemeMode(
                    isDarkMode ? ThemeMode.dark : ThemeMode.light,
                  );
                  setState(() {});
                },
                child: Text(context.l10n.default_reset),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
