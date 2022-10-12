import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';

/// [Lottie] animations should NOT be usually cached - they usually work just fine using
/// via Lottie widget. Caching them takes apart from caching SVGs much more time.
///
/// However, there are some edge cases when they are needed to be cached:
final _lottiePathsToCache = <String>[
  ...[
    // TODO: Find smaller animation.
    // Caching this specific animation because it is really big and lags
    // the screen when it shows up for the first time.
    Assets.animatedIllustrations.confetti,
  ].map((e) => e.path),
];

class LottieCacheManager {
  LottieCacheManager();

  final Map<String, LottieComposition> _compositions = {};

  Future<void> init() async {
    await Future.forEach<String>(
      _lottiePathsToCache,
      (path) => _addToCache(path),
    );
  }

  Future<void> _addToCache(String path) async {
    _compositions[path] = await AssetLottie(path).load();
  }

  Widget loadFromCache(
    LottieGenImage lottie, {
    bool? repeat,
  }) {
    final composition = _compositions[lottie.path];
    return IgnorePointer(
      child: composition != null
          ? Lottie(
              composition: composition,
              repeat: repeat,
            )
          : lottie.lottie(
              repeat: repeat,
            ),
    );
  }
}
