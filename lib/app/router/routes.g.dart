// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $mainRoute,
    ];

GoRoute get $mainRoute => GoRouteData.$route(
      path: '/',
      factory: $MainRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'settings/about-app',
          factory: $AboutAppRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'games/math',
          factory: $MathGameRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'games/breathing-list',
          factory: $BreathingExercisesRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'games/breathing/:shape',
          factory: $BreathingGameRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'contacts/phones',
          factory: $PhoneContactsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/anxiety',
          factory: $AnxietyAppRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/anxiety/tips',
          factory: $AnxietyTipsAppRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/self-harm',
          factory: $SelfHarmRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/self-harm/timer',
          factory: $SelfHarmTimerRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/my-records',
          factory: $MyRecordsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/my-records/mood-track',
          factory: $MoodTrackRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/depression',
          factory: $DepressionRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/suicidal-thoughts',
          factory: $SuicidalThoughtsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/eating-disorder',
          factory: $EatingDisorderRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/eating-disorder/tips',
          factory: $EatingDisorderTipsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/eating-disorder/tasks',
          factory: $EatingDisorderTasksRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/eating-disorder/samples',
          factory: $EatingDisorderSamplesRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/eating-disorder/distraction',
          factory: $EatingDisorderDistractionsRouteExtension._fromState,
        ),
      ],
    );

extension $MainRouteExtension on MainRoute {
  static MainRoute _fromState(GoRouterState state) => const MainRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $AboutAppRouteExtension on AboutAppRoute {
  static AboutAppRoute _fromState(GoRouterState state) => const AboutAppRoute();

  String get location => GoRouteData.$location(
        '/settings/about-app',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $MathGameRouteExtension on MathGameRoute {
  static MathGameRoute _fromState(GoRouterState state) => const MathGameRoute();

  String get location => GoRouteData.$location(
        '/games/math',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $BreathingExercisesRouteExtension on BreathingExercisesRoute {
  static BreathingExercisesRoute _fromState(GoRouterState state) =>
      const BreathingExercisesRoute();

  String get location => GoRouteData.$location(
        '/games/breathing-list',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $BreathingGameRouteExtension on BreathingGameRoute {
  static BreathingGameRoute _fromState(GoRouterState state) =>
      BreathingGameRoute(
        shape: _$BreathingGameShapeEnumMap._$fromName(state.params['shape']!),
      );

  String get location => GoRouteData.$location(
        '/games/breathing/${Uri.encodeComponent(_$BreathingGameShapeEnumMap[shape]!)}',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $PhoneContactsRouteExtension on PhoneContactsRoute {
  static PhoneContactsRoute _fromState(GoRouterState state) =>
      const PhoneContactsRoute();

  String get location => GoRouteData.$location(
        '/contacts/phones',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $AnxietyAppRouteExtension on AnxietyAppRoute {
  static AnxietyAppRoute _fromState(GoRouterState state) =>
      const AnxietyAppRoute();

  String get location => GoRouteData.$location(
        '/home/anxiety',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $AnxietyTipsAppRouteExtension on AnxietyTipsAppRoute {
  static AnxietyTipsAppRoute _fromState(GoRouterState state) =>
      const AnxietyTipsAppRoute();

  String get location => GoRouteData.$location(
        '/home/anxiety/tips',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $SelfHarmRouteExtension on SelfHarmRoute {
  static SelfHarmRoute _fromState(GoRouterState state) => const SelfHarmRoute();

  String get location => GoRouteData.$location(
        '/home/self-harm',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $SelfHarmTimerRouteExtension on SelfHarmTimerRoute {
  static SelfHarmTimerRoute _fromState(GoRouterState state) =>
      const SelfHarmTimerRoute();

  String get location => GoRouteData.$location(
        '/home/self-harm/timer',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $MyRecordsRouteExtension on MyRecordsRoute {
  static MyRecordsRoute _fromState(GoRouterState state) =>
      const MyRecordsRoute();

  String get location => GoRouteData.$location(
        '/home/my-records',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $MoodTrackRouteExtension on MoodTrackRoute {
  static MoodTrackRoute _fromState(GoRouterState state) =>
      const MoodTrackRoute();

  String get location => GoRouteData.$location(
        '/home/my-records/mood-track',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $DepressionRouteExtension on DepressionRoute {
  static DepressionRoute _fromState(GoRouterState state) =>
      const DepressionRoute();

  String get location => GoRouteData.$location(
        '/home/depression',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $SuicidalThoughtsRouteExtension on SuicidalThoughtsRoute {
  static SuicidalThoughtsRoute _fromState(GoRouterState state) =>
      const SuicidalThoughtsRoute();

  String get location => GoRouteData.$location(
        '/home/suicidal-thoughts',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $EatingDisorderRouteExtension on EatingDisorderRoute {
  static EatingDisorderRoute _fromState(GoRouterState state) =>
      const EatingDisorderRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $EatingDisorderTipsRouteExtension on EatingDisorderTipsRoute {
  static EatingDisorderTipsRoute _fromState(GoRouterState state) =>
      const EatingDisorderTipsRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/tips',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $EatingDisorderTasksRouteExtension on EatingDisorderTasksRoute {
  static EatingDisorderTasksRoute _fromState(GoRouterState state) =>
      const EatingDisorderTasksRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/tasks',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $EatingDisorderSamplesRouteExtension on EatingDisorderSamplesRoute {
  static EatingDisorderSamplesRoute _fromState(GoRouterState state) =>
      const EatingDisorderSamplesRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/samples',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $EatingDisorderDistractionsRouteExtension
    on EatingDisorderDistractionsRoute {
  static EatingDisorderDistractionsRoute _fromState(GoRouterState state) =>
      const EatingDisorderDistractionsRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/distraction',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

const _$BreathingGameShapeEnumMap = {
  BreathingGameShape.circle: 'circle',
  BreathingGameShape.square: 'square',
  BreathingGameShape.triangle: 'triangle',
};

extension<T extends Enum> on Map<T, String> {
  T _$fromName(String value) =>
      entries.singleWhere((element) => element.value == value).key;
}
