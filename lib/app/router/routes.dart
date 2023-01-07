import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/games/balance/balance_game_screen.dart';
import 'package:nepanikar/games/balloons/balloons_game_screen.dart';
import 'package:nepanikar/games/breathing/breathing_exercises_screen.dart';
import 'package:nepanikar/games/breathing/breathing_game_screen.dart';
import 'package:nepanikar/games/math/math_game_screen.dart';
import 'package:nepanikar/screens/about_app_screen.dart';
import 'package:nepanikar/screens/contacts/chat_contacts_screen.dart';
import 'package:nepanikar/screens/contacts/crisis_message_screen.dart';
import 'package:nepanikar/screens/contacts/eating_disorder_contacts_screen.dart';
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
import 'package:nepanikar/screens/home/my_records/diary/my_records_diary_add_screen.dart';
import 'package:nepanikar/screens/home/my_records/diary/my_records_diary_detail_screen.dart';
import 'package:nepanikar/screens/home/my_records/diary/my_records_diary_edit_screen.dart';
import 'package:nepanikar/screens/home/my_records/diary/my_records_diary_records_screen.dart';
import 'package:nepanikar/screens/home/my_records/mood_track_screen.dart';
import 'package:nepanikar/screens/home/my_records/my_records_screen.dart';
import 'package:nepanikar/screens/home/my_records/my_records_sleep_track_screen.dart';
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

part 'routes.g.dart';

/// After editing this page, run:
///
/// `flutter packages pub run build_runner build --delete-conflicting-outputs` to regenerate
/// the routes.
///
/// Alternative ways of pushing a route:
/// * context.push(MainRoute().location);
/// * GoRouter.of(context).push(MainRoute().location);
/// * MainRoute().push(context);
/// * registry.get<GoRouter>().push(MainRoute().location); - if you need to push a route from where
/// `context` is not available
///
/// More info in the package docs: https://pub.dev/packages/go_router.
@TypedGoRoute<MainRoute>(
  path: '/',
  routes: [
    ..._settingsRoutes,
    ..._gameRoutes,
    ..._contactRoutes,
    ..._homeRoutes,
  ],
)
class MainRoute extends GoRouteData {
  const MainRoute();

  @override
  Widget build(BuildContext context, _) => const MainScreen();
}

const _settingsRoutes = <TypedGoRoute<GoRouteData>>[
  TypedGoRoute<AboutAppRoute>(path: 'settings/about-app'),
];

const _gameRoutes = <TypedGoRoute<GoRouteData>>[
  TypedGoRoute<MathGameRoute>(path: 'games/math'),
  TypedGoRoute<BreathingExercisesRoute>(path: 'games/breathing-list'),
  TypedGoRoute<BreathingGameRoute>(path: 'games/breathing/:shape'),
  TypedGoRoute<BalanceGameRoute>(path: 'games/balance'),
  TypedGoRoute<BalloonsGameRoute>(path: 'games/balloons'),
];

const _contactRoutes = <TypedGoRoute<GoRouteData>>[
  TypedGoRoute<ContactsRoute>(path: 'contacts'),
  TypedGoRoute<CrisisMessageRoute>(path: 'contacts/crisis-message'),
  TypedGoRoute<PhoneContactsRoute>(path: 'contacts/phones'),
  TypedGoRoute<CrisisCenterContactsRoute>(path: 'contacts/crisis-center'),
  TypedGoRoute<ChatContactsRoute>(path: 'contacts/chat'),
  TypedGoRoute<UniversityContactsRoute>(path: 'contacts/universities'),
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
  TypedGoRoute<EatingDisorderTipsRemorseAppRoute>(
    path: 'home/eating-disorder/tips/remorse',
  ),
  TypedGoRoute<EatingDisorderTipsOvereatAppRoute>(path: 'home/eating-disorder/tips/overeat'),
  TypedGoRoute<EatingDisorderTipsVomitAppRoute>(path: 'home/eating-disorder/tips/vomit'),
  TypedGoRoute<EatingDisorderTipsFailAppRoute>(path: 'home/eating-disorder/tips/fail'),
  TypedGoRoute<EatingDisorderTipsGeneralAppRoute>(path: 'home/eating-disorder/tips/general'),
];

const _myRecordsRoutes = <TypedGoRoute<GoRouteData>>[
  TypedGoRoute<MyRecordsRoute>(path: 'home/my-records'),
  TypedGoRoute<MoodTrackRoute>(path: 'home/my-records/mood-track'),
  TypedGoRoute<MyRecordsSleepTrackRoute>(path: 'home/my-records/sleep-track'),
  TypedGoRoute<MyRecordsDiaryRecordsRoute>(path: 'home/my-records/diary'),
  TypedGoRoute<MyRecordsDiaryAddRoute>(path: 'home/my-records/diary/add'),
  TypedGoRoute<MyRecordsDiaryDetailRoute>(path: 'home/my-records/diary/detail'),
  TypedGoRoute<MyRecordsDiaryEditRoute>(path: 'home/my-records/diary/edit'),
];
