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
          path: 'contacts',
          factory: $ContactsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'contacts/phones',
          factory: $PhoneContactsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'contacts/universities',
          factory: $UniversityContactsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/depression',
          factory: $DepressionRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/depression/tips',
          factory: $DepressionTipsAppRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/depression/activity-plan',
          factory: $DepressionActivityPlanRouteExtension._fromState,
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
          path: 'home/self-harm/tips',
          factory: $SelfHarmTipsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/self-harm/helped',
          factory: $SelfHarmHelpedRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/self-harm/plan',
          factory: $SelfHarmPlanRouteExtension._fromState,
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
          path: 'home/my-records/diary',
          factory: $MyRecordsDiariesListRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/my-records/diary/detail',
          factory: $MyRecordsDiaryDetailRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/my-records/diary/edit',
          factory: $MyRecordsDiaryEditRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/suicidal-thoughts',
          factory: $SuicidalThoughtsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/suicidal-thoughts/plan',
          factory: $SuicidalThoughtsPlanRouteExtension._fromState,
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
        GoRouteData.$route(
          path: 'home/eating-disorder/tips/figure',
          factory: $EatingDisorderTipsFigureAppRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/eating-disorder/tips/remorse',
          factory: $EatingDisorderTipsRemorseAppRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/eating-disorder/tips/overeat',
          factory: $EatingDisorderTipsOvereatAppRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/eating-disorder/tips/vomit',
          factory: $EatingDisorderTipsVomitAppRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/eating-disorder/tips/fail',
          factory: $EatingDisorderTipsFailAppRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/eating-disorder/tips/general',
          factory: $EatingDisorderTipsGeneralAppRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/eating-disorder/meal-plan',
          factory: $MealPlanRouteExtension._fromState,
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

extension $ContactsRouteExtension on ContactsRoute {
  static ContactsRoute _fromState(GoRouterState state) => const ContactsRoute();

  String get location => GoRouteData.$location(
        '/contacts',
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

extension $UniversityContactsRouteExtension on UniversityContactsRoute {
  static UniversityContactsRoute _fromState(GoRouterState state) =>
      const UniversityContactsRoute();

  String get location => GoRouteData.$location(
        '/contacts/universities',
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

extension $DepressionTipsAppRouteExtension on DepressionTipsAppRoute {
  static DepressionTipsAppRoute _fromState(GoRouterState state) =>
      const DepressionTipsAppRoute();

  String get location => GoRouteData.$location(
        '/home/depression/tips',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $DepressionActivityPlanRouteExtension on DepressionActivityPlanRoute {
  static DepressionActivityPlanRoute _fromState(GoRouterState state) =>
      const DepressionActivityPlanRoute();

  String get location => GoRouteData.$location(
        '/home/depression/activity-plan',
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

extension $SelfHarmTipsRouteExtension on SelfHarmTipsRoute {
  static SelfHarmTipsRoute _fromState(GoRouterState state) =>
      const SelfHarmTipsRoute();

  String get location => GoRouteData.$location(
        '/home/self-harm/tips',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $SelfHarmHelpedRouteExtension on SelfHarmHelpedRoute {
  static SelfHarmHelpedRoute _fromState(GoRouterState state) =>
      const SelfHarmHelpedRoute();

  String get location => GoRouteData.$location(
        '/home/self-harm/helped',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $SelfHarmPlanRouteExtension on SelfHarmPlanRoute {
  static SelfHarmPlanRoute _fromState(GoRouterState state) =>
      const SelfHarmPlanRoute();

  String get location => GoRouteData.$location(
        '/home/self-harm/plan',
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

extension $MyRecordsDiariesListRouteExtension on MyRecordsDiariesListRoute {
  static MyRecordsDiariesListRoute _fromState(GoRouterState state) =>
      const MyRecordsDiariesListRoute();

  String get location => GoRouteData.$location(
        '/home/my-records/diary',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $MyRecordsDiaryDetailRouteExtension on MyRecordsDiaryDetailRoute {
  static MyRecordsDiaryDetailRoute _fromState(GoRouterState state) =>
      const MyRecordsDiaryDetailRoute();

  String get location => GoRouteData.$location(
        '/home/my-records/diary/detail',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $MyRecordsDiaryEditRouteExtension on MyRecordsDiaryEditRoute {
  static MyRecordsDiaryEditRoute _fromState(GoRouterState state) =>
      const MyRecordsDiaryEditRoute();

  String get location => GoRouteData.$location(
        '/home/my-records/diary/edit',
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

extension $SuicidalThoughtsPlanRouteExtension on SuicidalThoughtsPlanRoute {
  static SuicidalThoughtsPlanRoute _fromState(GoRouterState state) =>
      const SuicidalThoughtsPlanRoute();

  String get location => GoRouteData.$location(
        '/home/suicidal-thoughts/plan',
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

extension $EatingDisorderTipsFigureAppRouteExtension
    on EatingDisorderTipsFigureAppRoute {
  static EatingDisorderTipsFigureAppRoute _fromState(GoRouterState state) =>
      const EatingDisorderTipsFigureAppRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/tips/figure',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $EatingDisorderTipsRemorseAppRouteExtension
    on EatingDisorderTipsRemorseAppRoute {
  static EatingDisorderTipsRemorseAppRoute _fromState(GoRouterState state) =>
      const EatingDisorderTipsRemorseAppRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/tips/remorse',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $EatingDisorderTipsOvereatAppRouteExtension
    on EatingDisorderTipsOvereatAppRoute {
  static EatingDisorderTipsOvereatAppRoute _fromState(GoRouterState state) =>
      const EatingDisorderTipsOvereatAppRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/tips/overeat',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $EatingDisorderTipsVomitAppRouteExtension
    on EatingDisorderTipsVomitAppRoute {
  static EatingDisorderTipsVomitAppRoute _fromState(GoRouterState state) =>
      const EatingDisorderTipsVomitAppRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/tips/vomit',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $EatingDisorderTipsFailAppRouteExtension
    on EatingDisorderTipsFailAppRoute {
  static EatingDisorderTipsFailAppRoute _fromState(GoRouterState state) =>
      const EatingDisorderTipsFailAppRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/tips/fail',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $EatingDisorderTipsGeneralAppRouteExtension
    on EatingDisorderTipsGeneralAppRoute {
  static EatingDisorderTipsGeneralAppRoute _fromState(GoRouterState state) =>
      const EatingDisorderTipsGeneralAppRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/tips/general',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $MealPlanRouteExtension on MealPlanRoute {
  static MealPlanRoute _fromState(GoRouterState state) => const MealPlanRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/meal-plan',
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
