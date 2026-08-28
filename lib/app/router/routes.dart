import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/games/balance/balance_game_screen.dart';
import 'package:nepanikar/games/balloons/balloons_game_screen.dart';
import 'package:nepanikar/games/breathing/breathing_exercises_screen.dart';
import 'package:nepanikar/games/breathing/breathing_game_screen.dart';
import 'package:nepanikar/games/games_screen.dart';
import 'package:nepanikar/games/math/math_game_screen.dart';
import 'package:nepanikar/games/plants/plants_game_screen.dart';
import 'package:nepanikar/games/relaxation/relaxation_screen.dart';
import 'package:nepanikar/games/relaxation/relaxations_list_screen.dart';
import 'package:nepanikar/screens/bpd_programme/bpd_landing_screen.dart';
import 'package:nepanikar/screens/bpd_programme/bpd_programme_screen.dart';
import 'package:nepanikar/screens/bpd_programme/bpd_week_detail_screen.dart';
import 'package:nepanikar/screens/bpd_programme/bpd_weeks_screen.dart';
import 'package:nepanikar/screens/bpd_programme/shared/day_pause_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day1_onboarding/day1_onboarding_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day2_spoko/day2_spoko_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/day7_reflection/day7_reflection_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week1/spoko_day/spoko_day_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day1_mindfulness_intro/day1_mindfulness_intro_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day2_what_skills/day2_what_skills_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day3_how_skills/day3_how_skills_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day4_breathing/day4_breathing_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day6_techniques/day6_techniques_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week2/day7_summary/day7_summary_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day1_emotions/day1_emotions_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day2_describe/day2_describe_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day3_check_facts/day3_check_facts_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day4_opposite_action/day4_opposite_action_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day5_spoko_recall/day5_spoko_recall_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week3/day7_summary/day7_summary_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week4/day1_stress/day1_stress_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week4/day2_crisis_skills/day2_crisis_skills_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week4/day4_mindfulness_stress/day4_mindfulness_stress_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week4/day5_uznavam/day5_uznavam_screen.dart';
import 'package:nepanikar/screens/bpd_programme/weeks/week4/day7_summary/day7_summary_screen.dart';
import 'package:nepanikar/screens/contacts/chat_contacts_screen.dart';
import 'package:nepanikar/screens/contacts/crisis_message_screen.dart';
import 'package:nepanikar/screens/contacts/eating_disorder_contacts_screen.dart';
import 'package:nepanikar/screens/contacts/email_counselling_screen.dart';
import 'package:nepanikar/screens/contacts/my_contacts_screen.dart';
import 'package:nepanikar/screens/contacts/phone_contacts_screen.dart';
import 'package:nepanikar/screens/contacts/region_contacts_screen.dart';
import 'package:nepanikar/screens/home/anxiety/anxiety_screen.dart';
import 'package:nepanikar/screens/home/anxiety/anxiety_tips_route.dart';
import 'package:nepanikar/screens/home/depression/depression_activity_plan_screen.dart';
import 'package:nepanikar/screens/home/depression/depression_nice_made_happy_screen.dart';
import 'package:nepanikar/screens/home/depression/depression_praise_my_achievements_screen.dart';
import 'package:nepanikar/screens/home/depression/depression_screen.dart';
import 'package:nepanikar/screens/home/depression/depression_tips_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/eating_disorder_distractions_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/eating_disorder_samples_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/eating_disorder_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/eating_disorder_tasks_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/eating_disorder_tips_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/meal_plan_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/tasks/eating_disorder_food_afraid_of_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/tasks/eating_disorder_food_challenges_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/tasks/eating_disorder_food_creative_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/tasks/eating_disorder_food_i_like_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/tasks/eating_disorder_food_motivation_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/tasks/eating_disorder_like_on_myself_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/tips/eating_disorder_tips_fail.dart';
import 'package:nepanikar/screens/home/eating_disorder/tips/eating_disorder_tips_figure.dart';
import 'package:nepanikar/screens/home/eating_disorder/tips/eating_disorder_tips_general.dart';
import 'package:nepanikar/screens/home/eating_disorder/tips/eating_disorder_tips_overeat.dart';
import 'package:nepanikar/screens/home/eating_disorder/tips/eating_disorder_tips_remorse.dart';
import 'package:nepanikar/screens/home/eating_disorder/tips/eating_disorder_tips_vomit.dart';
import 'package:nepanikar/screens/home/my_records/challenges/my_challenges_screen.dart';
import 'package:nepanikar/screens/home/my_records/dbt/dbt_records_screen.dart';
import 'package:nepanikar/screens/home/my_records/diary/my_records_diary_add_screen.dart';
import 'package:nepanikar/screens/home/my_records/diary/my_records_diary_detail_screen.dart';
import 'package:nepanikar/screens/home/my_records/diary/my_records_diary_edit_screen.dart';
import 'package:nepanikar/screens/home/my_records/diary/my_records_diary_records_screen.dart';
import 'package:nepanikar/screens/home/my_records/emotion_dictionary/emotion_dictionary_screen.dart';
import 'package:nepanikar/screens/home/my_records/food_records/my_records_food_record_detail_menu_detail_screen.dart';
import 'package:nepanikar/screens/home/my_records/food_records/my_records_food_record_detail_menu_list_screen.dart';
import 'package:nepanikar/screens/home/my_records/food_records/my_records_food_records_list_screen.dart';
import 'package:nepanikar/screens/home/my_records/goals/my_goals_screen.dart';
import 'package:nepanikar/screens/home/my_records/goals/smart_goal_form_screen.dart';
import 'package:nepanikar/screens/home/my_records/journal/my_records_detail_journal_screen.dart';
import 'package:nepanikar/screens/home/my_records/journal/my_records_journal_records_screen.dart';
import 'package:nepanikar/screens/home/my_records/mood/mood_entry_detail_screen.dart';
import 'package:nepanikar/screens/home/my_records/mood/mood_picker_screen.dart';
import 'package:nepanikar/screens/home/my_records/mood/mood_records_screen.dart';
import 'package:nepanikar/screens/home/my_records/mood/mood_track_screen.dart';
import 'package:nepanikar/screens/home/my_records/mood/search_mood_entry.dart';
import 'package:nepanikar/screens/home/my_records/my_records_screen.dart';
import 'package:nepanikar/screens/home/my_records/my_records_sleep_track_screen.dart';
import 'package:nepanikar/screens/home/my_records/rescue_package/rescue_package_screen.dart';
import 'package:nepanikar/screens/home/my_records/tests/test_detail_screen.dart';
import 'package:nepanikar/screens/home/my_records/tests/test_list_screen.dart';
import 'package:nepanikar/screens/home/my_records/tests/test_result_screen.dart';
import 'package:nepanikar/screens/home/my_records/tests/test_screen.dart';
import 'package:nepanikar/screens/home/self_harm/self_harm_helped_screen.dart';
import 'package:nepanikar/screens/home/self_harm/self_harm_plan_screen.dart';
import 'package:nepanikar/screens/home/self_harm/self_harm_screen.dart';
import 'package:nepanikar/screens/home/self_harm/self_harm_timer_screen.dart';
import 'package:nepanikar/screens/home/self_harm/self_harm_tips_screen.dart';
import 'package:nepanikar/screens/home/suicidal_thoughts/suicidal_thoughts_plan_screen.dart';
import 'package:nepanikar/screens/home/suicidal_thoughts/suicidal_thoughts_reasons_no_screen.dart';
import 'package:nepanikar/screens/home/suicidal_thoughts/suicidal_thoughts_screen.dart';
import 'package:nepanikar/screens/main/contacts_screen.dart';
import 'package:nepanikar/screens/main/main_screen.dart';
import 'package:nepanikar/screens/settings/about_app_screen.dart';
import 'package:nepanikar/screens/settings/export_screen.dart';
import 'package:nepanikar/screens/settings/languages_screen.dart';
import 'package:nepanikar/screens/settings/notification_settings_screen.dart';
import 'package:nepanikar/screens/settings/sponsors_screen.dart';
import 'package:nepanikar/screens/settings/theme_screen.dart';

