import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/providers/mood_state_provider.dart';
import 'package:nepanikar/screens/home/my_records/my_records_screen.dart';
import 'package:nepanikar/screens/main/contacts_screen.dart';
import 'package:nepanikar/screens/main/home_screen.dart';
import 'package:nepanikar/screens/main/settings_screen.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/utils/contacts_data_manager.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/bottom_navbar_item.dart';
import 'package:provider/provider.dart';


class MainPageExtra {
  MainPageExtra({
    required this.initIndex,
  });
  int initIndex;
}

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
      const MyRecordsScreen(
        showBottomNavbar: false,
      ),
      ContactsScreen(countryContacts: countryContacts),
      const SettingsScreen()
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
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _databaseService.checkDataPreloaded(context.l10n);

    setState(() {
      _selectedIndex = widget.extra?.initIndex ?? _selectedIndex;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<SvgPicture> bottomNavigationIcons =[
    SvgPicture.asset(
      Assets.icons.home.path,

    ),
  ];



  @override
  Widget build(BuildContext context) {
    isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: _routes.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          buildBottomNavigationBarItem(
            svgIconPath: Assets.icons.home.path,
            label: context.l10n.home,
            isSelected: _selectedIndex == 0,
            isDarkMode: isDarkMode,
          ),
          buildBottomNavigationBarItem(
            svgIconPath: Assets.icons.calendarEvent.path,
            label: context.l10n.records,
            isSelected: _selectedIndex == 1,
            isDarkMode: isDarkMode,
          ),
          buildBottomNavigationBarItem(
            svgIconPath: Assets.icons.phone.path,
            label: context.l10n.contacts_module,
            isSelected: _selectedIndex == 2,
            isDarkMode: isDarkMode,
          ),
          buildBottomNavigationBarItem(
            svgIconPath: Assets.icons.settings.path,
            label: context.l10n.settings,
            isSelected: _selectedIndex == 3,
            isDarkMode: isDarkMode,
          ),
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        onTap: _onItemTapped,
      ),
    );
  }
}
