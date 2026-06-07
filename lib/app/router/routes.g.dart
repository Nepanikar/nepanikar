// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$mainRoute];

RouteBase get $mainRoute => GoRouteData.$route(
  path: '/',
  factory: $MainRoute._fromState,
  routes: [
    GoRouteData.$route(
      path: 'settings/notification-settings',
      factory: $NotificationSettingsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'settings/sponsors',
      factory: $SponsorsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'settings/about-app',
      factory: $AboutAppRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'settings/export',
      factory: $ExportRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'settings/language',
      factory: $LanguagesRoute._fromState,
    ),
    GoRouteData.$route(path: 'settings/theme', factory: $ThemeRoute._fromState),
    GoRouteData.$route(path: 'games/math', factory: $MathGameRoute._fromState),
    GoRouteData.$route(
      path: 'games/breathing-list',
      factory: $BreathingExercisesRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'games/breathing/:shape',
      factory: $BreathingGameRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'games/balance',
      factory: $BalanceGameRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'games/balloons',
      factory: $BalloonsGameRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'games/relaxation/:relaxationType',
      factory: $RelaxationRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'games/relaxation-list',
      factory: $RelaxationsListRoute._fromState,
    ),
    GoRouteData.$route(path: 'contacts', factory: $ContactsRoute._fromState),
    GoRouteData.$route(
      path: 'contacts/crisis-message',
      factory: $CrisisMessageRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'contacts/phones',
      factory: $PhoneContactsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'contacts/crisis-center',
      factory: $CrisisCenterContactsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'contacts/chat',
      factory: $ChatContactsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'contacts/universities',
      factory: $UniversityContactsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'contacts/my-contacts-records',
      factory: $MyContactsRecordsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'contacts/email-counselling',
      factory: $EmailCounsellingRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/depression',
      factory: $DepressionRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/depression/tips',
      factory: $DepressionTipsAppRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/depression/activity-plan',
      factory: $DepressionActivityPlanRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/depression/nice-made-happy',
      factory: $DepressionNiceMadeHappyRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/depression/praise-my-achievements',
      factory: $DepressionPraiseMyAchievementsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/anxiety',
      factory: $AnxietyAppRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/anxiety/tips',
      factory: $AnxietyTipsAppRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/self-harm',
      factory: $SelfHarmRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/self-harm/tips',
      factory: $SelfHarmTipsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/self-harm/helped',
      factory: $SelfHarmHelpedRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/self-harm/plan',
      factory: $SelfHarmPlanRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/self-harm/timer',
      factory: $SelfHarmTimerRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records',
      factory: $MyRecordsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/mood-track',
      factory: $MoodTrackRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/mood-picker',
      factory: $MoodPickerRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/mood-records',
      factory: $MoodRecordsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/search-mood-entry',
      factory: $SearchMoodEntryRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/mood-records/mood-entry',
      factory: $MoodEntryDetailRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/sleep-track',
      factory: $MyRecordsSleepTrackRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/diary',
      factory: $MyRecordsDiaryRecordsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/diary/add',
      factory: $MyRecordsDiaryAddRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/diary/detail',
      factory: $MyRecordsDiaryDetailRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/diary/edit',
      factory: $MyRecordsDiaryEditRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/journal',
      factory: $MyRecordsJournalRecordsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/journal-detail',
      factory: $MyRecordsJournalDetailRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/food-records',
      factory: $MyRecordsFoodRecordsListRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/food-records/detail',
      factory: $MyRecordsFoodRecordsDetailMenuListRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/food-records/detail/menu-detail',
      factory: $MyRecordsFoodRecordsDetailMenuDetailRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/suicidal-thoughts',
      factory: $SuicidalThoughtsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/suicidal-thoughts/plan',
      factory: $SuicidalThoughtsPlanRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/suicidal-thoughts/reasons-no',
      factory: $SuicidalThoughtsReasonsNoRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder',
      factory: $EatingDisorderRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/tips',
      factory: $EatingDisorderTipsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/tips/figure',
      factory: $EatingDisorderTipsFigureAppRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/tips/remorse',
      factory: $EatingDisorderTipsRemorseAppRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/tips/overeat',
      factory: $EatingDisorderTipsOvereatAppRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/tips/vomit',
      factory: $EatingDisorderTipsVomitAppRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/tips/fail',
      factory: $EatingDisorderTipsFailAppRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/tips/general',
      factory: $EatingDisorderTipsGeneralAppRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/tasks',
      factory: $EatingDisorderTasksRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/tasks/food-creative',
      factory: $EatingDisorderFoodCreativeRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/tasks/food-motivation',
      factory: $EatingDisorderFoodMotivationRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/tasks/food-challenges',
      factory: $EatingDisorderFoodChallengesRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/tasks/like-on-myself',
      factory: $EatingDisorderLikeOnMyselfRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/tasks/food-i-like',
      factory: $EatingDisorderFoodILikeRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/tasks/food-afraid-of',
      factory: $EatingDisorderFoodAfraidOfRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/samples',
      factory: $EatingDisorderSamplesRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/distraction',
      factory: $EatingDisorderDistractionsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/meal-plan',
      factory: $MealPlanRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/contacts',
      factory: $EatingDisorderContactsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/tests',
      factory: $TestListScreenRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/tests/:testId',
      factory: $TestScreenRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/tests/test-detail/:testId',
      factory: $TestDetailScreenRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/test-result/:testId/:completedAt',
      factory: $TestResultScreenRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'bpd-programme/landing',
      factory: $BpdLandingScreenRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'bpd-programme',
      factory: $BpdProgrammeScreenRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'bpd-programme/weeks',
      factory: $BpdWeeksScreenRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'bpd-programme/week/:weekNumber',
      factory: $BpdWeekDetailScreenRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'bpd-programme/day-onboarding',
      factory: $Day1OnboardingScreenRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'bpd-programme/week/1/day/2',
      factory: $Day2EducationScreenRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'bpd-programme/week/1/day/4',
      factory: $Day4PleaseScreenRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'bpd-programme/week/2/day/1',
      factory: $Week2Day1MindfulnessIntroScreenRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'bpd-programme/week/2/day/2',
      factory: $Week2Day2WhatSkillsScreenRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'bpd-programme/week/2/day/3',
      factory: $Week2Day3HowSkillsScreenRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'bpd-programme/week/2/day/4',
      factory: $Week2Day4BreathingScreenRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'bpd-programme/week/:weekNumber/day/:dayNumber/pause',
      factory: $DayPauseScreenRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'bpd-programme/week/:weekNumber/review',
      factory: $WeekReviewScreenRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'bpd-programme/smart',
      factory: $SmartEducationScreenRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'bpd-programme/smart/new-goal',
      factory: $SmartGoalFormScreenRoute._fromState,
    ),
  ],
);

