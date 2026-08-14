import 'package:flutter/material.dart' as m;
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';
//import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:nepanikar/app/l10n/ext.dart';
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
import 'package:multi_dropdown/multi_dropdown.dart';
part 'search_mood_entry.g.dart';

@TypedGoRoute<SearchMoodEntryRoute>(path: '/home/my-records/search-mood-entry')
class SearchMoodEntryRoute extends GoRouteData with $SearchMoodEntryRoute {
  const SearchMoodEntryRoute();

  @override
  Widget build(BuildContext context, _) => const SearchMoodEntryScreen<MoodTrackDao>();
}

class SearchMoodEntryScreen<T extends MoodTrackDao> extends StatefulWidget {
  const SearchMoodEntryScreen({super.key});

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

  Future<void> _search() async {
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
    final List<DropdownItem<String>> items = _emotions
        .map(
          (emotion) => DropdownItem<String>(
            label: emotion,
            value: emotion,
            selected: _selectedEmotions.contains(emotion),
          ),
        )
        .toList();

    const pageHorizontalPadding = EdgeInsets.symmetric(horizontal: 24.0, vertical: 12);

    final ValueKey<int> uniqueKey = ValueKey<int>(_selectedEmotions.length);

    final textStyleColor = customColorsBasedOnDarkMode(
      context,
      NepanikarColors.white,
      NepanikarColors.primary(context),
    );
    final containerColor = customColorsBasedOnDarkMode(
      context,
      NepanikarColors.container(context),
      NepanikarColors.white,
    );

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
                const SizedBox(height: 20),
                TextFormField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: context.l10n.search_by_summary,
                    fillColor: containerColor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: NepanikarColors.container(context)),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    hintText: context.l10n.enter_part_of_summary,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _summaryToSearch = value;
                    });
                  },
                ),
                const SizedBox(height: 15),
                Container(
                  key: uniqueKey,
                  child: m.Material(
                    type: m.MaterialType.transparency,
                    child: MultiDropdown<String>(
                      items: items,
                      searchEnabled: true,
                      maxSelections: 9,
                      dropdownMode: DropdownMode.bottomSheet,

                      onSelectionChange: (values) {
                        _onEmotionsUpdated(List<String>.from(values));
                      },

                      fieldDecoration: FieldDecoration(
                        hintText: context.l10n.search_by_emotions,
                        hintStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        backgroundColor: containerColor,
                        borderRadius: 40,
                      ),

                      dropdownDecoration: DropdownDecoration(backgroundColor: containerColor),

                      searchDecoration: SearchFieldDecoration(hintText: context.l10n.emotions),

                      dropdownItemDecoration: DropdownItemDecoration(
                        textColor: textStyleColor,
                        selectedTextColor: textStyleColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
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
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                        ),
                        child: Text(
                          context.l10n.search,
                          style: const TextStyle(color: Colors.white, fontSize: 14), // Text color
                        ),
                      ),
                    ),
                    Container(
                      padding: pageHorizontalPadding,
                      width: 150,
                      height: 70,
                      child: ElevatedButton(
                        onPressed: () {
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
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
                        ),
                        child: Text(
                          context.l10n.clear_button,
                          style: const TextStyle(color: Colors.white, fontSize: 14), // Text color
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                if (search) ...[
                  if (_searchResults.isNotEmpty) ...[
                    Text(
                      context.l10n.mood_entries,
                      style: NepanikarFonts.title2.copyWith(color: textStyleColor),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _searchResults.length, // Use the length of the search results list
                      itemBuilder: (context, index) {
                        final moodEntry = _searchResults[index]; // Access the search result item
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                          child: MoodEntryCard(
                            dateTime: DateFormat('d. MMM yyyy, HH:mm').format(moodEntry.date),
                            moodIcon: moodEntry.mood.icon,
                            moodDescription:
                                moodEntry.summary ?? context.l10n.no_description_provided,
                            onTap: () {
                              Provider.of<MoodState>(
                                context,
                                listen: false,
                              ).selectMoodEntry(moodEntry);
                              context.push(const MoodEntryDetailRoute().location);
                            },
                          ),
                        );
                      },
                    ),
                  ] else ...[
                    Text(
                      context.l10n.no_mood_entries,
                      style: NepanikarFonts.title2.copyWith(color: textStyleColor),
                    ),
                  ],
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
