import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:nepanikar/widgets/heatmap/data/heatmap_color.dart';
import 'package:nepanikar/widgets/heatmap/data/heatmap_color_mode.dart';

class MyKey implements Comparable<MyKey> {

  MyKey(this.value);
  final int value;

  @override
  int compareTo(MyKey other) {
    return value.compareTo(other.value);
  }
}

class HeatMapColorTip extends StatelessWidget {

  const HeatMapColorTip({
    Key? key,
    required this.colorMode,
    this.colorsets,
    this.leftWidget,
    this.rightWidget,
    this.containerCount,
    this.size,
  }) : super(key: key);
  /// Default length of [containerCount].
  final int _defaultLength = 7;

  /// The colorsets which give the color value for its thresholds key value.
  ///
  /// Be aware that first Color is the maximum value if [ColorMode] is [ColorMode.opacity].
  final Map<int, Color>? colorsets;

  /// ColorMode changes the color mode of blocks.
  ///
  /// [ColorMode.opacity] requires just one colorsets value and changes color
  /// [ColorMode.color] changes colors based on [colorsets] thresholds key value.
  final ColorMode colorMode;

  /// The widget which shows left side of [HeatMapColorTip].
  ///
  /// If the value is null then show default 'less' [Text].
  final Widget? leftWidget;

  /// The widget which shows right side of [HeatMapColorTip].
  ///
  /// If the value is null then show default 'more' [Text].
  final Widget? rightWidget;

  /// The integer value of color tip containers count.
  final int? containerCount;

  /// The double value of tip container's size.
  final double? size;

  /// It returns the List of tip container.
  ///
  /// If [ColorMode.color], call [_heatmapListColor]
  /// If [ColorMode.opacity], call [_heatmapListOpacity]
  List<Widget> _heatmapList() => colorMode == ColorMode.color
      ? _heatmapListColor()
      : _heatmapListOpacity();

  /// Evenly show every colors from lowest to highest.
  List<Widget> _heatmapListColor() {
    List<Widget> children = [];
    SplayTreeMap<int, Color> sortedColorset =
        SplayTreeMap<int, Color>.from(colorsets ?? {}, (a, b) => a.compareTo(b));

    for (int i = 0; i < (containerCount ?? _defaultLength); i++) {
      // Correctly calculate index within bounds and use elements
      int index = ((sortedColorset.length / (containerCount ?? _defaultLength)) * i).floor();
      Color color = sortedColorset.values.elementAt(index);
      children.add(_tipContainer(color));
    }

    return children;
  }

  /// Evenly show every colors from transparent to non-transparent.
  List<Widget> _heatmapListOpacity() {
    List<Widget> children = [];

    for (int i = 0; i < (containerCount ?? _defaultLength); i++) {
      children.add(_tipContainer(colorsets?.values.first
              .withOpacity(i / (containerCount ?? _defaultLength)) ??
          Colors.white));
    }
    return children;
  }

  /// Container which is colored by [color].
  Widget _tipContainer(Color color) {
    return Container(
      color: HeatMapColor.defaultColor,
      child: Container(
        width: size ?? 10,
        height: size ?? 10,
        color: color,
      ),
    );
  }

  /// Default text widget.
  Widget _defaultText(String text) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: size ?? 10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          leftWidget ?? _defaultText('less'),
          ..._heatmapList(),
          rightWidget ?? _defaultText('more'),
        ],
      ),
    );
  }
}
