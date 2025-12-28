import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/utils/lottie_cache_manager.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
part 'plants_game_screen.g.dart';

@TypedGoRoute<PlantsGameRoute>(path: '/games/plants/')
class PlantsGameRoute extends GoRouteData with $PlantsGameRoute {
  const PlantsGameRoute();

  @override
  Widget build(BuildContext context, _) => const PlantsGameScreen();
}

class PlantsGameScreen extends StatefulWidget {
  const PlantsGameScreen({super.key});

  @override
  State<PlantsGameScreen> createState() => _PlantsGameScreenState();
}

class _PlantsGameScreenState extends State<PlantsGameScreen> with TickerProviderStateMixin {
  late final Timer gameLoop;
  static const numberOfPlants = 3;
  late final AnimationController _controller;
  late final double maxSpeed;
  late final double minDistance;
  late final double speedMultiplier;
  late final double wiggleMultiplier;
  late final double fpsMultiplier;
  final double fps = 90;
  List<Plant> plants = [];
  int elapsed = 0;
  math.Point<double> explosionCoord = const math.Point<double>(0.0, 0.0);
  late math.Point<double> handCoord;
  Slash slash = Slash();
  bool showHint = true;

  late final double sceneWidth;
  late final double sceneHeight;
  late final math.Point<double> sceneCenter;

  final _lottieCacheManager = registry.get<LottieCacheManager>();

  double randomHalfToOne() {
    return math.Random().nextDouble() * 0.5 + 0.5;
  }

  int orientation(math.Point p, math.Point q, math.Point r) {
    final val = (q.y - p.y) * (r.x - q.x) - (q.x - p.x) * (r.y - q.y);
    if (val == 0) return 0;
    return (val > 0) ? 1 : 2;
  }

  bool segmentsIntersect(math.Point p1, math.Point q1, math.Point p2, math.Point q2) {
    final o1 = orientation(p1, q1, p2);
    final o2 = orientation(p1, q1, q2);
    final o3 = orientation(p2, q2, p1);
    final o4 = orientation(p2, q2, q1);

    if (o1 != o2 && o3 != o4) return true;
    return false;
  }

  Plant generatePlant([math.Point<double>? coord, bool? grown])
  {
    var position = const math.Point<double>(0.0, 0.0);
    if(coord == null) {
      if (math.Random().nextDouble() > 0.5) {
        position = math.Point(
          (math.Random().nextDouble() > 0.5) ? sceneWidth : 0,
          sceneHeight * math.Random().nextDouble(),
        );
      } else {
        position = math.Point(
          sceneWidth * math.Random().nextDouble(),
          (math.Random().nextDouble() > 0.5) ? sceneHeight : 0,
        );
      }
    }
    else {
      position = coord;
    }

    final orientation = sceneCenter - position;
    var currentPosition = position;
    if(grown == true) {
        currentPosition = sceneCenter;
      }
    return Plant(
      initialPosition: position,
      x: currentPosition.x,
      y: currentPosition.y,
      variant: (math.Random().nextDouble() * 3).round(),
      flipped: math.Random().nextDouble() > 0.5,
      size: orientation.magnitude * 1.2,
      speed: maxSpeed * randomHalfToOne(),
      angle: math.atan2(orientation.y, orientation.x) + math.pi / 2,
    );
  }

  void runFrame() {
    slash.update();
    if(elapsed < 2.5*fps) {
      handCoord += const math.Point(1.0, -1.0);
    }
    else
    {
      handCoord = math.Point(sceneWidth*2, sceneHeight*2);
    }
    final newPlants = plants.mapIndexed((i, e) {
      if (e.variant == -1) {
        return generatePlant();
      } else {
        if (slash.active) {
          if (segmentsIntersect(
            slash.start,
            slash.limitedEnd,
            e.initialPosition,
            math.Point(e.x, e.y),
          )) {
            slash.active = false;
            explosionCoord = math.Point(e.x, e.y);
            _controller
              ..reset()
              ..duration = const Duration(milliseconds: 800)
              ..forward();
            return Plant();
          }
        }
        final trajectory = sceneCenter - math.Point(e.x, e.y);
        final step = trajectory * e.speed;
        return e.copyWith(x: e.x + step.x, y: e.y + step.y);
      }
    }).toList();
    setState(() {
      elapsed++;
      plants = newPlants;
    });
  }

  @override
  void initState() {
    super.initState();
    final view = WidgetsBinding.instance.platformDispatcher.views.first;
    final size = view.physicalSize / view.devicePixelRatio;
    _controller = AnimationController(vsync: this);
    WakelockPlus.enable();

    setState(() {
      fpsMultiplier = fps / 30;
      maxSpeed = (0.000004 * size.height) / fpsMultiplier;
      minDistance = size.width * 0.01;
      sceneWidth = size.width;
      sceneHeight = size.height;
      sceneCenter = math.Point(sceneWidth / 2.0, sceneHeight / 2.0);
      slash.sizeLimit = sceneWidth * 0.35;
      handCoord = math.Point<double>(sceneWidth*0.2, sceneHeight*0.4);
      plants = List.generate(numberOfPlants, (index) => Plant());
      plants.first = generatePlant(const math.Point<double>(0.0, 0.0), true);
    });

    gameLoop = Timer.periodic(Duration(milliseconds: (1000 / fps).round()), (timer) => runFrame());
  }