part 'routes.g.dart';

/// After editing this page, run:
/// More info in the package docs: https://pub.dev/packages/go_router.
@TypedGoRoute<MainRoute>(
  path: '/',
  routes: [
    ..._settingsRoutes,
    ..._gameRoutes,
    ..._contactRoutes,
    ..._homeRoutes,
    ..._myRecordsTestRoutes,
    ..._bpdProgrammeRoutes,
  ],
)
class MainRoute extends GoRouteData with $MainRoute {
  const MainRoute();

  @override
  Widget build(BuildContext context, _) =>
      MainScreen(extra: GoRouterState.of(context).extra as MainPageExtra?);
}

const _settingsRoutes = <TypedGoRoute<GoRouteData>>[
  TypedGoRoute<NotificationSettingsRoute>(path: 'settings/notification-settings'),
  TypedGoRoute<SponsorsRoute>(path: 'settings/sponsors'),
  TypedGoRoute<AboutAppRoute>(path: 'settings/about-app'),
  TypedGoRoute<ExportRoute>(path: 'settings/export'),
  TypedGoRoute<LanguagesRoute>(path: 'settings/language'),
  TypedGoRoute<ThemeRoute>(path: 'settings/theme'),
];

const _gameRoutes = <TypedGoRoute<GoRouteData>>[
  TypedGoRoute<GamesRoute>(path: 'games'),
  TypedGoRoute<MathGameRoute>(path: 'games/math'),
  TypedGoRoute<BreathingExercisesRoute>(path: 'games/breathing-list'),
  TypedGoRoute<BreathingGameRoute>(path: 'games/breathing/:shape'),
  TypedGoRoute<BalanceGameRoute>(path: 'games/balance'),
  TypedGoRoute<BalloonsGameRoute>(path: 'games/balloons'),
  TypedGoRoute<PlantsGameRoute>(path: 'games/plants'),
  TypedGoRoute<RelaxationRoute>(path: 'games/relaxation/:relaxationType'),
  TypedGoRoute<RelaxationsListRoute>(path: 'games/relaxation-list'),
];

