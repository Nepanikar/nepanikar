// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breathing_game_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$breathingGameRoute];

RouteBase get $breathingGameRoute => GoRouteData.$route(
  path: '/games/breathing/:shape',
  factory: $BreathingGameRoute._fromState,
);

mixin $BreathingGameRoute on GoRouteData {
  static BreathingGameRoute _fromState(GoRouterState state) =>
      BreathingGameRoute(
        shape: _$BreathingGameShapeEnumMap._$fromName(
          state.pathParameters['shape']!,
        )!,
        preset: state.uri.queryParameters['preset'],
      );

  BreathingGameRoute get _self => this as BreathingGameRoute;

  @override
  String get location => GoRouteData.$location(
    '/games/breathing/${Uri.encodeComponent(_$BreathingGameShapeEnumMap[_self.shape]!)}',
    queryParams: {
      if (_self.preset != null) 'preset': _self.preset!,
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

const _$BreathingGameShapeEnumMap = {
  BreathingGameShape.circle: 'circle',
  BreathingGameShape.square: 'square',
  BreathingGameShape.triangle: 'triangle',
};

extension<T extends Enum> on Map<T, String> {
  T? _$fromName(String? value) =>
      entries.where((element) => element.value == value).firstOrNull?.key;
}
