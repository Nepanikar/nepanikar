// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$mainRoute];

RouteBase get $mainRoute => GoRouteData.$route(
  path: '/',
  factory: _$MainRoute._fromState,
  routes: [
    GoRouteData.$route(
      path: 'settings/notification-settings',
      factory: _$NotificationSettingsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'settings/sponsors',
      factory: _$SponsorsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'settings/about-app',
      factory: _$AboutAppRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'settings/export',
      factory: _$ExportRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'settings/language',
      factory: _$LanguagesRoute._fromState,
    ),
    GoRouteData.$route(path: 'games/math', factory: _$MathGameRoute._fromState),
    GoRouteData.$route(
      path: 'games/breathing-list',
      factory: _$BreathingExercisesRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'games/breathing/:shape',
      factory: _$BreathingGameRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'games/balance',
      factory: _$BalanceGameRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'games/balloons',
      factory: _$BalloonsGameRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'games/relaxation/:relaxationType',
      factory: _$RelaxationRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'games/relaxation-list',
      factory: _$RelaxationsListRoute._fromState,
    ),
    GoRouteData.$route(path: 'contacts', factory: _$ContactsRoute._fromState),
    GoRouteData.$route(
      path: 'contacts/crisis-message',
      factory: _$CrisisMessageRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'contacts/phones',
      factory: _$PhoneContactsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'contacts/crisis-center',
      factory: _$CrisisCenterContactsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'contacts/chat',
      factory: _$ChatContactsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'contacts/universities',
      factory: _$UniversityContactsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'contacts/my-contacts-records',
      factory: _$MyContactsRecordsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'contacts/email-counselling',
      factory: _$EmailCounsellingRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/depression',
      factory: _$DepressionRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/depression/tips',
      factory: _$DepressionTipsAppRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/depression/activity-plan',
      factory: _$DepressionActivityPlanRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/depression/nice-made-happy',
      factory: _$DepressionNiceMadeHappyRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/depression/praise-my-achievements',
      factory: _$DepressionPraiseMyAchievementsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/anxiety',
      factory: _$AnxietyAppRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/anxiety/tips',
      factory: _$AnxietyTipsAppRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/self-harm',
      factory: _$SelfHarmRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/self-harm/tips',
      factory: _$SelfHarmTipsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/self-harm/helped',
      factory: _$SelfHarmHelpedRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/self-harm/plan',
      factory: _$SelfHarmPlanRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/self-harm/timer',
      factory: _$SelfHarmTimerRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records',
      factory: _$MyRecordsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/mood-track',
      factory: _$MoodTrackRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/mood-picker',
      factory: _$MoodPickerRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/mood-records',
      factory: _$MoodRecordsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/search-mood-entry',
      factory: _$SearchMoodEntryRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/mood-records/mood-entry',
      factory: _$MoodEntryDetailRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/sleep-track',
      factory: _$MyRecordsSleepTrackRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/diary',
      factory: _$MyRecordsDiaryRecordsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/diary/add',
      factory: _$MyRecordsDiaryAddRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/diary/detail',
      factory: _$MyRecordsDiaryDetailRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/diary/edit',
      factory: _$MyRecordsDiaryEditRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/journal',
      factory: _$MyRecordsJournalRecordsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/journal-detail',
      factory: _$MyRecordsJournalDetailRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/food-records',
      factory: _$MyRecordsFoodRecordsListRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/food-records/detail',
      factory: _$MyRecordsFoodRecordsDetailMenuListRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/my-records/food-records/detail/menu-detail',
      factory: _$MyRecordsFoodRecordsDetailMenuDetailRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/suicidal-thoughts',
      factory: _$SuicidalThoughtsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/suicidal-thoughts/plan',
      factory: _$SuicidalThoughtsPlanRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/suicidal-thoughts/reasons-no',
      factory: _$SuicidalThoughtsReasonsNoRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder',
      factory: _$EatingDisorderRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/tips',
      factory: _$EatingDisorderTipsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/tips/figure',
      factory: _$EatingDisorderTipsFigureAppRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/tips/remorse',
      factory: _$EatingDisorderTipsRemorseAppRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/tips/overeat',
      factory: _$EatingDisorderTipsOvereatAppRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/tips/vomit',
      factory: _$EatingDisorderTipsVomitAppRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/tips/fail',
      factory: _$EatingDisorderTipsFailAppRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/tips/general',
      factory: _$EatingDisorderTipsGeneralAppRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/tasks',
      factory: _$EatingDisorderTasksRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/tasks/food-creative',
      factory: _$EatingDisorderFoodCreativeRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/tasks/food-motivation',
      factory: _$EatingDisorderFoodMotivationRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/tasks/food-challenges',
      factory: _$EatingDisorderFoodChallengesRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/tasks/like-on-myself',
      factory: _$EatingDisorderLikeOnMyselfRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/tasks/food-i-like',
      factory: _$EatingDisorderFoodILikeRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/tasks/food-afraid-of',
      factory: _$EatingDisorderFoodAfraidOfRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/samples',
      factory: _$EatingDisorderSamplesRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/distraction',
      factory: _$EatingDisorderDistractionsRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/meal-plan',
      factory: _$MealPlanRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'home/eating-disorder/contacts',
      factory: _$EatingDisorderContactsRoute._fromState,
    ),
  ],
);

