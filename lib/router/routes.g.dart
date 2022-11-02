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
          path: 'home/relaxation',
          factory: $RelaxationRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home/relaxation/mood-track',
          factory: $MoodTrackRouteExtension._fromState,
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

extension $RelaxationRouteExtension on RelaxationRoute {
  static RelaxationRoute _fromState(GoRouterState state) =>
      const RelaxationRoute();

  String get location => GoRouteData.$location(
        '/home/relaxation',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

extension $MoodTrackRouteExtension on MoodTrackRoute {
  static MoodTrackRoute _fromState(GoRouterState state) =>
      const MoodTrackRoute();

  String get location => GoRouteData.$location(
        '/home/relaxation/mood-track',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}
