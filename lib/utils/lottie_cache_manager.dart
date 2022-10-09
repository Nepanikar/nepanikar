import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';

final _lottiePathsToCache = <String>[
  ...[
    ...Assets.animatedIllustrations.values,
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
