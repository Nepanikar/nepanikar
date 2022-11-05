import 'package:flutter/material.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/services/db/relaxation/mood_track_model.dart';
import 'package:nepanikar/utils/extensions.dart';
import 'package:nepanikar/utils/lottie_cache_manager.dart';
import 'package:nepanikar/utils/registry.dart';

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

class _MoodPickerState extends State<MoodPicker> with TickerProviderStateMixin {
  Mood? activeMood;

  final _lottieCacheManager = registry.get<LottieCacheManager>();

  final _lottieAnimControllersMap = <Mood, AnimationController>{};

  static const _lottieAnimDuration = Duration(milliseconds: 2590);

  AnimationController? _getLottieAnimController(Mood m) => _lottieAnimControllersMap[m];

  @override
  void initState() {
    super.initState();
    activeMood = widget.activeMood;
    for (final m in Mood.values) {
      _lottieAnimControllersMap[m] = AnimationController(
        vsync: this,
        duration: _lottieAnimDuration,
      );
    }
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
  void dispose() {
    for (final animController in _lottieAnimControllersMap.values) {
      if (mounted) animController.dispose();
    }
    _lottieAnimControllersMap.clear();
    super.dispose();
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
                    if (activeMood == pickedMood) {
                      _getLottieAnimController(pickedMood)?.forward(from: 0);
                      return;
                    }
                    setState(() => activeMood = pickedMood);
                    _getLottieAnimController(pickedMood)?.forward(from: 0);
                    context.showSuccessSnackbar(
                      text: 'Náladu jsme úspěšně zaznamenali',
                      // TODO: l10n
                      leading: Assets.icons.checkmarks.checkCircular.svg(),
                    );
                    widget.onPick.call(pickedMood);
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Opacity(
                    opacity: activeMood != null && activeMood != mood ? 0.4 : 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4),
                      child: Column(
                        children: [
                          _lottieCacheManager.loadFromCache(
                            mood.animatedIcon,
                            controller: _getLottieAnimController(mood),
                            width: 50,
                            height: 50,
                            repeat: false,
                            animate: false,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            mood.getLabel(context),
                            style: NepanikarFonts.bodySmallHeavy,
                          ),
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
