import 'package:flutter/material.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/services/db/relaxation/mood_track_model.dart';
import 'package:nepanikar/utils/extensions.dart';

class MoodPicker extends StatefulWidget {
  const MoodPicker({
    super.key,
    required this.onPick,
    this.activeMood,
  });

  final Mood? activeMood;
  final ValueChanged<Mood> onPick;

  @override
  State<MoodPicker> createState() => _MoodPickerState();
}

class _MoodPickerState extends State<MoodPicker> {
  Mood? activeMood;

  @override
  void initState() {
    super.initState();
    activeMood = widget.activeMood;
  }

  @override
  void didUpdateWidget(MoodPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (activeMood != widget.activeMood) {
      setState(() {
        activeMood = widget.activeMood;
      });
    }
  }

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
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: Mood.values.reversed
              .map(
                (mood) => InkWell(
                  onTap: () {
                    final pickedMood = mood;
                    if (activeMood == pickedMood) return;
                    setState(() => activeMood = pickedMood);
                    widget.onPick.call(pickedMood);
                    context.showSuccessSnackbar(
                      text: 'Náladu jsme úspěšně zaznamenali',
                      // TODO: l10n
                      leading: Assets.icons.checkmarks.checkCircular.svg(),
                    );
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Opacity(
                    opacity: activeMood != null && activeMood != mood ? 0.4 : 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4),
                      child: Column(
                        children: [
                          mood.icon.svg(),
                          const SizedBox(height: 4),
                          Text(
                            mood.getLabel(context),
                            style: NepanikarFonts.bodySmallHeavy,
                          )
                        ],
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
