import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/providers/mood_state_provider.dart';
import 'package:nepanikar/screens/home/my_records/mood/mood_picker_screen.dart';
import 'package:nepanikar/services/db/my_records/mood_track_dao.dart';
import 'package:nepanikar/services/db/my_records/mood_track_model.dart';
import 'package:nepanikar/widgets/mood/chosen_emotions.dart';
import 'package:provider/provider.dart';

class MoodEntryDetailRoute extends GoRouteData {
  const MoodEntryDetailRoute();

  @override
  Widget build(BuildContext context, _) =>
      const MoodEntryDetailScreen<MoodTrackDao>();
}

class MoodEntryDetailScreen<T extends MoodTrackDao> extends StatefulWidget {
  const MoodEntryDetailScreen({
    super.key,
  });

  @override
  State<MoodEntryDetailScreen<T>> createState() => _MoodEntryDetailState();
}

class _MoodEntryDetailState<T extends MoodTrackDao>
    extends State<MoodEntryDetailScreen<T>> {

  Future<bool> _deleteMoodEntry(BuildContext context, MoodTrack moodEntry) async {
    final bool confirmDelete = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: NepanikarColors.containerD,
          title:  Text(context.l10n.submit),
          content: Text(context.l10n.confirm_delete),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                context.l10n.cancel,
                style: const TextStyle(
                  color: NepanikarColors.white,
                ) ,
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child:  Text(
                context.l10n.delete_record,
                style: const TextStyle(
                    color: NepanikarColors.white,
                ) ,
              ),
            ),
          ],
        );
      },
    ) ?? false; // The dialog returns null if dismissed
    return confirmDelete;
  }

  @override
  Widget build(BuildContext context) {
    final moodEntry =
        Provider.of<MoodState>(context).selectedMoodEntry!;
    final textStyleColor = customColorsBasedOnDarkMode(
      context,
      NepanikarColors.white,
      NepanikarColors.primary,
    );
    final formattedDate =
        DateFormat('d. MMM. yyyy   HH:mm').format(moodEntry.date);


    return Scaffold(
      appBar: AppBar(
        title: Text(
          formattedDate,
          style: NepanikarFonts.title2.copyWith(color: NepanikarColors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 320,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    top: 15,
                    left: -70,
                    child: Opacity(
                      opacity: 0.1,
                      child: SvgPicture.asset(
                        moodEntry.mood.icon.path,
                        width: 250,
                        height: 250,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 3,
                    top: 60,
                    child: Opacity(
                      opacity: 0.2,
                      child: Text(
                        context.l10n.emotions,
                        style: TextStyle(
                          color: textStyleColor,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    right: 10,
                    child: Container(
                      width: 220,
                      child: ChosenEmotionsWidget(
                        initialEmotions: moodEntry.emotions ?? [],
                        deleteEmotionEnabled: false,
                      ),
                    )
                  ),
                  Positioned(
                    right: 3,
                    top: 240,
                    child: Opacity(
                      opacity: 0.2,
                      child: Text(
                        context.l10n.title_entry_label,
                        style: TextStyle(
                          // Replace with your style
                          color: textStyleColor,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 15,
                    left: 60,
                    top: 290,
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        moodEntry.summary!,
                        style: TextStyle(
                          color: NepanikarColors.primarySwatch.shade700,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: true,
                        maxLines: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (moodEntry.description!.isNotEmpty) ...[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Stack(
                  children: [
                    Positioned(
                      left: 3,
                      child: Opacity(
                        opacity: 0.2,
                        child: Text(
                          context.l10n.description,
                          style: TextStyle(
                            // Replace with your style
                            color: textStyleColor,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 5,
                      right: 3,
                      top: 65,
                      child: Text(
                        moodEntry.description!,
                        style: TextStyle(
                          color: NepanikarColors.primarySwatch.shade700,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              )
            ],

          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent, // Makes the BottomAppBar transparent
        elevation: 0, // Removes the shadow
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 130,  // Set the width of the SizedBox to define the size of the button
                height: 60,  // Set the height of the SizedBox to define the size of the button
                child: ElevatedButton(
                  onPressed: () async {
                    final success = await _deleteMoodEntry(context, moodEntry);
                    if(success){
                      if(mounted){
                        await Provider.of<MoodState>(context, listen: false).deleteMoodTrack(moodEntry);
                      }
                    }
                    if(mounted){
                      Navigator.of(context).pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: NepanikarColors.deleteButton,

                  ),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(
                width: 130,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Provider.of<MoodState>(context, listen: false).setEditing(true);
                    context.push(const MoodPickerRoute().location);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: NepanikarColors.baseButtonD,
                  ),
                  child: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
