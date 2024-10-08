import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/app/theme/fonts.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/utils/contacts_data_manager.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/contacts/region_item_contacts_list.dart';
import 'package:nepanikar/widgets/nepanikar_dropdown.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';
import 'package:nepanikar_contacts_gen/nepanikar_contacts_gen.dart';

class UniversityContactsRoute extends GoRouteData {
  const UniversityContactsRoute();

  ContactsDataManager get _contactsManager => registry.get<ContactsDataManager>();

  UserSettingsDao get _userSettingsDao => registry.get<UserSettingsDao>();

  @override
  Widget build(BuildContext context, _) {
    final locale = _userSettingsDao.locale;
    final universityRegionContacts =
        _contactsManager.getContactsFromLocale(locale).universityRegionContacts;
    return RegionContactsScreen(
      appBarTitle: context.l10n.universities,
      appBarDescription: context.l10n.university_contacts_description,
      regionContacts: universityRegionContacts ?? [],
    );
  }
}

class CrisisCenterContactsRoute extends GoRouteData {
  const CrisisCenterContactsRoute();

  ContactsDataManager get _contactsManager => registry.get<ContactsDataManager>();

  UserSettingsDao get _userSettingsDao => registry.get<UserSettingsDao>();

  @override
  Widget build(BuildContext context, _) {
    final locale = _userSettingsDao.locale;
    final crisisCenterRegionContacts =
        _contactsManager.getContactsFromLocale(locale).crisisCenterContacts;
    return RegionContactsScreen(
      appBarTitle: context.l10n.center,
      appBarDescription: context.l10n.crisis_centers_description,
      regionContacts: crisisCenterRegionContacts ?? [],
    );
  }
}

class RegionContactsScreen extends StatefulWidget {
  const RegionContactsScreen({
    super.key,
    required this.appBarTitle,
    required this.appBarDescription,
    required this.regionContacts,
  });

  final String appBarTitle;
  final String appBarDescription;
  final List<RegionContact> regionContacts;

  @override
  State<RegionContactsScreen> createState() => _RegionContactsScreenState();
}

class _RegionContactsScreenState extends State<RegionContactsScreen> {
  RegionContact? _activeDropdownMenuItem;

  @override
  void initState() {
    super.initState();
    _activeDropdownMenuItem = widget.regionContacts.firstOrNull;
  }

  void _onDropdownMenuItemSelected(RegionContact item) {
    if (item != _activeDropdownMenuItem) {
      setState(() {
        _activeDropdownMenuItem = item;
      });
    }
  }

  Widget _buildRegionHeader(String header, Color? textColor) {
    return Text(
      header,
      style: NepanikarFonts.title2.copyWith(
        fontWeight: FontWeight.w900,
        color: textColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textColor = textColorBasedOnDarkMode(context);
    return NepanikarScreenWrapper(
      appBarTitle: widget.appBarTitle,
      isModuleList: false,
      appBarDescription: widget.appBarDescription,
      isCardStackLayout: true,
      children: [
        if (widget.regionContacts.length > 1) ...[
          Text(
            context.l10n.select_region_dropdown_label,
            style: NepanikarFonts.bodySmallMedium.copyWith(
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
          const SizedBox(height: 5),
          NepanikarDropdown<RegionContact>.outlined(
            activeItem: _activeDropdownMenuItem,
            expand: true,
            items: widget.regionContacts,
            labelBuilder: (item) => item.region,
            onPick: _onDropdownMenuItemSelected,
          ),
        ],
        if (_activeDropdownMenuItem != null) ...[
          if (widget.regionContacts.length > 1) ...[
            const SizedBox(height: 20),
            _buildRegionHeader(
              _activeDropdownMenuItem!.region,
              textColor,
            ),
          ],
          ..._activeDropdownMenuItem!.contacts.map(
            (u) => Padding(
              padding: const EdgeInsets.only(top: 18),
              child: RegionItemContactsList(regionItemContact: u),
            ),
          ),
        ],
        const SizedBox(height: 6),
      ],
    );
  }
}
