import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';

class RelaxationRoute extends GoRouteData {
  const RelaxationRoute();

  @override
  Widget build(BuildContext context, _) => const RelaxationScreen();
}

class RelaxationScreen extends StatefulWidget {
  const RelaxationScreen({super.key});

  @override
  State<RelaxationScreen> createState() => _RelaxationScreenState();
}

class _RelaxationScreenState extends State<RelaxationScreen> {
  final player = AssetsAudioPlayer();

  Duration songDuration = Duration.zero;
  Duration sliderPosition = Duration.zero;

  String labelFromMilliseconds(int time) {
    final int sHours = Duration(milliseconds: time).inHours;
    final int sMinutes = Duration(milliseconds: time).inMinutes;
    final int sSeconds = Duration(milliseconds: time).inSeconds;

    //final int rHours = sHours;
    final int rMinutes = sMinutes - (sHours * 60);
    final int rSeconds = sSeconds - (sMinutes * 60 + sHours * 60 * 60);

    return '$rMinutes:$rSeconds';
  }

  @override
  void initState() {
    super.initState();

    player.open(
      Audio('assets/audio/relaxCS.mp3'),
      autoStart: false,
    );

    player.current.listen((playingAudio) {
      if (playingAudio?.audio != null) {
        setState(() {
          songDuration = playingAudio!.audio.duration;
        });
      }
    });
    player.currentPosition.listen((currPosition) {
      setState(() {
        sliderPosition = currPosition;
      });
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NepanikarColors.primarySwatch.shade200,
      appBar: AppBar(
        title: Text(context.l10n.relaxation),
      ),
      body: Stack(
        children: [
          Align(
            child: StreamBuilder(
              stream: player.isPlaying,
              builder: (context, asyncSnapshot) {
                final bool isPlaying = asyncSnapshot.data ?? false;
                return GestureDetector(
                  onTap: () => player.playOrPause(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      color: Colors.white,
                      width: 86,
                      height: 86,
                      child: Icon(
                        isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                        size: 40,
                        color: NepanikarColors.primary,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SliderTheme(
                    data: const SliderThemeData(
                      trackHeight: 6,
                      inactiveTrackColor: Colors.white,
                    ),
                    child: Slider(
                      value: sliderPosition.inMilliseconds
                          .clamp(0, songDuration.inMilliseconds)
                          .toDouble(),
                      max: songDuration.inMilliseconds.toDouble(),
                      divisions: 100,
                      onChanged: (double value) {
                        setState(() {
                          sliderPosition = Duration(
                            milliseconds: value.toInt(),
                          );
                        });
                        player.seek(
                          Duration(
                            milliseconds: value.toInt(),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          labelFromMilliseconds(sliderPosition.inMilliseconds),
                          style: NepanikarFonts.bodySmallMedium.copyWith(fontSize: 15),
                        ),
                        Text(
                          labelFromMilliseconds(songDuration.inMilliseconds),
                          style: NepanikarFonts.bodySmallMedium.copyWith(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
