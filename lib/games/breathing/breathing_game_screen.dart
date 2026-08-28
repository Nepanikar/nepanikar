import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/games/breathing/breathing_config.dart';
import 'package:nepanikar/games/breathing/shape_painter.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/helpers/semantics_helpers.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
part 'breathing_game_screen.g.dart';

enum BreathingGameShape { circle, square, triangle }

@TypedGoRoute<BreathingGameRoute>(path: '/games/breathing/:shape')
class BreathingGameRoute extends GoRouteData with $BreathingGameRoute {
  const BreathingGameRoute({required this.shape, this.preset});

  final BreathingGameShape shape;

  /// Optional preset: 'box' for 4-4-4-4, '7-11' for 7s inhale + 11s exhale,
  /// 'slow-exhale' for 4s inhale + 6s exhale
  final String? preset;

  @override
  Widget build(BuildContext context, _) => BreathingGameScreen(
        shape: shape,
        preset: preset,
      );
}

class BreathingGameScreen extends StatefulWidget {
  const BreathingGameScreen({super.key, required this.shape, this.preset});

  final BreathingGameShape shape;

  /// Optional preset: 'box' for 4-4-4-4, '7-11' for 7s inhale + 11s exhale,
  /// 'slow-exhale' for 4s inhale + 6s exhale
  final String? preset;

  @override
  State<BreathingGameScreen> createState() => _BreathingGameScreenState();
}

