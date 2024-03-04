import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/services/db/my_records/mood_track_dao.dart';
import 'package:nepanikar/utils/registry.dart';

class MoodRecordsRoute extends GoRouteData {
  const MoodRecordsRoute();

  @override
  Widget build(BuildContext context, _) =>
      const MoodRecordsScreen<MoodTrackDao>();
}

class MoodRecordsScreen<T extends MoodTrackDao> extends StatefulWidget {
  const MoodRecordsScreen({
    super.key,
  });


  @override
  State<MoodRecordsScreen<T>> createState() => _MoodRecordsScreenState<T>();
}

class _MoodRecordsScreenState<T extends MoodTrackDao>
  extends State<MoodRecordsScreen<T>> {
  T get  _trackDao => registry.get<T>();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }}
