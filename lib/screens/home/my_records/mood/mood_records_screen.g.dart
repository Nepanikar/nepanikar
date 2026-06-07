// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_records_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$moodRecordsRoute];

RouteBase get $moodRecordsRoute => GoRouteData.$route(
  path: '/home/my-records/mood-records',
  factory: $MoodRecordsRoute._fromState,
);

mixin $MoodRecordsRoute on GoRouteData {
  static MoodRecordsRoute _fromState(GoRouterState state) => MoodRecordsRoute(
    fromMoodPicker: _$convertMapValue(
      'from-mood-picker',
      state.uri.queryParameters,
      _$boolConverter,
    ),
  );

  MoodRecordsRoute get _self => this as MoodRecordsRoute;

  @override
  String get location => GoRouteData.$location(
    '/home/my-records/mood-records',
    queryParams: {
      if (_self.fromMoodPicker != null)
        'from-mood-picker': _self.fromMoodPicker!.toString(),
    },
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

T? _$convertMapValue<T>(
  String key,
  Map<String, String> map,
  T? Function(String) converter,
) {
  final value = map[key];
  return value == null ? null : converter(value);
}

bool _$boolConverter(String value) {
  switch (value) {
    case 'true':
      return true;
    case 'false':
      return false;
    default:
      throw UnsupportedError('Cannot convert "$value" into a bool.');
  }
}
