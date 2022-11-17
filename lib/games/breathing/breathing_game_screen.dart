import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/games/breathing/shape_painter.dart';

enum BreathingGameShape {
  circle,
  square,
  triangle,
}

class BreathingGameRoute extends GoRouteData {
  const BreathingGameRoute({
    required this.shape,
  });

  final BreathingGameShape shape;

  @override
  Widget build(BuildContext context) => BreathingGameScreen(
        shape: shape,
      );
}

class BreathingGameScreen extends StatefulWidget {
  const BreathingGameScreen({super.key, required this.shape});

  final BreathingGameShape shape;

  @override
  State<BreathingGameScreen> createState() => _BreathingGameScreenState();
}

class _BreathingGameScreenState extends State<BreathingGameScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  double _currentSliderValue = 10;
  final _indexNotifier = ValueNotifier<int>(0);
  final _countDownNotifier = ValueNotifier<int>(0);
  late final _scaleAnimation = ValueNotifier(
    AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    ),
  );
  List<String> steps = [];

  void initSteps() {
    switch (widget.shape) {
      case BreathingGameShape.circle:
        setState(() {
          steps = [
            context.l10n.breathe_in,
            context.l10n.breathe_out,
          ];
        });
        break;
      case BreathingGameShape.square:
        setState(() {
          steps = [
            context.l10n.breathe_in,
            context.l10n.breathe_hold,
            context.l10n.breathe_out,
            context.l10n.breathe_hold,
          ];
        });
        break;
      case BreathingGameShape.triangle:
        setState(() {
          steps = [
            context.l10n.breathe_in,
            context.l10n.breathe_hold,
            context.l10n.breathe_out,
          ];
        });
        break;
    }
  }

  void progressListener() {
    final newIndex = (_controller.value * steps.length).floor();
    if (newIndex != _indexNotifier.value) {
      _indexNotifier.value = newIndex;
      setState(() {});
    }

    final totalSteps = 3 * steps.length;
    final currStep = (totalSteps * _controller.value).floor();

    final discount = ((totalSteps - 1 - currStep) / 3).floor() * 3;
    if ((totalSteps - currStep) - discount != _countDownNotifier.value) {
      setState(() {
        _countDownNotifier.value = (totalSteps - currStep) - discount;
      });

      _scaleAnimation.value
        ..reset()
        ..value = 1
        ..duration = Duration(
          milliseconds: ((_controller.duration?.inMilliseconds ?? 0) / totalSteps).round(),
        )
        ..reverse();
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    _controller.addListener(progressListener);
    _controller.repeat();
  }

  @override
  void didChangeDependencies() {
    initSteps();

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    _countDownNotifier.dispose();
    _indexNotifier.dispose();
    _scaleAnimation.value.dispose();
    _scaleAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final painterWidth = MediaQuery.of(context).size.width - 96;
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.breath)),
      backgroundColor: NepanikarColors.primary,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: ValueListenableBuilder(
                valueListenable: _scaleAnimation,
                builder: (context, index, _) {
                  return ScaleTransition(
                    scale: _scaleAnimation.value,
                    child: Text(
                      _countDownNotifier.value.toString(),
                      style: const TextStyle(
                        color: Colors.white12,
                        fontSize: 300,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: widget.shape == BreathingGameShape.triangle ? 120.0 : 0,
                ),
                child: CustomPaint(
                  painter: BorderPainter(
                    animation: _controller,
                    shape: widget.shape,
                  ),
                  child: SizedBox(
                    width: painterWidth,
                    height: painterWidth,
                  ),
                ),
              ),
            ),
            if (steps.isNotEmpty)
              Padding(
                padding:
                    EdgeInsets.only(bottom: widget.shape == BreathingGameShape.triangle ? 64.0 : 0),
                child: Center(
                  child: ValueListenableBuilder(
                    valueListenable: _indexNotifier,
                    builder: (context, value, _) {
                      return Text(
                        steps.elementAt(value),
                        style: NepanikarFonts.bodyHeavy.copyWith(
                          color: Colors.white,
                          fontSize: 26,
                        ),
                      );
                    },
                  ),
                ),
              ),
            Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Text(
                      //TODO: l10n
                      'Posaďte se a opřete se o něco pevného.',
                      style: TextStyle(
                        color: NepanikarColors.primarySwatch.shade300,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  //TODO: l10n
                  'Rychlost dechu',
                  style: NepanikarFonts.bodyBlack.copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 23,
                ),
                Slider(
                  value: _currentSliderValue,
                  min: 5,
                  max: 15,
                  divisions: 10,
                  label: (_currentSliderValue.round() - 5).toString(),
                  thumbColor: Colors.white,
                  activeColor: Colors.white,
                  inactiveColor: NepanikarColors.primarySwatch.shade500,
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                      _controller.duration = Duration(seconds: 20 - value.floor());
                    });
                    _controller.forward();
                    _controller.repeat();
                  },
                ),
                const SizedBox(
                  height: 38,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
