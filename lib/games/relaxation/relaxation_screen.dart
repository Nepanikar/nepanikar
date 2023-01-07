import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:url_launcher/url_launcher.dart';

enum RelaxationType {
  general,
  morning,
  evening,
}

class RelaxationRoute extends GoRouteData {
  const RelaxationRoute({
    required this.relaxationType,
  });

  final RelaxationType relaxationType;

  @override
  Widget build(BuildContext context, _) => RelaxationScreen(
        relaxationType: relaxationType,
      );
}

class RelaxationScreen extends StatefulWidget {
  const RelaxationScreen({super.key, required this.relaxationType});

  final RelaxationType relaxationType;

  @override
  State<RelaxationScreen> createState() => _RelaxationScreenState();
}

class _RelaxationScreenState extends State<RelaxationScreen> {
  final player = AssetsAudioPlayer();

  Duration songDuration = Duration.zero;
  Duration sliderPosition = Duration.zero;

  late String title;
  late String asset;
  late String? description;
  late String? url;

  String labelFromMilliseconds(int time) {
    final int sHours = Duration(milliseconds: time).inHours;
    final int sMinutes = Duration(milliseconds: time).inMinutes;
    final int sSeconds = Duration(milliseconds: time).inSeconds;

    //final int rHours = sHours;
    final int rMinutes = sMinutes - (sHours * 60);
    final int rSeconds = sSeconds - (sMinutes * 60 + sHours * 60 * 60);

    return '$rMinutes:$rSeconds';
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();

    switch (widget.relaxationType) {
      case RelaxationType.general:

        /// Not translated, bcs this module is only used in CS and SK lang
        title = 'Relaxace';
        asset = Assets.audio.relaxCS;
        break;
      case RelaxationType.morning:
        title = 'Ranní zastavení';
        asset = Assets.audio.morningCS;
        description = 'Dlouhodobé zaznamenávání nálady ti pomůže Odpověď uvnitř';
        url = 'https://www.odpoveduvnitr.cz/';
        break;
      case RelaxationType.evening:
        title = 'Večerní zastavení';
        asset = Assets.audio.eveningCS;
        description = 'Dlouhodobé zaznamenávání nálady ti pomůže Odpověď uvnitř';
        url = 'https://www.odpoveduvnitr.cz/';
        break;
    }

    player.open(
      Audio(asset),
      autoStart: false,
    );

    player.current.listen((playingAudio) {
      if (playingAudio?.audio != null) {
        if (mounted) {
          setState(() {
            songDuration = playingAudio!.audio.duration;
          });
        }
      }
    });
    player.currentPosition.listen((currPosition) {
      if (mounted) {
        setState(() {
          sliderPosition = currPosition;
        });
      }
    });
  }

  @override
  void dispose() {
    player.stop();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NepanikarColors.primarySwatch,
      appBar: AppBar(
        title: Text(title),
      ),
      body: Stack(
        children: [
          if (description != null)
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: GestureDetector(
                  onTap: () => _launchUrl(url!),
                  child: Text(
                    description!,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: NepanikarColors.primarySwatch.shade300),
                  ),
                ),
              ),
            ),
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
                      activeTrackColor: Colors.white24,
                      thumbColor: Colors.white,
                    ),
                    child: Slider(
                      value: sliderPosition.inMilliseconds
                          .clamp(0, songDuration.inMilliseconds)
                          .toDouble(),
                      max: songDuration.inMilliseconds.toDouble(),
                      divisions: 100,
                      onChanged: (double value) {
                        if (mounted) {
                          setState(() {
                            sliderPosition = Duration(
                              milliseconds: value.toInt(),
                            );
                          });
                        }
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
                          style: NepanikarFonts.bodySmallMedium.copyWith(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          labelFromMilliseconds(songDuration.inMilliseconds),
                          style: NepanikarFonts.bodySmallMedium.copyWith(
                            fontSize: 15,
                            color: Colors.white,
                          ),
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
