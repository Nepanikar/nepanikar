import 'package:flutter/material.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/l10n/ext.dart';
import 'package:nepanikar/widgets/home_tile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _moods = <SvgGenImage>[
    Assets.illustrations.moods.happy1,
    Assets.illustrations.moods.good2,
    Assets.illustrations.moods.okay3,
    Assets.illustrations.moods.bad4,
    Assets.illustrations.moods.sad5,
  ];

  final _illustrations = <SvgGenImage>[
    Assets.illustrations.modules.anxietyPanic,
    Assets.illustrations.modules.depression,
    Assets.illustrations.modules.selfHarm,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.home),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _moods.map((e) => Flexible(child: e.svg())).toList(),
              ),
              Row(
                children: _illustrations.map((e) => Flexible(child: e.svg())).toList(),
              ),
              HomeTile(),
              GridView.count(
                primary: false,
                padding: const EdgeInsets.all(24),
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                crossAxisCount: 2,
                shrinkWrap: true,
                childAspectRatio: 1.331,
                children: [
                  HomeTile(),
                  HomeTile(),
                  HomeTile(),
                  HomeTile(),
                  HomeTile(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
