import 'package:equatable/equatable.dart';
import 'package:ini/ini.dart';
import 'package:nepanikar_data_migration/nepanikar_data_migration.dart';

class SelfHarmTimerDTO extends Equatable {
  const SelfHarmTimerDTO._({
    required this.currSelfHarmTimerStartDateTime,
    required this.selfHarmTimerRecord,
  });

  factory SelfHarmTimerDTO.getData(Config config) {
    const sectionName = 'General';

    final selfHarmTimer = config.get(sectionName, 'selfHarmTimer')?.getIniBoolValue();
    final DateTime? currSelfHarmTimerStartDateTime;

    // Whether the self harm timer is running, get start Date Time.
    if (selfHarmTimer == true) {
      currSelfHarmTimerStartDateTime =
          config.get(sectionName, 'selfHarmTimerDate')?.getIniDateTimeValue();
    } else {
      currSelfHarmTimerStartDateTime = null;
    }

    final selfHarmTimerRecord = config.get(sectionName, 'selfHarmTimerRecord')?.getIniIntValue();

    return SelfHarmTimerDTO._(
      currSelfHarmTimerStartDateTime: currSelfHarmTimerStartDateTime,
      selfHarmTimerRecord: selfHarmTimerRecord,
    );
  }

  /// The date when the self harm timer was started.
  final DateTime? currSelfHarmTimerStartDateTime;

  /// The record of the self harm timer, duration in seconds.
  final int? selfHarmTimerRecord;

  @override
  List<Object?> get props => [currSelfHarmTimerStartDateTime, selfHarmTimerRecord];
}
