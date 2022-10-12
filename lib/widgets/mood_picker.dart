import 'package:flutter/material.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/utils/extensions.dart';

class MoodPicker extends StatefulWidget {
  const MoodPicker({super.key});

  @override
  State<MoodPicker> createState() => _MoodPickerState();
}

class _MoodPickerState extends State<MoodPicker> {
  int? activeMood;

  final _moods = <SvgGenImage>[
    Assets.illustrations.moods.happy1,
    Assets.illustrations.moods.good2,
    Assets.illustrations.moods.okay3,
    Assets.illustrations.moods.bad4,
    Assets.illustrations.moods.sad5,
  ];

  // TODO: l10n
  final _names = ['Super', 'Dobře', 'Nic moc', 'Smutně', 'Mizerně'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ahoj, jak se dnes cítíš?',
          // TODO: l10n
          style: NepanikarFonts.title2,
        ),
        const SizedBox(
          height: 14,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _moods
              .asMap()
              .entries
              .map(
                (e) => InkWell(
                  onTap: () {
                    if (activeMood == e.key) return;
                    setState(() {
                      activeMood = e.key;
                    });
                    context.showSuccessSnackbar(
                      text: 'Náladu jsme úspěšně zaznamenali',
                      // TODO: l10n
                      leading: Assets.icons.checkmarks.checkCircular.svg(),
                    );
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Opacity(
                    opacity: activeMood != null && activeMood != e.key ? 0.4 : 1,
                    child: Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4),
                        child: Column(
                          children: [
                            e.value.svg(),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              _names.elementAt(e.key),
                              style: NepanikarFonts.bodySmallHeavy,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        )
      ],
    );
  }
}
