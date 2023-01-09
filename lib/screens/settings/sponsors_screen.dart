import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/widgets/nepanikar_clean_screen_wrapper.dart';
import 'package:nepanikar/widgets/sponsor_tile.dart';

class SponsorsRoute extends GoRouteData {
  const SponsorsRoute();

  @override
  Widget build(BuildContext context, _) => const SponsorsScreen();
}

class SponsorsScreen extends StatelessWidget {
  const SponsorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NepanikarCleanScreenWrapper(
      appBarTitle: context.l10n.support,
      child: Column(
        children: [
          SponsorTile(
            // TODO: l10n
            title: 'Hlavní partneři',
            type: SponsorType.primary,
            logoPaths: [
              Assets.sponsors.sponsorPpf.path,
              Assets.sponsors.sponsorCeskoDigitalPng.path,
            ],
          ),
          const SizedBox(height: 20),
          SponsorTile(
            // TODO: l10n
            title: 'Další partneři',
            type: SponsorType.secondary,
            logoPaths: [
              Assets.sponsors.sponsorUniqa.path,
              Assets.sponsors.sponsorLivechatoo.path,
              Assets.sponsors.sponsorRodinyOrlickych.path,
              Assets.sponsors.sponsorKofi.path,
            ],
          ),
        ],
      ),
    );
  }
}
