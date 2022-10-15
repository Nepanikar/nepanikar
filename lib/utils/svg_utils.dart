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
  await Future.forEach<String>(
    _svgPathsToCache,
    (path) => precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, path),
      null,
    ),
  );
}
