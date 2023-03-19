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
          path: 'settings/notification-settings',
          factory: $NotificationSettingsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'settings/sponsors',
          factory: $SponsorsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'settings/about-app',
          factory: $AboutAppRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'settings/export',
          factory: $ExportRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'settings/language',
          factory: $LanguagesRouteExtension._fromState,
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
          path: 'games/balance',
          factory: $BalanceGameRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'games/balloons',
          factory: $BalloonsGameRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'games/relaxation/:relaxationType',
          factory: $RelaxationRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'games/relaxation-list',
          factory: $RelaxationsListRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'contacts',
          factory: $ContactsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'contacts/crisis-message',
          factory: $CrisisMessageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'contacts/phones',
          factory: $PhoneContactsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'contacts/crisis-center',
          factory: $CrisisCenterContactsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'contacts/chat',
          factory: $ChatContactsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'contacts/universities',
          factory: $UniversityContactsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'contacts/my-contacts-records',
          factory: $MyContactsRecordsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'contacts/email-counselling',
          factory: $EmailCounsellingRouteExtension._fromState,
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
          path: 'home/depression/nice-made-happy',
          factory: $DepressionNiceMadeHappyRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/depression/praise-my-achievements',
          factory: $DepressionPraiseMyAchievementsRouteExtension._fromState,
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
          path: 'home/my-records/sleep-track',
          factory: $MyRecordsSleepTrackRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/my-records/diary',
          factory: $MyRecordsDiaryRecordsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/my-records/diary/add',
          factory: $MyRecordsDiaryAddRouteExtension._fromState,
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
          path: 'home/my-records/journal',
          factory: $MyRecordsJournalRecordsRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/my-records/journal-detail',
          factory: $MyRecordsJournalDetailRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/my-records/food-records',
          factory: $MyRecordsFoodRecordsListRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/my-records/food-records/detail',
          factory: $MyRecordsFoodRecordsDetailMenuListRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/my-records/food-records/detail/menu-detail',
          factory:
              $MyRecordsFoodRecordsDetailMenuDetailRouteExtension._fromState,
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
          path: 'home/suicidal-thoughts/reasons-no',
          factory: $SuicidalThoughtsReasonsNoRouteExtension._fromState,
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
          path: 'home/eating-disorder/tasks',
          factory: $EatingDisorderTasksRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/eating-disorder/tasks/food-creative',
          factory: $EatingDisorderFoodCreativeRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/eating-disorder/tasks/food-motivation',
          factory: $EatingDisorderFoodMotivationRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/eating-disorder/tasks/food-challenges',
          factory: $EatingDisorderFoodChallengesRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/eating-disorder/tasks/like-on-myself',
          factory: $EatingDisorderLikeOnMyselfRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/eating-disorder/tasks/food-i-like',
          factory: $EatingDisorderFoodILikeRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/eating-disorder/tasks/food-afraid-of',
          factory: $EatingDisorderFoodAfraidOfRouteExtension._fromState,
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
          path: 'home/eating-disorder/meal-plan',
          factory: $MealPlanRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/eating-disorder/contacts',
          factory: $EatingDisorderContactsRouteExtension._fromState,
        ),
      ],
    );