const _contactRoutes = <TypedGoRoute<GoRouteData>>[
  TypedGoRoute<ContactsRoute>(path: 'contacts'),
  TypedGoRoute<CrisisMessageRoute>(path: 'contacts/crisis-message'),
  TypedGoRoute<PhoneContactsRoute>(path: 'contacts/phones'),
  TypedGoRoute<CrisisCenterContactsRoute>(path: 'contacts/crisis-center'),
  TypedGoRoute<ChatContactsRoute>(path: 'contacts/chat'),
  TypedGoRoute<UniversityContactsRoute>(path: 'contacts/universities'),
  TypedGoRoute<MyContactsRecordsRoute>(path: 'contacts/my-contacts-records'),
  TypedGoRoute<EmailCounsellingRoute>(path: 'contacts/email-counselling'),
];

const _homeRoutes = <TypedGoRoute<GoRouteData>>[
  ..._depressionRoutes,
  TypedGoRoute<AnxietyAppRoute>(path: 'home/anxiety'),
  TypedGoRoute<AnxietyTipsAppRoute>(path: 'home/anxiety/tips'),
  ..._selfHarmRoutes,
  ..._myRecordsRoutes,
  ..._suicidalThoughtsRoutes,
  ..._eatingDisorderRoutes,
];

const _depressionRoutes = <TypedGoRoute<GoRouteData>>[
  TypedGoRoute<DepressionRoute>(path: 'home/depression'),
  TypedGoRoute<DepressionTipsAppRoute>(path: 'home/depression/tips'),
  TypedGoRoute<DepressionActivityPlanRoute>(path: 'home/depression/activity-plan'),
  TypedGoRoute<DepressionNiceMadeHappyRoute>(path: 'home/depression/nice-made-happy'),
  TypedGoRoute<DepressionPraiseMyAchievementsRoute>(path: 'home/depression/praise-my-achievements'),
];

const _selfHarmRoutes = <TypedGoRoute<GoRouteData>>[
  TypedGoRoute<SelfHarmRoute>(path: 'home/self-harm'),
  TypedGoRoute<SelfHarmTipsRoute>(path: 'home/self-harm/tips'),
  TypedGoRoute<SelfHarmHelpedRoute>(path: 'home/self-harm/helped'),
  TypedGoRoute<SelfHarmPlanRoute>(path: 'home/self-harm/plan'),
  TypedGoRoute<SelfHarmTimerRoute>(path: 'home/self-harm/timer'),
];

const _suicidalThoughtsRoutes = <TypedGoRoute<GoRouteData>>[
  TypedGoRoute<SuicidalThoughtsRoute>(path: 'home/suicidal-thoughts'),
  TypedGoRoute<SuicidalThoughtsPlanRoute>(path: 'home/suicidal-thoughts/plan'),
  TypedGoRoute<SuicidalThoughtsReasonsNoRoute>(path: 'home/suicidal-thoughts/reasons-no'),
];

const _eatingDisorderRoutes = <TypedGoRoute<GoRouteData>>[
  TypedGoRoute<EatingDisorderRoute>(path: 'home/eating-disorder'),
  ..._eatingDisorderTipsRoutes,
  ..._eatingDisorderTasksRoutes,
  TypedGoRoute<EatingDisorderSamplesRoute>(path: 'home/eating-disorder/samples'),
  TypedGoRoute<EatingDisorderDistractionsRoute>(path: 'home/eating-disorder/distraction'),
  TypedGoRoute<MealPlanRoute>(path: 'home/eating-disorder/meal-plan'),
  TypedGoRoute<EatingDisorderContactsRoute>(path: 'home/eating-disorder/contacts'),
];

