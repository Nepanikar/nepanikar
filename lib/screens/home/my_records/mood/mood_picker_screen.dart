import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/helpers/date_helpers.dart';
import 'package:nepanikar/providers/mood_state_provider.dart';
import 'package:nepanikar/screens/home/my_records/mood/mood_records_screen.dart';
import 'package:nepanikar/services/db/my_records/mood_track_dao.dart';
import 'package:nepanikar/services/db/my_records/mood_track_model.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/mood/chosen_emotions.dart';
import 'package:nepanikar/widgets/mood/mood_picker.dart';
import 'package:provider/provider.dart';

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
    this.isEditing = false,
  });

  final bool showBottomNavbar;
  final bool isEditing;

  @override
  State<MoodPickerScreen<T>> createState() => _MoodPickerScreenState<T>();
}

class _MoodPickerScreenState<T extends MoodTrackDao>
    extends State<MoodPickerScreen<T>> {
  T get _trackDao => registry.get<T>();

  DateTime get _now => getNowDateTimeLocal();

  String? selectedEmotion;

  List<String> selectedEmotions = [];

  List<String> emotions = [];

  String summary = '';

  String description = '';

  MoodTrack? selectedMoodTrack;

  Mood? currentMood;

  final TextEditingController _newEmotionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final moodState = Provider.of<MoodState>(context, listen: false);

    if (moodState.editing && moodState.selectedMoodEntry != null) {
      selectedMoodTrack = moodState.selectedMoodEntry;
      summary = selectedMoodTrack!.summary ?? '';
      description = selectedMoodTrack!.description ?? '';
      selectedEmotions = List<String>.from(selectedMoodTrack!.emotions ?? []);
      currentMood = selectedMoodTrack!.mood;
    } else {
      summary = '';
      description = '';
      selectedEmotions = [];
      currentMood = null;
    }
  }

  List<String> _addNewEmotion() {
    if (_newEmotionController.text.isNotEmpty &&
        !emotions.contains(_newEmotionController.text)) {
      setState(() {
        emotions.add(_newEmotionController.text);
        selectedEmotions.add(_newEmotionController.text);
        Provider.of<MoodState>(context, listen: false)
            .addEmotion(_newEmotionController.text);
      });
      _newEmotionController.clear();
    }
    return selectedEmotions;
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
    final moodState = Provider.of<MoodState>(context, listen: false);
    emotions = moodState.emotions;
    final items = emotions
        .map((emotion) => MultiSelectItem<String>(emotion, emotion))
        .toList();

    String formattedDateForEditing = '';

    if (!moodState.editing) {
      currentMood = Provider.of<MoodState>(context).activeMood;
    } else {
      formattedDateForEditing = DateFormat('d. MMM. yyyy   HH:mm')
          .format(moodState.selectedMoodEntry!.date);
    }

    const pageHorizontalPadding = EdgeInsets.symmetric(horizontal: 24.0);

    final formattedDate = DateFormat('d. MMM. yyyy   HH:mm').format(_now);

    //Colors
    final textStyleColor = customColorsBasedOnDarkMode(
      context,
      NepanikarColors.white,
      NepanikarColors.primaryD,
    );
    final containerColor = customColorsBasedOnDarkMode(
        context, NepanikarColors.containerD, NepanikarColors.white);

    final multiSelectKey = GlobalKey<FormFieldState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          moodState.editing ? formattedDateForEditing : formattedDate,
          style: NepanikarFonts.title2.copyWith(color: NepanikarColors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: pageHorizontalPadding,
                child: StreamBuilder<MoodTrack?>(
                  stream: _trackDao.latestMoodTrackStream,
                  builder: (_, snapshot) {
                    return MoodPicker(
                      activeMood: currentMood,
                      autoSizeTitle: false,
                      showLabels: false,
                      onPick: (mood) async {
                        currentMood = mood;
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: pageHorizontalPadding,
                child: TextFormField(
                  initialValue: summary,
                  decoration: InputDecoration(
                    labelText: context.l10n.title_entry_label,
                    labelStyle: TextStyle(
                        color: NepanikarColors.primarySwatch.shade400,
                        fontWeight: FontWeight.bold),
                    fillColor: containerColor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: NepanikarColors.containerD,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    hintText: context.l10n.enter_summary,
                    hintStyle: TextStyle(
                      color: NepanikarColors.primarySwatch.shade400,
                      fontWeight: FontWeight.bold,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                  onChanged: (value) {
                    setState(() {
                      summary = value;
                    });
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
                        backgroundColor: containerColor,
                        title: Text(context.l10n.emotions),
                        decoration: BoxDecoration(
                            color: containerColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40)),
                            border:
                                Border.all(color: NepanikarColors.containerD)),
                        selectedColor: textStyleColor,
                        selectedItemsTextStyle: TextStyle(
                          color: textStyleColor,
                        ),
                        unselectedColor: textStyleColor,
                        itemsTextStyle: TextStyle(
                          color: textStyleColor,
                        ),
                        buttonIcon: Icon(
                          Icons.arrow_drop_down,
                          color: textStyleColor,
                        ),
                        buttonText: Text(
                          context.l10n.select_your_emotions,
                          style: TextStyle(
                            color: NepanikarColors.primarySwatch.shade400,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        onConfirm: (results) {
                          if (results.length <= 9) {
                            _onEmotionsUpdated(results.cast<String>());
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        context.l10n.select_up_to_9_emotions)));
                          }
                        },
                        cancelText: Text(
                          context.l10n.cancel,
                          style: TextStyle(
                            color: textStyleColor,
                            fontSize: 16,
                          ),
                        ),
                        confirmText: Text(
                          context.l10n.submit,
                          style: TextStyle(
                            color: textStyleColor,
                            fontSize: 16,
                          ),
                        ),
                        initialValue: selectedEmotions,
                        chipDisplay: MultiSelectChipDisplay.none(),
                        validator: (values) {
                          if (values != null && values.length > 9) {
                            return context.l10n.select_up_to_9_emotions;
                          }
                          return null;
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add_circle_outline,
                        size: 30,
                        color: textStyleColor,
                      ),
                      onPressed: () =>
                          _showAddNewEmotionDialog(containerColor!),
                    ),
                  ],
                ),
              ),
              ChosenEmotionsWidget(
                key: ValueKey(selectedEmotions.length),
                initialEmotions: selectedEmotions,
                onEmotionsUpdated: _onEmotionsUpdated,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: pageHorizontalPadding,
                child: TextFormField(
                  maxLines: 20,
                  initialValue: description,
                  textAlignVertical: TextAlignVertical.top,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    labelText: context.l10n.summary_of_your_moment,
                    labelStyle: TextStyle(
                      color: NepanikarColors.primarySwatch.shade400,
                      fontWeight: FontWeight.bold,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: NepanikarColors.containerD,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: containerColor,
                    alignLabelWithHint: true,
                    hintText: context.l10n.describe_what_happened,
                    hintStyle: TextStyle(
                      color: NepanikarColors.primarySwatch.shade400,
                      fontWeight: FontWeight.bold,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                  onChanged: (value) {
                    setState(() {
                      description = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: pageHorizontalPadding,
                width: 600,
                child: ElevatedButton(
                  onPressed: () async {
                    if (moodState.editing) {
                      await Provider.of<MoodState>(context, listen: false)
                          .updateMoodTrack(
                        selectedMoodTrack!.date,
                        summary,
                        description,
                        selectedEmotions,
                        currentMood!,
                      );
                    } else {
                      await Provider.of<MoodState>(context, listen: false)
                          .saveMoodTrack(
                        summary,
                        description,
                        selectedEmotions,
                        currentMood!,
                      );
                    }
                    if (mounted) {
                      await context.push(const MoodRecordsRoute().location);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: NepanikarColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  ),
                  child:  Text(
                    context.l10n.save,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ), // Text color
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showAddNewEmotionDialog(Color containerColor) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: containerColor,
          title: Text(context.l10n.add_a_new_emotion),
          content: TextField(
            cursorColor: NepanikarColors.primarySwatch.shade600,
            controller: _newEmotionController,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: NepanikarColors.primarySwatch.shade600,
                  ),
              ),
              hintText: context.l10n.type_a_new_emotion,
            ),
            onChanged: (value) {
              if (value.length > 12) {
                setState(() {});
              }
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                context.l10n.cancel,
                style: TextStyle(
                  color: customColorsBasedOnDarkMode(context, NepanikarColors.white, NepanikarColors.primary),
                ),
              ),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
            TextButton(
              child: Text(
                context.l10n.submit,
                style: TextStyle(
                  color: customColorsBasedOnDarkMode(context, NepanikarColors.white, NepanikarColors.primary),
                ),
              ),
              onPressed: () {
                if (_newEmotionController.text.length > 12) {
                  ScaffoldMessenger.of(ctx).showSnackBar(
                    SnackBar(
                      content: Text(context.l10n.emotion_too_long),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else {
                  final updatedEmotions = _addNewEmotion();
                  _onEmotionsUpdated(updatedEmotions);
                  Navigator.of(ctx).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
