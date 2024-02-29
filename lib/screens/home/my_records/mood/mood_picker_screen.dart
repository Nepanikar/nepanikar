import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/helpers/date_helpers.dart';
import 'package:nepanikar/helpers/localization_helpers.dart';
import 'package:nepanikar/services/db/my_records/mood_track_dao.dart';
import 'package:nepanikar/services/db/my_records/mood_track_model.dart';
import 'package:nepanikar/services/notifications/notifications_service.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/mood/chosen_emotions.dart';
import 'package:nepanikar/widgets/mood/mood_picker.dart';

class MoodPickerRoute extends GoRouteData {
  const MoodPickerRoute();

  @override
  Widget build(BuildContext context, _) =>
      const MoodPickerScreen<MoodTrackDao>();
}

class MoodPickerScreen<T extends MoodTrackDao> extends StatefulWidget {
  const MoodPickerScreen({
    super.key,
    this.showBottomNavbar = true,
    this.mood,
  });

  final bool showBottomNavbar;
  final Mood? mood;

  @override
  State<MoodPickerScreen<T>> createState() => _MoodPickerScreenState<T>();
}

class _MoodPickerScreenState<T extends MoodTrackDao>
    extends State<MoodPickerScreen<T>> {
  T get _trackDao => registry.get<T>();

  NotificationsService get _notificationsService =>
      registry.get<NotificationsService>();

  DateTime get _now => getNowDateTimeLocal();

  final List<String> emotions = [
    'Happy',
    'Sad',
    'Angry',
    'Excited',
    'Stressed'
  ];

  String? selectedEmotion;

  List<String> selectedEmotions = [];

  String? summary = '';

  final TextEditingController _newEmotionController = TextEditingController();

  void _showAddNewEmotionDialog() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text('Add a New Emotion'),
          content: TextField(
            controller: _newEmotionController,
            decoration: InputDecoration(
              hintText: 'Type a new emotion',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                _addNewEmotion();
                Navigator.of(ctx).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _addNewEmotion() {
    if (_newEmotionController.text.isNotEmpty && !emotions.contains(_newEmotionController.text)) {
      setState(() {
        // Add the new emotion to the emotions list
        emotions.add(_newEmotionController.text);
        // You might also want to select the new emotion by default
        selectedEmotions.add(_newEmotionController.text);
        // Clear the text field after adding the new emotion
        _onEmotionsUpdated(selectedEmotions);
        _newEmotionController.clear();
      });
    }
  }

  @override
  void dispose() {
    // Dispose the controller when the state is disposed
    _newEmotionController.dispose();
    super.dispose();
  }

  void _onEmotionsUpdated(List<String> updatedEmotions) {
    setState(() {
      selectedEmotions = updatedEmotions;
    });
  }

  @override
  Widget build(BuildContext context) {
    const pageSidePadding = 24.0;
    const pageHorizontalPadding =
        EdgeInsets.symmetric(horizontal: pageSidePadding);
    final formattedDate = DateFormat('d. MMM. yyyy   HH:mm').format(_now);
    final textStyleColor = customColorsBasedOnDarkMode(
        context, NepanikarColors.white, NepanikarColors.primaryD);
    final items = emotions
        .map((emotion) => MultiSelectItem<String>(emotion, emotion))
        .toList();
    var multiSelectKey = GlobalKey<FormFieldState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          formattedDate,
          style: NepanikarFonts.title2.copyWith(color: textStyleColor),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: pageHorizontalPadding,
                child: StreamBuilder<MoodTrack?>(
                  stream: _trackDao.latestMoodTrackStream,
                  builder: (_, snapshot) {
                    final latestMoodTrack = snapshot.data;
                    return MoodPicker(
                      activeMood: latestMoodTrack?.mood,
                      autoSizeTitle: false,
                      showLabels: false,
                      onPickMessage: 'yes',
                      onPick: (mood) async {
                        final l10n = context.l10n;
                        await _trackDao.saveMood(mood);
                        unawaited(_notificationsService
                            .rescheduleNotifications(l10n));
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: pageHorizontalPadding,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: MultiSelectDialogField(
                          key: multiSelectKey,
                          searchable: true,
                          items: items,
                          backgroundColor: NepanikarColors.primary,
                          title: Text("Emotions"),
                          decoration: BoxDecoration(
                            color: NepanikarColors.containerD,
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            border: Border.all(
                              color: NepanikarColors.primarySwatch.shade600,
                            ),
                          ),
                          selectedColor: NepanikarColors.white,
                          selectedItemsTextStyle: const TextStyle(
                            color: NepanikarColors.white,
                          ),
                          unselectedColor: NepanikarColors.white,
                          itemsTextStyle: const TextStyle(
                            color: NepanikarColors.white,
                          ),
                          buttonIcon: const Icon(
                            Icons.arrow_drop_down,
                            color: NepanikarColors.white,
                          ),
                          buttonText:  Text(
                            "Select Your Emotions",
                            style: TextStyle(
                              color: NepanikarColors.primarySwatch.shade400,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          onConfirm: (results) {
                            _onEmotionsUpdated(results.cast<String>());
                          },
                          cancelText: const Text(
                            "CANCEL",
                            style: TextStyle(
                              color: NepanikarColors.white,
                              fontSize: 16,
                            ),
                          ),
                          confirmText: const Text(
                            "CONFIRM",
                            style: TextStyle(
                              color: NepanikarColors.white,
                              fontSize: 16,
                            ),
                          ),
                          initialValue: selectedEmotions,
                          chipDisplay: MultiSelectChipDisplay.none(),
                        ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.add_circle_outline,
                        size: 30,
                      ),
                      onPressed: _showAddNewEmotionDialog,
                    ),
                  ],
                ),
              ),
              ChosenEmotionsWidget(
                initialEmotions: selectedEmotions,
                onEmotionsUpdated: _onEmotionsUpdated,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: pageHorizontalPadding,
                child: TextFormField(
                  maxLines: 20,
                  initialValue: summary,
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    labelText: 'Summary of your moment',
                    filled: true,
                    fillColor: NepanikarColors.containerD,
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                    hintText: 'Describe what happened...',
                    floatingLabelBehavior: FloatingLabelBehavior.never
                  ),
                  onChanged: (value) {
                    setState(() {
                      summary = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