const _eatingDisorderTasksRoutes = <TypedGoRoute<GoRouteData>>[
  TypedGoRoute<EatingDisorderTasksRoute>(path: 'home/eating-disorder/tasks'),
  TypedGoRoute<EatingDisorderFoodCreativeRoute>(path: 'home/eating-disorder/tasks/food-creative'),
  TypedGoRoute<EatingDisorderFoodMotivationRoute>(
    path: 'home/eating-disorder/tasks/food-motivation',
  ),
  TypedGoRoute<EatingDisorderFoodChallengesRoute>(
    path: 'home/eating-disorder/tasks/food-challenges',
  ),
  TypedGoRoute<EatingDisorderLikeOnMyselfRoute>(path: 'home/eating-disorder/tasks/like-on-myself'),
  TypedGoRoute<EatingDisorderFoodILikeRoute>(path: 'home/eating-disorder/tasks/food-i-like'),
  TypedGoRoute<EatingDisorderFoodAfraidOfRoute>(path: 'home/eating-disorder/tasks/food-afraid-of'),
];

const _eatingDisorderTipsRoutes = <TypedGoRoute<GoRouteData>>[
  TypedGoRoute<EatingDisorderTipsRoute>(path: 'home/eating-disorder/tips'),
  TypedGoRoute<EatingDisorderTipsFigureAppRoute>(path: 'home/eating-disorder/tips/figure'),
  TypedGoRoute<EatingDisorderTipsRemorseAppRoute>(path: 'home/eating-disorder/tips/remorse'),
  TypedGoRoute<EatingDisorderTipsOvereatAppRoute>(path: 'home/eating-disorder/tips/overeat'),
  TypedGoRoute<EatingDisorderTipsVomitAppRoute>(path: 'home/eating-disorder/tips/vomit'),
  TypedGoRoute<EatingDisorderTipsFailAppRoute>(path: 'home/eating-disorder/tips/fail'),
  TypedGoRoute<EatingDisorderTipsGeneralAppRoute>(path: 'home/eating-disorder/tips/general'),
];

const _myRecordsRoutes = <TypedGoRoute<GoRouteData>>[
  TypedGoRoute<MyRecordsRoute>(path: 'home/my-records'),
  TypedGoRoute<MoodTrackRoute>(path: 'home/my-records/mood-track'),
  TypedGoRoute<MoodPickerRoute>(path: 'home/my-records/mood-picker'),
  TypedGoRoute<MoodRecordsRoute>(path: 'home/my-records/mood-records'),
  TypedGoRoute<SearchMoodEntryRoute>(path: 'home/my-records/search-mood-entry'),
  TypedGoRoute<MoodEntryDetailRoute>(path: 'home/my-records/mood-records/mood-entry'),
  TypedGoRoute<MyRecordsSleepTrackRoute>(path: 'home/my-records/sleep-track'),
  TypedGoRoute<MyChallengesRoute>(path: 'home/my-records/challenges'),
  TypedGoRoute<DbtRecordsRoute>(path: 'home/my-records/dbt'),
  TypedGoRoute<MyGoalsRoute>(path: 'home/my-records/goals'),
  TypedGoRoute<SmartGoalFormRoute>(path: 'home/my-records/goals/new'),
  TypedGoRoute<RescuePackageRoute>(path: 'home/my-records/rescue-package'),
  TypedGoRoute<EmotionDictionaryRoute>(path: 'home/my-records/emotion-dictionary'),

  // Diary
  TypedGoRoute<MyRecordsDiaryRecordsRoute>(path: 'home/my-records/diary'),
  TypedGoRoute<MyRecordsDiaryAddRoute>(path: 'home/my-records/diary/add'),
  TypedGoRoute<MyRecordsDiaryDetailRoute>(path: 'home/my-records/diary/detail'),
  TypedGoRoute<MyRecordsDiaryEditRoute>(path: 'home/my-records/diary/edit'),

  // Journal
  TypedGoRoute<MyRecordsJournalRecordsRoute>(path: 'home/my-records/journal'),
  TypedGoRoute<MyRecordsJournalDetailRoute>(path: 'home/my-records/journal-detail'),

  // Food records
  TypedGoRoute<MyRecordsFoodRecordsListRoute>(path: 'home/my-records/food-records'),
  TypedGoRoute<MyRecordsFoodRecordsDetailMenuListRoute>(
    path: 'home/my-records/food-records/detail',
  ),
  TypedGoRoute<MyRecordsFoodRecordsDetailMenuDetailRoute>(
    path: 'home/my-records/food-records/detail/menu-detail',
  ),
];

