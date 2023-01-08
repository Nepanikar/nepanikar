const CONTACTS_ASSET_NAME = 'all_contacts.json';

class NepanikarLanguages {
  static const AppLanguage cs = AppLanguage('cs');
  static const AppLanguage de = AppLanguage('de');
  static const AppLanguage en = AppLanguage('en');
  static const AppLanguage es = AppLanguage('es');
  static const AppLanguage fr = AppLanguage('fr');
  static const AppLanguage it = AppLanguage('it');
  static const AppLanguage ja = AppLanguage('ja');
  static const AppLanguage nb = AppLanguage('nb');
  static const AppLanguage pl = AppLanguage('pl');
  static const AppLanguage pt = AppLanguage('pt');
  static const AppLanguage pt_PT = AppLanguage('pt', 'PT');
  static const AppLanguage ru = AppLanguage('ru');
  static const AppLanguage sk = AppLanguage('sk');
  static const AppLanguage uk = AppLanguage('uk');
}

class AppLanguage {
  const AppLanguage(this.languageCode, [this.countryCode]);

  final String languageCode;
  final String? countryCode;
}
