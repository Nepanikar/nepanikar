import 'package:go_router/go_router.dart';
import 'package:health/health.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';
import 'package:nepanikar/services/health/health_service.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_button.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';

part 'health_data_screen.g.dart';

@TypedGoRoute<HealthDataRoute>(path: '/health-data')
class HealthDataRoute extends GoRouteData with $HealthDataRoute {
  const HealthDataRoute();

  @override
  Widget build(BuildContext context, _) => const HealthDataScreen();
}

class HealthDataScreen extends StatefulWidget {
  const HealthDataScreen({super.key});

  @override
  State<HealthDataScreen> createState() => _HealthDataScreenState();
}

enum _PageState {
  checkingSdkStatus,
  sdkUnavailableProviderUpdateRequired,
  sdkUnavailable,
  retryingSdkStatus,
  checkingPermissions,
  requestingPermissions,
  permissionsGranted,
  permissionsDenied,
}

class _HealthDataScreenState extends State<HealthDataScreen> {
  HealthService get _healthService => registry.get<HealthService>();

  late final AppLifecycleListener _appLifecycleListener;
  _PageState _pageState = _PageState.checkingSdkStatus;
  bool _permissionsRequested = false;
  bool _isLoading = false;
  final Map<HealthDataType, Future<HealthDataPoint?>> _latestHealthData = {};

  @override
  void initState() {
    super.initState();
    _appLifecycleListener = AppLifecycleListener(
      onResume: () {
        _load();
      },
    );
    _load();
  }

  @override
  void dispose() {
    _appLifecycleListener.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    if (_isLoading) return;
    _isLoading = true;

    final HealthConnectSdkStatus? healthConnectSdkStatus = await _healthService.health
        .getHealthConnectSdkStatus();
    if (!mounted) return;

    switch (healthConnectSdkStatus) {
      case null:
        setState(() {
          _pageState = _PageState.retryingSdkStatus;
        });

      case HealthConnectSdkStatus.sdkUnavailableProviderUpdateRequired:
        setState(() {
          _pageState = _PageState.sdkUnavailableProviderUpdateRequired;
        });
      case HealthConnectSdkStatus.sdkUnavailable:
        setState(() {
          _pageState = _PageState.sdkUnavailable;
        });
      case HealthConnectSdkStatus.sdkAvailable:
        setState(() {
          _pageState = _PageState.checkingPermissions;
        });
        final bool? permissions = await _healthService.hasPermissions();
        if (!mounted) return;

        if (permissions == true) {
          setState(() {
            _pageState = _PageState.permissionsGranted;
          });
        } else if (!_permissionsRequested) {
          setState(() {
            _pageState = _PageState.requestingPermissions;
          });

          _permissionsRequested = true;
          final bool granted = await _healthService.requestAuthorization();
          if (!mounted) return;
          setState(() {
            _pageState = granted ? _PageState.permissionsGranted : _PageState.permissionsDenied;
          });
        } else {
          setState(() {
            _pageState = _PageState.permissionsDenied;
          });
        }
    }

    if (_pageState == _PageState.permissionsGranted) {
      setState(() {
        // _latestHealthData.clear();
        for (final type in HealthService.types) {
          _latestHealthData[type] = _healthService.getLatestHealthData(type);
        }
      });
    }

    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return NepanikarScreenWrapper(
      appBarTitle: 'Health Data',
      children: [
        switch (_pageState) {
          _PageState.checkingSdkStatus => const Text('Checking Health Connect SDK status...'),
          _PageState.sdkUnavailableProviderUpdateRequired => NepanikarButton.async(
            onTapAsync: () async {
              await _healthService.health.installHealthConnect();
              return await _load();
            },
            text: 'Install Health Connect',
          ),
          _PageState.sdkUnavailable => const Text(
            'Health Connect SDK is not available on this device.',
          ),
          // _PageState.sdkAvailable => const Text(
          //   'Health Connect SDK is available and ready to use.',
          // ),
          _PageState.retryingSdkStatus => Column(
            children: [
              const Text('Unable to determine Health Connect SDK status. Try again?'),
              NepanikarButton.async(onTapAsync: _load, text: 'Retry'),
            ],
          ),
          _PageState.requestingPermissions => const Text('Requesting permissions...'),
          _PageState.permissionsGranted => Column(
            children: HealthService.types.map((type) {
              return _buildDataRow(type);
            }).toList(),
          ),
          _PageState.permissionsDenied => const Text(
            'Permissions denied. You cannot access health data.',
          ),
          // TODO: Handle this case.
          _PageState.checkingPermissions => const Text('Checking permissions...'),
        },
      ],
    );
  }

  Widget _buildDataRow(HealthDataType type) {
    return FutureBuilder<HealthDataPoint?>(
      future: _latestHealthData[type],
      builder: (context, snapshot) {
        final String description;
        if (snapshot.connectionState != ConnectionState.done) {
          description = 'Loading...';
        } else if (snapshot.hasError) {
          description = 'Error: ${snapshot.error}';
        } else if (snapshot.data == null) {
          description = 'No data';
        } else {
          final point = snapshot.data!;
          description =
              '${_formatValue(point)} at ${_formatDate(context, point.dateTo)} \n (${point.sourceName})';
        }
        return LongTile(
          text: type.name,
          description: description,
          image: null,
          onTap: null,
          trailing: const SizedBox.shrink(), // hides the default arrow: these rows aren't tappable
        );
      },
    );
  }

  String _formatValue(HealthDataPoint point) => switch (point.value) {
    NumericHealthValue(:final numericValue) =>
      '${numericValue.toStringAsFixed(numericValue % 1 == 0 ? 0 : 1)} ${point.unitString}',
    NutritionHealthValue(:final calories, :final name) =>
      '${name ?? 'meal'}: ${calories ?? '?'} kcal',
    MenstruationFlowHealthValue(:final flow) => flow?.name ?? 'unknown',
    SkinTemperatureHealthValue(:final temperatureDelta) =>
      '${temperatureDelta >= 0 ? '+' : ''}$temperatureDelta °C vs baseline',
    final other => other.toString(),
  };

  String _formatDate(BuildContext context, DateTime date) {
    final locale = Localizations.localeOf(context).languageCode;
    return DateFormat.yMd(locale).add_Hm().format(date);
  }
}
