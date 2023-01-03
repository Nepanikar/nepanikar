import 'dart:async';
import 'dart:math' as math;
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/utils/lottie_cache_manager.dart';
import 'package:nepanikar/utils/registry.dart';

class BalloonsGameRoute extends GoRouteData {
  const BalloonsGameRoute();

  @override
  Widget build(BuildContext context, _) => const BalloonsGameScreen();
}

class BalloonsGameScreen extends StatefulWidget {
  const BalloonsGameScreen({super.key});

  @override
  State<BalloonsGameScreen> createState() => _BalloonsGameScreenState();
}

class _BalloonsGameScreenState extends State<BalloonsGameScreen> with TickerProviderStateMixin {
  late final Timer gameLoop;
  static const numberOfBalloons = 5;
  late final AnimationController _controller;
  late final double minSpeed;
  late final double speedMultiplier;
  late final double wiggleMultiplier;
  List<Balloon> balloons = [];
  int elapsed = 0;
  double? confettiX;
  double? confettiY;

  late final double sceneWidth;
  late final double sceneHeight;

  final _lottieCacheManager = registry.get<LottieCacheManager>();

  void runFrame() {
    final newBalloons = balloons.mapIndexed((i, e) {
      // Init new balloon if outside of view else continue in motion
      if (e.y < -e.height) {
        final wanted = math.Random().nextDouble() > 0.8;
        return Balloon(
          x: sceneWidth * math.Random().nextDouble(),
          y: sceneHeight,
          wanted: wanted,
          height: e.height,
          speed: minSpeed + speedMultiplier * math.Random().nextDouble(),
          wiggleAmount: wiggleMultiplier * math.Random().nextDouble(),
          wiggleSpeed: math.Random().nextDouble() * 0.8,
          lightVariant: math.Random().nextBool(),
        );
      } else {
        return Balloon(
          x: e.x + e.wiggleAmount * math.sin(e.wiggleSpeed * elapsed + 100 * i),
          y: e.y - e.speed,
          wanted: e.wanted,
          height: e.height,
          speed: e.speed,
          wiggleAmount: e.wiggleAmount,
          wiggleSpeed: e.wiggleSpeed,
          lightVariant: e.lightVariant,
        );
      }
    }).toList();
    setState(() {
      elapsed = elapsed + 1;
      balloons = newBalloons;
    });
  }

  @override
  void initState() {
    super.initState();

    final size = window.physicalSize / window.devicePixelRatio;
    _controller = AnimationController(vsync: this);

    setState(() {
      minSpeed = 0.01 * size.height;
      speedMultiplier = 0.01 * size.height;
      wiggleMultiplier = 0.05 * size.height;
      sceneWidth = size.width;
      sceneHeight = size.height;
      balloons = List.generate(
        numberOfBalloons,
        (index) => Balloon(
          x: 0,
          y: -99999,
          wanted: false,
          height: 100,
          speed: 0,
          wiggleAmount: 0,
          wiggleSpeed: 0,
          lightVariant: math.Random().nextBool(),
        ),
      );
    });

    // 30 FPS game loop using timer
    gameLoop = Timer.periodic(
      const Duration(milliseconds: 33),
      (timer) => runFrame(),
    );
  }

  @override
  void dispose() {
    gameLoop.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NepanikarColors.primary,
      appBar: AppBar(),
      body: Stack(
        children: [
          ...balloons.mapIndexed(
            (i, e) => Positioned(
              top: e.y,
              left: e.x,
              child: Stack(
                children: [
                  if (e.wanted)
                    Assets.illustrations.games.balloons.balloonWanted.svg(width: 100)
                  else
                    e.lightVariant
                        ? Assets.illustrations.games.balloons.balloonUnwanted1.svg(width: 100)
                        : Assets.illustrations.games.balloons.balloonUnwanted2.svg(width: 100),
                  GestureDetector(
                    onTap: () {
                      if (e.wanted) {
                        setState(() {
                          confettiX = e.x;
                          confettiY = e.y;
                          balloons.elementAt(i).y = -99999;
                        });

                        _controller
                          ..reset()
                          ..duration = const Duration(milliseconds: 800)
                          ..forward();
                      }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(e.height),
                      child: Container(
                        width: e.height,
                        height: e.height + 20,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (confettiX != null)
            Positioned(
              top: confettiY! - (sceneWidth / 2),
              left: confettiX! - (sceneWidth / 2),
              child: IgnorePointer(
                child: _lottieCacheManager.loadFromCache(
                  controller: _controller,
                  Assets.animatedIllustrations.confetti,
                  repeat: false,
                  width: sceneWidth + 100,
                  height: sceneWidth,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 28.0),
              child: Assets.illustrations.games.balloons.touchGesture.svg(),
            ),
          )
        ],
      ),
    );
  }
}

class Balloon {
  Balloon({
    required this.x,
    required this.y,
    required this.wanted,
    required this.height,
    required this.speed,
    required this.wiggleAmount,
    required this.wiggleSpeed,
    required this.lightVariant,
  });

  final double x;
  double y;
  final bool wanted;
  final double height;
  final double speed;
  final double wiggleAmount;
  final double wiggleSpeed;
  final bool lightVariant;
}
