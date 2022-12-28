import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

/// List of text items with checkboxes.
class NepanikarChecklistFormDTO extends Equatable {
  const NepanikarChecklistFormDTO._({
    required this.records,
  });

  factory NepanikarChecklistFormDTO.getData(
    Config config, {
    required String sectionTextsName,
    required String sectionCheckboxStatesName,
  }) {
    final textsMap = config.itemsToMap(sectionTextsName);
    final checkboxStatesMap = config.itemsToMap(sectionCheckboxStatesName);

    final records = <MapEntry<String, bool>>[];
    if (textsMap != null) {
      final sortedTextEntries = textsMap.entries.toList()
        ..sort((a, b) => confKeysSorter(a.key, b.key));

      for (final textEntry in sortedTextEntries) {
        final text = textEntry.value ?? '';
        final checkboxState = checkboxStatesMap?[textEntry.key];
        records.add(MapEntry(text, checkboxState?.getIniBoolValue() ?? false));
      }
    }

    return NepanikarChecklistFormDTO._(
      records: records.isEmpty ? null : records,
    );
  }

  /// List of text items with checkboxes.
  ///
  /// Key is the text of the item, value is the checkbox state.
  final Iterable<MapEntry<String, bool>>? records;

  @override
  List<Object?> get props => [records];
}
