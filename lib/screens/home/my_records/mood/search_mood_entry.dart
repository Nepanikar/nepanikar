import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/services/db/my_records/mood_track_dao.dart';

class SearchMoodEntryRoute extends GoRouteData {
  const SearchMoodEntryRoute();

  @override
  Widget build(BuildContext context, _) =>
      const SearchMoodEntryScreen<MoodTrackDao>();
}

class SearchMoodEntryScreen<T extends MoodTrackDao> extends StatefulWidget {
  const SearchMoodEntryScreen({
    super.key,
  });

  @override
  State<SearchMoodEntryScreen<T>> createState() => _SearchMoodEntryState<T>();
}

class _SearchMoodEntryState<T extends MoodTrackDao>
extends State<SearchMoodEntryScreen<T>> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search",
          style: NepanikarFonts.title2.copyWith(color: NepanikarColors.white),
        ),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }

}