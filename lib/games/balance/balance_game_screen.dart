import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';

class BalanceGameRoute extends GoRouteData {
  const BalanceGameRoute();

  @override
  Widget build(BuildContext context, _) => const BalanceGameScreen();
}

class BalanceGameScreen extends StatefulWidget {
  const BalanceGameScreen({super.key});

  @override
  State<BalanceGameScreen> createState() => _BalanceGameScreenState();
}

class _BalanceGameScreenState extends State<BalanceGameScreen> {
  late final Timer gameLoop;
  double angle = 0;
  double speed = 0;
  double windStrength = 0.1;
  double limitAngle = 70;

  bool leftButtonActive = false;
  bool rightButtonActive = false;

  @override
  void initState() {
    super.initState();

    // 30 FPS game loop using timer
    gameLoop = Timer.periodic(const Duration(milliseconds: 33), (timer) {
      // Random interference
      if (math.Random().nextDouble() < 0.03) {
        setState(() {
          speed = speed + (math.Random().nextDouble() - 0.5);
        });
      }
      // Left wind active
      if (leftButtonActive) {
        setState(() {
          speed = speed + windStrength;
        });
      }
      // Right wind active
      if (rightButtonActive) {
        setState(() {
          speed = speed - windStrength;
        });
      }
      // Final angle
      final newSpeed = speed + (angle * 0.0018);
      setState(() {
        speed = newSpeed;
        angle = angle + newSpeed;
      });
      // Fail check
      if (angle.abs() > limitAngle) {
        setState(() {
          speed = 0;
          angle = 0;
          leftButtonActive = false;
          rightButtonActive = false;
        });
      }
    });
  }

  @override
  void dispose() {
    gameLoop.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: NepanikarColors.primary,
      appBar: AppBar(),
      body: Stack(
        children: [
          Positioned(
            top: screen.height * 0.2,
            left: 1 + (screen.width / 2) - (screen.width * 0.6) / 2,
            child: Assets.illustrations.games.swing.balanceStand
                .image(width: screen.width * 0.6, alignment: Alignment.topCenter),
          ),
          Positioned(
            // calculate position from top, based on asset width/height size ratio (6.88)
            top: (screen.height * 0.2) - ((screen.width * 0.8) / 6.88) / 2,
            left: (screen.width / 2) - (screen.width * 0.8) / 2,
            child: Transform.rotate(
              angle: (math.pi / 180) * angle,
              child: Assets.illustrations.games.swing.balance.svg(width: screen.width * 0.8),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            child: Material(
              borderRadius: BorderRadius.circular(40),
              child: InkWell(
                borderRadius: BorderRadius.circular(40),
                onTapDown: (e) {
                  setState(() {
                    leftButtonActive = true;
                    rightButtonActive = false;
                  });
                },
                onTapUp: (e) {
                  setState(() {
                    leftButtonActive = false;
                  });
                },
                child: const SizedBox(
                  width: 70,
                  height: 70,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            right: 20,
            child: Material(
              borderRadius: BorderRadius.circular(40),
              child: InkWell(
                borderRadius: BorderRadius.circular(40),
                onTapDown: (e) {
                  setState(() {
                    rightButtonActive = true;
                    leftButtonActive = false;
                  });
                },
                onTapUp: (e) {
                  setState(() {
                    rightButtonActive = false;
                  });
                },
                child: const SizedBox(
                  width: 70,
                  height: 70,
                ),
              ),
            ),
          ),
          if (rightButtonActive) const Positioned(bottom: 85, right: 20, child: _WindWidget()),
          if (leftButtonActive) const Positioned(bottom: 85, left: 20, child: _WindWidget()),
        ],
      ),
    );
  }
}

class _WindWidget extends StatelessWidget {
  const _WindWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 250,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.white38,
          ],
        ),
      ),
    );
  }
}
