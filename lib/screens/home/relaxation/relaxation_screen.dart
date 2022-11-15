import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/l10n/ext.dart';
import 'package:nepanikar/router/routes.dart';
import 'package:nepanikar/screens/home/relaxation/mood_track_screen.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

class RelaxationRoute extends GoRouteData {
  const RelaxationRoute();

  @override
  Widget build(BuildContext context) => const RelaxationScreen();
}

class RelaxationScreen extends StatelessWidget {
  const RelaxationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final modules = <Widget>[
      LongTile(
        text: context.l10n.depression_mood,
        image: Assets.illustrations.modules.relaxation.svg(),
        onTap: () => context.push(const MoodTrackRoute().location),
      ),
    ];

    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.relaxation,
      children: modules,
    );
  }
}
