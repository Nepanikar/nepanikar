import 'dart:async';
import 'dart:io';
import 'dart:math' as math;
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
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
  bool showHint = true;

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
        return e.copyWith(
          x: e.x + e.wiggleAmount * math.sin(e.wiggleSpeed * elapsed + 100 * i),
          y: e.y - e.speed,
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
      wiggleMultiplier = 0.02 * size.height;
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
      body: SafeArea(
        child: Stack(
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
                            showHint = false;
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
            if (showHint)
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Assets.illustrations.games.balloons.touchGesture.svg(),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      //TODO: l10n
                      'Dotykem praskej pouze bílé balónky',
                      style: NepanikarFonts.bodySmallMedium
                          .copyWith(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () => GoRouter.of(context).pop(),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Icon(
                    Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            )
          ],
        ),
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

  Balloon copyWith({
    double? x,
    double? y,
    bool? wanted,
    double? height,
    double? speed,
    double? wiggleAmount,
    double? wiggleSpeed,
    bool? lightVariant,
  }) {
    return Balloon(
      x: x ?? this.x,
      y: y ?? this.y,
      wanted: wanted ?? this.wanted,
      height: height ?? this.height,
      speed: speed ?? this.speed,
      wiggleAmount: wiggleAmount ?? this.wiggleAmount,
      wiggleSpeed: wiggleSpeed ?? this.wiggleSpeed,
      lightVariant: lightVariant ?? this.lightVariant,
    );
  }

  final double x;
  double y;
  final bool wanted;
  final double height;
  final double speed;
  final double wiggleAmount;
  final double wiggleSpeed;
  final bool lightVariant;
}
