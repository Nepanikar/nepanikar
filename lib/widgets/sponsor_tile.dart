import 'package:flutter/material.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/widgets/nepanikar_tile.dart';

enum SponsorType { primary, secondary }

class SponsorTile extends StatelessWidget {
  const SponsorTile({
    super.key,
    required this.title,
    required this.type,
    required this.logoPaths,
  });

  final String title;
  final SponsorType type;
  final List<String> logoPaths;

  @override
  Widget build(BuildContext context) {
    return NepanikarTile(
      child: Column(
        children: [
          Text(
            title,
            style: NepanikarFonts.title3,
          ),
          const SizedBox(height: 15),
          const Divider(
            height: 0,
            thickness: 1,
            color: NepanikarColors.purple200,
          ),
          if (type == SponsorType.primary)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
              child: Column(
                children: logoPaths.map((path) => Image.asset(path)).toList(),
              ),
            ),
          if (type == SponsorType.secondary)
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 25,
              mainAxisSpacing: 5,
              crossAxisCount: 2,
              children: logoPaths.map((path) => Image.asset(path)).toList(),
            ),
        ],
      ),
    );
  }
}
