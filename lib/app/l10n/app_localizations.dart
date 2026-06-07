import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('cs'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fi'),
    Locale('fr'),
    Locale('hi'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('nb'),
    Locale('pl'),
    Locale('pt'),
    Locale('ru'),
    Locale('sk'),
    Locale('sv'),
    Locale('tr'),
    Locale('uk'),
  ];

  /// No description provided for @about_app.
  ///
  /// In cs, this message translates to:
  /// **'O aplikaci'**
  String get about_app;

  /// No description provided for @about_app_text.
  ///
  /// In cs, this message translates to:
  /// **'Aplikace Nepanikař slouží jako pomocný nástroj první pomoci při psychických problémech, jako jsou například deprese či panika.  Cílem aplikace není nahradit lékařskou péči, pouze pomoci zmírnit příznaky. V případě zhoršení stavu je nutné vyhledat odbornou pomoc. Pokud Ti aplikace nepomáhá či si nejsi jistý/á jejím významem pro Tvůj stav, konzultuj její používání s Tvým lékařem.'**
  String get about_app_text;

  /// No description provided for @activity_hint_text.
  ///
  /// In cs, this message translates to:
  /// **'Aktivita'**
  String get activity_hint_text;

  /// No description provided for @add_a_new_emotion.
  ///
  /// In cs, this message translates to:
  /// **'Přidat novou emoci'**
  String get add_a_new_emotion;

  /// No description provided for @add_item.
  ///
  /// In cs, this message translates to:
  /// **'Přidat položku'**
  String get add_item;

  /// No description provided for @answer.
  ///
  /// In cs, this message translates to:
  /// **'Odpověď'**
  String get answer;

  /// No description provided for @anxiety_panic.
  ///
  /// In cs, this message translates to:
  /// **'Úzkost a panika'**
  String get anxiety_panic;

  /// No description provided for @app_name.
  ///
  /// In cs, this message translates to:
  /// **'Nepanikař'**
  String get app_name;

  /// No description provided for @audio_progress_announce.
  ///
  /// In cs, this message translates to:
  /// **'Zatím přehráno'**
  String get audio_progress_announce;

  /// No description provided for @audio_total_announce.
  ///
  /// In cs, this message translates to:
  /// **'Celková délka'**
  String get audio_total_announce;

  /// No description provided for @balance_game_instructions.
  ///
  /// In cs, this message translates to:
  /// **'Tvým úkolem je udržovat houpačku vyváženou klepáním na dvě krabičky na spodní straně obrazovky.'**
  String get balance_game_instructions;

  /// No description provided for @balloons_game_tip.
  ///
  /// In cs, this message translates to:
  /// **'Dotykem praskej pouze bílé balónky'**
  String get balloons_game_tip;

  /// No description provided for @breath.
  ///
  /// In cs, this message translates to:
  /// **'Dechová cvičení'**
  String get breath;

  /// No description provided for @breath_one.
  ///
  /// In cs, this message translates to:
  /// **'Dechové cvičení'**
  String get breath_one;

  /// No description provided for @breath_speed.
  ///
  /// In cs, this message translates to:
  /// **'Rychlost dechu'**
  String get breath_speed;

  /// No description provided for @breathe_hold.
  ///
  /// In cs, this message translates to:
  /// **'Zadržet dech'**
  String get breathe_hold;

  /// No description provided for @breathe_in.
  ///
  /// In cs, this message translates to:
  /// **'Nádech'**
  String get breathe_in;

  /// No description provided for @breathe_info.
  ///
  /// In cs, this message translates to:
  /// **'Posaď se a opři se o něco pevného'**
  String get breathe_info;

  /// No description provided for @breathe_out.
  ///
  /// In cs, this message translates to:
  /// **'Výdech'**
  String get breathe_out;

  /// No description provided for @breathe_slider.
  ///
  /// In cs, this message translates to:
  /// **'Rychlost dechu'**
  String get breathe_slider;

  /// No description provided for @breathing_exercise_i.
  ///
  /// In cs, this message translates to:
  /// **'Dechové cvičení I'**
  String get breathing_exercise_i;

  /// No description provided for @breathing_exercise_ii.
  ///
  /// In cs, this message translates to:
  /// **'Dechové cvičení II'**
  String get breathing_exercise_ii;

  /// No description provided for @breathing_exercise_iii.
  ///
  /// In cs, this message translates to:
  /// **'Dechové cvičení III'**
  String get breathing_exercise_iii;

  /// No description provided for @breathing_exercise_tip.
  ///
  /// In cs, this message translates to:
  /// **'Posaďte se a opřete se o něco pevného.'**
  String get breathing_exercise_tip;

  /// No description provided for @cancel.
  ///
  /// In cs, this message translates to:
  /// **'Zrušit'**
  String get cancel;

  /// No description provided for @center.
  ///
  /// In cs, this message translates to:
  /// **'Krizová centra'**
  String get center;

  /// No description provided for @chart_filter_custom.
  ///
  /// In cs, this message translates to:
  /// **'Vlastní'**
  String get chart_filter_custom;

  /// No description provided for @chart_filter_last_3_months.
  ///
  /// In cs, this message translates to:
  /// **'Poslední 3 měsíce'**
  String get chart_filter_last_3_months;

  /// No description provided for @chart_filter_last_6_months.
  ///
  /// In cs, this message translates to:
  /// **'Posledních 6 měsíců'**
  String get chart_filter_last_6_months;

  /// No description provided for @chart_filter_last_month.
  ///
  /// In cs, this message translates to:
  /// **'Poslední měsíc'**
  String get chart_filter_last_month;

  /// No description provided for @chart_filter_last_week.
  ///
  /// In cs, this message translates to:
  /// **'Poslední týden'**
  String get chart_filter_last_week;

  /// No description provided for @chat.
  ///
  /// In cs, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @chat_screen_description.
  ///
  /// In cs, this message translates to:
  /// **'K využívání chatových poraden je zapotřebí přístup k internetu.'**
  String get chat_screen_description;

  /// No description provided for @choose_a_color.
  ///
  /// In cs, this message translates to:
  /// **'Vyberte barvu'**
  String get choose_a_color;

  /// No description provided for @clear_all_button.
  ///
  /// In cs, this message translates to:
  /// **'Označit vše'**
  String get clear_all_button;

  /// No description provided for @clear_button.
  ///
  /// In cs, this message translates to:
  /// **'Smazat'**
  String get clear_button;

  /// No description provided for @clear_data.
  ///
  /// In cs, this message translates to:
  /// **'Smazat data'**
  String get clear_data;

  /// No description provided for @color_scheme.
  ///
  /// In cs, this message translates to:
  /// **'Barevné schéma'**
  String get color_scheme;

  /// No description provided for @confirm_delete.
  ///
  /// In cs, this message translates to:
  /// **'Jste si jisti, že chcete tento záznam nálady smazat?'**
  String get confirm_delete;

  /// No description provided for @contact_copied_snackbar.
  ///
  /// In cs, this message translates to:
  /// **'Kontakt byl zkopírován do schránky'**
  String get contact_copied_snackbar;

  /// No description provided for @contact_us.
  ///
  /// In cs, this message translates to:
  /// **'Kontaktuj nás'**
  String get contact_us;

  /// No description provided for @contact_us_text.
  ///
  /// In cs, this message translates to:
  /// **'Máš-li připomínky či dotazy k této aplikaci, kontaktuj nás na adrese &lt;a href=&quot;mailto:nepanikar.info@gmail.com&quot;&gt;nepanikar.info@gmail.com&lt;/a&gt;    '**
  String get contact_us_text;

  /// No description provided for @contacts.
  ///
  /// In cs, this message translates to:
  /// **'Kontakty na pomoc'**
  String get contacts;

  /// No description provided for @contacts_message.
  ///
  /// In cs, this message translates to:
  /// **'Krizová zpráva'**
  String get contacts_message;

  /// No description provided for @contacts_module.
  ///
  /// In cs, this message translates to:
  /// **'Kontakty'**
  String get contacts_module;

  /// No description provided for @counselling_email_subject.
  ///
  /// In cs, this message translates to:
  /// **'Pomoc z aplikace'**
  String get counselling_email_subject;

  /// No description provided for @crisis_centers_description.
  ///
  /// In cs, this message translates to:
  /// **'Krátkodobá péče, když se ocitneš v situaci, kterou nejsi schopný/á zvládnout sám/a.'**
  String get crisis_centers_description;

  /// No description provided for @custom_do.
  ///
  /// In cs, this message translates to:
  /// **'Co udělám...'**
  String get custom_do;

  /// No description provided for @custom_go.
  ///
  /// In cs, this message translates to:
  /// **'Kam půjdu...'**
  String get custom_go;

  /// No description provided for @custom_message.
  ///
  /// In cs, this message translates to:
  /// **'Text zprávy (nepovinné)'**
  String get custom_message;

  /// No description provided for @custom_ppl.
  ///
  /// In cs, this message translates to:
  /// **'Lidé, kterým na mě záleží'**
  String get custom_ppl;

  /// No description provided for @custom_theme.
  ///
  /// In cs, this message translates to:
  /// **'Nastavení barev'**
  String get custom_theme;

  /// No description provided for @custom_write.
  ///
  /// In cs, this message translates to:
  /// **'Komu napíšu...'**
  String get custom_write;

  /// No description provided for @custom_write_body.
  ///
  /// In cs, this message translates to:
  /// **'Ahoj, právě prožívám náročné období, můžeme si promluvit?'**
  String get custom_write_body;

  /// No description provided for @dark_mode.
  ///
  /// In cs, this message translates to:
  /// **'Tmavý režim'**
  String get dark_mode;

  /// No description provided for @dark_mode_off.
  ///
  /// In cs, this message translates to:
  /// **'Tmavý režim je VYPNUT'**
  String get dark_mode_off;

  /// No description provided for @dark_mode_on.
  ///
  /// In cs, this message translates to:
  /// **'Tmavý režim je ZAPNUT'**
  String get dark_mode_on;

  /// No description provided for @date_of_entry_label.
  ///
  /// In cs, this message translates to:
  /// **'Datum zápisu'**
  String get date_of_entry_label;

  /// No description provided for @date_of_note.
  ///
  /// In cs, this message translates to:
  /// **'Datum zápisu'**
  String get date_of_note;

  /// No description provided for @days.
  ///
  /// In cs, this message translates to:
  /// **'Dny'**
  String get days;

  /// No description provided for @default_reset.
  ///
  /// In cs, this message translates to:
  /// **'Výchozí'**
  String get default_reset;

  /// No description provided for @delete_data_description.
  ///
  /// In cs, this message translates to:
  /// **'Opravdu chcete smazat všechna data?'**
  String get delete_data_description;

  /// No description provided for @delete_data_title.
  ///
  /// In cs, this message translates to:
  /// **'Smazat data'**
  String get delete_data_title;

  /// No description provided for @delete_record.
  ///
  /// In cs, this message translates to:
  /// **'Smazat záznam'**
  String get delete_record;

  /// No description provided for @delete_success.
  ///
  /// In cs, this message translates to:
  /// **'Vaše data byla úspěšně smazaná.'**
  String get delete_success;

  /// No description provided for @depression.
  ///
  /// In cs, this message translates to:
  /// **'Deprese'**
  String get depression;

  /// No description provided for @depression_help.
  ///
  /// In cs, this message translates to:
  /// **'Co mi může pomoci'**
  String get depression_help;

  /// No description provided for @depression_mood.
  ///
  /// In cs, this message translates to:
  /// **'Sledování nálady'**
  String get depression_mood;

  /// No description provided for @depression_nice.
  ///
  /// In cs, this message translates to:
  /// **'Co mě potěšilo'**
  String get depression_nice;

  /// No description provided for @depression_nice_header.
  ///
  /// In cs, this message translates to:
  /// **'Zde mohu napsat, co mi dnes udělalo radost:'**
  String get depression_nice_header;

  /// No description provided for @depression_plan.
  ///
  /// In cs, this message translates to:
  /// **'Plánování aktivit'**
  String get depression_plan;

  /// No description provided for @depression_plan_header.
  ///
  /// In cs, this message translates to:
  /// **'Zde si napíšu, co všechno plánuji udělat:'**
  String get depression_plan_header;

  /// No description provided for @depression_praise.
  ///
  /// In cs, this message translates to:
  /// **'Moje úspěchy'**
  String get depression_praise;

  /// No description provided for @depression_praise_header.
  ///
  /// In cs, this message translates to:
  /// **'Zde si mohu napsat pochvalu za to, co se mi povedlo:'**
  String get depression_praise_header;

  /// No description provided for @depression_tips.
  ///
  /// In cs, this message translates to:
  /// **'Sportuj.\nVezmi si kolo a udělej si půlhodinovou vyjížďku.\nNebuď sám/a.\nNapiš nebo zavolej rodičům, partnerce, partnerovi, kamarádce, kamarádovi. Běž je navštívit.\nMedituj.\nPohodlně se posaď, zavři oči a zhluboka se párkrát nadechni. Poté nech myšlenky volně plynout.\nPřestaň kouřit, nepij alkohol.\nUvař si bylinkový nebo ovocný čaj.\nPromluv si s (školním) psychologem/terapeutem.\nDomluvte si schůzku v nejkratším termínu.\nPoslouchej. hudbu\nVytvoř si na mobilu play list oblíbených písniček a poslouchej je.\nSejdi se s kamarády.\nNapiš nebo zavolej kamarádovi/kamarádce a domluvte si setkání.\nSleduj oblíbený film.\nPodívej se na film, který máš rád/a nebo sleduj nejnovější videa na internetu.\nNapiš blízké osobě.\nNapiš osobě, které věříš a sděl jí, jak Ti je.\nKresli si.\nVezmi si omalovánky nebo si vytiskni mandalu a vymaluj ji.\nBěž si zacvičit.\nBěh, jízda na kole nebo delší procházka Ti může pomoci.\nRelaxuj.\nStáhni si do mobilu řízenou relaxaci, pusť si ji, lehni si na zem, uvolni se, zavři oči a relaxuj.\nZahraj si na hudební nástroj.\nZahraj si/zazpívej si skladbu od oblíbeného autora.\nČti si. \nPřečti si něco zajímavého, najdi knížku, časopis nebo článek na internetu.\nObejmi blízkou osobu.\nPomazli se s domácím mazlíčkem.'**
  String get depression_tips;

  /// No description provided for @describe_what_happened.
  ///
  /// In cs, this message translates to:
  /// **'Popiš, co se stalo...'**
  String get describe_what_happened;

  /// No description provided for @description.
  ///
  /// In cs, this message translates to:
  /// **'Popis'**
  String get description;

  /// No description provided for @diary.
  ///
  /// In cs, this message translates to:
  /// **'Deník'**
  String get diary;

  /// No description provided for @diary_add_appbar_title.
  ///
  /// In cs, this message translates to:
  /// **'Nový záznam'**
  String get diary_add_appbar_title;

  /// No description provided for @diary_description.
  ///
  /// In cs, this message translates to:
  /// **'Zapisuj si dosažené výsledky a posuny. Můžeš se kdykoliv k záznamům vrátit.'**
  String get diary_description;

  /// No description provided for @diary_detail_appbar_title.
  ///
  /// In cs, this message translates to:
  /// **'Detail záznamu'**
  String get diary_detail_appbar_title;

  /// No description provided for @diary_edit_appbar_title.
  ///
  /// In cs, this message translates to:
  /// **'Upravit záznam'**
  String get diary_edit_appbar_title;

  /// No description provided for @diary_empty.
  ///
  /// In cs, this message translates to:
  /// **'Zatím v deníku nemáš žádný záznam'**
  String get diary_empty;

  /// No description provided for @diary_record_date.
  ///
  /// In cs, this message translates to:
  /// **'Datum záznamu'**
  String get diary_record_date;

  /// No description provided for @distraction.
  ///
  /// In cs, this message translates to:
  /// **'Odvedení pozornosti'**
  String get distraction;

  /// No description provided for @eating_disorder_description.
  ///
  /// In cs, this message translates to:
  /// **'Zaznamenej si důvody, proč se chceš postavit poruchám příjmu potravy.'**
  String get eating_disorder_description;

  /// No description provided for @edit.
  ///
  /// In cs, this message translates to:
  /// **'Upravit'**
  String get edit;

  /// No description provided for @email_consultation.
  ///
  /// In cs, this message translates to:
  /// **'E-mailová poradna'**
  String get email_consultation;

  /// No description provided for @email_counselling_screen_description.
  ///
  /// In cs, this message translates to:
  /// **'Na Tvůj email odpovíme do 7 dní, odpověď ti přijde k Tobě do mailové schránky.'**
  String get email_counselling_screen_description;

  /// No description provided for @emergency_plan_description.
  ///
  /// In cs, this message translates to:
  /// **'Ve chvíli, kdy se cítíš lépe, si můžeš vyplnit svůj osobní záchranný plán, který budeš mít vždy po ruce. V těžkých chvílích Ti může pomoci.'**
  String get emergency_plan_description;

  /// No description provided for @emotion_angry.
  ///
  /// In cs, this message translates to:
  /// **'Rozzlobený'**
  String get emotion_angry;

  /// No description provided for @emotion_excited.
  ///
  /// In cs, this message translates to:
  /// **'Nadšený'**
  String get emotion_excited;

  /// No description provided for @emotion_happy.
  ///
  /// In cs, this message translates to:
  /// **'Šťastný'**
  String get emotion_happy;

  /// No description provided for @emotion_relaxed.
  ///
  /// In cs, this message translates to:
  /// **'Uvolněný'**
  String get emotion_relaxed;

  /// No description provided for @emotion_sad.
  ///
  /// In cs, this message translates to:
  /// **'Smutný'**
  String get emotion_sad;

  /// No description provided for @emotion_too_long.
  ///
  /// In cs, this message translates to:
  /// **'Emoce je příliš dlouhá (max. 12 znaků)'**
  String get emotion_too_long;

  /// No description provided for @emotions.
  ///
  /// In cs, this message translates to:
  /// **'Emoce'**
  String get emotions;

  /// No description provided for @enter_part_of_summary.
  ///
  /// In cs, this message translates to:
  /// **'Zadejte část souhrnu vašeho požadovaného souhrnu'**
  String get enter_part_of_summary;

  /// No description provided for @enter_summary.
  ///
  /// In cs, this message translates to:
  /// **'Zadejte krátké shrnutí'**
  String get enter_summary;

  /// No description provided for @exit.
  ///
  /// In cs, this message translates to:
  /// **'Ukončit'**
  String get exit;

  /// No description provided for @export_button.
  ///
  /// In cs, this message translates to:
  /// **'Export'**
  String get export_button;

  /// No description provided for @export_data.
  ///
  /// In cs, this message translates to:
  /// **'Export'**
  String get export_data;

  /// No description provided for @export_failed.
  ///
  /// In cs, this message translates to:
  /// **'Při exportování nastala chyba.'**
  String get export_failed;

  /// No description provided for @export_old_app_description.
  ///
  /// In cs, this message translates to:
  /// **'Pokud si některá svá data při přenosu do nové verze ztratil/a, zde je můžeš exportovat. Napiš nám na pomoc@nepanikar.eu a my Ti je pomůžeme obnovit.'**
  String get export_old_app_description;

  /// No description provided for @export_old_app_title.
  ///
  /// In cs, this message translates to:
  /// **'Export dat ze staré verze aplikace'**
  String get export_old_app_title;

  /// No description provided for @export_successful.
  ///
  /// In cs, this message translates to:
  /// **'Export byl úspěšný.'**
  String get export_successful;

  /// No description provided for @feeling_bad_do.
  ///
  /// In cs, this message translates to:
  /// **'Pokud se nebudu cítit dobře, zkusím udělat:'**
  String get feeling_bad_do;

  /// No description provided for @feeling_bad_go.
  ///
  /// In cs, this message translates to:
  /// **'Pokud se nebudu cítit dobře, půjdu:'**
  String get feeling_bad_go;

  /// No description provided for @feeling_bad_write.
  ///
  /// In cs, this message translates to:
  /// **'Pokud se nebudu cítit dobře, napíšu:'**
  String get feeling_bad_write;

  /// No description provided for @feeling_bad_write_body.
  ///
  /// In cs, this message translates to:
  /// **'Co napíšu:'**
  String get feeling_bad_write_body;

  /// No description provided for @filter_next_time_period.
  ///
  /// In cs, this message translates to:
  /// **'Další časové období'**
  String get filter_next_time_period;

  /// No description provided for @filter_previous_time_period.
  ///
  /// In cs, this message translates to:
  /// **'Předchozí časové období'**
  String get filter_previous_time_period;

  /// No description provided for @follow_us.
  ///
  /// In cs, this message translates to:
  /// **'Sledujte nás'**
  String get follow_us;

  /// No description provided for @food.
  ///
  /// In cs, this message translates to:
  /// **'Poruchy příjmu potravy'**
  String get food;

  /// No description provided for @food_afraid_header.
  ///
  /// In cs, this message translates to:
  /// **'Do tohoto seznamu si sepiš seznam “zakázaných“ potravin a každý týden jednu potravinu vyzkoušej a odškrtni si ji na seznamu.'**
  String get food_afraid_header;

  /// No description provided for @food_afraid_text.
  ///
  /// In cs, this message translates to:
  /// **'Jídla, kterých se bojím'**
  String get food_afraid_text;

  /// No description provided for @food_am_snack.
  ///
  /// In cs, this message translates to:
  /// **'Dopolední svačina'**
  String get food_am_snack;

  /// No description provided for @food_breakfast.
  ///
  /// In cs, this message translates to:
  /// **'Snídaně'**
  String get food_breakfast;

  /// No description provided for @food_challenge_text.
  ///
  /// In cs, this message translates to:
  /// **'Umím být a chci být na sebe hodná/ý.\nDnes si dopřeji velkou dávku optimismu, pozitivního myšlení a víry, že se všechno jednou obrátí k lepšímu.\nOde dneška budu dávat najevo své pocity, city a myšlenky.\nKaždou hodinu se pochválím za cokoliv, co mě napadne.\nDnes si napíšu svých vlastních dvacet cílů, kterých bych chtěl/a v životě dosáhnout.\nZaměřím se na jiné činnosti než jídlo, začnu hledat to, co by mi pomáhalo najít smysl života.\nPřestanu si nadávat, nebudu sama sebe před sebou ponižovat.\nPoděkuji všem, že mi pomáhají zvládat mé problémy.\nUvědomím si, co je pro mé tělo zdravé a dobré.\nDám najevo, že mi na někom záleží a že je pro mě důležitý.\nPokud už nemám odbornou pomoc, dnes si ji najdu.\nDnes odpočívám, protože vím, že je to pro mne dobré.\nUvědomím si, po čem toužím a co mi chybí.\nPoděkuji svým rodičům za to, že mne vychovali tak, abych si byl/a sám/sama sebou jist/jistá a s čistým svědomím mohl/a říct, že jsem čestný a slušný člověk.\nUvědomím si lidi, ke kterým si mohu přijít pro podporu a pochopení.\nZačátek dnešního dne oslavím vlastním mottem. Jaké to bude?\nDnes se nebudu bát se najíst. Co si dám?\nDnes se podělím o své starosti. Komu?\nDnes zkusím odpustit každému, o němž si myslím, že mi ublížil. Odpouštím i sama sobě\nOde dneška začnu hovořit o tom, jak se cítím, co mi vadí, co mě trápí.\nOdteď se nebudu bát svěřit s tím, že jsem unavený/á nebo že se mi nikam nechce.\nNaučím se říkat NE, pokud si NE budu myslet.\nZaložím si svůj milý deníček a budu si do něj zapisovat myšlenky a úspěchy v mé léčbě.\nNebudu tolerovat negativní a kritické poznámky, které ostatní říkají o hmotnosti kohokoliv jiného.\nNapíšu si, co jsem v životě dokázal/a.\nKe každému prstu své ruky mohu přiřadit přítele/přítelkyni, který/á mi bude oporou.'**
  String get food_challenge_text;

  /// No description provided for @food_choice.
  ///
  /// In cs, this message translates to:
  /// **'Výběr pokrmu'**
  String get food_choice;

  /// No description provided for @food_contact.
  ///
  /// In cs, this message translates to:
  /// **'Kontakty na pomoc'**
  String get food_contact;

  /// No description provided for @food_contact_text.
  ///
  /// In cs, this message translates to:
  /// **''**
  String get food_contact_text;

  /// No description provided for @food_creative_text.
  ///
  /// In cs, this message translates to:
  /// **'Namaluj, jak si představuješ anorexii a ten obrázek roztrhej\nSepiš dopis svému anorektickému já, ve kterém mu poděkuješ za lekci a rozluč se s ním\nSepiš si důvody, proč se chceš z toho dostat a co Ti v tom brání\nVytvoř si pořadače a roztřiď všechny papíry, sešity a časopisy, co máš na stole\nNauč se nějaký nový účes\nZkus se protáhnout a otestuj svou pružnost\nPřemýšlel/a jsi tetování? Jestli ano, tak do toho! Zajdi do lékárny, kup si henu na kůži a zkoušej, kde je to pravé místo!\nZkus si vytvořit památník z prázdnin/Vánoc/dovolené. Vytiskni fotky, kup třpytky a nálepky a potom už jen tvoř!\nCo takhle naučit se cizí jazyk nebo zlepšit ty, které už znáš? Na internetu je spoustu testů a slovíček, které určitě neznáš\nChtěl/a jsi někdy zkusit hrát na klavír, kytaru, flétnu nebo něco jiného? Proč ne? Najdi si učitele nebo se do toho vrhni sám/sama! Kup si kytaru a pomalu si k ní najdi cestu\nNauč se podle internetu složit origami z papíru\nNapiš krátké vyprávění tom, co hezkého jsi v životě zažil/a a chtěl/a bys to prožít znovu\nUdělej si nějakou novou dekoraci do pokoje'**
  String get food_creative_text;

  /// No description provided for @food_dinner.
  ///
  /// In cs, this message translates to:
  /// **'Večeře'**
  String get food_dinner;

  /// No description provided for @food_dishes.
  ///
  /// In cs, this message translates to:
  /// **'Ukázky jídelníčku'**
  String get food_dishes;

  /// No description provided for @food_dishes_am_snack.
  ///
  /// In cs, this message translates to:
  /// **'smoothie z banánu, borůvek a chia semínek\n        jahodový jogurt s piškoty'**
  String get food_dishes_am_snack;

  /// No description provided for @food_dishes_breakfast.
  ///
  /// In cs, this message translates to:
  /// **'ovesné vločky restované na másle s jablkem, ořechy, medem a skořicí, přelité bílým jogurtem\n        domácí müsli, čerstvé ovoce, bílý jogurt\n        míchaná vajíčka na jarní cibulce, bageta se semínky, rajčatový salát'**
  String get food_dishes_breakfast;

  /// No description provided for @food_dishes_dinner.
  ///
  /// In cs, this message translates to:
  /// **'grilovaný steak z lososa, zelenina a brambory v páře\n        pappardelle à la carbonara\n        hummus s rajčaty a pórkem, celozrnný žitný chléb\n        pečená zelenina s hoblinkami parmezánu, tmavý rohlík\n        vícezrnná bageta s tvarohovou pomazánkou a pažitkou, zelenina\n        chléb s pomazánkou a kvalitní šunkou, obloha\n        salát caprese z rajčat a mozzarelly, knäckebrotty\n        obložený talíř s vejcem, cereální kornspitz'**
  String get food_dishes_dinner;

  /// No description provided for @food_dishes_lunch.
  ///
  /// In cs, this message translates to:
  /// **'smažený řízek s bramborovým pyré, salát s naklíčenými luštěninami\n        těstoviny se zeleninou, jogurtový dresink, bazalka\n        grilované kuřecí maso, kuskus se zeleninou\n        dýňový krém\n        kuřecí vývar se zeleninou\n        minestrone'**
  String get food_dishes_lunch;

  /// No description provided for @food_dishes_pm_snack.
  ///
  /// In cs, this message translates to:
  /// **'ovoce s řeckým jogurtem, restovaná dýňová a slunečnicová semínka\n        tmavý toustový chléb, plátky sýra, zeleninová obloha\n        grilovaný banán na másle s rozmarýnem, jogurt\n        šlehaný tvaroh s medem a sušenými švestkami'**
  String get food_dishes_pm_snack;

  /// No description provided for @food_fail.
  ///
  /// In cs, this message translates to:
  /// **'Selhávám'**
  String get food_fail;

  /// No description provided for @food_fail_text.
  ///
  /// In cs, this message translates to:
  /// **'Netrestej se.\nMluv o svých myšlenkách s někým blízkým.\nUvědom si, že jde o proces a každá zvládnutá překážka Tě dělá silnějším.\nNapiš si své úspěchy, na které jsi opravdu pyšný/á.\nUvědom si, co jsi všechno již zvládl/zvládla.'**
  String get food_fail_text;

  /// No description provided for @food_figure.
  ///
  /// In cs, this message translates to:
  /// **'Postava'**
  String get food_figure;

  /// No description provided for @food_figure_text.
  ///
  /// In cs, this message translates to:
  /// **'Vždycky si mohu přidat, je to přirozené\nJídlo si vychutnávám\nNevadí, když nesním všechno, co mám na talíři a nechám to\nJídlo nám neslouží k neustálému přemýšlení o něm\nPřirozený pohyb mě naplňuje\nMoji hodnotu neurčuje číslo na váze\nStravuji se pravidelně a vyváženě\nMít hlad je normální a jíst je nutné\nJsou mnohokrát důležitější, ale i krásnější a hodnotnější věci na světě, než neustálé přemýšlení o jídle\nKrásný je člověk tím, jaký je, a ne tím, jestli má o 4 kg víc nebo míň\nNevzdávám se bez boje a přitom věřím ve své vlastní schopnosti\nNečekám, že to přejde samo od sebe\nVyhýbám se srovnávání s ostatními\nVšichni jsme jen lidé a máme právo na chyby, důležité je se z nich poučit\nPochopil/a jsem, že největším problémem je to, že jsem se v minulosti příliš věnoval/a tomu, jak vypadám a jak působím na své okolí\nVím, že potřebuji sílu pro budoucnost\nVím, že mám problém s jídlem, ale vím také, že největší část práce zaleží a je na mně\nPřísun živin je důležitý, mé tělo potřebuje výživu a péči, kterou mu nemohu odpírat\nJídlo, které za den sním, je různorodé\nNebojím se zeleniny, ovoce, pečiva ani masa\nVím, že to dokážu, že mám mnoho síly, ale také se učím přijmout fakt, že není hanbou požádat o pomoc, když mi docházejí síly\nSvé úspěchy i neúspěchy při léčbě poruchy příjmu potravy budu s někým sdílet\nMám řadu přátel, na které se mohu spolehnout\nNekupuji časopisy, které prosazují a podporují hubnutí\nChválím se za maličkosti\nUmím být dokonalý/á, skvělý/á, bezchybný/á a nemusím k tomu držet diety ani se trápit tím, jak vypadám\nNenechávám si jídlo až na večer, protože vím, že tehdy jsem nejzranitelnější a nejcitlivější k pocitům, že se mi nedaří\nNemusím mít dokonalé tělo, má duše je dokonalá tím, že je. A o tom, jak je tělo dokonalé, nikdo nemá právo rozhodovat. Natož za mě\nJsem šťastný/á ze vztahů, kterými jsem obklopen/a, a které jsem si vytvořil/a\nVšechno nemá logické vysvětlení\nVím komu zavolat, když mi nebude dobře\nNemusím se smát sedm dní v týdnu, je to přirozené\nMám právo se zlobit, když se mi nedaří\nJe v pořádku si říct o pomoc\nNejsem na to sám/sama'**
  String get food_figure_text;

  /// No description provided for @food_food_like_header.
  ///
  /// In cs, this message translates to:
  /// **'Sem si napíšu seznam jídel, které mám rád/a'**
  String get food_food_like_header;

  /// No description provided for @food_food_like_text.
  ///
  /// In cs, this message translates to:
  /// **' '**
  String get food_food_like_text;

  /// No description provided for @food_like_header.
  ///
  /// In cs, this message translates to:
  /// **'Sem si napíšu seznam věcí, které mám na sobe rád/a'**
  String get food_like_header;

  /// No description provided for @food_like_text.
  ///
  /// In cs, this message translates to:
  /// **' '**
  String get food_like_text;

  /// No description provided for @food_lunch.
  ///
  /// In cs, this message translates to:
  /// **'Oběd'**
  String get food_lunch;

  /// No description provided for @food_misc.
  ///
  /// In cs, this message translates to:
  /// **'Obecné'**
  String get food_misc;

  /// No description provided for @food_misc_text.
  ///
  /// In cs, this message translates to:
  /// **'Měj okolo sebe lidi, kteří stojí při Tobě\nMěj v zásobě kontakt na psychologa, psychiatra a nutričního terapeuta, psychoterapeuta\nNevzdávej se koníčků, které jsi měl/a rád/a\nJednou denně si procvič řízenou relaxaci\nPravidelně sportuj (ale pozor, všeho moc škodí)\nDodržuj pravidelný a dostatečně dlouhý spánek\nPiš si deník\nNajdi si někoho, s kým si budeš moci povídat\nNedívej se do zrcadla\nNestoupej si na váhu\nJez s někým, kdo Ti bude oporou\nSnaž se jíst pravidelně\nMysli na pitný režim'**
  String get food_misc_text;

  /// No description provided for @food_motivation_header.
  ///
  /// In cs, this message translates to:
  /// **'Vytvořím si seznam věcí, pro které chci být zdravý/á.'**
  String get food_motivation_header;

  /// No description provided for @food_motivation_text.
  ///
  /// In cs, this message translates to:
  /// **' '**
  String get food_motivation_text;

  /// No description provided for @food_overeat.
  ///
  /// In cs, this message translates to:
  /// **'Záchvat přejídání'**
  String get food_overeat;

  /// No description provided for @food_overeat_text.
  ///
  /// In cs, this message translates to:
  /// **'Uvědom si, že se blíží\nNesoustřeď se jen na jídlo, zkus se odreagovat hrou/počítáním v aplikaci\nJdi se projít\nZkus si nalakovat nehty\nDej si žvýkačku\nBěž do společnosti – nebuď sám/sama\nZavolej blízké osobě\nVezmi si papír a tužku a vypiš se ze svých pocitů'**
  String get food_overeat_text;

  /// No description provided for @food_pm_snack.
  ///
  /// In cs, this message translates to:
  /// **'Odpolední svačina'**
  String get food_pm_snack;

  /// No description provided for @food_problems_anger.
  ///
  /// In cs, this message translates to:
  /// **'hněv'**
  String get food_problems_anger;

  /// No description provided for @food_problems_anxiety.
  ///
  /// In cs, this message translates to:
  /// **'úzkost'**
  String get food_problems_anxiety;

  /// No description provided for @food_problems_anxiety_attack.
  ///
  /// In cs, this message translates to:
  /// **'úzkostná ataka'**
  String get food_problems_anxiety_attack;

  /// No description provided for @food_problems_disgusted.
  ///
  /// In cs, this message translates to:
  /// **'zhnusení'**
  String get food_problems_disgusted;

  /// No description provided for @food_problems_exercise.
  ///
  /// In cs, this message translates to:
  /// **'cvičení'**
  String get food_problems_exercise;

  /// No description provided for @food_problems_fear.
  ///
  /// In cs, this message translates to:
  /// **'strach'**
  String get food_problems_fear;

  /// No description provided for @food_problems_happy.
  ///
  /// In cs, this message translates to:
  /// **'štěstí'**
  String get food_problems_happy;

  /// No description provided for @food_problems_laxative.
  ///
  /// In cs, this message translates to:
  /// **'projímadlo'**
  String get food_problems_laxative;

  /// No description provided for @food_problems_proud.
  ///
  /// In cs, this message translates to:
  /// **'hrdost'**
  String get food_problems_proud;

  /// No description provided for @food_problems_sad.
  ///
  /// In cs, this message translates to:
  /// **'smutek'**
  String get food_problems_sad;

  /// No description provided for @food_problems_satisfied.
  ///
  /// In cs, this message translates to:
  /// **'spokojenost'**
  String get food_problems_satisfied;

  /// No description provided for @food_problems_self_harm.
  ///
  /// In cs, this message translates to:
  /// **'sebepoškozování'**
  String get food_problems_self_harm;

  /// No description provided for @food_problems_stress.
  ///
  /// In cs, this message translates to:
  /// **'stres'**
  String get food_problems_stress;

  /// No description provided for @food_problems_unsatisfied.
  ///
  /// In cs, this message translates to:
  /// **'nespokojenost'**
  String get food_problems_unsatisfied;

  /// No description provided for @food_problems_vomit.
  ///
  /// In cs, this message translates to:
  /// **'zvracení'**
  String get food_problems_vomit;

  /// No description provided for @food_record_feel.
  ///
  /// In cs, this message translates to:
  /// **'Jaké jsi měl/a pocity při jídle?'**
  String get food_record_feel;

  /// No description provided for @food_record_problems.
  ///
  /// In cs, this message translates to:
  /// **'Vyskytly se příznaky poruch příjmu potravy? Jaké?'**
  String get food_record_problems;

  /// No description provided for @food_record_what.
  ///
  /// In cs, this message translates to:
  /// **'Co jsi jedl/a?'**
  String get food_record_what;

  /// No description provided for @food_record_when.
  ///
  /// In cs, this message translates to:
  /// **'Kdy jsi jedl/a?'**
  String get food_record_when;

  /// No description provided for @food_record_where.
  ///
  /// In cs, this message translates to:
  /// **'Kde jsi jedl/a?'**
  String get food_record_where;

  /// No description provided for @food_record_with.
  ///
  /// In cs, this message translates to:
  /// **'S kým jsi jedl/a?'**
  String get food_record_with;

  /// No description provided for @food_records.
  ///
  /// In cs, this message translates to:
  /// **'Záznamy jídelníčku'**
  String get food_records;

  /// No description provided for @food_remorse.
  ///
  /// In cs, this message translates to:
  /// **'Výčitky po jídle'**
  String get food_remorse;

  /// No description provided for @food_second_dinner.
  ///
  /// In cs, this message translates to:
  /// **'Druhá večeře'**
  String get food_second_dinner;

  /// No description provided for @food_tasks.
  ///
  /// In cs, this message translates to:
  /// **'Úkoly'**
  String get food_tasks;

  /// No description provided for @food_tasks_afraid.
  ///
  /// In cs, this message translates to:
  /// **'Jídla, kterých se bojím'**
  String get food_tasks_afraid;

  /// No description provided for @food_tasks_challenge.
  ///
  /// In cs, this message translates to:
  /// **'Výzvy'**
  String get food_tasks_challenge;

  /// No description provided for @food_tasks_creative.
  ///
  /// In cs, this message translates to:
  /// **'Kreativní'**
  String get food_tasks_creative;

  /// No description provided for @food_tasks_food_like.
  ///
  /// In cs, this message translates to:
  /// **'Jídlo, které mám rád/a'**
  String get food_tasks_food_like;

  /// No description provided for @food_tasks_like.
  ///
  /// In cs, this message translates to:
  /// **'Co mám na sobě rád/a'**
  String get food_tasks_like;

  /// No description provided for @food_tasks_motivation.
  ///
  /// In cs, this message translates to:
  /// **'Motivace'**
  String get food_tasks_motivation;

  /// No description provided for @food_tips.
  ///
  /// In cs, this message translates to:
  /// **'Tipy'**
  String get food_tips;

  /// No description provided for @food_tips_text.
  ///
  /// In cs, this message translates to:
  /// **'Zhluboka dýchej.\nOdveď pozornost při počítání/hře v aplikaci.\nMysli na motivaci, proč se chceš vyléčit.\nVyplakej se.\nZavolej člověku, který Ti rozumí a podpoří Tě.\nJdi za blízkým člověkem.\nObejmi maminku/tatínka/kamarádku/kamaráda/domácího mazlíčka.\nPoslouchej hudbu.\nČti knihu.\nPodívej se na oblíbený film.\nVymaluj mandalu veselými barvami.\nSepiš si důvody, proč se chceš vyléčit.'**
  String get food_tips_text;

  /// No description provided for @food_vomit.
  ///
  /// In cs, this message translates to:
  /// **'Nutkání cvičit/zvracet'**
  String get food_vomit;

  /// No description provided for @food_vomit_text.
  ///
  /// In cs, this message translates to:
  /// **'V hlavě si promysli důvody, proč chceš být zdravý/á.\nBěž do společnosti.\nZavolej blízké osobě.\nNapiš kamarádce/kamarádovi.\nZhluboka dýchej.\nOdveď pozornost při počítání/hře v aplikaci.\nVezmi si papír a tužku a vypiš se ze svých pocitů.'**
  String get food_vomit_text;

  /// No description provided for @game.
  ///
  /// In cs, this message translates to:
  /// **'Hra'**
  String get game;

  /// No description provided for @game_balance.
  ///
  /// In cs, this message translates to:
  /// **'Hra houpačka'**
  String get game_balance;

  /// No description provided for @game_balls.
  ///
  /// In cs, this message translates to:
  /// **'Hra balónky'**
  String get game_balls;

  /// No description provided for @game_instructions.
  ///
  /// In cs, this message translates to:
  /// **'Zasáhni dotekem jasně bílé balónky. Černé a šedé jsou jen pro zmatení.'**
  String get game_instructions;

  /// No description provided for @home.
  ///
  /// In cs, this message translates to:
  /// **'Domů'**
  String get home;

  /// No description provided for @homepage_subtitle.
  ///
  /// In cs, this message translates to:
  /// **'S čím můžeme pomoci?'**
  String get homepage_subtitle;

  /// No description provided for @hours.
  ///
  /// In cs, this message translates to:
  /// **'Hodiny'**
  String get hours;

  /// No description provided for @import_button.
  ///
  /// In cs, this message translates to:
  /// **'Import'**
  String get import_button;

  /// No description provided for @import_export.
  ///
  /// In cs, this message translates to:
  /// **'Import/Export'**
  String get import_export;

  /// No description provided for @import_export_text.
  ///
  /// In cs, this message translates to:
  /// **'Zde můžeš uložit svá data z aplikace do souboru či nahrát uložená data do aplikace. Import nových dat však přepíše aktuálně uložené položky!'**
  String get import_export_text;

  /// No description provided for @import_failed.
  ///
  /// In cs, this message translates to:
  /// **'Při importování nastala chyba.'**
  String get import_failed;

  /// No description provided for @import_successful.
  ///
  /// In cs, this message translates to:
  /// **'Import byl úspěšný.'**
  String get import_successful;

  /// No description provided for @item_added_announce.
  ///
  /// In cs, this message translates to:
  /// **'Položka byla přidána'**
  String get item_added_announce;

  /// No description provided for @journal.
  ///
  /// In cs, this message translates to:
  /// **'Journal'**
  String get journal;

  /// No description provided for @journal_feel.
  ///
  /// In cs, this message translates to:
  /// **'Jak se cítím?'**
  String get journal_feel;

  /// No description provided for @journal_grateful.
  ///
  /// In cs, this message translates to:
  /// **'Za co jsem vděčný/á?'**
  String get journal_grateful;

  /// No description provided for @journal_great.
  ///
  /// In cs, this message translates to:
  /// **'Čím je dnešní den skvělý?'**
  String get journal_great;

  /// No description provided for @journal_improve.
  ///
  /// In cs, this message translates to:
  /// **'Jak dnešní den ještě vylepšit?'**
  String get journal_improve;

  /// No description provided for @journal_three.
  ///
  /// In cs, this message translates to:
  /// **'Tři skvělé věci, co se dnes staly:'**
  String get journal_three;

  /// No description provided for @language.
  ///
  /// In cs, this message translates to:
  /// **'Jazyk'**
  String get language;

  /// No description provided for @main_partners.
  ///
  /// In cs, this message translates to:
  /// **'Hlavní partneři'**
  String get main_partners;

  /// No description provided for @make_call.
  ///
  /// In cs, this message translates to:
  /// **'Zavolat'**
  String get make_call;

  /// No description provided for @math.
  ///
  /// In cs, this message translates to:
  /// **'Počítání'**
  String get math;

  /// No description provided for @math_annouce_correct_answer.
  ///
  /// In cs, this message translates to:
  /// **'Správná odpověď'**
  String get math_annouce_correct_answer;

  /// No description provided for @math_annouce_incorrect_answer.
  ///
  /// In cs, this message translates to:
  /// **'Špatná odpověď'**
  String get math_annouce_incorrect_answer;

  /// No description provided for @math_game_answer_button.
  ///
  /// In cs, this message translates to:
  /// **'Jaký je výsledek?'**
  String get math_game_answer_button;

  /// No description provided for @message_text.
  ///
  /// In cs, this message translates to:
  /// **'Text zprávy'**
  String get message_text;

  /// No description provided for @minutes.
  ///
  /// In cs, this message translates to:
  /// **'Minuty'**
  String get minutes;

  /// No description provided for @month.
  ///
  /// In cs, this message translates to:
  /// **'Měsíc'**
  String get month;

  /// No description provided for @months.
  ///
  /// In cs, this message translates to:
  /// **'Měsíce'**
  String get months;

  /// No description provided for @mood.
  ///
  /// In cs, this message translates to:
  /// **'Nálada'**
  String get mood;

  /// No description provided for @mood_bad_sad.
  ///
  /// In cs, this message translates to:
  /// **'Smutně'**
  String get mood_bad_sad;

  /// No description provided for @mood_chart.
  ///
  /// In cs, this message translates to:
  /// **'Graf nálad'**
  String get mood_chart;

  /// No description provided for @mood_entries.
  ///
  /// In cs, this message translates to:
  /// **'Záznamy nálad'**
  String get mood_entries;

  /// No description provided for @mood_good.
  ///
  /// In cs, this message translates to:
  /// **'Dobře'**
  String get mood_good;

  /// No description provided for @mood_great_happy.
  ///
  /// In cs, this message translates to:
  /// **'Super'**
  String get mood_great_happy;

  /// No description provided for @mood_heatmap.
  ///
  /// In cs, this message translates to:
  /// **'Mapa nálad'**
  String get mood_heatmap;

  /// No description provided for @mood_help.
  ///
  /// In cs, this message translates to:
  /// **'Tvoje nálada je dlouhodobě špatná, nechceš zvážit kontaktovat odbornou pomoc?'**
  String get mood_help;

  /// No description provided for @mood_help_no.
  ///
  /// In cs, this message translates to:
  /// **'Ne'**
  String get mood_help_no;

  /// No description provided for @mood_help_yes.
  ///
  /// In cs, this message translates to:
  /// **'Ano'**
  String get mood_help_yes;

  /// No description provided for @mood_miserable_sad.
  ///
  /// In cs, this message translates to:
  /// **'Mizerně'**
  String get mood_miserable_sad;

  /// No description provided for @mood_no_data.
  ///
  /// In cs, this message translates to:
  /// **'Graf vyžaduje minimálně dvě uložené volby'**
  String get mood_no_data;

  /// No description provided for @mood_not_much.
  ///
  /// In cs, this message translates to:
  /// **'Nic moc'**
  String get mood_not_much;

  /// No description provided for @mood_statistics.
  ///
  /// In cs, this message translates to:
  /// **'Statistiky nálad'**
  String get mood_statistics;

  /// No description provided for @mood_text.
  ///
  /// In cs, this message translates to:
  /// **'Jak se dnes mám:'**
  String get mood_text;

  /// No description provided for @mood_track_chart_guide.
  ///
  /// In cs, this message translates to:
  /// **'Nastav si rozmezí data a sleduj vývoj nálady'**
  String get mood_track_chart_guide;

  /// No description provided for @mood_tracked_success_snackbar.
  ///
  /// In cs, this message translates to:
  /// **'Náladu jsme úspěšně zaznamenali'**
  String get mood_tracked_success_snackbar;

  /// No description provided for @mood_welcome_title.
  ///
  /// In cs, this message translates to:
  /// **'Ahoj, jak se dnes cítíš?'**
  String get mood_welcome_title;

  /// No description provided for @my_contacts.
  ///
  /// In cs, this message translates to:
  /// **'Moje kontakty'**
  String get my_contacts;

  /// No description provided for @my_contacts_header.
  ///
  /// In cs, this message translates to:
  /// **'Zde si mohu poznačit vlastní kontakty a napsat jim email, sms či zavolat.'**
  String get my_contacts_header;

  /// No description provided for @my_contacts_names_example.
  ///
  /// In cs, this message translates to:
  /// **'Jméno'**
  String get my_contacts_names_example;

  /// No description provided for @my_contacts_numbers_example.
  ///
  /// In cs, this message translates to:
  /// **'Číslo nebo email'**
  String get my_contacts_numbers_example;

  /// No description provided for @my_records.
  ///
  /// In cs, this message translates to:
  /// **'Mé záznamy'**
  String get my_records;

  /// No description provided for @need_help.
  ///
  /// In cs, this message translates to:
  /// **'Potřebuješ odbornou pomoc?'**
  String get need_help;

  /// No description provided for @next.
  ///
  /// In cs, this message translates to:
  /// **'Další'**
  String get next;

  /// No description provided for @nice_example.
  ///
  /// In cs, this message translates to:
  /// **'Bylo krásné počasí...'**
  String get nice_example;

  /// No description provided for @no_description_provided.
  ///
  /// In cs, this message translates to:
  /// **'Žádný popis není k dispozici'**
  String get no_description_provided;

  /// No description provided for @no_mood_entries.
  ///
  /// In cs, this message translates to:
  /// **'Pro tyto podmínky nejsou k dispozici žádné záznamy nálady.'**
  String get no_mood_entries;

  /// No description provided for @no_record_yet_empty_text.
  ///
  /// In cs, this message translates to:
  /// **'Zatím nemáš žádný záznam'**
  String get no_record_yet_empty_text;

  /// No description provided for @note_detail.
  ///
  /// In cs, this message translates to:
  /// **'Detail záznamu'**
  String get note_detail;

  /// No description provided for @notification_mood_reminder_title.
  ///
  /// In cs, this message translates to:
  /// **'Zatím nemáš zaznamenanou náladu'**
  String get notification_mood_reminder_title;

  /// No description provided for @notification_reminder_header.
  ///
  /// In cs, this message translates to:
  /// **'Nezapomněl/a jsi?'**
  String get notification_reminder_header;

  /// No description provided for @notification_reminder_time.
  ///
  /// In cs, this message translates to:
  /// **'Čas připomenutí'**
  String get notification_reminder_time;

  /// No description provided for @notification_sleep_mood_reminder_title.
  ///
  /// In cs, this message translates to:
  /// **'Zatím nemáš zadané, jak jsi se dnes vyspal/a'**
  String get notification_sleep_mood_reminder_title;

  /// No description provided for @notifications.
  ///
  /// In cs, this message translates to:
  /// **'Připomínky'**
  String get notifications;

  /// No description provided for @online_therapy.
  ///
  /// In cs, this message translates to:
  /// **'Online terapie'**
  String get online_therapy;

  /// No description provided for @other.
  ///
  /// In cs, this message translates to:
  /// **'jiné'**
  String get other;

  /// No description provided for @other_partners.
  ///
  /// In cs, this message translates to:
  /// **'Další partneři'**
  String get other_partners;

  /// No description provided for @panic_tips.
  ///
  /// In cs, this message translates to:
  /// **'Dýchej podle naší aplikace.\n\nPočítej od 100 do 0.\n\nVezmi si do ruky papír a pořádně ho zmačkej.\n\nObejmi blízkou osobu.\n\nZadrž dech.\n\nDej si čokoládu.\n\nUklízej.\nUtři prach u sebe v pokoji, vysajte.\nPodívej se na oblíbený film.\n\nPomazli se s domácím mazlíčkem.\n\nKresli si.\nVezmi si papír a tužku a zkus nakreslit Tvoje emoce a pocity.\nPoslouchej hudbu.\nVytvoř si na mobilu play list oblíbených písniček a poslouchej je.\nJdi na čerstvý vzduch.\nVydej se na půlhodinovou procházku, běž rychlým tempem.\n'**
  String get panic_tips;

  /// No description provided for @panic_tips_9.
  ///
  /// In cs, this message translates to:
  /// **'Co dělat při úzkosti'**
  String get panic_tips_9;

  /// No description provided for @people_to_write.
  ///
  /// In cs, this message translates to:
  /// **'Komu by to ublížilo:'**
  String get people_to_write;

  /// No description provided for @phone.
  ///
  /// In cs, this message translates to:
  /// **'Telefon'**
  String get phone;

  /// No description provided for @plan.
  ///
  /// In cs, this message translates to:
  /// **'Záchranný plán'**
  String get plan;

  /// No description provided for @plan_example.
  ///
  /// In cs, this message translates to:
  /// **'Nakoupím v obchodě'**
  String get plan_example;

  /// No description provided for @plural_day_few.
  ///
  /// In cs, this message translates to:
  /// **'Dny'**
  String get plural_day_few;

  /// No description provided for @plural_day_one.
  ///
  /// In cs, this message translates to:
  /// **'Den'**
  String get plural_day_one;

  /// No description provided for @plural_day_other.
  ///
  /// In cs, this message translates to:
  /// **'Dní'**
  String get plural_day_other;

  /// No description provided for @plural_hour_few.
  ///
  /// In cs, this message translates to:
  /// **'Hodiny'**
  String get plural_hour_few;

  /// No description provided for @plural_hour_one.
  ///
  /// In cs, this message translates to:
  /// **'Hodina'**
  String get plural_hour_one;

  /// No description provided for @plural_hour_other.
  ///
  /// In cs, this message translates to:
  /// **'Hodin'**
  String get plural_hour_other;

  /// No description provided for @plural_minutes_few.
  ///
  /// In cs, this message translates to:
  /// **'Minuty'**
  String get plural_minutes_few;

  /// No description provided for @plural_minutes_one.
  ///
  /// In cs, this message translates to:
  /// **'Minuta'**
  String get plural_minutes_one;

  /// No description provided for @plural_minutes_other.
  ///
  /// In cs, this message translates to:
  /// **'Minut'**
  String get plural_minutes_other;

  /// No description provided for @plural_month_few.
  ///
  /// In cs, this message translates to:
  /// **'Měsíce'**
  String get plural_month_few;

  /// No description provided for @plural_month_one.
  ///
  /// In cs, this message translates to:
  /// **'Měsíc'**
  String get plural_month_one;

  /// No description provided for @plural_month_other.
  ///
  /// In cs, this message translates to:
  /// **'Měsíců'**
  String get plural_month_other;

  /// No description provided for @plural_second_few.
  ///
  /// In cs, this message translates to:
  /// **'Sekundy'**
  String get plural_second_few;

  /// No description provided for @plural_second_one.
  ///
  /// In cs, this message translates to:
  /// **'Sekunda'**
  String get plural_second_one;

  /// No description provided for @plural_second_other.
  ///
  /// In cs, this message translates to:
  /// **'Sekund'**
  String get plural_second_other;

  /// No description provided for @plural_year_few.
  ///
  /// In cs, this message translates to:
  /// **'Roky'**
  String get plural_year_few;

  /// No description provided for @plural_year_one.
  ///
  /// In cs, this message translates to:
  /// **'Rok'**
  String get plural_year_one;

  /// No description provided for @plural_year_other.
  ///
  /// In cs, this message translates to:
  /// **'Roků'**
  String get plural_year_other;

  /// No description provided for @praise_example.
  ///
  /// In cs, this message translates to:
  /// **'Zvládl/a jsem si zacvičit'**
  String get praise_example;

  /// No description provided for @previous.
  ///
  /// In cs, this message translates to:
  /// **'Předchozí'**
  String get previous;

  /// No description provided for @quick_help_btn.
  ///
  /// In cs, this message translates to:
  /// **'Rychlá pomoc'**
  String get quick_help_btn;

  /// No description provided for @rate.
  ///
  /// In cs, this message translates to:
  /// **'Ohodnoť nás'**
  String get rate;

  /// No description provided for @really_remove.
  ///
  /// In cs, this message translates to:
  /// **'Chceš skutečně provést tuto akci?'**
  String get really_remove;

  /// No description provided for @really_stop_timer.
  ///
  /// In cs, this message translates to:
  /// **'Opravdu chceš zastavit časovač?'**
  String get really_stop_timer;

  /// No description provided for @reasons.
  ///
  /// In cs, this message translates to:
  /// **'Důvody proč ne'**
  String get reasons;

  /// No description provided for @reasons_example.
  ///
  /// In cs, this message translates to:
  /// **'Pomazlit se s domácím mazlíčkem (pejskem, kocourkem, morčetem).\nZazpívat si při kytaře u táboráku.\nVystudovat to, co chci.\nNajít si partnera/partnerku.\nMít dítě/děti.\nPomáhat druhým.'**
  String get reasons_example;

  /// No description provided for @reasons_text.
  ///
  /// In cs, this message translates to:
  /// **'Pokud budu žít, můžu ještě:'**
  String get reasons_text;

  /// No description provided for @record_added_announce.
  ///
  /// In cs, this message translates to:
  /// **'Záznam byl přidán'**
  String get record_added_announce;

  /// No description provided for @record_created_announce.
  ///
  /// In cs, this message translates to:
  /// **'Záznam byl vytvořen'**
  String get record_created_announce;

  /// No description provided for @record_deleted_announce.
  ///
  /// In cs, this message translates to:
  /// **'Záznam byl smazán'**
  String get record_deleted_announce;

  /// No description provided for @record_saved_announce.
  ///
  /// In cs, this message translates to:
  /// **'Záznam byl uložen'**
  String get record_saved_announce;

  /// No description provided for @records.
  ///
  /// In cs, this message translates to:
  /// **'Záznamy'**
  String get records;

  /// No description provided for @relaxation.
  ///
  /// In cs, this message translates to:
  /// **'Relaxace'**
  String get relaxation;

  /// No description provided for @reset_inputs.
  ///
  /// In cs, this message translates to:
  /// **'Vymazat uložená data'**
  String get reset_inputs;

  /// No description provided for @save.
  ///
  /// In cs, this message translates to:
  /// **'Uložit'**
  String get save;

  /// No description provided for @search.
  ///
  /// In cs, this message translates to:
  /// **'Hledat'**
  String get search;

  /// No description provided for @search_by_emotions.
  ///
  /// In cs, this message translates to:
  /// **'Hledat podle emocí'**
  String get search_by_emotions;

  /// No description provided for @search_by_summary.
  ///
  /// In cs, this message translates to:
  /// **'Hledat podle souhrnu'**
  String get search_by_summary;

  /// No description provided for @select_region_dropdown_label.
  ///
  /// In cs, this message translates to:
  /// **'Vyber region'**
  String get select_region_dropdown_label;

  /// No description provided for @select_up_to_9_emotions.
  ///
  /// In cs, this message translates to:
  /// **'Můžete vybrat maximálně 9 emocí!'**
  String get select_up_to_9_emotions;

  /// No description provided for @select_your_emotions.
  ///
  /// In cs, this message translates to:
  /// **'Vyberte své emoce'**
  String get select_your_emotions;

  /// No description provided for @self_harm.
  ///
  /// In cs, this message translates to:
  /// **'Chci si ublížit'**
  String get self_harm;

  /// No description provided for @self_harm_helped.
  ///
  /// In cs, this message translates to:
  /// **'Co mi pomohlo'**
  String get self_harm_helped;

  /// No description provided for @self_harm_helped_header.
  ///
  /// In cs, this message translates to:
  /// **'Seznam, kam si můžeš psát věci, co Ti pomohly zvládnout nutkání na sebepoškození v minulosti.'**
  String get self_harm_helped_header;

  /// No description provided for @self_harm_plan_questions.
  ///
  /// In cs, this message translates to:
  /// **'Proč to chci zvládnout?\nCo před tím ještě vyzkouším?\nKvůli komu to chci zvládnout?\nKomu se ozvu?'**
  String get self_harm_plan_questions;

  /// No description provided for @self_harm_record.
  ///
  /// In cs, this message translates to:
  /// **'Můj rekord'**
  String get self_harm_record;

  /// No description provided for @self_harm_timer.
  ///
  /// In cs, this message translates to:
  /// **'Jak dlouho to zvládám'**
  String get self_harm_timer;

  /// No description provided for @self_harm_timer_3_months.
  ///
  /// In cs, this message translates to:
  /// **'Máš za sebou čtvrt roku bez sebepoškozování.\nTo je skvělé!'**
  String get self_harm_timer_3_months;

  /// No description provided for @self_harm_timer_begin.
  ///
  /// In cs, this message translates to:
  /// **'Vedeš si skvěle.\nJen tak dál!'**
  String get self_harm_timer_begin;

  /// No description provided for @self_harm_timer_day.
  ///
  /// In cs, this message translates to:
  /// **'Máš za sebou první velký krok, zvládl/a jsi celý den.'**
  String get self_harm_timer_day;

  /// No description provided for @self_harm_timer_half_year.
  ///
  /// In cs, this message translates to:
  /// **'Ušel/ušla jsi dlouhou cestu, už půl roku sis neublížil/a.\nTo je výborný výsledek!'**
  String get self_harm_timer_half_year;

  /// No description provided for @self_harm_timer_hour.
  ///
  /// In cs, this message translates to:
  /// **'Skvělý start! Zapiš si tipy, co Ti pomohlo.\nZvládneš další?'**
  String get self_harm_timer_hour;

  /// No description provided for @self_harm_timer_month.
  ///
  /// In cs, this message translates to:
  /// **'Už měsíc sis neublížil/a.\nDíky čemu se Ti to daří?'**
  String get self_harm_timer_month;

  /// No description provided for @self_harm_timer_week.
  ///
  /// In cs, this message translates to:
  /// **'Máš za sebou celý týden, skvělé, že se Ti to podařilo.'**
  String get self_harm_timer_week;

  /// No description provided for @self_harm_timer_year.
  ///
  /// In cs, this message translates to:
  /// **'Máš za sebou svůj první rok bez sebepoškozování.\nDržíme palce, ať se Ti to daří dál.'**
  String get self_harm_timer_year;

  /// No description provided for @self_harm_tips.
  ///
  /// In cs, this message translates to:
  /// **'Co mi může pomoci'**
  String get self_harm_tips;

  /// No description provided for @self_harm_tips_13.
  ///
  /// In cs, this message translates to:
  /// **'Vezmi si kostku ledu.\nPřejížděj si s ní po tom místě, kde si chceš ublížit.\nNapiš kamarádovi.\nZeptej se ho, jak se má.\nVezmi si červenou fixu a maluj si po ruce.\n \nBouchej do polštáře.\n \nNapiš na papír, jak se cítíš a pak jej roztrhej.\n \nZmačkej papír.\n \nKřič.\n \nZacvič si.\nProjeď se na kole nebo si běž zaběhat.\nJdi se projít.\nNajdi si oblíbenou trasu, oblíbené místo a běž na procházku.\nUklízej.\nUtři prach u sebe v pokoji, vysaj.\nMaluj si.\nVezmi si omalovánky nebo si vytiskni mandalu a vymaluj ji.\nNakresli to, co si chceš udělat.\n \nZkus jít spát.\n \nRelaxuj.\nStáhni si do mobilu řízenou relaxaci, pusť si ji, lehni si na zem, uvolni se, zavři oči a relaxuj.\nDej si studenou sprchu.\n \nZatni pěsti.\n \nNapiš blízké osobě.\nNapiš osobě, které věříš, že Ti není dobře.\nJdi mezi lidi.\nBěž se projít do centra a kup si něco hezkého.'**
  String get self_harm_tips_13;

  /// No description provided for @send.
  ///
  /// In cs, this message translates to:
  /// **'Odeslat'**
  String get send;

  /// No description provided for @send_records.
  ///
  /// In cs, this message translates to:
  /// **'Odeslat záznamy'**
  String get send_records;

  /// No description provided for @send_records_text.
  ///
  /// In cs, this message translates to:
  /// **'Zvol rozsah dat záznamů, které chceš odeslat, a e-mailovou adresu příjemce.'**
  String get send_records_text;

  /// No description provided for @send_sms.
  ///
  /// In cs, this message translates to:
  /// **'Poslat sms'**
  String get send_sms;

  /// No description provided for @settings.
  ///
  /// In cs, this message translates to:
  /// **'Nastavení'**
  String get settings;

  /// No description provided for @sleep_text.
  ///
  /// In cs, this message translates to:
  /// **'Jak kvalitní byl můj dnešní spánek?'**
  String get sleep_text;

  /// No description provided for @sleep_title.
  ///
  /// In cs, this message translates to:
  /// **'Můj spánek'**
  String get sleep_title;

  /// No description provided for @sleep_track_chart_guide.
  ///
  /// In cs, this message translates to:
  /// **'Nastav si rozmezí data a sleduj vývoj kvality spánku'**
  String get sleep_track_chart_guide;

  /// No description provided for @sleep_tracked_success_snackbar.
  ///
  /// In cs, this message translates to:
  /// **'Kvalita spánku byla úspěšně zaznamenána'**
  String get sleep_tracked_success_snackbar;

  /// No description provided for @start.
  ///
  /// In cs, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @statistics.
  ///
  /// In cs, this message translates to:
  /// **'Statistika'**
  String get statistics;

  /// No description provided for @stop.
  ///
  /// In cs, this message translates to:
  /// **'Stop'**
  String get stop;

  /// No description provided for @submit.
  ///
  /// In cs, this message translates to:
  /// **'Potvrdit'**
  String get submit;

  /// No description provided for @suicidal_thoughts.
  ///
  /// In cs, this message translates to:
  /// **'Myšlenky na sebevraždu'**
  String get suicidal_thoughts;

  /// No description provided for @summary_of_your_moment.
  ///
  /// In cs, this message translates to:
  /// **'Shrnutí vašeho okamžiku'**
  String get summary_of_your_moment;

  /// No description provided for @support.
  ///
  /// In cs, this message translates to:
  /// **'Podpořili nás'**
  String get support;

  /// No description provided for @support_us.
  ///
  /// In cs, this message translates to:
  /// **'Podpoř nás'**
  String get support_us;

  /// No description provided for @text_of_entry_label.
  ///
  /// In cs, this message translates to:
  /// **'Text zápisu'**
  String get text_of_entry_label;

  /// No description provided for @theme_slider.
  ///
  /// In cs, this message translates to:
  /// **'Zde můžeš nastavit vlastní barvu pozadí'**
  String get theme_slider;

  /// No description provided for @theme_slider_light.
  ///
  /// In cs, this message translates to:
  /// **'Zde uprav jas'**
  String get theme_slider_light;

  /// No description provided for @title_entry_hint_text.
  ///
  /// In cs, this message translates to:
  /// **'Pojmenuj zápis'**
  String get title_entry_hint_text;

  /// No description provided for @title_entry_label.
  ///
  /// In cs, this message translates to:
  /// **'Název zápisu'**
  String get title_entry_label;

  /// No description provided for @type_a_new_emotion.
  ///
  /// In cs, this message translates to:
  /// **'Zadejte novou emoci'**
  String get type_a_new_emotion;

  /// No description provided for @universities.
  ///
  /// In cs, this message translates to:
  /// **'Vysokoškolské poradny'**
  String get universities;

  /// No description provided for @university_contacts_description.
  ///
  /// In cs, this message translates to:
  /// **'Vysokoškolské poradny zpravidla vyžadují předchozí objednání.'**
  String get university_contacts_description;

  /// No description provided for @year.
  ///
  /// In cs, this message translates to:
  /// **'Rok'**
  String get year;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ar',
    'cs',
    'de',
    'en',
    'es',
    'fi',
    'fr',
    'hi',
    'it',
    'ja',
    'ko',
    'nb',
    'pl',
    'pt',
    'ru',
    'sk',
    'sv',
    'tr',
    'uk',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'cs':
      return AppLocalizationsCs();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fi':
      return AppLocalizationsFi();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'nb':
      return AppLocalizationsNb();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'sk':
      return AppLocalizationsSk();
    case 'sv':
      return AppLocalizationsSv();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