  @override
  void dispose() {
    gameLoop.cancel();
    _controller.dispose();
    WakelockPlus.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = customColorsBasedOnDarkMode(
      context,
      NepanikarColors.primary(context),
      NepanikarColors.white,
    );
    final uiColor = customColorsBasedOnDarkMode(
      context,
      NepanikarColors.white,
      NepanikarColors.primary(context),
    );
    final heartColor = customColorsBasedOnDarkMode(
      context,
      NepanikarColors.primaryColorShade(context, 0.8),
      NepanikarColors.primaryColorShade(context, 0.3),
    );

    final colorFilter = svgColorFilterBasedOnDarkMode(context);
    final heartSize = sceneWidth * 0.2;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanStart: (details) => slash.startSlash(details.localPosition),
        onPanUpdate: (details) =>
            slash.end = math.Point<double>(details.localPosition.dx, details.localPosition.dy),
        onPanEnd: (details) => slash.active = false,
        child: SafeArea(
          child: Stack(
            children: [
              ...plants.mapIndexed(
                (i, e) => Positioned(
                  top: e.y,
                  left: e.x,
                  child: Stack(
                    children: [
                      Transform.rotate(
                        alignment: Alignment.topCenter,
                        angle: e.angle,
                        child: Transform.flip(
                          flipX: e.flipped,
                          child: switch (e.variant) {
                            0 => Assets.illustrations.games.plants.plant1.svg(
                              width: e.width(),
                              height: e.size,
                              colorFilter: colorFilter,
                            ),
                            1 => Assets.illustrations.games.plants.plant2.svg(
                              width: e.width(),
                              height: e.size,
                              colorFilter: colorFilter,
                            ),
                            _ => Assets.illustrations.games.plants.plant3.svg(
                              width: e.width(),
                              height: e.size,
                              colorFilter: colorFilter,
                            ),
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: slash.coord.y,
                left: slash.coord.x,
                child: Transform.rotate(
                  alignment: Alignment.topCenter,
                  angle: slash.angle,
                  child: Assets.illustrations.games.plants.slash.svg(
                    width: slash.width(),
                    height: slash.size,
                    colorFilter: colorFilter,
                  ),
                ),
              ),
              if (explosionCoord.x != -1)
                Positioned(
                  top: explosionCoord.y - (sceneWidth / 2),
                  left: explosionCoord.x - (sceneWidth / 2),
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
              Positioned(
                top: sceneCenter.y - heartSize / 2,
                left: sceneCenter.x - heartSize / 2,
                child: Assets.icons.heart.svg(
                  width: heartSize,
                  colorFilter: ColorFilter.mode(heartColor!, BlendMode.srcIn),
                ),),
                Positioned(
                  top: handCoord.y,
                  left: handCoord.x,
                  child: Assets.illustrations.games.balloons.touchGesture.svg(
                  width: heartSize,
                  colorFilter: colorFilter,
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
                      color: uiColor,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const nullPoint = math.Point<double>(0.0, 0.0);

class Slash {
  Slash({
    this.coord = nullPoint,
    this.size = 0,
    this.angle = 0,
    this.sizeLimit = 0,
    this.start = nullPoint,
    this.end = nullPoint,
    this.limitedEnd = nullPoint,
    this.active = false,
  });

  double width() {
    return size * 0.177;
  }

  void startSlash(Offset offset) {
    active = true;
    start = math.Point<double>(offset.dx, offset.dy);
    end = math.Point<double>(offset.dx, offset.dy);
  }

  void update() {
    if (!active) {
      size = 0;
      start = nullPoint;
      end = nullPoint;
      return;
    }
    coord = start;
    final orientation = end - start;
    coord -= math.Point(width() / 2.0, 50);
    angle = math.atan2(orientation.y, orientation.x) - math.pi / 2;
    size = start.distanceTo(end).clamp(0, sizeLimit);
    final normalizedOrientation = math.Point<double>(
      orientation.x / orientation.magnitude,
      orientation.y / orientation.magnitude,
    );
    limitedEnd = start + normalizedOrientation * size;
  }

  math.Point<double> coord;
  double size;
  double angle;
  double sizeLimit;
  math.Point<double> start;
  math.Point<double> end;
  math.Point<double> limitedEnd;
  bool active;
}

class Plant {
  Plant({
    this.x = 0,
    this.y = 0,
    this.size = 0,
    this.speed = 0,
    this.variant = -1,
    this.flipped = false,
    this.initialPosition = const math.Point<double>(0.0, 0.0),
    this.angle = 0,
  });

  double width() {
    return size * plantWidthRatio;
  }

  Plant copyWith({
    double? x,
    double? y,
    double? angle,
    math.Point<double>? initialPosition,
    double? size,
    double? speed,
    int? variant,
    bool? flipped,
  }) {
    return Plant(
      x: x ?? this.x,
      y: y ?? this.y,
      angle: angle ?? this.angle,
      flipped: flipped ?? this.flipped,
      size: size ?? this.size,
      variant: variant ?? this.variant,
      speed: speed ?? this.speed,
      initialPosition: initialPosition ?? this.initialPosition,
    );
  }

  final double x;
  final double y;
  final double angle;
  final math.Point<double> initialPosition;
  final double size;
  final double speed;
  final int variant;
  final bool flipped;
  static const plantWidthRatio = 0.17;
}
