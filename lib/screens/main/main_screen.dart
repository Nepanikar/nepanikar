import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/providers/mood_state_provider.dart';
import 'package:nepanikar/screens/bpd_programme/bpd_landing_screen.dart';
import 'package:nepanikar/screens/home/my_records/my_records_screen.dart';
import 'package:nepanikar/screens/main/contacts_screen.dart';
import 'package:nepanikar/screens/main/home_screen.dart';
import 'package:nepanikar/screens/main/settings_screen.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/utils/contacts_data_manager.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/bottom_navbar_item.dart';
import 'package:nepanikar/widgets/notifications/notification_opt_in_dialog.dart';
import 'package:provider/provider.dart';

class MainPageExtra {
  MainPageExtra({required this.initIndex});
  int initIndex;
}

/// Index of the DBT tab within [mainTabs].
///
/// Tab indices are also route indices and are what `MainPageExtra.initIndex`
/// means, so they must not shift when a tab is hidden.
const bpdTabIndex = 2;

/// Every tab, in bar order. Index == the value `MainPageExtra.initIndex` takes.
const mainTabs = [0, 1, bpdTabIndex, 3, 4];

/// The bar as seen before the DBT programme is unlocked.
const tabsWithoutBpd = [0, 1, 3, 4];

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, this.extra});

  final MainPageExtra? extra;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  bool isDarkMode = false;

  ContactsDataManager get _contactsDataManager => registry.get<ContactsDataManager>();

  DatabaseService get _databaseService => registry.get<DatabaseService>();

  UserSettingsDao get _userSettingsDao => registry.get<UserSettingsDao>();

  List<Widget> get _routes {
    final locale = _userSettingsDao.locale;
    final countryContacts = _contactsDataManager.getContactsFromLocale(locale);
    return <Widget>[
      const HomeScreen(),
      const MyRecordsScreen(showBottomNavbar: false),
      _BpdLandingNavigator(onDismissed: _leaveBpdTab),
      ContactsScreen(countryContacts: countryContacts),
      const SettingsScreen(),
    ];
  }

  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
    final moodState = Provider.of<MoodState>(context, listen: false);
    moodState.init();
    setState(() {
      _selectedIndex = widget.extra?.initIndex ?? _selectedIndex;
    });
    // Offer notifications only once the first frame is up: asking over a splash
    // screen gives the person nothing to judge the request against, and the OS
    // grants a single chance to ask (see maybeOfferNotifications).
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) unawaited(maybeOfferNotifications(context));
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _databaseService.checkDataPreloaded(context.l10n);

    setState(() {
      _selectedIndex = widget.extra?.initIndex ?? _selectedIndex;
    });
  }

  @override
  void didUpdateWidget(covariant MainScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // When we're navigated back to `/` with a new target tab (e.g. exiting the
    // DBT programme), this State is preserved, so react to the changed `extra`
    // here — otherwise we'd stay on the stale tab.
    final newIndex = widget.extra?.initIndex;
    if (newIndex != null && newIndex != oldWidget.extra?.initIndex) {
      setState(() {
        _selectedIndex = newIndex;
      });
    }
  }

  /// Leaves the DBT tab once its landing screen is dismissed.
  ///
  /// Home, rather than the tab they came from, because that is where the
  /// landing screen's own "Možná později" and the programme's exit button go.
  void _leaveBpdTab() {
    if (_selectedIndex == bpdTabIndex) _onItemTapped(0);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem _navItem(BuildContext context, int tab, int selected) {
    final isSelected = tab == selected;
    switch (tab) {
      case bpdTabIndex:
        return buildBottomNavigationBarItem(
          svgIconPath: Assets.icons.calendarEvent.path,
          label: 'DBT',
          isSelected: isSelected,
          context: context,
        );
      case 1:
        return buildBottomNavigationBarItem(
          svgIconPath: Assets.icons.calendarEvent.path,
          label: context.l10n.records,
          isSelected: isSelected,
          context: context,
        );
      case 3:
        return buildBottomNavigationBarItem(
          svgIconPath: Assets.icons.phone.path,
          label: context.l10n.contacts_module,
          isSelected: isSelected,
          context: context,
        );
      case 4:
        return buildBottomNavigationBarItem(
          svgIconPath: Assets.icons.settings.path,
          label: context.l10n.settings,
          isSelected: isSelected,
          context: context,
        );
      default:
        return buildBottomNavigationBarItem(
          svgIconPath: Assets.icons.home.path,
          label: context.l10n.home,
          isSelected: isSelected,
          context: context,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return StreamBuilder<bool>(
      stream: _userSettingsDao.bpdProgrammeUnlockedStream,
      builder: (context, snapshot) {
        // The DBT programme is a closed pilot, so its tab is absent until the
        // access code is entered. Route indices stay fixed either way — every
        // `MainPageExtra(initIndex:)` in the app is written against them — and
        // only which of them are shown changes.
        final visibleTabs = (snapshot.data ?? false) ? mainTabs : tabsWithoutBpd;
        // A stale initIndex pointing at the hidden tab must not strand anyone
        // on a blank screen.
        final selected = visibleTabs.contains(_selectedIndex) ? _selectedIndex : 0;

        return Scaffold(
          body: _routes.elementAt(selected),
          bottomNavigationBar: BottomNavigationBar(
            items: [for (final tab in visibleTabs) _navItem(context, tab, selected)],
            currentIndex: visibleTabs.indexOf(selected),
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            onTap: (visibleIndex) => _onItemTapped(visibleTabs[visibleIndex]),
          ),
        );
      },
    );
  }
}

/// The DBT tab's body.
///
/// The tab has no screen of its own — it opens the landing screen full-screen,
/// over the bottom bar — so this is only ever what sits behind it.
class _BpdLandingNavigator extends StatefulWidget {
  const _BpdLandingNavigator({required this.onDismissed});

  /// Called once the landing screen has left the stack.
  ///
  /// Without it, coming back (back gesture, system back button) leaves the
  /// person on the spinner below with no way out: the tab is still selected
  /// and `_hasNavigated` has latched, so nothing pushes again.
  final VoidCallback onDismissed;

  @override
  State<_BpdLandingNavigator> createState() => _BpdLandingNavigatorState();
}

class _BpdLandingNavigatorState extends State<_BpdLandingNavigator> {
  bool _hasNavigated = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_hasNavigated) {
      _hasNavigated = true;
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (!mounted) return;
        await context.push(const BpdLandingScreenRoute().location);
        // This also completes when the landing screen leaves via "Začít svou
        // cestu", which replaces the stack. Harmless: the tab it hands back to
        // is hidden under the weeks screen, and is the one the programme's own
        // exit returns to anyway.
        if (mounted) widget.onDismissed();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
