import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
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
      appBarTitle: 'Podpořili nás',
      child: Column(
        children: [
          SponsorTile(
            title: 'Hlavní parneři',
            type: SponsorType.primary,
            logoPaths: [
              Assets.sponsors.sponsorPpf.path,
              Assets.sponsors.sponsorCeskoDigital.path,
            ],
          ),
          const SizedBox(height: 20),
          SponsorTile(
            title: 'Další parneři',
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
