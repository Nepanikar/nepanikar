import 'package:flutter_svg/flutter_svg.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';

final _svgPathsToCache = <String>[
  ...[
    ...Assets.icons.values,
    ...Assets.icons.navigation.values,
    ...Assets.icons.checkmarks.values,
    ...Assets.illustrations.contacts.values,
    ...Assets.illustrations.modules.values,
    ...Assets.illustrations.moods.values,
    ...Assets.illustrations.games.math.values,
  ].map((e) => e.path),
];

Future<void> precacheSvgs() async {
  for (final path in _svgPathsToCache) {
    final loader = SvgAssetLoader(path);
    await svg.cache.putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));
  }
}
