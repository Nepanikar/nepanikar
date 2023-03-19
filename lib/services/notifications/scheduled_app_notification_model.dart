import 'package:equatable/equatable.dart';
import 'package:nepanikar/services/notifications/app_notification_data_model.dart';

class ScheduledAppNotification extends Equatable {
  const ScheduledAppNotification({
    required this.id,
    required this.scheduleDate,
    required this.data,
  });

  final int id;
  final DateTime scheduleDate;
  final AppNotificationData data;

  @override
  List<Object> get props => [id, data, scheduleDate];
}
