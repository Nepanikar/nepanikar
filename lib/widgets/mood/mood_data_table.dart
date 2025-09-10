import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/services/db/my_records/mood_track_model.dart';

class MoodDataTable extends StatelessWidget {
  const MoodDataTable({super.key, required this.moodTrackData, required this.moodLabelBuilder});

  final Map<DateTime, List<MoodTrack>> moodTrackData;
  final String Function(Mood m) moodLabelBuilder;

  List<DataColumn> _getDataColumns(BuildContext context) {
    final l10n = context.l10n;
    return [DataColumn(label: Text(l10n.date_of_note)), const DataColumn(label: Text(''))];
  }

  List<DataRow> _getDataRows(BuildContext context) {
    final locale = Localizations.localeOf(context);
    return moodTrackData.entries
        .map((e) {
          final moodTrack = e.value;
          double averageMood = 0;
          for (final mood in moodTrack) {
            averageMood += mood.mood.index.toDouble();
          }
          averageMood /= moodTrack.length;
          DataRow(
            cells: [
              DataCell(Text(DateFormat.yMMMd(locale.languageCode).format(e.key))),
              DataCell(Text(averageMood.toStringAsFixed(2))),
            ],
          );
        })
        .whereType<DataRow>()
        .toList()
        .reversed
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FittedBox(
        child: DataTable(
          columns: _getDataColumns(context),
          rows: _getDataRows(context),
          columnSpacing: 100,
        ),
      ),
    );
  }
}