mixin _$MainRoute on GoRouteData {
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

mixin _$NotificationSettingsRoute on GoRouteData {
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

mixin _$SponsorsRoute on GoRouteData {
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

mixin _$AboutAppRoute on GoRouteData {
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

mixin _$ExportRoute on GoRouteData {
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

mixin _$LanguagesRoute on GoRouteData {
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

mixin _$MathGameRoute on GoRouteData {
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

mixin _$BreathingExercisesRoute on GoRouteData {
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

mixin _$BreathingGameRoute on GoRouteData {
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

mixin _$BalanceGameRoute on GoRouteData {
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

mixin _$BalloonsGameRoute on GoRouteData {
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

mixin _$RelaxationRoute on GoRouteData {
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

mixin _$RelaxationsListRoute on GoRouteData {
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

mixin _$ContactsRoute on GoRouteData {
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

mixin _$CrisisMessageRoute on GoRouteData {
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

mixin _$PhoneContactsRoute on GoRouteData {
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

mixin _$CrisisCenterContactsRoute on GoRouteData {
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

mixin _$ChatContactsRoute on GoRouteData {
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

mixin _$UniversityContactsRoute on GoRouteData {
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

mixin _$MyContactsRecordsRoute on GoRouteData {
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

mixin _$EmailCounsellingRoute on GoRouteData {
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

mixin _$DepressionRoute on GoRouteData {
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

mixin _$DepressionTipsAppRoute on GoRouteData {
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

mixin _$DepressionActivityPlanRoute on GoRouteData {
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

mixin _$DepressionNiceMadeHappyRoute on GoRouteData {
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

mixin _$DepressionPraiseMyAchievementsRoute on GoRouteData {
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

mixin _$AnxietyAppRoute on GoRouteData {
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

mixin _$AnxietyTipsAppRoute on GoRouteData {
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

mixin _$SelfHarmRoute on GoRouteData {
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

mixin _$SelfHarmTipsRoute on GoRouteData {
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

mixin _$SelfHarmHelpedRoute on GoRouteData {
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

mixin _$SelfHarmPlanRoute on GoRouteData {
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

mixin _$SelfHarmTimerRoute on GoRouteData {
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

mixin _$MyRecordsRoute on GoRouteData {
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

mixin _$MoodTrackRoute on GoRouteData {
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

mixin _$MoodPickerRoute on GoRouteData {
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

mixin _$MoodRecordsRoute on GoRouteData {
  static MoodRecordsRoute _fromState(GoRouterState state) =>
      const MoodRecordsRoute();

  @override
  String get location => GoRouteData.$location('/home/my-records/mood-records');

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

mixin _$SearchMoodEntryRoute on GoRouteData {
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

mixin _$MoodEntryDetailRoute on GoRouteData {
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

mixin _$MyRecordsSleepTrackRoute on GoRouteData {
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

mixin _$MyRecordsDiaryRecordsRoute on GoRouteData {
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

mixin _$MyRecordsDiaryAddRoute on GoRouteData {
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

mixin _$MyRecordsDiaryDetailRoute on GoRouteData {
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

mixin _$MyRecordsDiaryEditRoute on GoRouteData {
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

mixin _$MyRecordsJournalRecordsRoute on GoRouteData {
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

mixin _$MyRecordsJournalDetailRoute on GoRouteData {
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

mixin _$MyRecordsFoodRecordsListRoute on GoRouteData {
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

mixin _$MyRecordsFoodRecordsDetailMenuListRoute on GoRouteData {
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

mixin _$MyRecordsFoodRecordsDetailMenuDetailRoute on GoRouteData {
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

mixin _$SuicidalThoughtsRoute on GoRouteData {
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

mixin _$SuicidalThoughtsPlanRoute on GoRouteData {
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

mixin _$SuicidalThoughtsReasonsNoRoute on GoRouteData {
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

mixin _$EatingDisorderRoute on GoRouteData {
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

mixin _$EatingDisorderTipsRoute on GoRouteData {
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

mixin _$EatingDisorderTipsFigureAppRoute on GoRouteData {
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

mixin _$EatingDisorderTipsRemorseAppRoute on GoRouteData {
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

mixin _$EatingDisorderTipsOvereatAppRoute on GoRouteData {
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

mixin _$EatingDisorderTipsVomitAppRoute on GoRouteData {
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

mixin _$EatingDisorderTipsFailAppRoute on GoRouteData {
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

mixin _$EatingDisorderTipsGeneralAppRoute on GoRouteData {
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

mixin _$EatingDisorderTasksRoute on GoRouteData {
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

mixin _$EatingDisorderFoodCreativeRoute on GoRouteData {
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

mixin _$EatingDisorderFoodMotivationRoute on GoRouteData {
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

mixin _$EatingDisorderFoodChallengesRoute on GoRouteData {
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

mixin _$EatingDisorderLikeOnMyselfRoute on GoRouteData {
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

mixin _$EatingDisorderFoodILikeRoute on GoRouteData {
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

mixin _$EatingDisorderFoodAfraidOfRoute on GoRouteData {
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

mixin _$EatingDisorderSamplesRoute on GoRouteData {
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

mixin _$EatingDisorderDistractionsRoute on GoRouteData {
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

mixin _$MealPlanRoute on GoRouteData {
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

mixin _$EatingDisorderContactsRoute on GoRouteData {
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

extension<T extends Enum> on Map<T, String> {
  T? _$fromName(String? value) =>
      entries.where((element) => element.value == value).firstOrNull?.key;
}