mixin $MainRoute on GoRouteData {
  static MainRoute _fromState(GoRouterState state) => const MainRoute();

  @override
  String get location => GoRouteData.$location('/');

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

mixin $NotificationSettingsRoute on GoRouteData {
  static NotificationSettingsRoute _fromState(GoRouterState state) =>
      const NotificationSettingsRoute();

  @override
  String get location =>
      GoRouteData.$location('/settings/notification-settings');

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

mixin $SponsorsRoute on GoRouteData {
  static SponsorsRoute _fromState(GoRouterState state) => const SponsorsRoute();

  @override
  String get location => GoRouteData.$location('/settings/sponsors');

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

mixin $AboutAppRoute on GoRouteData {
  static AboutAppRoute _fromState(GoRouterState state) => const AboutAppRoute();

  @override
  String get location => GoRouteData.$location('/settings/about-app');

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

mixin $ExportRoute on GoRouteData {
  static ExportRoute _fromState(GoRouterState state) => const ExportRoute();

  @override
  String get location => GoRouteData.$location('/settings/export');

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

mixin $LanguagesRoute on GoRouteData {
  static LanguagesRoute _fromState(GoRouterState state) =>
      const LanguagesRoute();

  @override
  String get location => GoRouteData.$location('/settings/language');

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

mixin $ThemeRoute on GoRouteData {
  static ThemeRoute _fromState(GoRouterState state) => const ThemeRoute();

  @override
  String get location => GoRouteData.$location('/settings/theme');

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

mixin $MathGameRoute on GoRouteData {
  static MathGameRoute _fromState(GoRouterState state) => const MathGameRoute();

  @override
  String get location => GoRouteData.$location('/games/math');

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

mixin $BreathingExercisesRoute on GoRouteData {
  static BreathingExercisesRoute _fromState(GoRouterState state) =>
      const BreathingExercisesRoute();

  @override
  String get location => GoRouteData.$location('/games/breathing-list');

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

mixin $BreathingGameRoute on GoRouteData {
  static BreathingGameRoute _fromState(GoRouterState state) =>
      BreathingGameRoute(
        shape: _$BreathingGameShapeEnumMap._$fromName(
          state.pathParameters['shape']!,
        )!,
      );

  BreathingGameRoute get _self => this as BreathingGameRoute;

  @override
  String get location => GoRouteData.$location(
    '/games/breathing/${Uri.encodeComponent(_$BreathingGameShapeEnumMap[_self.shape]!)}',
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

const _$BreathingGameShapeEnumMap = {
  BreathingGameShape.circle: 'circle',
  BreathingGameShape.square: 'square',
  BreathingGameShape.triangle: 'triangle',
};

mixin $BalanceGameRoute on GoRouteData {
  static BalanceGameRoute _fromState(GoRouterState state) =>
      const BalanceGameRoute();

  @override
  String get location => GoRouteData.$location('/games/balance');

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

mixin $BalloonsGameRoute on GoRouteData {
  static BalloonsGameRoute _fromState(GoRouterState state) =>
      const BalloonsGameRoute();

  @override
  String get location => GoRouteData.$location('/games/balloons');

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

mixin $RelaxationRoute on GoRouteData {
  static RelaxationRoute _fromState(GoRouterState state) => RelaxationRoute(
    relaxationType: _$RelaxationTypeEnumMap._$fromName(
      state.pathParameters['relaxationType']!,
    )!,
  );

  RelaxationRoute get _self => this as RelaxationRoute;

  @override
  String get location => GoRouteData.$location(
    '/games/relaxation/${Uri.encodeComponent(_$RelaxationTypeEnumMap[_self.relaxationType]!)}',
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

const _$RelaxationTypeEnumMap = {
  RelaxationType.general: 'general',
  RelaxationType.morning: 'morning',
  RelaxationType.evening: 'evening',
};

mixin $RelaxationsListRoute on GoRouteData {
  static RelaxationsListRoute _fromState(GoRouterState state) =>
      const RelaxationsListRoute();

  @override
  String get location => GoRouteData.$location('/games/relaxation-list');

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

mixin $ContactsRoute on GoRouteData {
  static ContactsRoute _fromState(GoRouterState state) => const ContactsRoute();

  @override
  String get location => GoRouteData.$location('/contacts');

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

mixin $CrisisMessageRoute on GoRouteData {
  static CrisisMessageRoute _fromState(GoRouterState state) =>
      const CrisisMessageRoute();

  @override
  String get location => GoRouteData.$location('/contacts/crisis-message');

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

mixin $PhoneContactsRoute on GoRouteData {
  static PhoneContactsRoute _fromState(GoRouterState state) =>
      const PhoneContactsRoute();

  @override
  String get location => GoRouteData.$location('/contacts/phones');

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

mixin $CrisisCenterContactsRoute on GoRouteData {
  static CrisisCenterContactsRoute _fromState(GoRouterState state) =>
      const CrisisCenterContactsRoute();

  @override
  String get location => GoRouteData.$location('/contacts/crisis-center');

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

mixin $ChatContactsRoute on GoRouteData {
  static ChatContactsRoute _fromState(GoRouterState state) =>
      const ChatContactsRoute();

  @override
  String get location => GoRouteData.$location('/contacts/chat');

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

mixin $UniversityContactsRoute on GoRouteData {
  static UniversityContactsRoute _fromState(GoRouterState state) =>
      const UniversityContactsRoute();

  @override
  String get location => GoRouteData.$location('/contacts/universities');

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

mixin $MyContactsRecordsRoute on GoRouteData {
  static MyContactsRecordsRoute _fromState(GoRouterState state) =>
      const MyContactsRecordsRoute();

  @override
  String get location => GoRouteData.$location('/contacts/my-contacts-records');

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

mixin $EmailCounsellingRoute on GoRouteData {
  static EmailCounsellingRoute _fromState(GoRouterState state) =>
      const EmailCounsellingRoute();

  @override
  String get location => GoRouteData.$location('/contacts/email-counselling');

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

mixin $DepressionRoute on GoRouteData {
  static DepressionRoute _fromState(GoRouterState state) =>
      const DepressionRoute();

  @override
  String get location => GoRouteData.$location('/home/depression');

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

mixin $DepressionTipsAppRoute on GoRouteData {
  static DepressionTipsAppRoute _fromState(GoRouterState state) =>
      const DepressionTipsAppRoute();

  @override
  String get location => GoRouteData.$location('/home/depression/tips');

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

mixin $DepressionActivityPlanRoute on GoRouteData {
  static DepressionActivityPlanRoute _fromState(GoRouterState state) =>
      const DepressionActivityPlanRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/depression/activity-plan');

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

mixin $DepressionNiceMadeHappyRoute on GoRouteData {
  static DepressionNiceMadeHappyRoute _fromState(GoRouterState state) =>
      const DepressionNiceMadeHappyRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/depression/nice-made-happy');

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

mixin $DepressionPraiseMyAchievementsRoute on GoRouteData {
  static DepressionPraiseMyAchievementsRoute _fromState(GoRouterState state) =>
      const DepressionPraiseMyAchievementsRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/depression/praise-my-achievements');

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

mixin $AnxietyAppRoute on GoRouteData {
  static AnxietyAppRoute _fromState(GoRouterState state) =>
      const AnxietyAppRoute();

  @override
  String get location => GoRouteData.$location('/home/anxiety');

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

mixin $AnxietyTipsAppRoute on GoRouteData {
  static AnxietyTipsAppRoute _fromState(GoRouterState state) =>
      const AnxietyTipsAppRoute();

  @override
  String get location => GoRouteData.$location('/home/anxiety/tips');

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

mixin $SelfHarmRoute on GoRouteData {
  static SelfHarmRoute _fromState(GoRouterState state) => const SelfHarmRoute();

  @override
  String get location => GoRouteData.$location('/home/self-harm');

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

mixin $SelfHarmTipsRoute on GoRouteData {
  static SelfHarmTipsRoute _fromState(GoRouterState state) =>
      const SelfHarmTipsRoute();

  @override
  String get location => GoRouteData.$location('/home/self-harm/tips');

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

mixin $SelfHarmHelpedRoute on GoRouteData {
  static SelfHarmHelpedRoute _fromState(GoRouterState state) =>
      const SelfHarmHelpedRoute();

  @override
  String get location => GoRouteData.$location('/home/self-harm/helped');

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

mixin $SelfHarmPlanRoute on GoRouteData {
  static SelfHarmPlanRoute _fromState(GoRouterState state) =>
      const SelfHarmPlanRoute();

  @override
  String get location => GoRouteData.$location('/home/self-harm/plan');

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

mixin $SelfHarmTimerRoute on GoRouteData {
  static SelfHarmTimerRoute _fromState(GoRouterState state) =>
      const SelfHarmTimerRoute();

  @override
  String get location => GoRouteData.$location('/home/self-harm/timer');

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

mixin $MyRecordsRoute on GoRouteData {
  static MyRecordsRoute _fromState(GoRouterState state) =>
      const MyRecordsRoute();

  @override
  String get location => GoRouteData.$location('/home/my-records');

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

mixin $MoodTrackRoute on GoRouteData {
  static MoodTrackRoute _fromState(GoRouterState state) =>
      const MoodTrackRoute();

  @override
  String get location => GoRouteData.$location('/home/my-records/mood-track');

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

mixin $MoodPickerRoute on GoRouteData {
  static MoodPickerRoute _fromState(GoRouterState state) =>
      const MoodPickerRoute();

  @override
  String get location => GoRouteData.$location('/home/my-records/mood-picker');

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

mixin $SearchMoodEntryRoute on GoRouteData {
  static SearchMoodEntryRoute _fromState(GoRouterState state) =>
      const SearchMoodEntryRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/my-records/search-mood-entry');

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

mixin $MoodEntryDetailRoute on GoRouteData {
  static MoodEntryDetailRoute _fromState(GoRouterState state) =>
      const MoodEntryDetailRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/my-records/mood-records/mood-entry');

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

mixin $MyRecordsSleepTrackRoute on GoRouteData {
  static MyRecordsSleepTrackRoute _fromState(GoRouterState state) =>
      const MyRecordsSleepTrackRoute();

  @override
  String get location => GoRouteData.$location('/home/my-records/sleep-track');

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

mixin $MyRecordsDiaryRecordsRoute on GoRouteData {
  static MyRecordsDiaryRecordsRoute _fromState(GoRouterState state) =>
      const MyRecordsDiaryRecordsRoute();

  @override
  String get location => GoRouteData.$location('/home/my-records/diary');

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

mixin $MyRecordsDiaryAddRoute on GoRouteData {
  static MyRecordsDiaryAddRoute _fromState(GoRouterState state) =>
      const MyRecordsDiaryAddRoute();

  @override
  String get location => GoRouteData.$location('/home/my-records/diary/add');

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

mixin $MyRecordsDiaryDetailRoute on GoRouteData {
  static MyRecordsDiaryDetailRoute _fromState(GoRouterState state) =>
      const MyRecordsDiaryDetailRoute();

  @override
  String get location => GoRouteData.$location('/home/my-records/diary/detail');

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

mixin $MyRecordsDiaryEditRoute on GoRouteData {
  static MyRecordsDiaryEditRoute _fromState(GoRouterState state) =>
      const MyRecordsDiaryEditRoute();

  @override
  String get location => GoRouteData.$location('/home/my-records/diary/edit');

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

mixin $MyRecordsJournalRecordsRoute on GoRouteData {
  static MyRecordsJournalRecordsRoute _fromState(GoRouterState state) =>
      const MyRecordsJournalRecordsRoute();

  @override
  String get location => GoRouteData.$location('/home/my-records/journal');

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

mixin $MyRecordsJournalDetailRoute on GoRouteData {
  static MyRecordsJournalDetailRoute _fromState(GoRouterState state) =>
      const MyRecordsJournalDetailRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/my-records/journal-detail');

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

mixin $MyRecordsFoodRecordsListRoute on GoRouteData {
  static MyRecordsFoodRecordsListRoute _fromState(GoRouterState state) =>
      const MyRecordsFoodRecordsListRoute();

  @override
  String get location => GoRouteData.$location('/home/my-records/food-records');

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

mixin $MyRecordsFoodRecordsDetailMenuListRoute on GoRouteData {
  static MyRecordsFoodRecordsDetailMenuListRoute _fromState(
    GoRouterState state,
  ) => const MyRecordsFoodRecordsDetailMenuListRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/my-records/food-records/detail');

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

mixin $MyRecordsFoodRecordsDetailMenuDetailRoute on GoRouteData {
  static MyRecordsFoodRecordsDetailMenuDetailRoute _fromState(
    GoRouterState state,
  ) => const MyRecordsFoodRecordsDetailMenuDetailRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/my-records/food-records/detail/menu-detail');

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

mixin $SuicidalThoughtsRoute on GoRouteData {
  static SuicidalThoughtsRoute _fromState(GoRouterState state) =>
      const SuicidalThoughtsRoute();

  @override
  String get location => GoRouteData.$location('/home/suicidal-thoughts');

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

mixin $SuicidalThoughtsPlanRoute on GoRouteData {
  static SuicidalThoughtsPlanRoute _fromState(GoRouterState state) =>
      const SuicidalThoughtsPlanRoute();

  @override
  String get location => GoRouteData.$location('/home/suicidal-thoughts/plan');

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

mixin $SuicidalThoughtsReasonsNoRoute on GoRouteData {
  static SuicidalThoughtsReasonsNoRoute _fromState(GoRouterState state) =>
      const SuicidalThoughtsReasonsNoRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/suicidal-thoughts/reasons-no');

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

mixin $EatingDisorderRoute on GoRouteData {
  static EatingDisorderRoute _fromState(GoRouterState state) =>
      const EatingDisorderRoute();

  @override
  String get location => GoRouteData.$location('/home/eating-disorder');

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

mixin $EatingDisorderTipsRoute on GoRouteData {
  static EatingDisorderTipsRoute _fromState(GoRouterState state) =>
      const EatingDisorderTipsRoute();

  @override
  String get location => GoRouteData.$location('/home/eating-disorder/tips');

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

mixin $EatingDisorderTipsFigureAppRoute on GoRouteData {
  static EatingDisorderTipsFigureAppRoute _fromState(GoRouterState state) =>
      const EatingDisorderTipsFigureAppRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/eating-disorder/tips/figure');

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

mixin $EatingDisorderTipsRemorseAppRoute on GoRouteData {
  static EatingDisorderTipsRemorseAppRoute _fromState(GoRouterState state) =>
      const EatingDisorderTipsRemorseAppRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/eating-disorder/tips/remorse');

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

mixin $EatingDisorderTipsOvereatAppRoute on GoRouteData {
  static EatingDisorderTipsOvereatAppRoute _fromState(GoRouterState state) =>
      const EatingDisorderTipsOvereatAppRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/eating-disorder/tips/overeat');

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

mixin $EatingDisorderTipsVomitAppRoute on GoRouteData {
  static EatingDisorderTipsVomitAppRoute _fromState(GoRouterState state) =>
      const EatingDisorderTipsVomitAppRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/eating-disorder/tips/vomit');

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

mixin $EatingDisorderTipsFailAppRoute on GoRouteData {
  static EatingDisorderTipsFailAppRoute _fromState(GoRouterState state) =>
      const EatingDisorderTipsFailAppRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/eating-disorder/tips/fail');

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

mixin $EatingDisorderTipsGeneralAppRoute on GoRouteData {
  static EatingDisorderTipsGeneralAppRoute _fromState(GoRouterState state) =>
      const EatingDisorderTipsGeneralAppRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/eating-disorder/tips/general');

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

mixin $EatingDisorderTasksRoute on GoRouteData {
  static EatingDisorderTasksRoute _fromState(GoRouterState state) =>
      const EatingDisorderTasksRoute();

  @override
  String get location => GoRouteData.$location('/home/eating-disorder/tasks');

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

mixin $EatingDisorderFoodCreativeRoute on GoRouteData {
  static EatingDisorderFoodCreativeRoute _fromState(GoRouterState state) =>
      const EatingDisorderFoodCreativeRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/eating-disorder/tasks/food-creative');

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

mixin $EatingDisorderFoodMotivationRoute on GoRouteData {
  static EatingDisorderFoodMotivationRoute _fromState(GoRouterState state) =>
      const EatingDisorderFoodMotivationRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/eating-disorder/tasks/food-motivation');

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

mixin $EatingDisorderFoodChallengesRoute on GoRouteData {
  static EatingDisorderFoodChallengesRoute _fromState(GoRouterState state) =>
      const EatingDisorderFoodChallengesRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/eating-disorder/tasks/food-challenges');

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

mixin $EatingDisorderLikeOnMyselfRoute on GoRouteData {
  static EatingDisorderLikeOnMyselfRoute _fromState(GoRouterState state) =>
      const EatingDisorderLikeOnMyselfRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/eating-disorder/tasks/like-on-myself');

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

mixin $EatingDisorderFoodILikeRoute on GoRouteData {
  static EatingDisorderFoodILikeRoute _fromState(GoRouterState state) =>
      const EatingDisorderFoodILikeRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/eating-disorder/tasks/food-i-like');

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

mixin $EatingDisorderFoodAfraidOfRoute on GoRouteData {
  static EatingDisorderFoodAfraidOfRoute _fromState(GoRouterState state) =>
      const EatingDisorderFoodAfraidOfRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/eating-disorder/tasks/food-afraid-of');

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

mixin $EatingDisorderSamplesRoute on GoRouteData {
  static EatingDisorderSamplesRoute _fromState(GoRouterState state) =>
      const EatingDisorderSamplesRoute();

  @override
  String get location => GoRouteData.$location('/home/eating-disorder/samples');

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

mixin $EatingDisorderDistractionsRoute on GoRouteData {
  static EatingDisorderDistractionsRoute _fromState(GoRouterState state) =>
      const EatingDisorderDistractionsRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/eating-disorder/distraction');

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

mixin $MealPlanRoute on GoRouteData {
  static MealPlanRoute _fromState(GoRouterState state) => const MealPlanRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/eating-disorder/meal-plan');

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

mixin $EatingDisorderContactsRoute on GoRouteData {
  static EatingDisorderContactsRoute _fromState(GoRouterState state) =>
      const EatingDisorderContactsRoute();

  @override
  String get location =>
      GoRouteData.$location('/home/eating-disorder/contacts');

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

mixin $TestListScreenRoute on GoRouteData {
  static TestListScreenRoute _fromState(GoRouterState state) =>
      const TestListScreenRoute();

  @override
  String get location => GoRouteData.$location('/home/my-records/tests');

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

mixin $TestScreenRoute on GoRouteData {
  static TestScreenRoute _fromState(GoRouterState state) =>
      TestScreenRoute(testId: state.pathParameters['testId']!);

  TestScreenRoute get _self => this as TestScreenRoute;

  @override
  String get location => GoRouteData.$location(
    '/home/my-records/tests/${Uri.encodeComponent(_self.testId)}',
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

mixin $TestDetailScreenRoute on GoRouteData {
  static TestDetailScreenRoute _fromState(GoRouterState state) =>
      TestDetailScreenRoute(testId: state.pathParameters['testId']!);

  TestDetailScreenRoute get _self => this as TestDetailScreenRoute;

  @override
  String get location => GoRouteData.$location(
    '/home/my-records/tests/test-detail/${Uri.encodeComponent(_self.testId)}',
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

mixin $TestResultScreenRoute on GoRouteData {
  static TestResultScreenRoute _fromState(GoRouterState state) =>
      TestResultScreenRoute(
        testId: state.pathParameters['testId']!,
        completedAt: int.parse(state.pathParameters['completedAt']!),
      );

  TestResultScreenRoute get _self => this as TestResultScreenRoute;

  @override
  String get location => GoRouteData.$location(
    '/home/my-records/test-result/${Uri.encodeComponent(_self.testId)}/${Uri.encodeComponent(_self.completedAt.toString())}',
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

mixin $BpdLandingScreenRoute on GoRouteData {
  static BpdLandingScreenRoute _fromState(GoRouterState state) =>
      const BpdLandingScreenRoute();

  @override
  String get location => GoRouteData.$location('/bpd-programme/landing');

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

mixin $BpdProgrammeScreenRoute on GoRouteData {
  static BpdProgrammeScreenRoute _fromState(GoRouterState state) =>
      const BpdProgrammeScreenRoute();

  @override
  String get location => GoRouteData.$location('/bpd-programme');

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

mixin $BpdWeeksScreenRoute on GoRouteData {
  static BpdWeeksScreenRoute _fromState(GoRouterState state) =>
      const BpdWeeksScreenRoute();

  @override
  String get location => GoRouteData.$location('/bpd-programme/weeks');

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

mixin $BpdWeekDetailScreenRoute on GoRouteData {
  static BpdWeekDetailScreenRoute _fromState(GoRouterState state) =>
      BpdWeekDetailScreenRoute(
        weekNumber: int.parse(state.pathParameters['weekNumber']!),
      );

  BpdWeekDetailScreenRoute get _self => this as BpdWeekDetailScreenRoute;

  @override
  String get location => GoRouteData.$location(
    '/bpd-programme/week/${Uri.encodeComponent(_self.weekNumber.toString())}',
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

mixin $Day1OnboardingScreenRoute on GoRouteData {
  static Day1OnboardingScreenRoute _fromState(GoRouterState state) =>
      const Day1OnboardingScreenRoute();

  @override
  String get location => GoRouteData.$location('/bpd-programme/day-onboarding');

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

mixin $Day2EducationScreenRoute on GoRouteData {
  static Day2EducationScreenRoute _fromState(GoRouterState state) =>
      const Day2EducationScreenRoute();

  @override
  String get location => GoRouteData.$location('/bpd-programme/week/1/day/2');

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

mixin $Day4PleaseScreenRoute on GoRouteData {
  static Day4PleaseScreenRoute _fromState(GoRouterState state) =>
      const Day4PleaseScreenRoute();

  @override
  String get location => GoRouteData.$location('/bpd-programme/week/1/day/4');

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

mixin $Week2Day1MindfulnessIntroScreenRoute on GoRouteData {
  static Week2Day1MindfulnessIntroScreenRoute _fromState(GoRouterState state) =>
      const Week2Day1MindfulnessIntroScreenRoute();

  @override
  String get location => GoRouteData.$location('/bpd-programme/week/2/day/1');

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

mixin $Week2Day2WhatSkillsScreenRoute on GoRouteData {
  static Week2Day2WhatSkillsScreenRoute _fromState(GoRouterState state) =>
      const Week2Day2WhatSkillsScreenRoute();

  @override
  String get location => GoRouteData.$location('/bpd-programme/week/2/day/2');

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

mixin $Week2Day3HowSkillsScreenRoute on GoRouteData {
  static Week2Day3HowSkillsScreenRoute _fromState(GoRouterState state) =>
      const Week2Day3HowSkillsScreenRoute();

  @override
  String get location => GoRouteData.$location('/bpd-programme/week/2/day/3');

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

mixin $Week2Day4BreathingScreenRoute on GoRouteData {
  static Week2Day4BreathingScreenRoute _fromState(GoRouterState state) =>
      const Week2Day4BreathingScreenRoute();

  @override
  String get location => GoRouteData.$location('/bpd-programme/week/2/day/4');

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

mixin $DayPauseScreenRoute on GoRouteData {
  static DayPauseScreenRoute _fromState(GoRouterState state) =>
      DayPauseScreenRoute(
        weekNumber: int.parse(state.pathParameters['weekNumber']!),
        dayNumber: int.parse(state.pathParameters['dayNumber']!),
      );

  DayPauseScreenRoute get _self => this as DayPauseScreenRoute;

  @override
  String get location => GoRouteData.$location(
    '/bpd-programme/week/${Uri.encodeComponent(_self.weekNumber.toString())}/day/${Uri.encodeComponent(_self.dayNumber.toString())}/pause',
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

mixin $WeekReviewScreenRoute on GoRouteData {
  static WeekReviewScreenRoute _fromState(GoRouterState state) =>
      WeekReviewScreenRoute(
        weekNumber: int.parse(state.pathParameters['weekNumber']!),
      );

  WeekReviewScreenRoute get _self => this as WeekReviewScreenRoute;

  @override
  String get location => GoRouteData.$location(
    '/bpd-programme/week/${Uri.encodeComponent(_self.weekNumber.toString())}/review',
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

mixin $SmartEducationScreenRoute on GoRouteData {
  static SmartEducationScreenRoute _fromState(GoRouterState state) =>
      const SmartEducationScreenRoute();

  @override
  String get location => GoRouteData.$location('/bpd-programme/smart');

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

mixin $SmartGoalFormScreenRoute on GoRouteData {
  static SmartGoalFormScreenRoute _fromState(GoRouterState state) =>
      const SmartGoalFormScreenRoute();

  @override
  String get location => GoRouteData.$location('/bpd-programme/smart/new-goal');

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

extension<T extends Enum> on Map<T, String> {
  T? _$fromName(String? value) =>
      entries.where((element) => element.value == value).firstOrNull?.key;
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
