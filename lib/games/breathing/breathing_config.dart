/// Configuration for breathing exercise phases with customizable durations.
class BreathingPhaseConfig {
  const BreathingPhaseConfig({
    required this.inhaleSeconds,
    required this.hold1Seconds,
    required this.exhaleSeconds,
    required this.hold2Seconds,
  });

  final int inhaleSeconds;
  final int hold1Seconds;
  final int exhaleSeconds;
  final int hold2Seconds;

  /// Box breathing: 4-4-4-4 (inhale, hold, exhale, hold)
  static const box = BreathingPhaseConfig(
    inhaleSeconds: 4,
    hold1Seconds: 4,
    exhaleSeconds: 4,
    hold2Seconds: 4,
  );

  /// 7-11 relaxation breathing: 7s inhale, 11s exhale (no holds)
  static const sevenEleven = BreathingPhaseConfig(
    inhaleSeconds: 7,
    hold1Seconds: 0,
    exhaleSeconds: 11,
    hold2Seconds: 0,
  );

  /// Longer exhale than inhale: 4s in, 6s out (no holds).
  ///
  /// Asked for by the HPO programme, Week 4 Day 2 (TIPS → "Pravidelné
  /// dýchání: zpomal dech – nádech na 4, výdech na 6–8"). Neither `box` nor
  /// `sevenEleven` matches, and a link that opens a different rhythm than the
  /// text just promised undoes the instruction.
  static const slowExhale = BreathingPhaseConfig(
    inhaleSeconds: 4,
    hold1Seconds: 0,
    exhaleSeconds: 6,
    hold2Seconds: 0,
  );

  /// Returns list of non-zero phase durations in order: [inhale, hold1, exhale, hold2]
  List<int> get phaseDurations {
    return [inhaleSeconds, hold1Seconds, exhaleSeconds, hold2Seconds].where((x) => x > 0).toList();
  }

  /// Total cycle duration in seconds
  int get totalSeconds => phaseDurations.fold(0, (a, b) => a + b);

  /// Number of active phases (excludes phases with 0 duration)
  int get phaseCount => phaseDurations.length;

  /// Returns phase boundaries as fractions [0.0, ..., 1.0]
  /// Used for calculating which phase we're in based on animation progress
  List<double> get phaseBoundaries {
    final boundaries = <double>[0.0];
    var cumulative = 0.0;
    for (final duration in phaseDurations) {
      cumulative += duration / totalSeconds;
      boundaries.add(cumulative);
    }
    return boundaries;
  }

  /// Get phase index (0-based) for given progress value [0.0, 1.0)
  int getPhaseIndex(double progress) {
    final boundaries = phaseBoundaries;
    for (var i = 0; i < boundaries.length - 1; i++) {
      if (progress >= boundaries[i] && progress < boundaries[i + 1]) {
        return i;
      }
    }
    return phaseDurations.length - 1;
  }

  /// Get countdown value (seconds remaining in current phase) for given progress
  int getCountdown(double progress) {
    final boundaries = phaseBoundaries;
    final phaseIndex = getPhaseIndex(progress);
    final phaseDuration = phaseDurations[phaseIndex];

    // Calculate how far into this phase we are
    final phaseStart = boundaries[phaseIndex];
    final phaseEnd = boundaries[phaseIndex + 1];
    final phaseProgress = (progress - phaseStart) / (phaseEnd - phaseStart);

    // Countdown from phaseDuration down to 1
    return (phaseDuration * (1 - phaseProgress)).ceil().clamp(1, phaseDuration);
  }
}
