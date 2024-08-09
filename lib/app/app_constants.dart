class AppConstants {
  /// If true, the app will have turned on Analytics.
  static const bool IS_PROD = bool.fromEnvironment('IS_PROD');

  static const String loremIpsum = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. '
      'Curabitur vitae diam non enim vestibulum interdum. Nullam at arcu a est sollicitudin euismod. '
      'Aliquam ante. Nulla turpis magna, cursus sit amet, suscipit a, interdum id, felis. In laoreet, '
      'magna id viverra tincidunt, sem odio bibendum justo, vel imperdiet sapien wisi sed libero. '
      'Curabitur sagittis hendrerit ante. Etiam commodo dui eget wisi. Aliquam ante. Duis pulvinar. '
      'Pellentesque sapien. Quisque tincidunt scelerisque libero.';

  static final String loremIpsumShort = loremIpsum.split('.').first;

  static const nepanikarTherapyUrl = 'https://nepanikar.eu/terapie/';
  static const nepanikarContactEmail = 'pomoc@nepanikar.eu';
  static const nepanikarWeb = 'https://nepanikar.eu/';
  static const nepanikarInstagram = 'https://www.instagram.com/aplikace_nepanikar';
  static const nepanikarFacebook = 'https://www.facebook.com/aplikacenepanikar/';
  static const nepanikarDonate = 'https://www.darujme.cz/darovat/1203622?referrer=&frequency=once&amount=300&widget=1202392';
}
