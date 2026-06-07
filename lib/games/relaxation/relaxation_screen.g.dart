// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relaxation_screen.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$relaxationRoute];

RouteBase get $relaxationRoute => GoRouteData.$route(
  path: '/games/relaxation/:relaxationType',
  factory: $RelaxationRoute._fromState,
);

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

extension<T extends Enum> on Map<T, String> {
  T? _$fromName(String? value) =>
      entries.where((element) => element.value == value).firstOrNull?.key;
}
