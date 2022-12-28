import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

/// List of text items without checkboxes.
class NepanikarListFormDTO extends Equatable {
  const NepanikarListFormDTO._({
    required this.texts,
  });

  factory NepanikarListFormDTO.getData(Config config, {required String sectionName}) {
    final itemsMap = config.itemsToMap(sectionName);

    final texts = <String>[];
    if (itemsMap != null) {
      final sortedKeys = itemsMap.keys.toList()..sort(confKeysSorter);
      texts.addAll(sortedKeys.map((key) => itemsMap[key] ?? ''));
    }

    return NepanikarListFormDTO._(
      texts: texts.isEmpty ? null : texts,
    );
  }

  /// List of text items without checkboxes.
  final List<String>? texts;

  @override
  List<Object?> get props => [texts];
}