const _myRecordsTestRoutes = <TypedGoRoute<GoRouteData>>[
  TypedGoRoute<TestListScreenRoute>(path: 'home/my-records/tests'),
  TypedGoRoute<TestScreenRoute>(path: 'home/my-records/tests/:testId'),
  TypedGoRoute<TestDetailScreenRoute>(path: 'home/my-records/tests/test-detail/:testId'),
  TypedGoRoute<TestResultScreenRoute>(path: 'home/my-records/test-result/:testId/:completedAt'),
];

const _bpdProgrammeRoutes = <TypedGoRoute<GoRouteData>>[
  TypedGoRoute<BpdLandingScreenRoute>(path: 'bpd-programme/landing'),
  TypedGoRoute<BpdProgrammeScreenRoute>(path: 'bpd-programme'),
  TypedGoRoute<BpdWeeksScreenRoute>(path: 'bpd-programme/weeks'),
  TypedGoRoute<BpdWeekDetailScreenRoute>(path: 'bpd-programme/week/:weekNumber'),
  TypedGoRoute<Day1OnboardingScreenRoute>(path: 'bpd-programme/day-onboarding'),
  // Day content screens - Week 1 (SPOKO)
  TypedGoRoute<Week1Day2SpokoScreenRoute>(path: 'bpd-programme/week/1/day/2'),
  TypedGoRoute<Week1Day3PotravaScreenRoute>(path: 'bpd-programme/week/1/day/3'),
  TypedGoRoute<Week1Day4LatkyScreenRoute>(path: 'bpd-programme/week/1/day/4'),
  TypedGoRoute<Week1Day5KondiceScreenRoute>(path: 'bpd-programme/week/1/day/5'),
  TypedGoRoute<Week1Day6OnemocneniScreenRoute>(path: 'bpd-programme/week/1/day/6'),
  TypedGoRoute<Week1Day7ReflexeScreenRoute>(path: 'bpd-programme/week/1/day/7'),
  // Day content screens - Week 2 (Mindfulness)
  TypedGoRoute<Week2Day1MindfulnessIntroScreenRoute>(path: 'bpd-programme/week/2/day/1'),
  TypedGoRoute<Week2Day2WhatSkillsScreenRoute>(path: 'bpd-programme/week/2/day/2'),
  TypedGoRoute<Week2Day3HowSkillsScreenRoute>(path: 'bpd-programme/week/2/day/3'),
  TypedGoRoute<Week2Day4BreathingScreenRoute>(path: 'bpd-programme/week/2/day/4'),
  TypedGoRoute<Week2Day6TechniquesScreenRoute>(path: 'bpd-programme/week/2/day/6'),
  TypedGoRoute<Week2Day7SummaryScreenRoute>(path: 'bpd-programme/week/2/day/7'),
  // Day content screens - Week 3 (Emoční regulace)
  TypedGoRoute<Week3Day1EmotionsScreenRoute>(path: 'bpd-programme/week/3/day/1'),
  TypedGoRoute<Week3Day2DescribeScreenRoute>(path: 'bpd-programme/week/3/day/2'),
  TypedGoRoute<Week3Day3CheckFactsScreenRoute>(path: 'bpd-programme/week/3/day/3'),
  TypedGoRoute<Week3Day4OppositeActionScreenRoute>(path: 'bpd-programme/week/3/day/4'),
  TypedGoRoute<Week3Day5SpokoRecallScreenRoute>(path: 'bpd-programme/week/3/day/5'),
  TypedGoRoute<Week3Day7SummaryScreenRoute>(path: 'bpd-programme/week/3/day/7'),
  TypedGoRoute<Week4Day1StressScreenRoute>(path: 'bpd-programme/week/4/day/1'),
  TypedGoRoute<Week4Day2CrisisSkillsScreenRoute>(path: 'bpd-programme/week/4/day/2'),
  TypedGoRoute<Week4Day4MindfulnessScreenRoute>(path: 'bpd-programme/week/4/day/4'),
  TypedGoRoute<Week4Day5UznavamScreenRoute>(path: 'bpd-programme/week/4/day/5'),
  TypedGoRoute<Week4Day7SummaryScreenRoute>(path: 'bpd-programme/week/4/day/7'),
  // Pause day (reusable for any week/day)
  TypedGoRoute<DayPauseScreenRoute>(path: 'bpd-programme/week/:weekNumber/day/:dayNumber/pause'),
];
