import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nepanikar/app/generated/assets.gen.dart';
import 'package:nepanikar/app/l10n/ext.dart';
import 'package:nepanikar/helpers/color_helpers.dart';
import 'package:nepanikar/screens/contacts/eating_disorder_contacts_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/eating_disorder_distractions_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/eating_disorder_samples_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/eating_disorder_tasks_screen.dart';
import 'package:nepanikar/screens/home/eating_disorder/eating_disorder_tips_screen.dart';
import 'package:nepanikar/screens/home/my_records/food_records/my_records_food_records_list_screen.dart';
import 'package:nepanikar/services/db/user_settings/user_settings_dao.dart';
import 'package:nepanikar/utils/contacts_data_manager.dart';
import 'package:nepanikar/utils/registry.dart';
import 'package:nepanikar/widgets/long_tile.dart';
import 'package:nepanikar/widgets/nepanikar_screen_wrapper.dart';
part 'eating_disorder_screen.g.dart';

@TypedGoRoute<EatingDisorderRoute>(path: '/home/eating-disorder')
class EatingDisorderRoute extends GoRouteData with $EatingDisorderRoute {
  const EatingDisorderRoute();

  ContactsDataManager get _contactsManager =>
      registry.get<ContactsDataManager>();

  UserSettingsDao get _userSettingsDao => registry.get<UserSettingsDao>();

  @override
  Widget build(BuildContext context, _) {
    final locale = _userSettingsDao.locale;
    final eatingDisorderContacts = _contactsManager
        .getContactsFromLocale(locale)
        .eatingDisorderContacts;
    return EatingDisorderScreen(
      shouldShowContactsTile: eatingDisorderContacts != null,
    );
  }
}

class EatingDisorderScreen extends StatelessWidget {
  const EatingDisorderScreen({super.key, required this.shouldShowContactsTile});

  final bool shouldShowContactsTile;

  @override
  Widget build(BuildContext context) {
    svgColorBasedOnDarkMode(context);
    final colorFilter = svgColorFilterBasedOnDarkMode(context);

    final modules = <Widget>[
      LongTile(
        text: context.l10n.food_tips,
        image: Assets.illustrations.modules.eatingTips.svg(
          colorFilter: colorFilter,
        ),
        onTap: () => context.push(const EatingDisorderTipsRoute().location),
      ),
      LongTile(
        text: context.l10n.food_tasks,
        image: Assets.illustrations.modules.homework.svg(
          colorFilter: colorFilter,
        ),
        onTap: () => context.push(const EatingDisorderTasksRoute().location),
      ),
      LongTile(
        text: context.l10n.food_dishes,
        image: Assets.illustrations.modules.eatingDisorder.svg(
          colorFilter: colorFilter,
        ),
        onTap: () => context.push(const EatingDisorderSamplesRoute().location),
      ),
      LongTile(
        text: context.l10n.distraction,
        image: Assets.illustrations.games.math.math.svg(
          colorFilter: colorFilter,
        ),
        onTap: () =>
            context.push(const EatingDisorderDistractionsRoute().location),
      ),
      if (shouldShowContactsTile)
        LongTile(
          text: context.l10n.food_contact,
          image: Assets.illustrations.contacts.phones.svg(
            colorFilter: colorFilter,
          ),
          onTap: () =>
              context.push(const EatingDisorderContactsRoute().location),
        ),
      LongTile(
        text: context.l10n.food_records,
        image: Assets.illustrations.modules.foodTracker.svg(
          colorFilter: colorFilter,
        ),
        onTap: () =>
            context.push(const MyRecordsFoodRecordsListRoute().location),
      ),
    ];
    return NepanikarScreenWrapper(
      appBarTitle: context.l10n.food,
      showBottomNavbar: true,
      children: modules,
    );
  }
}
