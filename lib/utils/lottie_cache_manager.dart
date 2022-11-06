import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';

/// [Lottie] animations should NOT be usually cached - they usually work just fine using
/// via Lottie widget. Caching them takes apart from caching SVGs much more time.
///
/// However, there are some edge cases when they are needed to be cached:
final _lottiePathsToCache = <String>[
  ...<LottieGenImage>[
    // TODO: Find smaller animation.
    // Caching this specific animation because it is really big and lags
    // the screen when it shows up for the first time.
    Assets.animatedIllustrations.confetti,

    // Caching these animations because they are located on the home screen
    // (which is the first screen)
    ...Assets.animatedIllustrations.moods.values,
  ].map((e) => e.path),
];

class LottieCacheManager {
  LottieCacheManager();

  /// Key is the path to the animation.
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
    LottieGenImage lottieGenImg, {
    Animation<double>? controller,
    bool? animate,
    FrameRate? frameRate,
    bool? repeat,
    bool? reverse,
    LottieDelegates? delegates,
    LottieOptions? options,
    Key? key,
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    bool? addRepaintBoundary,
    FilterQuality? filterQuality,
  }) {
    final composition = _compositions[lottieGenImg.path];
    return composition != null
        ? Lottie(
            composition: composition,
            controller: controller,
            animate: animate,
            frameRate: frameRate,
            repeat: repeat,
            reverse: reverse,
            delegates: delegates,
            options: options,
            key: key,
            width: width,
            height: height,
            fit: fit,
            alignment: alignment,
            addRepaintBoundary: addRepaintBoundary,
            filterQuality: filterQuality,
          )
        : lottieGenImg.lottie(
            controller: controller,
            animate: animate,
            frameRate: frameRate,
            repeat: repeat,
            reverse: reverse,
            delegates: delegates,
            options: options,
            key: key,
            width: width,
            height: height,
            fit: fit,
            alignment: alignment,
            addRepaintBoundary: addRepaintBoundary,
            filterQuality: filterQuality,
          );
  }
}
