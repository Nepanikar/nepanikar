import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/router/routes.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/providers/mood_state_provider.dart';
import 'package:nepanikar/screens/home/my_records/mood/mood_entry_detail_screen.dart';
import 'package:nepanikar/services/db/my_records/mood_track_dao.dart';
import 'package:nepanikar/services/db/my_records/mood_track_model.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/mood/chosen_emotions.dart';
import 'package:nepanikar/widgets/mood/mood_entry_card.dart';
import 'package:provider/provider.dart';

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

class _SearchMoodEntryState<T extends MoodTrackDao> extends State<SearchMoodEntryScreen<T>> {

  T get _trackDao => registry.get<T>();

  final TextEditingController _searchController = TextEditingController();

  List<String> _selectedEmotions = [];
  List<String> _emotions = [];
  String _summaryToSearch = '';
  List<MoodTrack> _searchResults = [];
  bool search = false;

  final multiSelectKey = GlobalKey<FormFieldState>();



  void _onEmotionsUpdated(List<String> updatedEmotions) {
    setState(() {
      _selectedEmotions = updatedEmotions;
    });
  }

  void _search() async {
    final results = await _trackDao.searchMoodTracks(_summaryToSearch, _selectedEmotions);
    setState(() {
      _searchResults = results;
    });
  }

  @override
  void dispose() {
    // Dispose the controller when the state is disposed
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _emotions = Provider.of<MoodState>(context).emotions;
    final items = _emotions
        .map((emotion) => MultiSelectItem<String>(emotion, emotion))
        .toList();

    const pageHorizontalPadding = EdgeInsets.symmetric(horizontal: 24.0, vertical: 12);

    ValueKey<int> uniqueKey = ValueKey<int>(_selectedEmotions.length);


    final textStyleColor = customColorsBasedOnDarkMode(
      context,
      NepanikarColors.white,
      NepanikarColors.primaryD,
    );
    final containerColor = customColorsBasedOnDarkMode(
        context, NepanikarColors.containerD, NepanikarColors.white);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.search,
          style: NepanikarFonts.title2.copyWith(color: NepanikarColors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: pageHorizontalPadding,
            child: Column(
              key: ValueKey(_selectedEmotions.length),
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _searchController,
                  decoration:  InputDecoration(
                    labelText: context.l10n.search_by_summary,
                    labelStyle: TextStyle(
                      color: NepanikarColors.primarySwatch.shade400,
                      fontWeight: FontWeight.bold,
                    ),
                    fillColor: containerColor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: NepanikarColors.containerD,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    hintText: context.l10n.enter_part_of_summary,
                    hintStyle: TextStyle(
                        color: NepanikarColors.primarySwatch.shade400,
                        fontWeight: FontWeight.w500,
                        fontSize: 14
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _summaryToSearch = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  key: uniqueKey,
                  child: MultiSelectDialogField(
                    searchable: true,
                    items: items,
                    backgroundColor: containerColor,
                    title: Text(context.l10n.emotions),
                    decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                      border: Border.all(
                        color: NepanikarColors.containerD,
                      ),
                    ),
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
                      context.l10n.search_by_emotions,
                      style: TextStyle(
                        color: NepanikarColors.primarySwatch.shade400,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    onConfirm: (results) {
                      _onEmotionsUpdated(results.cast<String>());
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
                    initialValue: _selectedEmotions,
                    chipDisplay: MultiSelectChipDisplay.none(),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                ChosenEmotionsWidget(
                  initialEmotions: _selectedEmotions,
                  onEmotionsUpdated: _onEmotionsUpdated,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: pageHorizontalPadding,
                      width: 150,
                      height: 70,
                      child: ElevatedButton(
                        onPressed: () {
                          search = true;
                          FocusScope.of(context).unfocus();
                          _search();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: NepanikarColors.containerD,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        child: Text(
                          context.l10n.search,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ), // Text color
                        ),
                      ),
                    ),
                    Container(
                      padding: pageHorizontalPadding,
                      width: 150,
                      height: 70,
                      child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                            _searchController.clear();
                            _summaryToSearch = '';
                            search = false;
                            _selectedEmotions.clear();
                            FocusScope.of(context).unfocus();
                            _searchResults.clear();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: NepanikarColors.deleteButton,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        child: Text(
                          context.l10n.clear_button,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ), // Text color
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
                if (search) ... [
                  if (_searchResults.isNotEmpty) ... [
                    Text(
                      context.l10n.mood_entries,
                      style: NepanikarFonts.title2.copyWith(color: textStyleColor),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _searchResults.length, // Use the length of the search results list
                      itemBuilder: (context, index) {
                        final moodEntry = _searchResults[index]; // Access the search result item
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                          child: MoodEntryCard(
                            dateTime: DateFormat('d. MMM yyyy, HH:mm').format(moodEntry.date),
                            moodIcon: moodEntry.mood.icon,
                            moodDescription: moodEntry.summary ?? context.l10n.no_description_provided,
                            onTap: () {
                              Provider.of<MoodState>(context, listen: false).selectMoodEntry(moodEntry);
                              context.push(const MoodEntryDetailRoute().location);
                            },
                            moodColor: null,
                          ),
                        );
                      },
                    ),
                  ]
                  else ... [
                    Text(
                      context.l10n.no_mood_entries,
                      style: NepanikarFonts.title2.copyWith(color: textStyleColor),
                    ),
                  ]
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