extension $MainRouteExtension on MainRoute {
  static MainRoute _fromState(GoRouterState state) => const MainRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $NotificationSettingsRouteExtension on NotificationSettingsRoute {
  static NotificationSettingsRoute _fromState(GoRouterState state) =>
      const NotificationSettingsRoute();

  String get location => GoRouteData.$location(
        '/settings/notification-settings',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $SponsorsRouteExtension on SponsorsRoute {
  static SponsorsRoute _fromState(GoRouterState state) => const SponsorsRoute();

  String get location => GoRouteData.$location(
        '/settings/sponsors',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $AboutAppRouteExtension on AboutAppRoute {
  static AboutAppRoute _fromState(GoRouterState state) => const AboutAppRoute();

  String get location => GoRouteData.$location(
        '/settings/about-app',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $ExportRouteExtension on ExportRoute {
  static ExportRoute _fromState(GoRouterState state) => const ExportRoute();

  String get location => GoRouteData.$location(
        '/settings/export',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $LanguagesRouteExtension on LanguagesRoute {
  static LanguagesRoute _fromState(GoRouterState state) =>
      const LanguagesRoute();

  String get location => GoRouteData.$location(
        '/settings/language',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $MathGameRouteExtension on MathGameRoute {
  static MathGameRoute _fromState(GoRouterState state) => const MathGameRoute();

  String get location => GoRouteData.$location(
        '/games/math',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $BreathingExercisesRouteExtension on BreathingExercisesRoute {
  static BreathingExercisesRoute _fromState(GoRouterState state) =>
      const BreathingExercisesRoute();

  String get location => GoRouteData.$location(
        '/games/breathing-list',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $BreathingGameRouteExtension on BreathingGameRoute {
  static BreathingGameRoute _fromState(GoRouterState state) =>
      BreathingGameRoute(
        shape: _$BreathingGameShapeEnumMap._$fromName(state.params['shape']!),
      );

  String get location => GoRouteData.$location(
        '/games/breathing/${Uri.encodeComponent(_$BreathingGameShapeEnumMap[shape]!)}',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $BalanceGameRouteExtension on BalanceGameRoute {
  static BalanceGameRoute _fromState(GoRouterState state) =>
      const BalanceGameRoute();

  String get location => GoRouteData.$location(
        '/games/balance',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $BalloonsGameRouteExtension on BalloonsGameRoute {
  static BalloonsGameRoute _fromState(GoRouterState state) =>
      const BalloonsGameRoute();

  String get location => GoRouteData.$location(
        '/games/balloons',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $RelaxationRouteExtension on RelaxationRoute {
  static RelaxationRoute _fromState(GoRouterState state) => RelaxationRoute(
        relaxationType:
            _$RelaxationTypeEnumMap._$fromName(state.params['relaxationType']!),
      );

  String get location => GoRouteData.$location(
        '/games/relaxation/${Uri.encodeComponent(_$RelaxationTypeEnumMap[relaxationType]!)}',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $RelaxationsListRouteExtension on RelaxationsListRoute {
  static RelaxationsListRoute _fromState(GoRouterState state) =>
      const RelaxationsListRoute();

  String get location => GoRouteData.$location(
        '/games/relaxation-list',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $ContactsRouteExtension on ContactsRoute {
  static ContactsRoute _fromState(GoRouterState state) => const ContactsRoute();

  String get location => GoRouteData.$location(
        '/contacts',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $CrisisMessageRouteExtension on CrisisMessageRoute {
  static CrisisMessageRoute _fromState(GoRouterState state) =>
      const CrisisMessageRoute();

  String get location => GoRouteData.$location(
        '/contacts/crisis-message',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $PhoneContactsRouteExtension on PhoneContactsRoute {
  static PhoneContactsRoute _fromState(GoRouterState state) =>
      const PhoneContactsRoute();

  String get location => GoRouteData.$location(
        '/contacts/phones',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $CrisisCenterContactsRouteExtension on CrisisCenterContactsRoute {
  static CrisisCenterContactsRoute _fromState(GoRouterState state) =>
      const CrisisCenterContactsRoute();

  String get location => GoRouteData.$location(
        '/contacts/crisis-center',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $ChatContactsRouteExtension on ChatContactsRoute {
  static ChatContactsRoute _fromState(GoRouterState state) =>
      const ChatContactsRoute();

  String get location => GoRouteData.$location(
        '/contacts/chat',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $UniversityContactsRouteExtension on UniversityContactsRoute {
  static UniversityContactsRoute _fromState(GoRouterState state) =>
      const UniversityContactsRoute();

  String get location => GoRouteData.$location(
        '/contacts/universities',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $MyContactsRecordsRouteExtension on MyContactsRecordsRoute {
  static MyContactsRecordsRoute _fromState(GoRouterState state) =>
      const MyContactsRecordsRoute();

  String get location => GoRouteData.$location(
        '/contacts/my-contacts-records',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $EmailCounsellingRouteExtension on EmailCounsellingRoute {
  static EmailCounsellingRoute _fromState(GoRouterState state) =>
      const EmailCounsellingRoute();

  String get location => GoRouteData.$location(
        '/contacts/email-counselling',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $DepressionRouteExtension on DepressionRoute {
  static DepressionRoute _fromState(GoRouterState state) =>
      const DepressionRoute();

  String get location => GoRouteData.$location(
        '/home/depression',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $DepressionTipsAppRouteExtension on DepressionTipsAppRoute {
  static DepressionTipsAppRoute _fromState(GoRouterState state) =>
      const DepressionTipsAppRoute();

  String get location => GoRouteData.$location(
        '/home/depression/tips',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $DepressionActivityPlanRouteExtension on DepressionActivityPlanRoute {
  static DepressionActivityPlanRoute _fromState(GoRouterState state) =>
      const DepressionActivityPlanRoute();

  String get location => GoRouteData.$location(
        '/home/depression/activity-plan',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $DepressionNiceMadeHappyRouteExtension
    on DepressionNiceMadeHappyRoute {
  static DepressionNiceMadeHappyRoute _fromState(GoRouterState state) =>
      const DepressionNiceMadeHappyRoute();

  String get location => GoRouteData.$location(
        '/home/depression/nice-made-happy',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $DepressionPraiseMyAchievementsRouteExtension
    on DepressionPraiseMyAchievementsRoute {
  static DepressionPraiseMyAchievementsRoute _fromState(GoRouterState state) =>
      const DepressionPraiseMyAchievementsRoute();

  String get location => GoRouteData.$location(
        '/home/depression/praise-my-achievements',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $AnxietyAppRouteExtension on AnxietyAppRoute {
  static AnxietyAppRoute _fromState(GoRouterState state) =>
      const AnxietyAppRoute();

  String get location => GoRouteData.$location(
        '/home/anxiety',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $AnxietyTipsAppRouteExtension on AnxietyTipsAppRoute {
  static AnxietyTipsAppRoute _fromState(GoRouterState state) =>
      const AnxietyTipsAppRoute();

  String get location => GoRouteData.$location(
        '/home/anxiety/tips',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $SelfHarmRouteExtension on SelfHarmRoute {
  static SelfHarmRoute _fromState(GoRouterState state) => const SelfHarmRoute();

  String get location => GoRouteData.$location(
        '/home/self-harm',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $SelfHarmTipsRouteExtension on SelfHarmTipsRoute {
  static SelfHarmTipsRoute _fromState(GoRouterState state) =>
      const SelfHarmTipsRoute();

  String get location => GoRouteData.$location(
        '/home/self-harm/tips',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $SelfHarmHelpedRouteExtension on SelfHarmHelpedRoute {
  static SelfHarmHelpedRoute _fromState(GoRouterState state) =>
      const SelfHarmHelpedRoute();

  String get location => GoRouteData.$location(
        '/home/self-harm/helped',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $SelfHarmPlanRouteExtension on SelfHarmPlanRoute {
  static SelfHarmPlanRoute _fromState(GoRouterState state) =>
      const SelfHarmPlanRoute();

  String get location => GoRouteData.$location(
        '/home/self-harm/plan',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $SelfHarmTimerRouteExtension on SelfHarmTimerRoute {
  static SelfHarmTimerRoute _fromState(GoRouterState state) =>
      const SelfHarmTimerRoute();

  String get location => GoRouteData.$location(
        '/home/self-harm/timer',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $MyRecordsRouteExtension on MyRecordsRoute {
  static MyRecordsRoute _fromState(GoRouterState state) =>
      const MyRecordsRoute();

  String get location => GoRouteData.$location(
        '/home/my-records',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $MoodTrackRouteExtension on MoodTrackRoute {
  static MoodTrackRoute _fromState(GoRouterState state) =>
      const MoodTrackRoute();

  String get location => GoRouteData.$location(
        '/home/my-records/mood-track',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $MyRecordsSleepTrackRouteExtension on MyRecordsSleepTrackRoute {
  static MyRecordsSleepTrackRoute _fromState(GoRouterState state) =>
      const MyRecordsSleepTrackRoute();

  String get location => GoRouteData.$location(
        '/home/my-records/sleep-track',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $MyRecordsDiaryRecordsRouteExtension on MyRecordsDiaryRecordsRoute {
  static MyRecordsDiaryRecordsRoute _fromState(GoRouterState state) =>
      const MyRecordsDiaryRecordsRoute();

  String get location => GoRouteData.$location(
        '/home/my-records/diary',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $MyRecordsDiaryAddRouteExtension on MyRecordsDiaryAddRoute {
  static MyRecordsDiaryAddRoute _fromState(GoRouterState state) =>
      const MyRecordsDiaryAddRoute();

  String get location => GoRouteData.$location(
        '/home/my-records/diary/add',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $MyRecordsDiaryDetailRouteExtension on MyRecordsDiaryDetailRoute {
  static MyRecordsDiaryDetailRoute _fromState(GoRouterState state) =>
      const MyRecordsDiaryDetailRoute();

  String get location => GoRouteData.$location(
        '/home/my-records/diary/detail',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $MyRecordsDiaryEditRouteExtension on MyRecordsDiaryEditRoute {
  static MyRecordsDiaryEditRoute _fromState(GoRouterState state) =>
      const MyRecordsDiaryEditRoute();

  String get location => GoRouteData.$location(
        '/home/my-records/diary/edit',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $MyRecordsJournalRecordsRouteExtension
    on MyRecordsJournalRecordsRoute {
  static MyRecordsJournalRecordsRoute _fromState(GoRouterState state) =>
      const MyRecordsJournalRecordsRoute();

  String get location => GoRouteData.$location(
        '/home/my-records/journal',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $MyRecordsJournalDetailRouteExtension on MyRecordsJournalDetailRoute {
  static MyRecordsJournalDetailRoute _fromState(GoRouterState state) =>
      const MyRecordsJournalDetailRoute();

  String get location => GoRouteData.$location(
        '/home/my-records/journal-detail',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $MyRecordsFoodRecordsListRouteExtension
    on MyRecordsFoodRecordsListRoute {
  static MyRecordsFoodRecordsListRoute _fromState(GoRouterState state) =>
      const MyRecordsFoodRecordsListRoute();

  String get location => GoRouteData.$location(
        '/home/my-records/food-records',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $MyRecordsFoodRecordsDetailMenuListRouteExtension
    on MyRecordsFoodRecordsDetailMenuListRoute {
  static MyRecordsFoodRecordsDetailMenuListRoute _fromState(
          GoRouterState state) =>
      const MyRecordsFoodRecordsDetailMenuListRoute();

  String get location => GoRouteData.$location(
        '/home/my-records/food-records/detail',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $MyRecordsFoodRecordsDetailMenuDetailRouteExtension
    on MyRecordsFoodRecordsDetailMenuDetailRoute {
  static MyRecordsFoodRecordsDetailMenuDetailRoute _fromState(
          GoRouterState state) =>
      const MyRecordsFoodRecordsDetailMenuDetailRoute();

  String get location => GoRouteData.$location(
        '/home/my-records/food-records/detail/menu-detail',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $SuicidalThoughtsRouteExtension on SuicidalThoughtsRoute {
  static SuicidalThoughtsRoute _fromState(GoRouterState state) =>
      const SuicidalThoughtsRoute();

  String get location => GoRouteData.$location(
        '/home/suicidal-thoughts',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $SuicidalThoughtsPlanRouteExtension on SuicidalThoughtsPlanRoute {
  static SuicidalThoughtsPlanRoute _fromState(GoRouterState state) =>
      const SuicidalThoughtsPlanRoute();

  String get location => GoRouteData.$location(
        '/home/suicidal-thoughts/plan',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $SuicidalThoughtsReasonsNoRouteExtension
    on SuicidalThoughtsReasonsNoRoute {
  static SuicidalThoughtsReasonsNoRoute _fromState(GoRouterState state) =>
      const SuicidalThoughtsReasonsNoRoute();

  String get location => GoRouteData.$location(
        '/home/suicidal-thoughts/reasons-no',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $EatingDisorderRouteExtension on EatingDisorderRoute {
  static EatingDisorderRoute _fromState(GoRouterState state) =>
      const EatingDisorderRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $EatingDisorderTipsRouteExtension on EatingDisorderTipsRoute {
  static EatingDisorderTipsRoute _fromState(GoRouterState state) =>
      const EatingDisorderTipsRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/tips',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $EatingDisorderTipsFigureAppRouteExtension
    on EatingDisorderTipsFigureAppRoute {
  static EatingDisorderTipsFigureAppRoute _fromState(GoRouterState state) =>
      const EatingDisorderTipsFigureAppRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/tips/figure',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $EatingDisorderTipsRemorseAppRouteExtension
    on EatingDisorderTipsRemorseAppRoute {
  static EatingDisorderTipsRemorseAppRoute _fromState(GoRouterState state) =>
      const EatingDisorderTipsRemorseAppRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/tips/remorse',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $EatingDisorderTipsOvereatAppRouteExtension
    on EatingDisorderTipsOvereatAppRoute {
  static EatingDisorderTipsOvereatAppRoute _fromState(GoRouterState state) =>
      const EatingDisorderTipsOvereatAppRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/tips/overeat',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $EatingDisorderTipsVomitAppRouteExtension
    on EatingDisorderTipsVomitAppRoute {
  static EatingDisorderTipsVomitAppRoute _fromState(GoRouterState state) =>
      const EatingDisorderTipsVomitAppRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/tips/vomit',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $EatingDisorderTipsFailAppRouteExtension
    on EatingDisorderTipsFailAppRoute {
  static EatingDisorderTipsFailAppRoute _fromState(GoRouterState state) =>
      const EatingDisorderTipsFailAppRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/tips/fail',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $EatingDisorderTipsGeneralAppRouteExtension
    on EatingDisorderTipsGeneralAppRoute {
  static EatingDisorderTipsGeneralAppRoute _fromState(GoRouterState state) =>
      const EatingDisorderTipsGeneralAppRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/tips/general',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $EatingDisorderTasksRouteExtension on EatingDisorderTasksRoute {
  static EatingDisorderTasksRoute _fromState(GoRouterState state) =>
      const EatingDisorderTasksRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/tasks',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $EatingDisorderFoodCreativeRouteExtension
    on EatingDisorderFoodCreativeRoute {
  static EatingDisorderFoodCreativeRoute _fromState(GoRouterState state) =>
      const EatingDisorderFoodCreativeRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/tasks/food-creative',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $EatingDisorderFoodMotivationRouteExtension
    on EatingDisorderFoodMotivationRoute {
  static EatingDisorderFoodMotivationRoute _fromState(GoRouterState state) =>
      const EatingDisorderFoodMotivationRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/tasks/food-motivation',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $EatingDisorderFoodChallengesRouteExtension
    on EatingDisorderFoodChallengesRoute {
  static EatingDisorderFoodChallengesRoute _fromState(GoRouterState state) =>
      const EatingDisorderFoodChallengesRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/tasks/food-challenges',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $EatingDisorderLikeOnMyselfRouteExtension
    on EatingDisorderLikeOnMyselfRoute {
  static EatingDisorderLikeOnMyselfRoute _fromState(GoRouterState state) =>
      const EatingDisorderLikeOnMyselfRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/tasks/like-on-myself',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $EatingDisorderFoodILikeRouteExtension
    on EatingDisorderFoodILikeRoute {
  static EatingDisorderFoodILikeRoute _fromState(GoRouterState state) =>
      const EatingDisorderFoodILikeRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/tasks/food-i-like',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $EatingDisorderFoodAfraidOfRouteExtension
    on EatingDisorderFoodAfraidOfRoute {
  static EatingDisorderFoodAfraidOfRoute _fromState(GoRouterState state) =>
      const EatingDisorderFoodAfraidOfRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/tasks/food-afraid-of',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $EatingDisorderSamplesRouteExtension on EatingDisorderSamplesRoute {
  static EatingDisorderSamplesRoute _fromState(GoRouterState state) =>
      const EatingDisorderSamplesRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/samples',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $EatingDisorderDistractionsRouteExtension
    on EatingDisorderDistractionsRoute {
  static EatingDisorderDistractionsRoute _fromState(GoRouterState state) =>
      const EatingDisorderDistractionsRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/distraction',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $MealPlanRouteExtension on MealPlanRoute {
  static MealPlanRoute _fromState(GoRouterState state) => const MealPlanRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/meal-plan',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $EatingDisorderContactsRouteExtension on EatingDisorderContactsRoute {
  static EatingDisorderContactsRoute _fromState(GoRouterState state) =>
      const EatingDisorderContactsRoute();

  String get location => GoRouteData.$location(
        '/home/eating-disorder/contacts',
      );

  void go(BuildContext context) => context.go(location);

  void push(BuildContext context) => context.push(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

const _$BreathingGameShapeEnumMap = {
  BreathingGameShape.circle: 'circle',
  BreathingGameShape.square: 'square',
  BreathingGameShape.triangle: 'triangle',
};

const _$RelaxationTypeEnumMap = {
  RelaxationType.general: 'general',
  RelaxationType.morning: 'morning',
  RelaxationType.evening: 'evening',
};

extension<T extends Enum> on Map<T, String> {
  T _$fromName(String value) =>
      entries.singleWhere((element) => element.value == value).key;
}
