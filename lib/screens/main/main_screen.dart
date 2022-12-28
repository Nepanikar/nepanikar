import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/colors.dart';
import 'package:nepanikar/screens/home/my_records/my_records_screen.dart';
import 'package:nepanikar/screens/main/contacts_screen.dart';
import 'package:nepanikar/screens/main/home_screen.dart';
import 'package:nepanikar/screens/main/settings_screen.dart';
import 'package:nepanikar/services/db/database_service.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/utils/contacts_data_manager.dart';
import 'package:nepanikar/utils/registry.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  ContactsDataManager get _contactsDataManager => registry.get<ContactsDataManager>();

  DatabaseService get _databaseService => registry.get<DatabaseService>();

  UserSettingsDao get _userSettingsDao => registry.get<UserSettingsDao>();

  List<Widget> get _routes {
    final locale = _userSettingsDao.locale;
    final countryContacts = _contactsDataManager.getContactsFromLocale(locale);
    return <Widget>[
      HomeScreen(showQuickHelpButton: countryContacts.phoneContacts != null),
      const MyRecordsScreen(),
      ContactsScreen(countryContacts: countryContacts),
      const SettingsScreen()
    ];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _databaseService.checkDataPreloaded(context.l10n);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required bool isSelected,
    required String svgIconPath,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: SvgPicture.asset(
              Assets.icons.marker.path,
              color: isSelected ? NepanikarColors.primarySwatch.shade800 : Colors.transparent,
            ),
          ),
          SvgPicture.asset(
            svgIconPath,
            color: isSelected
                ? NepanikarColors.primarySwatch.shade800
                : NepanikarColors.primarySwatch.shade700,
          ),
        ],
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _routes.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          _buildBottomNavigationBarItem(
            svgIconPath: Assets.icons.home.path,
            label: context.l10n.home,
            isSelected: _selectedIndex == 0,
          ),
          _buildBottomNavigationBarItem(
            svgIconPath: Assets.icons.calendarEvent.path,
            // TODO: l10n
            label: 'Záznamy',
            isSelected: _selectedIndex == 1,
          ),
          _buildBottomNavigationBarItem(
            svgIconPath: Assets.icons.phone.path,
            label: 'Kontakty',
            isSelected: _selectedIndex == 2,
          ),
          _buildBottomNavigationBarItem(
            svgIconPath: Assets.icons.settings.path,
            label: 'Nastavení',
            isSelected: _selectedIndex == 3,
          ),
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xAAFAF4FF),
        elevation: 0,
        selectedItemColor: NepanikarColors.primarySwatch.shade800,
        unselectedItemColor: NepanikarColors.primarySwatch.shade700,
        onTap: _onItemTapped,
      ),
    );
  }
}