class _BreathingGameScreenState extends State<BreathingGameScreen>
    with TickerProviderStateMixin {
  /// Slider represents seconds per phase for circle shape
  static const _sliderMinValue = 2.0;
  static const _sliderMaxValue = 8.0;

  late AnimationController _controller;
  double _currentSliderValue = 4.0; // Default 4 seconds per phase
  final _indexNotifier = ValueNotifier<int>(0);
  final _countDownNotifier = ValueNotifier<int>(0);
  late final _scaleAnimation = ValueNotifier(
    AnimationController(duration: const Duration(seconds: 1), vsync: this),
  );
  List<String> steps = [];

  /// Custom phase configuration (null = use default equal phases)
  BreathingPhaseConfig? _phaseConfig;

  /// Whether we're using a custom preset with specific phase durations
  bool get _useCustomPhases => _phaseConfig != null;

  /// Selected preset index for square/triangle (null = custom)
  int? _selectedPresetIndex;

  /// Whether custom controls are expanded
  bool _showCustomControls = false;

  /// Custom phase durations (for square: 4 values, triangle: 3 values)
  List<int> _customPhaseDurations = [4, 4, 4, 4];

  /// Presets for square breathing (inhale, hold, exhale, hold)
  static const List<_BreathingPreset> _squarePresets = [
    _BreathingPreset(name: '4-4-4-4', durations: [4, 4, 4, 4]),
    _BreathingPreset(name: '4-7-8', durations: [4, 7, 8, 0]),
    _BreathingPreset(name: '5-5-5-5', durations: [5, 5, 5, 5]),
    _BreathingPreset(name: '6-6-6-6', durations: [6, 6, 6, 6]),
  ];

  /// Presets for triangle breathing (inhale, hold, exhale)
  static const List<_BreathingPreset> _trianglePresets = [
    _BreathingPreset(name: '4-4-4', durations: [4, 4, 4]),
    _BreathingPreset(name: '4-7-8', durations: [4, 7, 8]),
    _BreathingPreset(name: '5-5-5', durations: [5, 5, 5]),
    _BreathingPreset(name: '3-3-6', durations: [3, 3, 6]),
  ];

  List<_BreathingPreset> get _currentPresets {
    switch (widget.shape) {
      case BreathingGameShape.square:
        return _squarePresets;
      case BreathingGameShape.triangle:
        return _trianglePresets;
      case BreathingGameShape.circle:
        return [];
    }
  }

  List<String> get _phaseLabels {
    switch (widget.shape) {
      case BreathingGameShape.square:
        return ['Nádych', 'Zadržať', 'Výdych', 'Zadržať'];
      case BreathingGameShape.triangle:
        return ['Nádych', 'Zadržať', 'Výdych'];
      case BreathingGameShape.circle:
        return ['Nádych', 'Výdych'];
    }
  }

  void _initPhaseConfig() {
    // Parse preset parameter to get phase configuration
    switch (widget.preset) {
      case 'box':
        _phaseConfig = BreathingPhaseConfig.box;
      case '7-11':
        _phaseConfig = BreathingPhaseConfig.sevenEleven;
      case 'slow-exhale':
        _phaseConfig = BreathingPhaseConfig.slowExhale;
      default:
        _phaseConfig = null; // Use default equal phases
    }
  }

  void initSteps() {
    // If using custom config, build steps from it
    if (_useCustomPhases) {
      final config = _phaseConfig!;
      final newSteps = <String>[];
      if (config.inhaleSeconds > 0) newSteps.add(context.l10n.breathe_in);
      if (config.hold1Seconds > 0) newSteps.add(context.l10n.breathe_hold);
      if (config.exhaleSeconds > 0) newSteps.add(context.l10n.breathe_out);
      if (config.hold2Seconds > 0) newSteps.add(context.l10n.breathe_hold);
      setState(() => steps = newSteps);
      return;
    }

    // Default behavior based on shape
    switch (widget.shape) {
      case BreathingGameShape.circle:
        setState(() {
          steps = [context.l10n.breathe_in, context.l10n.breathe_out];
        });
      case BreathingGameShape.square:
        setState(() {
          steps = [
            context.l10n.breathe_in,
            context.l10n.breathe_hold,
            context.l10n.breathe_out,
            context.l10n.breathe_hold,
          ];
        });
      case BreathingGameShape.triangle:
        setState(() {
          steps = [
            context.l10n.breathe_in,
            context.l10n.breathe_hold,
            context.l10n.breathe_out,
          ];
        });
    }
  }

  void progressListener() {
    if (_useCustomPhases) {
      _progressListenerCustomPhases();
    } else {
      _progressListenerDefault();
    }
  }

  /// Progress listener for custom phase configurations (e.g., 4-4-4-4, 7-11)
  void _progressListenerCustomPhases() {
    final config = _phaseConfig!;
    final progress = _controller.value;

    final newIndex = config.getPhaseIndex(progress);
    var stepChanged = false;
    if (newIndex != _indexNotifier.value) {
      stepChanged = true;
      _indexNotifier.value = newIndex;
      setState(() {});
    }

    final newCountdown = config.getCountdown(progress);
    if (newCountdown != _countDownNotifier.value) {
      setState(() {
        _countDownNotifier.value = newCountdown;
        if (mounted) {
          if (stepChanged) {
            context.semanticsAnnounce(
              '${steps[_indexNotifier.value]} $newCountdown',
            );
          } else {
            context.semanticsAnnounce(newCountdown.toString());
          }
        }
      });

      _scaleAnimation.value
        ..reset()
        ..value = 1
        ..duration = const Duration(milliseconds: 800)
        ..reverse();
    } else {
      if (stepChanged) {
        context.semanticsAnnounce(steps[_indexNotifier.value]);
      }
    }
  }

  /// Default progress listener for equal phase durations
  void _progressListenerDefault() {
    final phaseCount = steps.length;
    final newIndex = (_controller.value * phaseCount).floor().clamp(0, phaseCount - 1);
    var stepChanged = false;
    if (newIndex != _indexNotifier.value) {
      stepChanged = true;
      _indexNotifier.value = newIndex;
      setState(() {});
    }

    // Calculate countdown: slider value = seconds per phase
    final secondsPerPhase = _currentSliderValue.round();

    // Calculate progress within current phase
    final phaseProgress = (_controller.value * phaseCount) - newIndex;
    final secondsRemainingInPhase =
        (secondsPerPhase * (1 - phaseProgress)).ceil().clamp(1, secondsPerPhase);

    if (secondsRemainingInPhase != _countDownNotifier.value) {
      setState(() {
        _countDownNotifier.value = secondsRemainingInPhase;
        if (mounted) {
          if (stepChanged) {
            context.semanticsAnnounce(
              '${steps[_indexNotifier.value]} $secondsRemainingInPhase',
            );
          } else {
            context.semanticsAnnounce(secondsRemainingInPhase.toString());
          }
        }
      });

      _scaleAnimation.value
        ..reset()
        ..value = 1
        ..duration = const Duration(milliseconds: 800)
        ..reverse();
    } else {
      if (stepChanged) {
        context.semanticsAnnounce(steps[_indexNotifier.value]);
      }
    }
  }

  void _onSliderChange(double value) {
    final phaseCount = steps.isNotEmpty ? steps.length : 2;
    final secondsPerPhase = value.round();
    final totalSeconds = secondsPerPhase * phaseCount;
    final newDuration = Duration(seconds: totalSeconds);

    setState(() {
      _currentSliderValue = value;
      _controller.duration = newDuration;
      // Immediately update countdown for new duration
      final phaseProgress = (_controller.value * phaseCount) -
          (_controller.value * phaseCount).floor();
      _countDownNotifier.value =
          (secondsPerPhase * (1 - phaseProgress)).ceil().clamp(1, secondsPerPhase);
    });
    _controller.forward();
    _controller.repeat();
  }

  @override
  void initState() {
    super.initState();

    _initPhaseConfig();

    // Initialize custom phase durations based on shape
    switch (widget.shape) {
      case BreathingGameShape.square:
        _customPhaseDurations = [4, 4, 4, 4];
      case BreathingGameShape.triangle:
        _customPhaseDurations = [4, 4, 4];
      case BreathingGameShape.circle:
        _customPhaseDurations = [4, 4];
    }

    // Set animation duration based on config or default
    final duration = _useCustomPhases
        ? Duration(seconds: _phaseConfig!.totalSeconds)
        : const Duration(seconds: 10);

    _controller = AnimationController(
      vsync: this,
      duration: duration,
    );

    _controller.addListener(progressListener);
    _controller.repeat();
    WakelockPlus.enable();
  }

  bool _isFirstRun = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initSteps();

    // Initialize countdown and duration
    if (_useCustomPhases) {
      _countDownNotifier.value = _phaseConfig!.getCountdown(0);
    } else if (widget.shape == BreathingGameShape.circle) {
      // Circle: use slider value
      final phaseCount = steps.isNotEmpty ? steps.length : 2;
      final secondsPerPhase = _currentSliderValue.round();
      final totalSeconds = secondsPerPhase * phaseCount;
      _controller.duration = Duration(seconds: totalSeconds);
      _countDownNotifier.value = secondsPerPhase;
    } else if (_isFirstRun) {
      // Square/Triangle: select first preset by default
      _isFirstRun = false;
      if (_currentPresets.isNotEmpty) {
        // Use post frame callback to avoid setState during build
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _selectPreset(0);
        });
      }
    }

    context.semanticsAnnounce(steps[_indexNotifier.value]);
    if (context.isAccessibilityReaderEnabled) {
      _onSliderChange(_sliderMinValue + 2);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _countDownNotifier.dispose();
    _indexNotifier.dispose();
    _scaleAnimation.value.dispose();
    _scaleAnimation.dispose();
    WakelockPlus.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final painterWidth = MediaQuery.of(context).size.width - 96;
    final backgroundColor = customColorsBasedOnDarkMode(
      context,
      NepanikarColors.primary(context),
      NepanikarColors.primary(context),
    );
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.breath)),
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: ValueListenableBuilder<int>(
                valueListenable: _countDownNotifier,
                builder: (context, countdown, _) {
                  return ValueListenableBuilder<AnimationController>(
                    valueListenable: _scaleAnimation,
                    builder: (context, scaleController, _) {
                      return ScaleTransition(
                        scale: scaleController,
                        child: Text(
                          countdown.toString(),
                          style: const TextStyle(
                            color: Colors.white12,
                            fontSize: 300,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: widget.shape == BreathingGameShape.triangle
                      ? 120.0
                      : 0,
                ),
                child: CustomPaint(
                  painter: BorderPainter(
                    animation: _controller,
                    shape: widget.shape,
                  ),
                  child: SizedBox(width: painterWidth, height: painterWidth),
                ),
              ),
            ),
            if (steps.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(
                  bottom: widget.shape == BreathingGameShape.triangle
                      ? 64.0
                      : 0,
                ),
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
                const SizedBox(height: 8),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Text(
                      context.l10n.breathing_exercise_tip,
                      style: TextStyle(
                        color: NepanikarColors.primarySwatch(
                          Theme.of(context).primaryColor,
                        ).shade50,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Controls at the bottom
            if (widget.shape == BreathingGameShape.circle && !_useCustomPhases)
              // Simple slider for circle
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    context.l10n.breath_speed,
                    style: NepanikarFonts.bodyBlack.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${_currentSliderValue.round()}s',
                    style: NepanikarFonts.bodyHeavy.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Slider(
                    value: _currentSliderValue,
                    min: _sliderMinValue,
                    max: _sliderMaxValue,
                    divisions: (_sliderMaxValue - _sliderMinValue).toInt(),
                    label: '${_currentSliderValue.round()}s',
                    thumbColor: Colors.white,
                    activeColor: Colors.white,
                    inactiveColor: NepanikarColors.primarySwatch(
                      Theme.of(context).primaryColor,
                    ).shade500,
                    onChanged: _onSliderChange,
                  ),
                  const SizedBox(height: 38),
                ],
              )
            else if (widget.shape != BreathingGameShape.circle && !_useCustomPhases)
              // Presets + custom controls for square/triangle
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildShapeControls(),
                ],
              ),
          ],
        ),
      ),
    );
  }

  /// Build preset and custom controls for square/triangle shapes
  Widget _buildShapeControls() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Preset buttons row
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ..._currentPresets.asMap().entries.map((entry) {
                  final index = entry.key;
                  final preset = entry.value;
                  final isSelected = _selectedPresetIndex == index && !_showCustomControls;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: _buildPresetButton(
                      preset.name,
                      isSelected,
                      () => _selectPreset(index),
                    ),
                  );
                }),
                // Custom button
                _buildPresetButton(
                  'Vlastné',
                  _showCustomControls,
                  () => _toggleCustomControls(),
                ),
              ],
            ),
          ),

          // Custom controls (expandable)
          if (_showCustomControls) ...[
            const SizedBox(height: 16),
            ...List.generate(_phaseLabels.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _buildPhaseControl(index),
              );
            }),
          ],
        ],
      ),
    );
  }

  Widget _buildPresetButton(String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? NepanikarColors.primary(context) : Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildPhaseControl(int index) {
    final label = _phaseLabels[index];
    final value = _customPhaseDurations[index];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        Row(
          children: [
            _buildControlButton(
              Icons.remove,
              () => _adjustPhaseValue(index, -1),
              enabled: value > 1,
            ),
            Container(
              width: 50,
              alignment: Alignment.center,
              child: Text(
                '${value}s',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildControlButton(
              Icons.add,
              () => _adjustPhaseValue(index, 1),
              enabled: value < 15,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildControlButton(IconData icon, VoidCallback onTap, {bool enabled = true}) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: enabled ? Colors.white.withOpacity(0.2) : Colors.white.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: enabled ? Colors.white : Colors.white.withOpacity(0.3),
          size: 20,
        ),
      ),
    );
  }

  void _selectPreset(int index) {
    final preset = _currentPresets[index];
    setState(() {
      _selectedPresetIndex = index;
      _showCustomControls = false;
      _customPhaseDurations = List.from(preset.durations);
    });
    _applyPhaseDurations(preset.durations);
  }

  void _toggleCustomControls() {
    setState(() {
      _showCustomControls = !_showCustomControls;
      if (_showCustomControls) {
        _selectedPresetIndex = null;
      }
    });
  }

  void _adjustPhaseValue(int index, int delta) {
    final newValue = (_customPhaseDurations[index] + delta).clamp(1, 15);
    setState(() {
      _customPhaseDurations[index] = newValue;
    });
    _applyPhaseDurations(_customPhaseDurations);
  }

  void _applyPhaseDurations(List<int> durations) {
    // Create phase config from durations
    BreathingPhaseConfig config;
    if (widget.shape == BreathingGameShape.square) {
      config = BreathingPhaseConfig(
        inhaleSeconds: durations[0],
        hold1Seconds: durations[1],
        exhaleSeconds: durations[2],
        hold2Seconds: durations.length > 3 ? durations[3] : 0,
      );
    } else {
      // Triangle
      config = BreathingPhaseConfig(
        inhaleSeconds: durations[0],
        hold1Seconds: durations[1],
        exhaleSeconds: durations[2],
        hold2Seconds: 0,
      );
    }

    _phaseConfig = config;
    _controller.duration = Duration(seconds: config.totalSeconds);
    _countDownNotifier.value = config.getCountdown(0);
    initSteps();

    // Restart animation with new duration
    _controller.reset();
    _controller.repeat();
  }
}

/// Helper class for breathing presets
class _BreathingPreset {
  const _BreathingPreset({
    required this.name,
    required this.durations,
  });

  final String name;
  final List<int> durations;
}
